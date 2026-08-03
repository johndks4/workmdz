#define FILTERSCRIPT

#include <a_samp>
#include <sampvoice>

// =============================================================================
// DEFINICOES & CORES
// =============================================================================
#define COR_AZUL        0x33CCFFFF
#define COR_VERMELHO    0xFF3333FF
#define COR_VERDE       0x00FF80FF
#define COR_AMARELO     0xFFCC00FF
#define COR_CINZA       0x888888FF
#define COR_BRANCO      0xEFEFEFFF

// Teclas PTT (Push-To-Talk)
#define TECLA_VOZ_LOCAL   0x42 // Tecla "B" (Voz de Proximidade)
#define TECLA_VOZ_RADIO   0x5A // Tecla "Z" (Rádio/Walkie-Talkie)

// =============================================================================
// VARIAVEIS GLOBAIS
// =============================================================================

// Canal de voz local 3D individual de cada jogador
new SV_LSTREAM:G_StreamLocal[MAX_PLAYERS] = {SV_NULL, ...};

// Canais globais de rádio/frequências (1 a 100)
new SV_GSTREAM:G_StreamRadio[101] = {SV_NULL, ...};

// Guarda a frequência de rádio atual do jogador (0 = Desligado)
new FrequenciaPlayer[MAX_PLAYERS] = {0, ...};

// Forward para strtok
forward strtok(const string[], &index);

// =============================================================================
// CALLBACKS DO FILTERSCRIPT
// =============================================================================

public OnFilterScriptInit()
{
    print("\n---------------------------------------------------------");
    print("      FS VOIP (SAMPVOICE 3.0) - Proximidade & Radio      ");
    print("---------------------------------------------------------\n");

    // Inicializa o motor de voz do SampVoice no servidor
    // Parametros: Bitrate (48000 Hz), Microfone habilitado por padrao
    SvInit(48000);

    // Criar os canais de rádio estáticos (Frequências de 1 a 100)
    for(new i = 1; i <= 100; i++)
    {
        new nomeCanal[32];
        format(nomeCanal, sizeof(nomeCanal), "Radio_Freq_%d", i);
        G_StreamRadio[i] = SvCreateGStream(0x00FF80FF, nomeCanal);
    }
    return 1;
}

public OnFilterScriptExit()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i))
        {
            DesconectarVOIP(i);
        }
    }

    for(new i = 1; i <= 100; i++)
    {
        if(G_StreamRadio[i] != SV_NULL)
        {
            SvDeleteStream(G_StreamRadio[i]);
            G_StreamRadio[i] = SV_NULL;
        }
    }
    return 1;
}

public OnPlayerConnect(playerid)
{
    // Verifica se o jogador possui o plugin de voz instalado no GTA dele
    if(SvGetVersion(playerid) == SV_NULL)
    {
        SendClientMessage(playerid, COR_VERMELHO, "[VOIP] Voce NAO possui o plugin de voz (sampvoice.asi) instalado!");
        SendClientMessage(playerid, COR_CINZA, "[VOIP] Baixe o plugin do servidor para ouvir e falar no chat de voz.");
        return 1;
    }

    // Criar o canal 3D local do jogador (Alcance: 20 metros, maximo 40 ouvintes)
    // A cor 0x33CCFFFF é a cor do ícone de microfone na cabeça do player
    G_StreamLocal[playerid] = SvCreateDLStreamAtPlayer(20.0, 40, playerid, COR_AZUL, "Local");

    // Registra as teclas PTT no cliente do jogador
    SvAddKey(playerid, TECLA_VOZ_LOCAL);
    SvAddKey(playerid, TECLA_VOZ_RADIO);

    SendClientMessage(playerid, COR_VERDE, "[VOIP] Chat de voz conectado com sucesso!");
    SendClientMessage(playerid, COR_CINZA, "[VOIP] Pressione 'B' para Falar Local | Pressione 'Z' para Falar no Radio.");
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    DesconectarVOIP(playerid);
    return 1;
}

// =============================================================================
// CALLBACKS NATIVAS DO SAMPVOICE (PRESSIONAR E SOLTAR TECLAS)
// =============================================================================

