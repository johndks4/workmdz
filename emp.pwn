#define FILTERSCRIPT

#include <a_samp>

// =============================================================================
// DEFINICOES & DIALOGS
// =============================================================================
#define DIALOG_EMPS_MAIN      9900
#define DIALOG_ONIBUS_PASSAGE 9901
#define DIALOG_AJD_MAIN       9902
#define DIALOG_AJD_UBER       9903
#define DIALOG_AJD_IFOOD      9904
#define DIALOG_AJD_ONIBUS     9905
#define DIALOG_AJD_EMPREGOS   9906
#define DIALOG_PONTOS_GPS     9907

// Cores em HEX para SendClientMessage & Dialogs
#define COR_AZUL        0x33CCFFFF
#define COR_VERMELHO    0xFF3333FF
#define COR_VERDE       0x33FF33FF
#define COR_LARANJA     0xFF9900FF
#define COR_CINZA       0xAFAFAFFF
#define COR_BRANCO      0xFFFFFFFF
#define COR_AMARELO     0xFFFF33FF

#define SLOT_ACESSORIO 1

// Tipos de Emprego
enum
{
    EMP_NENHUM = 0,
    EMP_IFOOD,
    EMP_UBER,
    EMP_MECANICO,
    EMP_CAMINHO,
    EMP_ONIBUS
};

// Variaveis Globais por Jogador
new EmpregoAtual[MAX_PLAYERS];
new EtapaTrabalho[MAX_PLAYERS];
new VeiculoEmprego[MAX_PLAYERS] = {INVALID_VEHICLE_ID, ...};
new PontoGPS[MAX_PLAYERS];
new RotaOnibusIndex[MAX_PLAYERS];

// Pontos de Onibus (Coordenadas X, Y, Z, Nome)
enum enum_PontosOnibus
{
    NomePonto[32],
    Float:PontoX,
    Float:PontoY,
    Float:PontoZ
};

new const PontosOnibus[][enum_PontosOnibus] = {
    {"Prefeitura de Los Santos", 1481.0, -1771.0, 18.7},
    {"Hospital Central",         1188.0, -1323.0, 15.8},
    {"Departamento de Policia",  1172.0, -1430.0, 15.4},
    {"Estacao Unity",            1758.0, -1898.0, 13.5},
    {"Bairro Ganton",            2230.0, -1670.0, 15.0},
    {"Praia de Santa Maria",     385.0,  -1812.0, 7.8},
    {"Commerce Center",          1350.0, -1280.0, 13.5},
    {"Aeroporto Internacional",   1680.0, -2240.0, 13.5}
};

// Objetos/Labels dos Pontos
new Text3D:LabelPontos[sizeof(PontosOnibus)];
new PickupPontos[sizeof(PontosOnibus)];

// Coordenadas do iFood (Restaurantes)
new Float:RestaurantesIfood[][3] = {
    {2105.32, -1806.45, 13.55},
    {1199.12, -888.34, 43.10},
    {2421.10, -1509.20, 24.00},
    {1368.50, -1279.80, 13.54}
};

// Coordenadas do iFood (Entregas nas Casas)
new Float:CasasIfood[][3] = {
    {2230.15, -1159.40, 25.80},
    {2487.60, -1670.30, 13.30},
    {1920.40, -1400.10, 13.50},
    {1015.80, -1125.60, 23.80}
};

// Coordenadas de Cargas para Caminhoneiro
new Float:DestinosCaminhao[][3] = {
    {2780.12, -2430.45, 13.65},
    {2180.50, -690.30, 11.20},
    {-1020.40, -620.10, 32.50},
    {1410.80, 1480.60, 10.80}
};

// Forward Declarations
forward NovaColetaIfood(playerid);
forward NovaCargaCaminhao(playerid);

// =============================================================================
// CALLBACKS DO FILTERSCRIPT
// =============================================================================

