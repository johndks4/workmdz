#include <YSI_Coding\y_hooks>

// =================================================================
// CONFIGURAÇÕES DO EVENTO THE PURGE (NOITE DE CRIME)
// =================================================================
#define LINK_AUDIO_PURGE "https://som.brasilplaygames.com.br/som/THEPURGEE.mp3"

// TEMPO DE ESPERA PARA O AUDIO TERMINAR ANTES DE LIBERAR O CRIME (em milissegundos)
// Ajuste de acordo com a duração real do MP3. (Ex: 30000 = 30 segundos)
#define TEMPO_ESPERA_AUDIO 30000 

// =================================================================
// VARIÁVEIS GLOBAIS E TEXTDRAWS
// =================================================================
new bool:MdzPurgeAtivo = false;

new Text:Purge_BG;
new Text:Purge_Title;
new Text:Purge_Sub;
new Text:Purge_Btn;

// =================================================================
// CARREGAMENTO DOS TEXTDRAWS (DESIGN FODA)
// =================================================================
hook OnGameModeInit()
{
    // Fundo Negro Transparente
    Purge_BG = TextDrawCreate(120.000000, 130.000000, "box");
    TextDrawLetterSize(Purge_BG, 0.000000, 18.000000);
    TextDrawTextSize(Purge_BG, 520.000000, 0.000000);
    TextDrawAlignment(Purge_BG, 1);
    TextDrawColor(Purge_BG, -1);
    TextDrawUseBox(Purge_BG, 1);
    TextDrawBoxColor(Purge_BG, 180); // Preto com transparência
    TextDrawSetShadow(Purge_BG, 0);
    TextDrawSetOutline(Purge_BG, 0);
    TextDrawBackgroundColor(Purge_BG, 255);
    TextDrawFont(Purge_BG, 1);
    TextDrawSetProportional(Purge_BG, 1);

    // Título Centralizado: THE PURGE
    Purge_Title = TextDrawCreate(320.000000, 140.000000, "THE PURGE");
    TextDrawLetterSize(Purge_Title, 1.200000, 4.000000);
    TextDrawAlignment(Purge_Title, 2); // Centralizado
    TextDrawColor(Purge_Title, 0xED4245FF); // Vermelho Sangue
    TextDrawSetShadow(Purge_Title, 0);
    TextDrawSetOutline(Purge_Title, 2); // Borda preta grossa
    TextDrawBackgroundColor(Purge_Title, 255);
    TextDrawFont(Purge_Title, 0); // Fonte estilo terror/gótica
    TextDrawSetProportional(Purge_Title, 1);

    // Subtítulo
    Purge_Sub = TextDrawCreate(320.000000, 200.000000, "~w~ESTE E O SISTEMA DE TRANSMISSAO DE EMERGENCIA.~n~~n~~r~TODOS OS CRIMES ESTAO LEGALIZADOS.~n~~w~SERVICOS DE POLICIA E HOSPITAL ESTAO SUSPENSOS.~n~~n~QUE DEUS PROTEJA VOCES.");
    TextDrawLetterSize(Purge_Sub, 0.350000, 1.200000);
    TextDrawAlignment(Purge_Sub, 2);
    TextDrawColor(Purge_Sub, -1);
    TextDrawSetShadow(Purge_Sub, 1);
    TextDrawSetOutline(Purge_Sub, 0);
    TextDrawBackgroundColor(Purge_Sub, 255);
    TextDrawFont(Purge_Sub, 1);
    TextDrawSetProportional(Purge_Sub, 1);

    // Botão Clicável para Fechar
    Purge_Btn = TextDrawCreate(240.000000, 275.000000, "~r~> ~w~[ CLIQUE AQUI PARA FECHAR ] ~r~<");
    TextDrawLetterSize(Purge_Btn, 0.400000, 1.500000);
    TextDrawAlignment(Purge_Btn, 1); // Alinhado à esquerda para facilitar a área de clique
    TextDrawColor(Purge_Btn, -1);
    TextDrawSetShadow(Purge_Btn, 0);
    TextDrawSetOutline(Purge_Btn, 1);
    TextDrawBackgroundColor(Purge_Btn, 255);
    TextDrawFont(Purge_Btn, 2);
    TextDrawSetProportional(Purge_Btn, 1);
    TextDrawSetSelectable(Purge_Btn, 1); // Torna o botão clicável
    TextDrawTextSize(Purge_Btn, 450.000000, 20.000000); // Define a caixa mágica de onde o mouse detecta o clique
    return 1;
}