// Chamada quando o jogador PRESSIONA uma tecla de voz
public SV_VOID:OnPlayerActivationKeyPress(SV_UINT:playerid, SV_UINT:keyid)
{
    // Pressionou 'B' -> Fala no Chat Local (3D Proximidade)
    if(keyid == TECLA_VOZ_LOCAL)
    {
        if(G_StreamLocal[playerid] != SV_NULL)
        {
            SvAttachPlayerToStream(G_StreamLocal[playerid], playerid);
        }
    }

    // Pressionou 'Z' -> Fala no Rádio (Se estiver em uma frequência)
    if(keyid == TECLA_VOZ_RADIO)
    {
        new freq = FrequenciaPlayer[playerid];
        if(freq >= 1 && freq <= 100 && G_StreamRadio[freq] != SV_NULL)
        {
            SvAttachPlayerToStream(G_StreamRadio[freq], playerid);
            
            // Notificacao discreta no GameText
            GameTextForPlayer(playerid, "~g~~k~~PED_ANSWER_PHONE~ Transmitindo Radio...", 1000, 4);
        }
        else
        {
            SendClientMessage(playerid, COR_VERMELHO, "[RADIO] Voce nao esta sintonizado em nenhuma frequencia! Use /freq [1-100]");
        }
    }
    return 1;
}

// Chamada quando o jogador SOLTA a tecla de voz
public SV_VOID:OnPlayerActivationKeyRelease(SV_UINT:playerid, SV_UINT:keyid)
{
    // Soltou 'B' -> Para de transmitir no local
    if(keyid == TECLA_VOZ_LOCAL)
    {
        if(G_StreamLocal[playerid] != SV_NULL)
        {
            SvDetachPlayerFromStream(G_StreamLocal[playerid], playerid);
        }
    }

    // Soltou 'Z' -> Para de transmitir no rádio
    if(keyid == TECLA_VOZ_RADIO)
    {
        new freq = FrequenciaPlayer[playerid];
        if(freq >= 1 && freq <= 100 && G_StreamRadio[freq] != SV_NULL)
        {
            SvDetachPlayerFromStream(G_StreamRadio[freq], playerid);
        }
    }
    return 1;
}

// =============================================================================
// COMANDOS DE RADIO
// =============================================================================

public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[32], idx;
    cmd = strtok(cmdtext, idx);

    // Mudar Frequência de Rádio
    if(strcmp(cmd, "/frequencia", true) == 0 || strcmp(cmd, "/freq", true) == 0)
    {
        new tmp[32];
        tmp = strtok(cmdtext, idx);

        if(!strlen(tmp))
        {
            SendClientMessage(playerid, COR_CINZA, "USO: /freq [1 a 100] (Ou /freq 0 para desligar)");
            return 1;
        }

        new freq = strval(tmp);

        if(freq < 0 || freq > 100)
        {
            SendClientMessage(playerid, COR_VERMELHO, "[RADIO] Escolha uma frequencia valida entre 1 e 100.");
            return 1;
        }

        // Se já estava em um rádio antigo, remove do canal antigo
        new freqAntiga = FrequenciaPlayer[playerid];
        if(freqAntiga >= 1 && freqAntiga <= 100 && G_StreamRadio[freqAntiga] != SV_NULL)
        {
            SvDetachListenerFromStream(G_StreamRadio[freqAntiga], playerid);
        }

        // Desligar Rádio
        if(freq == 0)
        {
            FrequenciaPlayer[playerid] = 0;
            SendClientMessage(playerid, COR_AMARELO, "[RADIO] Voce desligou seu comunicador de radio.");
            return 1;
        }

        // Conecta no novo canal de rádio
        FrequenciaPlayer[playerid] = freq;
        SvAttachListenerToStream(G_StreamRadio[freq], playerid);

        new msg[128];
        format(msg, sizeof(msg), "[RADIO] Rádio sintonizado na Frequência %d Mhz. Segure 'Z' para falar.", freq);
        SendClientMessage(playerid, COR_VERDE, msg);
        return 1;
    }
    return 0;
}

// =============================================================================
// FUNCOES AUXILIARES
// =============================================================================

stock DesconectarVOIP(playerid)
{
    // Remove do rádio
    new freq = FrequenciaPlayer[playerid];
    if(freq >= 1 && freq <= 100 && G_StreamRadio[freq] != SV_NULL)
    {
        SvDetachListenerFromStream(G_StreamRadio[freq], playerid);
    }
    FrequenciaPlayer[playerid] = 0;

    // Destroi a stream local do player
    if(G_StreamLocal[playerid] != SV_NULL)
    {
        SvDeleteStream(G_StreamLocal[playerid]);
        G_StreamLocal[playerid] = SV_NULL;
    }
    return 1;
}

stock strtok(const string[], &index)
{
    new length = strlen(string);
    while ((index < length) && (string[index] <= ' ')) {
        index++;
    }
    new offset = index;
    new result[32];
    while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1))) {
        result[index - offset] = string[index];
        index++;
    }
    result[index - offset] = '\0';
    return result;
}