public OnFilterScriptInit()
{
    print("\n-----------------------------------------------------");
    print("  FS Central de Empregos (/emps) - Versao 4.0 Clean  ");
    print("-----------------------------------------------------\n");

    // Criar Labels e Pickups dos Pontos de Onibus
    for(new i = 0; i < sizeof(PontosOnibus); i++)
    {
        new strLabel[128];
        format(strLabel, sizeof(strLabel), "{33CCFF}[PONTO DE ONIBUS]\n{FFFFFF}%s\n{AFAFAF}Use /pegaronibus para viajar", PontosOnibus[i][NomePonto]);
        LabelPontos[i] = Create3DTextLabel(strLabel, 0xFFFFFFFF, PontosOnibus[i][PontoX], PontosOnibus[i][PontoY], PontosOnibus[i][PontoZ] + 0.5, 20.0, 0, 1);
        PickupPontos[i] = CreatePickup(1239, 1, PontosOnibus[i][PontoX], PontosOnibus[i][PontoY], PontosOnibus[i][PontoZ], -1);
    }
    return 1;
}

public OnFilterScriptExit()
{
    for(new i = 0; i < sizeof(PontosOnibus); i++)
    {
        Delete3DTextLabel(LabelPontos[i]);
        DestroyPickup(PickupPontos[i]);
    }

    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i)) EncerrarEmprego(i, false);
    }
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    EncerrarEmprego(playerid, false);
    return 1;
}

// =============================================================================
// COMANDOS
// =============================================================================

public OnPlayerCommandText(playerid, cmdtext[])
{
    // Central de Empregos
    if (strcmp(cmdtext, "/emps", true) == 0 || strcmp(cmdtext, "/empregos", true) == 0 || strcmp(cmdtext, "/tbr", true) == 0)
    {
        AbrirMenuEmpregos(playerid);
        return 1;
    }

    // Demissao
    if (strcmp(cmdtext, "/demissao", true) == 0 || strcmp(cmdtext, "/sairtrabalho", true) == 0)
    {
        if(EmpregoAtual[playerid] == EMP_NENHUM)
        {
            SendClientMessage(playerid, COR_VERMELHO, "[ERRO] Voce nao esta trabalhando em nenhum emprego no momento.");
            return 1;
        }
        EncerrarEmprego(playerid, true);
        return 1;
    }

    // Sistema de Ajuda para os Jogadores
    if (strcmp(cmdtext, "/ajd", true) == 0 || strcmp(cmdtext, "/ajuda", true) == 0)
    {
        AbrirMenuAjuda(playerid);
        return 1;
    }

    // Localizador GPS de Pontos de Onibus
    if (strcmp(cmdtext, "/pontos", true) == 0 || strcmp(cmdtext, "/pontosonibus", true) == 0)
    {
        AbrirGPSPontos(playerid);
        return 1;
    }

    // Pegar Onibus no Ponto
    if (strcmp(cmdtext, "/pegaronibus", true) == 0 || strcmp(cmdtext, "/onibus", true) == 0)
    {
        new bool:pertoDePonto = false;
        for(new i = 0; i < sizeof(PontosOnibus); i++)
        {
            if(IsPlayerInRangeOfPoint(playerid, 3.5, PontosOnibus[i][PontoX], PontosOnibus[i][PontoY], PontosOnibus[i][PontoZ]))
            {
                pertoDePonto = true;
                break;
            }
        }

        if(!pertoDePonto)
        {
            SendClientMessage(playerid, COR_VERMELHO, "[ONIBUS] Voce precisa estar em um Ponto de Onibus para viajar. Use /pontos para localizar um.");
            return 1;
        }

        new menu[512];
        strcat(menu, "{33CCFF}Destino\t{33CCFF}Tarifa\n");
        for(new i = 0; i < sizeof(PontosOnibus); i++)
        {
            new linha[128];
            format(linha, sizeof(linha), "{EFEFEF}%s\t{00FF00}$25\n", PontosOnibus[i][NomePonto]);
            strcat(menu, linha);
        }

        ShowPlayerDialog(playerid, DIALOG_ONIBUS_PASSAGE, DIALOG_STYLE_TABLIST_HEADERS, "{33CCFF}:: LINHAS DE ONIBUS URBANAS ::", menu, "Viajar", "Cancelar");
        return 1;
    }
    return 0;
}

// =============================================================================
// INTERFACES DE DIALOGS
// =============================================================================