hook OnGameModeExit()
{
    TextDrawDestroy(Purge_BG);
    TextDrawDestroy(Purge_Title);
    TextDrawDestroy(Purge_Sub);
    TextDrawDestroy(Purge_Btn);
    return 1;
}

// =================================================================
// FUNÇÕES DE INTERFACE (MOSTRAR / ESCONDER)
// =================================================================
stock MostrarPainelPurge(playerid)
{
    TextDrawShowForPlayer(playerid, Purge_BG);
    TextDrawShowForPlayer(playerid, Purge_Title);
    TextDrawShowForPlayer(playerid, Purge_Sub);
    TextDrawShowForPlayer(playerid, Purge_Btn);
    
    // Libera a setinha do mouse para o jogador poder clicar
    SelectTextDraw(playerid, 0xED4245AA); 
    return 1;
}

stock EsconderPainelPurge(playerid)
{
    TextDrawHideForPlayer(playerid, Purge_BG);
    TextDrawHideForPlayer(playerid, Purge_Title);
    TextDrawHideForPlayer(playerid, Purge_Sub);
    TextDrawHideForPlayer(playerid, Purge_Btn);
    CancelSelectTextDraw(playerid);
    return 1;
}

// =================================================================
// HOOK DE CLIQUE (QUANDO O JOGADOR CLICA NO BOTAO OU APERTA ESC)
// =================================================================
hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    // Se clicou no nosso botão de fechar
    if(clickedid == Purge_Btn)
    {
        EsconderPainelPurge(playerid);
        SendClientMessage(playerid, 0xED4245FF, "⚠️ Você aceitou as condições. Sobreviva à Noite de Crime!");
        PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0); // Som de clique
        return ~1; // Interrompe chamadas de outros textdraws
    }
    // Se apertou ESC (INVALID_TEXT_DRAW) durante a seleção de texto
    else if(clickedid == Text:INVALID_TEXT_DRAW)
    {
        EsconderPainelPurge(playerid);
        return 1;
    }
    return 1;
}

// =================================================================
// COMANDOS DE ATIVAÇÃO
// =================================================================
CMD:iniciarpurge(playerid, params[])
{
    // Permissão (Admin 1340 ou RCON)
    if(PlayerInfo[playerid][pAdmin] < 1340 && !IsPlayerAdmin(playerid)) 
        return SendClientMessage(playerid, -1, "Você não tem permissão para usar este comando.");

    if(MdzPurgeAtivo) return SendClientMessage(playerid, -1, "A Noite de Crime já está ativa!");

    new stringAnuncio[128];
    format(stringAnuncio, sizeof(stringAnuncio), "O Administrador %s disparou os alarmes de emergência...", PlayerName(playerid));
    SendClientMessageToAll(0xED4245FF, stringAnuncio);

    // Dispara a sirene e exibe o TextDraw para TODOS online
    foreach(new i: Player)
    {
        PlayAudioStreamForPlayer(i, LINK_AUDIO_PURGE);
        MostrarPainelPurge(i);
    }

    // Inicia a contagem para liberar o sistema oficial APÓS o fim do áudio
    SetTimer("IniciarEventoOficial", TEMPO_ESPERA_AUDIO, false);
    return 1;
}

CMD:pararpurge(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 1340 && !IsPlayerAdmin(playerid)) 
        return SendClientMessage(playerid, -1, "Você não tem permissão para usar este comando.");

    if(!MdzPurgeAtivo) return SendClientMessage(playerid, -1, "A Noite de Crime não está ativa.");

    MdzPurgeAtivo = false;

    foreach(new i: Player)
    {
        StopAudioStreamForPlayer(i);
        EsconderPainelPurge(i); // Esconde por precaução
    }

    SetWeather(10); // Clima normal
    SetWorldTime(12); // Meio-dia

    SendClientMessageToAll(0x57F287FF, "🕊️ A Noite de Crime acabou. Todos os serviços emergenciais foram restaurados.");
    return 1;
}

// =================================================================
// FUNÇÃO QUE ATIVA APÓS O ÁUDIO TERMINAR
// =================================================================
forward IniciarEventoOficial();
public IniciarEventoOficial()
{
    MdzPurgeAtivo = true;

    // Modifica o ambiente do jogo para clima de terror
    SetWeather(9);   // Clima nublado/neblina pesada (ou 8 para tempestade)
    SetWorldTime(0); // Meia-noite cravada

    SendClientMessageToAll(0xED4245FF, "⚠️ A SIRENE TERMINOU. TODOS OS CRIMES ESTÃO LEGALIZADOS A PARTIR DE AGORA!");
    return 1;
}