stock AbrirMenuEmpregos(playerid)
{
    new menu[600];
    strcat(menu, "{33CCFF}Emprego\t{33CCFF}Veiculo\t{33CCFF}Pagamento\t{33CCFF}Status\n");
    strcat(menu, "{EFEFEF}Entregador iFood\t{AFAFAF}Faggio\t{00FF00}$450 - $700\t{00FF00}[Disponivel]\n");
    strcat(menu, "{EFEFEF}Motorista Uber\t{AFAFAF}Premier\t{00FF00}Por Corrida\t{00FF00}[Disponivel]\n");
    strcat(menu, "{EFEFEF}Mecanico / Socorro\t{AFAFAF}Towtruck\t{00FF00}Por Servico\t{00FF00}[Disponivel]\n");
    strcat(menu, "{EFEFEF}Caminhoneiro\t{AFAFAF}Linerunner\t{00FF00}$1200 - $2000\t{00FF00}[Disponivel]\n");
    strcat(menu, "{EFEFEF}Motorista de Onibus\t{AFAFAF}Bus\t{00FF00}$300 / Ponto\t{00FF00}[Disponivel]\n");

    if(EmpregoAtual[playerid] != EMP_NENHUM)
    {
        strcat(menu, "{FF3333}Encerrar Expediente\t{AFAFAF}-\t{FF3333}-\t{FF3333}[Pedir Demissao]");
    }

    ShowPlayerDialog(playerid, DIALOG_EMPS_MAIN, DIALOG_STYLE_TABLIST_HEADERS, "{33CCFF}:: AGENCIA DE EMPREGOS CENTRAL ::", menu, "Selecionar", "Fechar");
    return 1;
}

stock AbrirMenuAjuda(playerid)
{
    new menu[300];
    strcat(menu, "Categoria\tDescricao\n");
    strcat(menu, "{33CCFF}1. Como Trabalhar\t{AFAFAF}[ Comandos /emps e /tbr ]\n");
    strcat(menu, "{33CCFF}2. Como Pedir Uber\t{AFAFAF}[ Sistema de Celular e Transportes ]\n");
    strcat(menu, "{33CCFF}3. Como Pedir iFood\t{AFAFAF}[ Pedir Refeicoes ]\n");
    strcat(menu, "{33CCFF}4. Como Usar Onibus\t{AFAFAF}[ Comando /pontos e /pegaronibus ]");

    ShowPlayerDialog(playerid, DIALOG_AJD_MAIN, DIALOG_STYLE_TABLIST_HEADERS, "{33CCFF}:: CENTRAL DE AJUDA AO JOGADOR ::", menu, "Selecionar", "Fechar");
    return 1;
}

stock AbrirGPSPontos(playerid)
{
    new menu[512];
    strcat(menu, "{33CCFF}Ponto de Onibus\t{33CCFF}Status\n");
    for(new i = 0; i < sizeof(PontosOnibus); i++)
    {
        new linha[128];
        format(linha, sizeof(linha), "{EFEFEF}%s\t{00FF00}[ Marcar no GPS ]\n", PontosOnibus[i][NomePonto]);
        strcat(menu, linha);
    }

    ShowPlayerDialog(playerid, DIALOG_PONTOS_GPS, DIALOG_STYLE_TABLIST_HEADERS, "{33CCFF}:: LOCALIZAR PONTOS DE ONIBUS ::", menu, "Marcar", "Cancelar");
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    // MENU PRINCIPAL DE EMPREGOS
    if(dialogid == DIALOG_EMPS_MAIN)
    {
        if(!response) return 1;

        if(listitem < 5 && EmpregoAtual[playerid] != EMP_NENHUM)
        {
            EncerrarEmprego(playerid, false);
            SendClientMessage(playerid, COR_AZUL, "[EMPREGOS] Seu expediente anterior foi encerrado para iniciar o novo trabalho.");
        }

        switch(listitem)
        {
            case 0: IniciarIfood(playerid);
            case 1: IniciarUber(playerid);
            case 2: IniciarMecanico(playerid);
            case 3: IniciarCaminhoneiro(playerid);
            case 4: IniciarMotoristaOnibus(playerid);
            case 5: EncerrarEmprego(playerid, true);
        }
        return 1;
    }

    // SELECAO DE DESTINO DE ONIBUS
    if(dialogid == DIALOG_ONIBUS_PASSAGE)
    {
        if(!response) return 1;

        new destino = listitem;
        if(GetPlayerMoney(playerid) < 25)
        {
            SendClientMessage(playerid, COR_VERMELHO, "[ONIBUS] Voce nao tem $25 para pagar a passagem.");
            return 1;
        }

        GivePlayerMoney(playerid, -25);
        SetPlayerPos(playerid, PontosOnibus[destino][PontoX], PontosOnibus[destino][PontoY], PontosOnibus[destino][PontoZ] + 1.0);
        SetCameraBehindPlayer(playerid);

        new msg[128];
        format(msg, sizeof(msg), "[ONIBUS] Voce pagou $25 e viajou para: %s.", PontosOnibus[destino][NomePonto]);
        SendClientMessage(playerid, COR_VERDE, msg);
        GameTextForPlayer(playerid, "~g~Chegou ao Destino!", 3000, 1);
        return 1;
    }

    // GPS PONTOS DE ONIBUS
    if(dialogid == DIALOG_PONTOS_GPS)
    {
        if(!response) return 1;

        new idPonto = listitem;
        SetPlayerCheckpoint(playerid, PontosOnibus[idPonto][PontoX], PontosOnibus[idPonto][PontoY], PontosOnibus[idPonto][PontoZ], 4.0);

        new msg[128];
        format(msg, sizeof(msg), "[GPS] O Ponto de Onibus '%s' foi marcado no seu radar!", PontosOnibus[idPonto][NomePonto]);
        SendClientMessage(playerid, COR_AZUL, msg);
        return 1;
    }

    // CENTRAL DE AJUDA (/AJD)
    if(dialogid == DIALOG_AJD_MAIN)
    {
        if(!response) return 1;

        switch(listitem)
        {
            case 0: // Como Trabalhar
            {
                new txt[400];
                strcat(txt, "{33CCFF}COMO PEGAR E EXECUTAR EMPREGOS:\n\n");
                strcat(txt, "{FFFFFF}1. Digite {00FF00}/emps{FFFFFF} ou {00FF00}/tbr{FFFFFF} para abrir a agencia de empregos.\n");
                strcat(txt, "{FFFFFF}2. Escolha o trabalho desejado para receber seu veiculo na hora.\n");
                strcat(txt, "{FFFFFF}3. Siga as instrucoes enviadas no chat e a rota no radar.\n");
                strcat(txt, "{FFFFFF}4. Para encerrar seu expediente, digite {FF3333}/demissao{FFFFFF}.");
                ShowPlayerDialog(playerid, DIALOG_AJD_EMPREGOS, DIALOG_STYLE_MSGBOX, "{33CCFF}AJUDA - EMPREGOS", txt, "Voltar", "");
            }
            case 1: // Como Pedir Uber
            {
                new txt[400];
                strcat(txt, "{33CCFF}COMO SOLICITAR UM UBER:\n\n");
                strcat(txt, "{FFFFFF}1. Abra o seu Smartphone digitando {00FF00}/cel{FFFFFF}.\n");
                strcat(txt, "{FFFFFF}2. Acesse o aplicativo Uber ou solicite transporte no chat.\n");
                strcat(txt, "{FFFFFF}3. Aguarde um motorista cadastrado aceitar sua corrida.\n");
                strcat(txt, "{FFFFFF}4. Combine a tarifa com o motorista e boa viagem!");
                ShowPlayerDialog(playerid, DIALOG_AJD_UBER, DIALOG_STYLE_MSGBOX, "{33CCFF}AJUDA - PEDIR UBER", txt, "Voltar", "");
            }
            case 2: // Como Pedir iFood
            {
                new txt[400];
                strcat(txt, "{33CCFF}COMO PEDIR REFEICOES (IFOOD):\n\n");
                strcat(txt, "{FFFFFF}1. Digite {00FF00}/cel{FFFFFF} para abrir seu smartphone.\n");
                strcat(txt, "{FFFFFF}2. Clique no aplicativo {EA1D2C}iFood{FFFFFF}.\n");
                strcat(txt, "{FFFFFF}3. Escolha a opcao 'Pedir Refeicao' por apenas $50.\n");
                strcat(txt, "{FFFFFF}4. Sua vida sera recuperada instantaneamente!");
                ShowPlayerDialog(playerid, DIALOG_AJD_IFOOD, DIALOG_STYLE_MSGBOX, "{33CCFF}AJUDA - PEDIR IFOOD", txt, "Voltar", "");
            }
            case 3: // Como Usar Onibus
            {
                new txt[450];
                strcat(txt, "{33CCFF}COMO USAR O TRANSPORTE PUBLICO:\n\n");
                strcat(txt, "{FFFFFF}1. Digite {00FF00}/pontos{FFFFFF} para ver a lista e marcar um Ponto de Onibus no GPS.\n");
                strcat(txt, "{FFFFFF}2. Va ate a parada marcada no radar (identificada com holograma 3D).\n");
                strcat(txt, "{FFFFFF}3. Estando no ponto, digite {00FF00}/pegaronibus{FFFFFF} ou {00FF00}/onibus{FFFFFF}.\n");
                strcat(txt, "{FFFFFF}4. Selecione seu local de destino na lista e pague $25 pela passagem.");
                ShowPlayerDialog(playerid, DIALOG_AJD_ONIBUS, DIALOG_STYLE_MSGBOX, "{33CCFF}AJUDA - ONIBUS", txt, "Voltar", "");
            }
        }
        return 1;
    }

    if(dialogid == DIALOG_AJD_EMPREGOS || dialogid == DIALOG_AJD_UBER || dialogid == DIALOG_AJD_IFOOD || dialogid == DIALOG_AJD_ONIBUS)
    {
        AbrirMenuAjuda(playerid);
        return 1;
    }

    return 1;
}

// =============================================================================
// INICIALIZACAO DE CADA EMPREGO
// =============================================================================

stock IniciarIfood(playerid)
{
    EmpregoAtual[playerid] = EMP_IFOOD;
    EtapaTrabalho[playerid] = 1;

    VeiculoEmprego[playerid] = CriarVeiculoTrabalho(playerid, 462, 3, 3);
    SetPlayerAttachedObject(playerid, SLOT_ACESSORIO, 1210, 1, 0.0, -0.25, 0.0, 0.0, 90.0, 90.0, 0.8, 0.8, 0.8);

    SendClientMessage(playerid, COR_AZUL, "--------------------------------------------------");
    SendClientMessage(playerid, COR_BRANCO, "[IFOOD] Voce iniciou como Entregador de Comida!");
    SendClientMessage(playerid, COR_CINZA, "Sua moto Faggio foi gerada. Va ate o restaurante no mapa.");
    SendClientMessage(playerid, COR_AZUL, "--------------------------------------------------");

    new idRest = random(sizeof(RestaurantesIfood));
    PontoGPS[playerid] = idRest;
    SetPlayerCheckpoint(playerid, RestaurantesIfood[idRest][0], RestaurantesIfood[idRest][1], RestaurantesIfood[idRest][2], 3.5);
    return 1;
}

stock IniciarUber(playerid)
{
    EmpregoAtual[playerid] = EMP_UBER;

    VeiculoEmprego[playerid] = CriarVeiculoTrabalho(playerid, 426, 0, 0);

    SendClientMessage(playerid, COR_AZUL, "--------------------------------------------------");
    SendClientMessage(playerid, COR_BRANCO, "[UBER] Voce iniciou como Motorista Particular!");
    SendClientMessage(playerid, COR_CINZA, "Seu veiculo executivo foi gerado. Fique atento aos chamados.");
    SendClientMessage(playerid, COR_AZUL, "--------------------------------------------------");
    return 1;
}

stock IniciarMecanico(playerid)
{
    EmpregoAtual[playerid] = EMP_MECANICO;

    VeiculoEmprego[playerid] = CriarVeiculoTrabalho(playerid, 525, 1, 1);

    SendClientMessage(playerid, COR_AZUL, "--------------------------------------------------");
    SendClientMessage(playerid, COR_BRANCO, "[MECANICO] Voce iniciou o expediente de Mecanico!");
    SendClientMessage(playerid, COR_CINZA, "Seu guincho foi gerado. Atenda chamados e preste socorro.");
    SendClientMessage(playerid, COR_AZUL, "--------------------------------------------------");
    return 1;
}

stock IniciarCaminhoneiro(playerid)
{
    EmpregoAtual[playerid] = EMP_CAMINHAO;
    EtapaTrabalho[playerid] = 1;

    VeiculoEmprego[playerid] = CriarVeiculoTrabalho(playerid, 403, 1, 0);

    SendClientMessage(playerid, COR_AZUL, "--------------------------------------------------");
    SendClientMessage(playerid, COR_BRANCO, "[CAMINHONEIRO] Voce iniciou no Transporte de Cargas!");
    SendClientMessage(playerid, COR_CINZA, "Seu caminhao foi gerado. Siga a rota marcada no GPS.");
    SendClientMessage(playerid, COR_AZUL, "--------------------------------------------------");

    new idCarga = random(sizeof(DestinosCaminhao));
    PontoGPS[playerid] = idCarga;
    SetPlayerCheckpoint(playerid, DestinosCaminhao[idCarga][0], DestinosCaminhao[idCarga][1], DestinosCaminhao[idCarga][2], 6.0);
    return 1;
}

stock IniciarMotoristaOnibus(playerid)
{
    EmpregoAtual[playerid] = EMP_ONIBUS;
    RotaOnibusIndex[playerid] = 0;

    VeiculoEmprego[playerid] = CriarVeiculoTrabalho(playerid, 431, 1, 3); // Bus ID 431

    SendClientMessage(playerid, COR_AZUL, "--------------------------------------------------");
    SendClientMessage(playerid, COR_BRANCO, "[ONIBUS] Voce iniciou como Motorista de Onibus!");
    SendClientMessage(playerid, COR_CINZA, "Seu onibus foi gerado. Siga a linha de pontos no GPS.");
    SendClientMessage(playerid, COR_AZUL, "--------------------------------------------------");

    SetPlayerCheckpoint(playerid, PontosOnibus[0][PontoX], PontosOnibus[0][PontoY], PontosOnibus[0][PontoZ], 5.0);
    new msg[128];
    format(msg, sizeof(msg), "[ONIBUS] Proxima Parada: %s.", PontosOnibus[0][NomePonto]);
    SendClientMessage(playerid, COR_AMARELO, msg);
    return 1;
}

// =============================================================================
// CHECKPOINTS E PAGAMENTOS
// =============================================================================

public OnPlayerEnterCheckpoint(playerid)
{
    if(EmpregoAtual[playerid] == EMP_IFOOD)
    {
        if(EtapaTrabalho[playerid] == 1)
        {
            DisablePlayerCheckpoint(playerid);
            GameTextForPlayer(playerid, "~w~Pedido ~g~Retirado!~n~~w~Entregue ao cliente.", 3000, 1);

            new idCasa = random(sizeof(CasasIfood));
            EtapaTrabalho[playerid] = 2;
            SetPlayerCheckpoint(playerid, CasasIfood[idCasa][0], CasasIfood[idCasa][1], CasasIfood[idCasa][2], 3.5);
            SendClientMessage(playerid, COR_AZUL, "[IFOOD] Pedido retirado com sucesso! A rota da entrega foi marcada no GPS.");
            return 1;
        }
        else if(EtapaTrabalho[playerid] == 2)
        {
            DisablePlayerCheckpoint(playerid);

            new pag = 450 + random(250);
            GivePlayerMoney(playerid, pag);

            new str[128];
            format(str, sizeof(str), "~g~Entrega Concluida!~n~~w~Pagamento: ~g~$%d", pag);
            GameTextForPlayer(playerid, str, 3000, 1);

            EtapaTrabalho[playerid] = 1;
            SetTimerEx("NovaColetaIfood", 4000, false, "i", playerid);
            return 1;
        }
    }

    if(EmpregoAtual[playerid] == EMP_CAMINHAO)
    {
        DisablePlayerCheckpoint(playerid);

        new pag = 1200 + random(800);
        GivePlayerMoney(playerid, pag);

        new str[128];
        format(str, sizeof(str), "~g~Carga Entregue!~n~~w~Pagamento: ~g~$%d", pag);
        GameTextForPlayer(playerid, str, 3000, 1);

        SetTimerEx("NovaCargaCaminhao", 5000, false, "i", playerid);
        return 1;
    }

    if(EmpregoAtual[playerid] == EMP_ONIBUS)
    {
        DisablePlayerCheckpoint(playerid);

        new pag = 300;
        GivePlayerMoney(playerid, pag);

        new idx = RotaOnibusIndex[playerid];
        new str[128];
        format(str, sizeof(str), "~g~Parada Concluida!~n~~w~%s~n~~g~+$%d", PontosOnibus[idx][NomePonto], pag);
        GameTextForPlayer(playerid, str, 3000, 1);

        idx = (idx + 1) % sizeof(PontosOnibus);
        RotaOnibusIndex[playerid] = idx;

        SetPlayerCheckpoint(playerid, PontosOnibus[idx][PontoX], PontosOnibus[idx][PontoY], PontosOnibus[idx][PontoZ], 5.0);

        format(str, sizeof(str), "[ONIBUS] Parada efetuada. Proxima Parada: %s.", PontosOnibus[idx][NomePonto]);
        SendClientMessage(playerid, COR_AMARELO, str);
        return 1;
    }

    return 1;
}

public NovaColetaIfood(playerid)
{
    if(EmpregoAtual[playerid] == EMP_IFOOD)
    {
        new idRest = random(sizeof(RestaurantesIfood));
        SetPlayerCheckpoint(playerid, RestaurantesIfood[idRest][0], RestaurantesIfood[idRest][1], RestaurantesIfood[idRest][2], 3.5);
        SendClientMessage(playerid, COR_AZUL, "[IFOOD] Novo pedido disponivel! Va ate o restaurante marcado no mapa.");
    }
    return 1;
}

public NovaCargaCaminhao(playerid)
{
    if(EmpregoAtual[playerid] == EMP_CAMINHAO)
    {
        new idCarga = random(sizeof(DestinosCaminhao));
        SetPlayerCheckpoint(playerid, DestinosCaminhao[idCarga][0], DestinosCaminhao[idCarga][1], DestinosCaminhao[idCarga][2], 6.0);
        SendClientMessage(playerid, COR_AZUL, "[CAMINHONEIRO] Nova rota de carga definida no seu GPS!");
    }
    return 1;
}

// =============================================================================
// FUNCOES AUXILIARES
// =============================================================================

stock CriarVeiculoTrabalho(playerid, modelid, cor1, cor2)
{
    new Float:x, Float:y, Float:z, Float:a;
    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, a);

    x += (3.5 * floatsin(-a, degrees));
    y += (3.5 * floatcos(-a, degrees));

    new veh = CreateVehicle(modelid, x, y, z + 0.5, a, cor1, cor2, -1);
    LinkVehicleToInterior(veh, GetPlayerInterior(playerid));
    SetVehicleVirtualWorld(veh, GetPlayerVirtualWorld(playerid));
    return veh;
}

stock EncerrarEmprego(playerid, bool:mensagem)
{
    EmpregoAtual[playerid] = EMP_NENHUM;
    EtapaTrabalho[playerid] = 0;
    RotaOnibusIndex[playerid] = 0;
    DisablePlayerCheckpoint(playerid);

    if(IsPlayerAttachedObjectSlotUsed(playerid, SLOT_ACESSORIO))
    {
        RemovePlayerAttachedObject(playerid, SLOT_ACESSORIO);
    }

    if(VeiculoEmprego[playerid] != INVALID_VEHICLE_ID)
    {
        DestroyVehicle(VeiculoEmprego[playerid]);
        VeiculoEmprego[playerid] = INVALID_VEHICLE_ID;
    }

    if(mensagem)
    {
        SendClientMessage(playerid, COR_VERDE, "[EMPREGOS] Voce encerrou seu expediente e devolveu os equipamentos com sucesso.");
    }
    return 1;
}
