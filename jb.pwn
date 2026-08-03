// ================================================================
// RPG COMPLETE - Empregos, Habilidades, Missões, Uber e mais
// Filterscript para SA-MP
// Autor: MDZ
// Versão: 3.1
// ================================================================

#include <a_samp>
#include <zcmd>
#include <sscanf2>
#include <streamer>

// ==================== CONFIGURAÇÕES ====================

#define MAX_JOBS 30
#define MAX_JOB_LOCATIONS 5
#define MAX_JOB_RANK 20
#define MAX_SKILLS 12
#define MAX_DAILY_MISSIONS 5
#define MAX_SPECIAL_MISSIONS 10

#define XP_PER_LEVEL 500
#define PAY_INTERVAL 60

// ==================== RANKS DO EMPREGO ====================

new JobRankNames[MAX_JOB_RANK][32] = {
    "Estagiario", "Aprendiz", "Trabalhador", "Especialista", "Profissional",
    "Mestre", "Perito", "Senior", "Gerente", "Diretor",
    "Executivo", "Presidente", "Magnata", "Bilionario", "Monopolista",
    "Industriario", "Capitalista", "Imperador", "Lorde", "Rei"
};

new JobRankColors[MAX_JOB_RANK] = {
    0xFFFFFFFF, 0x00FF00FF, 0x0000FFFF, 0xFF00FFFF, 0xFFA500FF,
    0xFFFF00FF, 0xFF0000FF, 0x00FFFFFF, 0xFFD700FF, 0xFF69B4FF,
    0xFFFF00FF, 0xFF0000FF, 0x00FF00FF, 0x0000FFFF, 0xFFA500FF,
    0xFFFFFF00, 0x00FFFFFF, 0xFF00FFFF, 0xFFFF0000, 0xFFFFFFFF
};

// ==================== DEFINIÇÃO DOS EMPREGOS ====================

enum JobData {
    jobName[32],
    jobDesc[64],
    jobColor,
    jobVehicle,
    Float:jobLocations[MAX_JOB_LOCATIONS][3],
    jobMissions[3][64],
    jobMissionReward[3],
    jobPayBase,
    jobXpBase,
    jobType,          // 0: normal, 1: Uber (NPC taxi)
    bool:jobActive
}

new Jobs[MAX_JOBS][JobData] = {
    // 1-5: Básicos
    {"Lenhador", "Corte arvores na floresta", 0x8B4513FF, 422,
        {{-1000.0, 0.0, 0.0}, {-900.0, 0.0, 0.0}, {-800.0, 0.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Corte 10 arvores", "Entregue a madeira", "Ate o fogo"},
        {200, 300, 500}, 80, 10, 0, true
    },
    {"Agricultor", "Plante e colha na fazenda", 0x228B22FF, 532,
        {{-2000.0, 1000.0, 0.0}, {-1900.0, 1000.0, 0.0}, {-1800.0, 1000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Plante 10 sementes", "Colha 15 frutas", "Regue as plantas"},
        {150, 250, 400}, 70, 10, 0, true
    },
    {"Mineiro", "Extraia minerios", 0x808080FF, 406,
        {{-1500.0, -500.0, 0.0}, {-1600.0, -500.0, 0.0}, {-1700.0, -500.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Extraia 5 minerios", "Refine 3 pedras", "Venda o ouro"},
        {180, 280, 450}, 90, 12, 0, true
    },
    {"Pescador", "Pesque no lago", 0x4169E1FF, 472,
        {{-100.0, -100.0, 0.0}, {-50.0, -150.0, 0.0}, {-150.0, -50.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Pesque 8 peixes", "Venda o peixe", "Prepare a isca"},
        {120, 220, 350}, 70, 10, 0, true
    },
    {"Entregador", "Faça entregas", 0xFFA500FF, 480,
        {{2000.0, 2000.0, 0.0}, {2500.0, 2000.0, 0.0}, {3000.0, 2000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Entregue 5 pacotes", "Leve 3 encomendas", "Rota rapida"},
        {200, 300, 500}, 100, 15, 0, true
    },
    // 6-10: Intermediários
    {"Mecanico", "Repare veiculos", 0x0000FFFF, 492,
        {{-500.0, -500.0, 0.0}, {-400.0, -500.0, 0.0}, {-500.0, -400.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Repare 5 carros", "Troque o oleo", "Calibre os pneus"},
        {250, 400, 600}, 120, 20, 0, true
    },
    {"Taxista", "Leve passageiros", 0xFFFF00FF, 438,
        {{1000.0, 1000.0, 0.0}, {1500.0, 1000.0, 0.0}, {2000.0, 1000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Leve 5 passageiros", "Faca 3 corridas longas", "Atendimento VIP"},
        {300, 500, 700}, 150, 25, 0, true
    },
    {"Entregador de Pizza", "Entregue pizzas", 0xCD5C5CFF, 482,
        {{-3000.0, 3000.0, 0.0}, {-3200.0, 3000.0, 0.0}, {-3400.0, 3000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Entregue 10 pizzas", "Pizza quente", "Cliente especial"},
        {180, 300, 450}, 110, 18, 0, true
    },
    {"Coletor de Lixo", "Colete lixo", 0x2F4F4FFF, 408,
        {{4000.0, 4000.0, 0.0}, {4100.0, 4000.0, 0.0}, {4200.0, 4000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Colete 15 latas", "Recicle 10 garrafas", "Entregue ao centro"},
        {100, 200, 300}, 60, 10, 0, true
    },
    {"Jornalista", "Encontre noticias", 0xDEB887FF, 445,
        {{-4000.0, -4000.0, 0.0}, {-4100.0, -4000.0, 0.0}, {-4200.0, -4000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Entreviste 3 pessoas", "Fotografe 5 eventos", "Escreva a materia"},
        {220, 350, 550}, 130, 20, 0, true
    },
    // 11-15: Avançados
    {"Motorista de Caminhao", "Transporte cargas", 0x696969FF, 456,
        {{-2000.0, 2000.0, 0.0}, {-2200.0, 2000.0, 0.0}, {-2400.0, 2000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Carregue 5 cargas", "Viagem longa", "Entrega rapida"},
        {400, 600, 800}, 200, 30, 0, true
    },
    {"Seguranca", "Patrulhe areas", 0x000000FF, 492,
        {{0.0, 0.0, 0.0}, {100.0, 0.0, 0.0}, {0.0, 100.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Patrulhe 10 quarteiroes", "Reporte 3 incidentes", "Proteja o local"},
        {150, 250, 400}, 80, 12, 0, true
    },
    {"Construtor", "Construa edificios", 0xDAA520FF, 578,
        {{-6000.0, 5000.0, 0.0}, {-6100.0, 5000.0, 0.0}, {-6200.0, 5000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Construa 3 paredes", "Pinte 2 casas", "Termine o projeto"},
        {350, 550, 750}, 220, 30, 0, true
    },
    {"Cozinheiro", "Prepare refeicoes", 0xFF6347FF, 496,
        {{-1000.0, 2000.0, 0.0}, {-1100.0, 2000.0, 0.0}, {-1200.0, 2000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Cozinhe 5 pratos", "Crie um novo prato", "Sirva 10 clientes"},
        {280, 450, 700}, 180, 25, 0, true
    },
    {"Guarda Florestal", "Proteja a natureza", 0x3CB371FF, 574,
        {{-5000.0, -5000.0, 0.0}, {-5100.0, -5000.0, 0.0}, {-5200.0, -5000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Patrulhe a floresta", "Plante 10 arvores", "Salve um animal"},
        {200, 350, 500}, 150, 22, 0, true
    },
    // 16-20: Especializados
    {"Medico", "Trate pacientes", 0xDC143CFF, 437,
        {{-2000.0, -2000.0, 0.0}, {-2100.0, -2000.0, 0.0}, {-2200.0, -2000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Trate 5 pacientes", "Realize uma cirurgia", "Salve uma vida"},
        {500, 800, 1200}, 300, 40, 0, true
    },
    {"Bombeiro", "Apague incendios", 0xFF4500FF, 527,
        {{-3000.0, -3000.0, 0.0}, {-3100.0, -3000.0, 0.0}, {-3200.0, -3000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Apague 3 incendios", "Salve uma pessoa", "Resgate um animal"},
        {400, 600, 900}, 250, 35, 0, true
    },
    {"Cientista", "Faça pesquisas", 0x8A2BE2FF, 535,
        {{-7000.0, 7000.0, 0.0}, {-7100.0, 7000.0, 0.0}, {-7200.0, 7000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Pesquise 3 amostras", "Descubra algo novo", "Publicue um artigo"},
        {600, 900, 1500}, 400, 50, 0, true
    },
    {"Piloto de Helicoptero", "Transporte VIPs", 0x00CED1FF, 548,
        {{-8000.0, 8000.0, 0.0}, {-8100.0, 8000.0, 0.0}, {-8200.0, 8000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Transporte 3 VIPs", "Voo cenario", "Pouso de emergencia"},
        {700, 1000, 1800}, 500, 60, 0, true
    },
    {"Mergulhador", "Explore o fundo do mar", 0x1E90FFFF, 563,
        {{-9000.0, -9000.0, -10.0}, {-9100.0, -9000.0, -10.0}, {-9200.0, -9000.0, -10.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Mergulhe 5 vezes", "Encontre um tesouro", "Explore uma caverna"},
        {300, 500, 800}, 200, 25, 0, true
    },
    // 21-25: Elite
    {"Detetive", "Solucione misterios", 0x4B0082FF, 413,
        {{-10000.0, 10000.0, 0.0}, {-10100.0, 10000.0, 0.0}, {-10200.0, 10000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Investigue 3 casos", "Encontre o culpado", "Feche o caso"},
        {800, 1200, 2000}, 600, 70, 0, true
    },
    {"Piloto de Aviao", "Pilote grandes aeronaves", 0xE6E6FAFF, 553,
        {{-11000.0, -11000.0, 100.0}, {-11100.0, -11000.0, 100.0}, {-11200.0, -11000.0, 100.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Pilote 5 voos", "Cruce o oceano", "Aterrisagem perfeita"},
        {1000, 1500, 2500}, 700, 80, 0, true
    },
    {"Mestre de Obras", "Gerencie construcoes", 0xB8860BFF, 582,
        {{-12000.0, 12000.0, 0.0}, {-12100.0, 12000.0, 0.0}, {-12200.0, 12000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Gerencie 5 obras", "Finalize um projeto", "Supere o orcamento"},
        {1200, 1800, 3000}, 800, 90, 0, true
    },
    {"Astronauta", "Explore o espaco", 0xFFFF00FF, 562,
        {{-13000.0, -13000.0, 500.0}, {-13100.0, -13000.0, 500.0}, {-13200.0, -13000.0, 500.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Explore 3 planetas", "Colete amostras", "Retorne a Terra"},
        {1500, 2500, 5000}, 1000, 100, 0, true
    },
    {"CEO", "Comande uma empresa", 0xFFFFFF00, 490,
        {{-14000.0, 14000.0, 0.0}, {-14100.0, 14000.0, 0.0}, {-14200.0, 14000.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Aumente os lucros", "Contrate 5 funcionarios", "Expanda o negocio"},
        {2000, 3000, 5000}, 1500, 150, 0, true
    },
    // 26: UBER (NPC taxi)
    {"Uber", "Transporte passageiros NPC", 0x00FF00FF, 438,
        {{-1500.0, 1500.0, 0.0}, {-1600.0, 1500.0, 0.0}, {-1700.0, 1500.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}},
        {"Leve o passageiro ao destino", "Corrida rapida", "Cliente 5 estrelas"},
        {400, 600, 1000}, 200, 30, 1, true
    }
};

// ==================== HABILIDADES ====================

enum SkillData {
    skillName[32],
    skillDesc[64],
    skillCost,
    skillLevelReq,
    bool:skillActive
}

new Skills[MAX_SKILLS][SkillData] = {
    {"Velocidade Extra", "Aumenta sua velocidade de corrida", 1, 3, false},
    {"Dano Aumentado", "Da +20% de dano com armas", 2, 5, false},
    {"Vida Extra", "Ganha +25 de vida maxima", 2, 7, false},
    {"Colete Reforcado", "Colete dura 50% mais", 3, 10, false},
    {"Duplo Dinheiro", "Ganhe o dobro em missoes", 3, 12, false},
    {"Regeneracao", "Recupera 5 HP por segundo", 2, 8, false},
    {"Munição Infinita", "Nunca fique sem balas", 4, 15, false},
    {"Invisibilidade", "Fica invisivel por 10s (ativo)", 3, 18, false},
    {"Super Salto", "Salta mais alto", 1, 4, false},
    {"Escudo", "Bloqueia 1 tiro a cada 10s", 4, 20, false},
    {"Uber Pro", "Aumenta ganhos do Uber em 50%", 2, 5, false},
    {"VIP", "Acesso a missoes especiais", 1, 1, false}
};

// ==================== MISSÕES DIÁRIAS ====================

enum DailyMission {
    dmName[64],
    dmDescription[128],
    dmTarget,
    dmRewardXP,
    dmRewardMoney,
    dmType,
    dmProgress
}

new DailyMissions[MAX_DAILY_MISSIONS][DailyMission];
new PlayerDailyProgress[MAX_PLAYERS][MAX_DAILY_MISSIONS];
new PlayerDailyCompleted[MAX_PLAYERS][MAX_DAILY_MISSIONS];
new bool:PlayerDailyClaimed[MAX_PLAYERS][MAX_DAILY_MISSIONS];
new LastDailyUpdate[MAX_PLAYERS];

// ==================== MISSÕES ESPECIAIS ====================

enum SpecialMission {
    smName[64],
    smDescription[128],
    smRewardXP,
    smRewardMoney,
    bool:smAvailable,
    smObjective[64]
}

new SpecialMissions[MAX_SPECIAL_MISSIONS][SpecialMission];
new PlayerSpecialProgress[MAX_PLAYERS][MAX_SPECIAL_MISSIONS];
new bool:PlayerSpecialCompleted[MAX_PLAYERS][MAX_SPECIAL_MISSIONS];
new bool:PlayerSpecialClaimed[MAX_PLAYERS][MAX_SPECIAL_MISSIONS];

// ==================== VARIÁVEIS GLOBAIS ====================

enum PlayerData {
    pJob,
    pJobLevel,
    pJobXP,
    pJobRank,
    pMoney,
    pSkillPoints,
    pSkills[MAX_SKILLS],
    bool:pSkillActive[MAX_SKILLS],
    pDailyMissionProgress[MAX_DAILY_MISSIONS],
    pDailyCompleted[MAX_DAILY_MISSIONS],
    bool:pDailyClaimed[MAX_DAILY_MISSIONS],
    pLastDailyUpdate,
    pSpecialMissionProgress[MAX_SPECIAL_MISSIONS],
    pSpecialCompleted[MAX_SPECIAL_MISSIONS],
    bool:pSpecialClaimed[MAX_SPECIAL_MISSIONS],
    pWeapons[13],
    pAmmo[13],
    Float:pArmour,
    Float:pHealth,
    pWorking,
    pWorkTimer,
    pJobVehicle,
    pJobActionCooldown,
    // Uber specific
    bool:pUberActive,
    pUberPassenger,
    Float:pUberDestination[3],
    pUberCheckpoint,
    pUberPassengerCheckpoint,
    pUberState
}

new PlayerInfo[MAX_PLAYERS][PlayerData];
new Text3D:JobLabel[MAX_PLAYERS];
new PlayerTextDraw:JobHUD[MAX_PLAYERS][10];

// ==================== FUNÇÕES BÁSICAS ====================

forward ResetDailyMissions();
forward UpdateDailyMissions(playerid);
forward LoadPlayerData(playerid);
forward SavePlayerData(playerid);
forward UberTimer(playerid);
forward UpdateUberCheckpoint(playerid);

public OnFilterScriptInit() {
    print(">> RPG Complete carregado!");
    ResetDailyMissions();
    ResetSpecialMissions();
    return 1;
}

public OnFilterScriptExit() {
    print(">> RPG Complete descarregado.");
    return 1;
}

public OnPlayerConnect(playerid) {
    // Inicialização
    PlayerInfo[playerid][pJob] = -1;
    PlayerInfo[playerid][pJobLevel] = 0;
    PlayerInfo[playerid][pJobXP] = 0;
    PlayerInfo[playerid][pJobRank] = 0;
    PlayerInfo[playerid][pMoney] = 0;
    PlayerInfo[playerid][pSkillPoints] = 0;
    for(new i=0; i<MAX_SKILLS; i++) {
        PlayerInfo[playerid][pSkills][i] = 0;
        PlayerInfo[playerid][pSkillActive][i] = false;
    }
    for(new i=0; i<MAX_DAILY_MISSIONS; i++) {
        PlayerInfo[playerid][pDailyMissionProgress][i] = 0;
        PlayerInfo[playerid][pDailyCompleted][i] = 0;
        PlayerInfo[playerid][pDailyClaimed][i] = false;
    }
    for(new i=0; i<MAX_SPECIAL_MISSIONS; i++) {
        PlayerInfo[playerid][pSpecialMissionProgress][i] = 0;
        PlayerInfo[playerid][pSpecialCompleted][i] = 0;
        PlayerInfo[playerid][pSpecialClaimed][i] = false;
    }
    for(new i=0; i<13; i++) {
        PlayerInfo[playerid][pWeapons][i] = 0;
        PlayerInfo[playerid][pAmmo][i] = 0;
    }
    PlayerInfo[playerid][pArmour] = 0.0;
    PlayerInfo[playerid][pHealth] = 100.0;
    PlayerInfo[playerid][pWorking] = 0;
    PlayerInfo[playerid][pWorkTimer] = 0;
    PlayerInfo[playerid][pJobVehicle] = INVALID_VEHICLE_ID;
    PlayerInfo[playerid][pJobActionCooldown] = 0;
    PlayerInfo[playerid][pUberActive] = false;
    PlayerInfo[playerid][pUberPassenger] = INVALID_VEHICLE_ID;
    PlayerInfo[playerid][pUberState] = 0;
    PlayerInfo[playerid][pUberCheckpoint] = 0;
    PlayerInfo[playerid][pUberPassengerCheckpoint] = 0;
    PlayerInfo[playerid][pLastDailyUpdate] = gettime();

    LoadPlayerData(playerid);
    CreateJobHUD(playerid);
    HideJobHUD(playerid);
    UpdateDailyMissions(playerid);
    return 1;
}

public OnPlayerDisconnect(playerid, reason) {
    SavePlayerData(playerid);
    DestroyJobHUD(playerid);
    return 1;
}

// ==================== HUD ====================

CreateJobHUD(playerid) {
    JobHUD[playerid][0] = CreatePlayerTextDraw(playerid, 320.0, 10.0, "EMPREGO");
    PlayerTextDrawColor(playerid, JobHUD[playerid][0], 0xFFFFFFFF);
    PlayerTextDrawBackgroundColor(playerid, JobHUD[playerid][0], 0x000000FF);
    PlayerTextDrawFont(playerid, JobHUD[playerid][0], 2);
    PlayerTextDrawSetOutline(playerid, JobHUD[playerid][0], 1);

    JobHUD[playerid][1] = CreatePlayerTextDraw(playerid, 320.0, 35.0, "Nivel: 0");
    PlayerTextDrawColor(playerid, JobHUD[playerid][1], 0xFFFF00FF);

    JobHUD[playerid][2] = CreatePlayerTextDraw(playerid, 320.0, 60.0, "XP: 0/500");
    PlayerTextDrawColor(playerid, JobHUD[playerid][2], 0x00FF00FF);

    JobHUD[playerid][3] = CreatePlayerTextDraw(playerid, 320.0, 85.0, "Rank: Estagiario");
    PlayerTextDrawColor(playerid, JobHUD[playerid][3], 0x00FFFFFF);

    JobHUD[playerid][4] = CreatePlayerTextDraw(playerid, 320.0, 110.0, "Dinheiro: $0");
    PlayerTextDrawColor(playerid, JobHUD[playerid][4], 0x00FFFFFF);

    JobHUD[playerid][5] = CreatePlayerTextDraw(playerid, 320.0, 135.0, "Habilidades: 0 pontos");
    PlayerTextDrawColor(playerid, JobHUD[playerid][5], 0xFF00FFFF);

    JobHUD[playerid][6] = CreatePlayerTextDraw(playerid, 320.0, 160.0, "Missao Diaria: Nenhuma");
    PlayerTextDrawColor(playerid, JobHUD[playerid][6], 0xFFA500FF);

    JobHUD[playerid][7] = CreatePlayerTextDraw(playerid, 320.0, 185.0, "Progresso: 0/0");
    PlayerTextDrawColor(playerid, JobHUD[playerid][7], 0xFFFFFFFF);

    JobHUD[playerid][8] = CreatePlayerTextDraw(playerid, 320.0, 210.0, "Missao Especial: Nenhuma");
    PlayerTextDrawColor(playerid, JobHUD[playerid][8], 0x00FF00FF);

    JobHUD[playerid][9] = CreatePlayerTextDraw(playerid, 320.0, 235.0, "Estado: Parado");
    PlayerTextDrawColor(playerid, JobHUD[playerid][9], 0xFFFFFFFF);
}

DestroyJobHUD(playerid) {
    for(new i=0; i<10; i++) {
        PlayerTextDrawDestroy(playerid, JobHUD[playerid][i]);
    }
}

UpdateJobHUD(playerid) {
    if (PlayerInfo[playerid][pJob] == -1) {
        HideJobHUD(playerid);
        return;
    }
    ShowJobHUD(playerid);
    new str[128];
    format(str, 128, "Emprego: %s", Jobs[PlayerInfo[playerid][pJob]][jobName]);
    PlayerTextDrawSetString(playerid, JobHUD[playerid][0], str);

    format(str, 128, "Nivel: %d", PlayerInfo[playerid][pJobLevel]);
    PlayerTextDrawSetString(playerid, JobHUD[playerid][1], str);

    format(str, 128, "XP: %d/%d", PlayerInfo[playerid][pJobXP], XP_PER_LEVEL * (PlayerInfo[playerid][pJobLevel]+1));
    PlayerTextDrawSetString(playerid, JobHUD[playerid][2], str);

    new rank = PlayerInfo[playerid][pJobRank];
    format(str, 128, "Rank: %s", JobRankNames[rank]);
    PlayerTextDrawSetString(playerid, JobHUD[playerid][3], str);

    format(str, 128, "Dinheiro: $%d", PlayerInfo[playerid][pMoney]);
    PlayerTextDrawSetString(playerid, JobHUD[playerid][4], str);

    format(str, 128, "Habilidades: %d pontos", PlayerInfo[playerid][pSkillPoints]);
    PlayerTextDrawSetString(playerid, JobHUD[playerid][5], str);

    // Daily mission
    for(new i=0; i<MAX_DAILY_MISSIONS; i++) {
        if (!PlayerInfo[playerid][pDailyCompleted][i]) {
            format(str, 128, "Missao Diaria: %s", DailyMissions[i][dmName]);
            PlayerTextDrawSetString(playerid, JobHUD[playerid][6], str);
            format(str, 128, "Progresso: %d/%d", PlayerInfo[playerid][pDailyMissionProgress][i], DailyMissions[i][dmTarget]);
            PlayerTextDrawSetString(playerid, JobHUD[playerid][7], str);
            break;
        }
    }

    // Special mission
    for(new i=0; i<MAX_SPECIAL_MISSIONS; i++) {
        if (SpecialMissions[i][smAvailable] && !PlayerInfo[playerid][pSpecialCompleted][i]) {
            format(str, 128, "Missao Especial: %s", SpecialMissions[i][smName]);
            PlayerTextDrawSetString(playerid, JobHUD[playerid][8], str);
            break;
        }
    }

    // Status
    new status[32];
    if (PlayerInfo[playerid][pWorking]) status = "Trabalhando";
    else if (PlayerInfo[playerid][pUberActive]) status = "Uber - Em corrida";
    else status = "Parado";
    format(str, 128, "Estado: %s", status);
    PlayerTextDrawSetString(playerid, JobHUD[playerid][9], str);
}

ShowJobHUD(playerid) {
    for(new i=0; i<10; i++) {
        PlayerTextDrawShow(playerid, JobHUD[playerid][i]);
    }
}

HideJobHUD(playerid) {
    for(new i=0; i<10; i++) {
        PlayerTextDrawHide(playerid, JobHUD[playerid][i]);
    }
}

// ==================== SISTEMA DE EMPREGO ====================

CMD:jobs(playerid, params[]) {
    new dialog[4096];
    dialog = "Selecione um emprego:\n\n";
    for (new i = 0; i < MAX_JOBS; i++) {
        if (Jobs[i][jobActive]) {
            format(dialog, sizeof(dialog), "%s%d. %s - %s\n", dialog, i+1, Jobs[i][jobName], Jobs[i][jobDesc]);
        }
    }
    ShowPlayerDialog(playerid, 1, DIALOG_STYLE_LIST, "Sistema de Empregos", dialog, "Selecionar", "Cancelar");
    return 1;
}

CMD:work(playerid, params[]) {
    if (PlayerInfo[playerid][pJob] == -1) return SendClientMessage(playerid, 0xFF0000FF, "Voce nao tem emprego.");
    if (PlayerInfo[playerid][pWorking]) return SendClientMessage(playerid, 0xFFFF00FF, "Voce ja esta trabalhando.");
    if (Jobs[PlayerInfo[playerid][pJob]][jobType] == 1) {
        // Uber job - start Uber mode
        StartUber(playerid);
        return 1;
    }
    PlayerInfo[playerid][pWorking] = 1;
    SpawnJobVehicle(playerid);
    UpdateJobMarker(playerid);
    SendClientMessage(playerid, 0x00FF00FF, "Voce comecou a trabalhar! Vá ate a area de trabalho.");
    return 1;
}

CMD:quitjob(playerid, params[]) {
    if (PlayerInfo[playerid][pJob] == -1) return SendClientMessage(playerid, 0xFF0000FF, "Voce nao tem emprego.");
    PlayerInfo[playerid][pJob] = -1;
    PlayerInfo[playerid][pWorking] = 0;
    KillTimer(PlayerInfo[playerid][pWorkTimer]);
    DestroyJobMarker(playerid);
    DestroyJobVehicle(playerid);
    HideJobHUD(playerid);
    // Stop Uber if active
    if (PlayerInfo[playerid][pUberActive]) StopUber(playerid);
    SendClientMessage(playerid, 0x00FF00FF, "Voce saiu do seu emprego.");
    return 1;
}

CMD:myjob(playerid, params[]) {
    if (PlayerInfo[playerid][pJob] == -1) return SendClientMessage(playerid, 0xFF0000FF, "Voce nao tem emprego.");
    new str[128];
    format(str, sizeof(str), "Emprego: %s | Nivel: %d | XP: %d/%d | Ganhos: $%d",
        Jobs[PlayerInfo[playerid][pJob]][jobName], PlayerInfo[playerid][pJobLevel],
        PlayerInfo[playerid][pJobXP], XP_PER_LEVEL * (PlayerInfo[playerid][pJobLevel]+1),
        PlayerInfo[playerid][pMoney]);
    SendClientMessage(playerid, 0xFFFFFFFF, str);
    return 1;
}

CMD:jobstats(playerid, params[]) {
    if (PlayerInfo[playerid][pJob] == -1) return SendClientMessage(playerid, 0xFF0000FF, "Voce nao tem emprego.");
    new msg[512];
    format(msg, sizeof(msg),
        "Estatisticas do seu emprego:\nEmprego: %s\nNivel: %d\nXP: %d/%d\nDinheiro ganho: $%d\nPagamento por acao: $%d",
        Jobs[PlayerInfo[playerid][pJob]][jobName],
        PlayerInfo[playerid][pJobLevel],
        PlayerInfo[playerid][pJobXP],
        XP_PER_LEVEL * (PlayerInfo[playerid][pJobLevel]+1),
        PlayerInfo[playerid][pMoney],
        GetJobPay(playerid));
    ShowPlayerDialog(playerid, 2, DIALOG_STYLE_MSGBOX, "Estatisticas", msg, "OK", "");
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if (dialogid == 1) {
        if (response) {
            if (listitem >= 0 && listitem < MAX_JOBS) {
                if (PlayerInfo[playerid][pJob] != -1) {
                    SendClientMessage(playerid, 0xFF0000FF, "Voce ja tem um emprego. Use /quitjob para sair.");
                    return 1;
                }
                if (!Jobs[listitem][jobActive]) {
                    SendClientMessage(playerid, 0xFF0000FF, "Esse emprego nao esta disponivel.");
                    return 1;
                }
                PlayerInfo[playerid][pJob] = listitem;
                PlayerInfo[playerid][pJobLevel] = 0;
                PlayerInfo[playerid][pJobXP] = 0;
                PlayerInfo[playerid][pMoney] = 0;
                PlayerInfo[playerid][pWorking] = 0;
                SendClientMessage(playerid, Jobs[listitem][jobColor],
                    "Voce agora e um %s. Use /work para comecar a trabalhar.", Jobs[listitem][jobName]);
                PlayerInfo[playerid][pWorkTimer] = SetTimerEx("WorkTimer", PAY_INTERVAL * 1000, true, "i", playerid);
                UpdateJobHUD(playerid);
            }
        }
        return 1;
    }
    return 0;
}

public WorkTimer(playerid) {
    if (!IsPlayerConnected(playerid) || PlayerInfo[playerid][pJob] == -1 || !PlayerInfo[playerid][pWorking]) return;
    if (!IsPlayerInJobZone(playerid) && !PlayerInfo[playerid][pUberActive]) {
        SendClientMessage(playerid, 0xFF0000FF, "Voce nao esta na area de trabalho! Volte para o marcador.");
        return;
    }
    // Pagamento automático
    new pay = GetJobPay(playerid);
    GivePlayerMoney(playerid, pay);
    PlayerInfo[playerid][pMoney] += pay;
    AddJobXP(playerid, GetJobXP(playerid));
    SendClientMessage(playerid, Jobs[PlayerInfo[playerid][pJob]][jobColor], "Voce ganhou $%d e %d XP como %s.",
        pay, GetJobXP(playerid), Jobs[PlayerInfo[playerid][pJob]][jobName]);
    UpdateJobHUD(playerid);
    // Daily mission progress
    UpdateDailyProgress(playerid, 3, 1); // type 3 = trabalhar
}

stock GetJobPay(playerid) {
    new job = PlayerInfo[playerid][pJob];
    new level = PlayerInfo[playerid][pJobLevel];
    new basePay = Jobs[job][jobPayBase];
    return basePay + (level * 25);
}

stock GetJobXP(playerid) {
    return Jobs[PlayerInfo[playerid][pJob]][jobXpBase] + (PlayerInfo[playerid][pJobLevel] * 5);
}

stock AddJobXP(playerid, xp) {
    PlayerInfo[playerid][pJobXP] += xp;
    new needed = XP_PER_LEVEL * (PlayerInfo[playerid][pJobLevel] + 1);
    while (PlayerInfo[playerid][pJobXP] >= needed) {
        PlayerInfo[playerid][pJobXP] -= needed;
        PlayerInfo[playerid][pJobLevel]++;
        // Atualiza rank job
        new rank = (PlayerInfo[playerid][pJobLevel] - 1) / 10;
        if (rank > MAX_JOB_RANK-1) rank = MAX_JOB_RANK-1;
        PlayerInfo[playerid][pJobRank] = rank;
        new msg[128];
        format(msg, sizeof(msg), "Voce subiu para o nivel %d no seu emprego! Rank: %s",
            PlayerInfo[playerid][pJobLevel], JobRankNames[rank]);
        SendClientMessage(playerid, JobRankColors[rank], msg);
        // Ganha pontos de habilidade
        PlayerInfo[playerid][pSkillPoints] += 1;
        UpdateJobHUD(playerid);
        needed = XP_PER_LEVEL * (PlayerInfo[playerid][pJobLevel] + 1);
    }
}

UpdateJobMarker(playerid) {
    DestroyJobMarker(playerid);
    new job = PlayerInfo[playerid][pJob];
    new Float:x, Float:y, Float:z;
    x = Jobs[job][jobLocations][0][0];
    y = Jobs[job][jobLocations][0][1];
    z = Jobs[job][jobLocations][0][2];
    JobLabel[playerid] = Create3DTextLabel("Area de Trabalho", Jobs[job][jobColor], x, y, z, 40.0, 0);
}

DestroyJobMarker(playerid) {
    if (JobLabel[playerid]) {
        Delete3DTextLabel(JobLabel[playerid]);
        JobLabel[playerid] = Text3D:0;
    }
}

SpawnJobVehicle(playerid) {
    DestroyJobVehicle(playerid);
    new job = PlayerInfo[playerid][pJob];
    new Float:x, Float:y, Float:z;
    x = Jobs[job][jobLocations][0][0];
    y = Jobs[job][jobLocations][0][1];
    z = Jobs[job][jobLocations][0][2];
    new vehicle = CreateVehicle(Jobs[job][jobVehicle], x, y, z+2.0, 0.0, 0, 0, -1);
    if (vehicle != INVALID_VEHICLE_ID) {
        PlayerInfo[playerid][pJobVehicle] = vehicle;
        PutPlayerInVehicle(playerid, vehicle, 0);
    }
}

DestroyJobVehicle(playerid) {
    if (PlayerInfo[playerid][pJobVehicle] != INVALID_VEHICLE_ID) {
        DestroyVehicle(PlayerInfo[playerid][pJobVehicle]);
        PlayerInfo[playerid][pJobVehicle] = INVALID_VEHICLE_ID;
    }
}

stock IsPlayerInJobZone(playerid) {
    new job = PlayerInfo[playerid][pJob];
    if (job == -1) return 0;
    new Float:px, Float:py, Float:pz;
    GetPlayerPos(playerid, px, py, pz);
    for (new i = 0; i < MAX_JOB_LOCATIONS; i++) {
        new Float:lx = Jobs[job][jobLocations][i][0];
        new Float:ly = Jobs[job][jobLocations][i][1];
        new Float:lz = Jobs[job][jobLocations][i][2];
        if (lx == 0.0 && ly == 0.0 && lz == 0.0) continue;
        if (GetPlayerDistanceFromPoint(playerid, lx, ly, lz) < 10.0) return 1;
    }
    return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
    if (newkeys & KEY_F && PlayerInfo[playerid][pJob] != -1 && PlayerInfo[playerid][pWorking]) {
        if (PlayerInfo[playerid][pUberActive]) {
            // Uber specific interaction
            HandleUberAction(playerid);
            return 1;
        }
        if (!IsPlayerInJobZone(playerid)) {
            SendClientMessage(playerid, 0xFF0000FF, "Voce nao esta na area de trabalho.");
            return 1;
        }
        if (GetTickCount() - PlayerInfo[playerid][pJobActionCooldown] < 2000) {
            SendClientMessage(playerid, 0xFFFF00FF, "Aguarde 2 segundos entre acoes.");
            return 1;
        }
        // Ação manual: bônus
        new pay = GetJobPay(playerid) + 50;
        GivePlayerMoney(playerid, pay);
        PlayerInfo[playerid][pMoney] += pay;
        AddJobXP(playerid, GetJobXP(playerid) + 5);
        PlayerInfo[playerid][pJobActionCooldown] = GetTickCount();
        SendClientMessage(playerid, Jobs[PlayerInfo[playerid][pJob]][jobColor],
            "Acao manual! Voce ganhou $%d e XP extra.", pay);
        UpdateJobHUD(playerid);
        UpdateDailyProgress(playerid, 0, 1); // type 0 = action
    }
    return 1;
}

// ==================== UBER JOB ====================

StartUber(playerid) {
    if (PlayerInfo[playerid][pUberActive]) return;
    PlayerInfo[playerid][pUberActive] = true;
    PlayerInfo[playerid][pUberState] = 0; // 0: waiting for passenger, 1: passenger onboard, 2: heading to destination
    SpawnJobVehicle(playerid);
    SpawnUberPassenger(playerid);
    SendClientMessage(playerid, 0x00FF00FF, "Uber iniciado! Dirija-se ate o passageiro (marcado no mapa).");
    UpdateJobHUD(playerid);
    SetTimerEx("UberTimer", 1000, true, "i", playerid);
}

StopUber(playerid) {
    PlayerInfo[playerid][pUberActive] = false;
    PlayerInfo[playerid][pUberState] = 0;
    if (PlayerInfo[playerid][pUberCheckpoint]) {
        DisablePlayerCheckpoint(playerid);
        PlayerInfo[playerid][pUberCheckpoint] = 0;
    }
    if (PlayerInfo[playerid][pUberPassengerCheckpoint]) {
        DisablePlayerCheckpoint(playerid);
        PlayerInfo[playerid][pUberPassengerCheckpoint] = 0;
    }
    DestroyJobVehicle(playerid);
    SendClientMessage(playerid, 0xFF0000FF, "Uber finalizado.");
    UpdateJobHUD(playerid);
}

SpawnUberPassenger(playerid) {
    // Generate random passenger location near player
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    // Random offset within 100 meters
    new Float:angle = random(360) * 3.14159 / 180.0;
    new Float:dist = 50.0 + random(50);
    x += dist * floatsin(angle, degrees);
    y += dist * floatcos(angle, degrees);
    // Set checkpoint for passenger
    SetPlayerCheckpoint(playerid, x, y, z, 5.0);
    PlayerInfo[playerid][pUberPassengerCheckpoint] = 1;
    // Store passenger coordinates
    PlayerInfo[playerid][pUberDestination][0] = x;
    PlayerInfo[playerid][pUberDestination][1] = y;
    PlayerInfo[playerid][pUberDestination][2] = z;
    PlayerInfo[playerid][pUberState] = 0;
}

HandleUberAction(playerid) {
    if (PlayerInfo[playerid][pUberState] == 0) {
        // Passenger pick-up
        if (!IsPlayerInCheckpoint(playerid)) {
            SendClientMessage(playerid, 0xFFFF00FF, "Va ate o passageiro (checkpoint).");
            return;
        }
        // Passenger boarded - generate destination
        PlayerInfo[playerid][pUberState] = 1;
        DisablePlayerCheckpoint(playerid);
        // Random destination far away
        new Float:destX, Float:destY, Float:destZ;
        // We'll use a predefined set of random locations (e.g., around LS)
        // For simplicity, we generate random coordinates in a range
        destX = -2000.0 + random(4000);
        destY = -2000.0 + random(4000);
        destZ = 10.0;
        SetPlayerCheckpoint(playerid, destX, destY, destZ, 5.0);
        PlayerInfo[playerid][pUberDestination][0] = destX;
        PlayerInfo[playerid][pUberDestination][1] = destY;
        PlayerInfo[playerid][pUberDestination][2] = destZ;
        SendClientMessage(playerid, 0x00FF00FF, "Passageiro embarcado! Leve-o ao destino.");
    } else if (PlayerInfo[playerid][pUberState] == 1) {
        // Check if reached destination
        if (IsPlayerInCheckpoint(playerid)) {
            // Destination reached - complete ride
            new pay = 300 + random(300);
            GivePlayerMoney(playerid, pay);
            PlayerInfo[playerid][pMoney] += pay;
            AddJobXP(playerid, 25 + random(25));
            SendClientMessage(playerid, 0x00FF00FF, "Corrida concluida! Voce ganhou $%d e XP.", pay);
            DisablePlayerCheckpoint(playerid);
            // Spawn new passenger
            SpawnUberPassenger(playerid);
            UpdateJobHUD(playerid);
        } else {
            SendClientMessage(playerid, 0xFFFF00FF, "Siga o checkpoint do destino.");
        }
    }
}

public UberTimer(playerid) {
    if (!PlayerInfo[playerid][pUberActive]) return;
    // Update HUD and check if passenger or destination checkpoint reached
    // The actual logic is handled in HandleUberAction via KEY_F, but we can also check automatically
    if (PlayerInfo[playerid][pUberState] == 0) {
        // Check if player is near passenger checkpoint
        if (IsPlayerInCheckpoint(playerid)) {
            HandleUberAction(playerid);
        }
    } else if (PlayerInfo[playerid][pUberState] == 1) {
        if (IsPlayerInCheckpoint(playerid)) {
            HandleUberAction(playerid);
        }
    }
    // Update HUD
    UpdateJobHUD(playerid);
}

stock IsPlayerInCheckpoint(playerid) {
    new Float:cx, Float:cy, Float:cz;
    GetPlayerCheckpoint(playerid, cx, cy, cz);
    new Float:px, Float:py, Float:pz;
    GetPlayerPos(playerid, px, py, pz);
    return GetPlayerDistanceFromPoint(playerid, cx, cy, cz) < 5.0;
}

// ==================== HABILIDADES ====================

CMD:skills(playerid, params[]) {
    new dialog[2048];
    dialog = "Habilidades disponiveis:\n\n";
    for (new i = 0; i < MAX_SKILLS; i++) {
        if (PlayerInfo[playerid][pSkills][i] == 0) {
            format(dialog, sizeof(dialog), "%s%d. %s (Custo: %d pontos, Nivel requerido: %d) - %s\n",
                dialog, i+1, Skills[i][skillName], Skills[i][skillCost], Skills[i][skillLevelReq], Skills[i][skillDesc]);
        } else {
            format(dialog, sizeof(dialog), "%s%d. %s (JA APRENDIDA)\n", dialog, i+1, Skills[i][skillName]);
        }
    }
    ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "Habilidades", dialog, "Aprender", "Cancelar");
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if (dialogid == 3) {
        if (response) {
            if (listitem >= 0 && listitem < MAX_SKILLS) {
                LearnSkill(playerid, listitem);
            }
        }
        return 1;
    }
    return 0;
}

stock LearnSkill(playerid, skillIndex) {
    if (PlayerInfo[playerid][pSkills][skillIndex] == 1) {
        SendClientMessage(playerid, 0xFFFF00FF, "Voce ja aprendeu essa habilidade.");
        return;
    }
    if (PlayerInfo[playerid][pSkillPoints] < Skills[skillIndex][skillCost]) {
        SendClientMessage(playerid, 0xFF0000FF, "Pontos de habilidade insuficientes.");
        return;
    }
    if (PlayerInfo[playerid][pJobLevel] < Skills[skillIndex][skillLevelReq]) {
        SendClientMessage(playerid, 0xFF0000FF, "Nivel insuficiente para essa habilidade.");
        return;
    }
    PlayerInfo[playerid][pSkills][skillIndex] = 1;
    PlayerInfo[playerid][pSkillPoints] -= Skills[skillIndex][skillCost];
    new msg[128];
    format(msg, sizeof(msg), "Voce aprendeu a habilidade: %s", Skills[skillIndex][skillName]);
    SendClientMessage(playerid, 0x00FF00FF, msg);
    UpdateJobHUD(playerid);
}

CMD:toggleskill(playerid, params[]) {
    new skillIndex;
    if (sscanf(params, "i", skillIndex)) return SendClientMessage(playerid, 0xFF0000FF, "Use: /toggleskill <ID da habilidade>");
    if (skillIndex < 0 || skillIndex >= MAX_SKILLS) return SendClientMessage(playerid, 0xFF0000FF, "Habilidade invalida.");
    if (PlayerInfo[playerid][pSkills][skillIndex] == 0) return SendClientMessage(playerid, 0xFF0000FF, "Voce nao aprendeu essa habilidade.");
    PlayerInfo[playerid][pSkillActive][skillIndex] = !PlayerInfo[playerid][pSkillActive][skillIndex];
    new status = PlayerInfo[playerid][pSkillActive][skillIndex] ? "ativada" : "desativada";
    new msg[128];
    format(msg, sizeof(msg), "Habilidade %s %s.", Skills[skillIndex][skillName], status);
    SendClientMessage(playerid, 0xFFFFFFFF, msg);
    return 1;
}

// ==================== MISSÕES DIÁRIAS ====================

ResetDailyMissions() {
    for (new i = 0; i < MAX_DAILY_MISSIONS; i++) {
        new randType = random(4);
        new randTarget = 5 + random(15);
        switch(randType) {
            case 0: format(DailyMissions[i][dmName], 64, "Mate %d inimigos", randTarget);
            case 1: format(DailyMissions[i][dmName], 64, "Colete %d itens", randTarget);
            case 2: format(DailyMissions[i][dmName], 64, "Entregue %d pacotes", randTarget);
            case 3: format(DailyMissions[i][dmName], 64, "Trabalhe %d minutos", randTarget);
        }
        format(DailyMissions[i][dmDescription], 128, "Complete a tarefa para ganhar XP e dinheiro.");
        DailyMissions[i][dmTarget] = randTarget;
        DailyMissions[i][dmRewardXP] = 50 + randTarget * 10;
        DailyMissions[i][dmRewardMoney] = 100 + randTarget * 20;
        DailyMissions[i][dmType] = randType;
        DailyMissions[i][dmProgress] = 0;
    }
    // Atualiza para todos os jogadores online
    for (new i = 0; i < MAX_PLAYERS; i++) {
        if (IsPlayerConnected(i)) {
            UpdateDailyMissions(i);
            UpdateJobHUD(i);
        }
    }
}

UpdateDailyMissions(playerid) {
    new currentDay = gettime() / 86400;
    if (currentDay != PlayerInfo[playerid][pLastDailyUpdate]) {
        for (new i = 0; i < MAX_DAILY_MISSIONS; i++) {
            PlayerInfo[playerid][pDailyMissionProgress][i] = 0;
            PlayerInfo[playerid][pDailyCompleted][i] = 0;
            PlayerInfo[playerid][pDailyClaimed][i] = false;
        }
        PlayerInfo[playerid][pLastDailyUpdate] = currentDay;
        SendClientMessage(playerid, 0x00FF00FF, "Novas missoes diarias disponiveis! Verifique o HUD.");
        UpdateJobHUD(playerid);
    }
}

CMD:dailies(playerid, params[]) {
    new msg[1024];
    msg = "Missoes Diarias:\n\n";
    for (new i = 0; i < MAX_DAILY_MISSIONS; i++) {
        new status[32];
        if (PlayerInfo[playerid][pDailyCompleted][i]) {
            if (PlayerInfo[playerid][pDailyClaimed][i]) status = "Concluida (Recompensa ja retirada)";
            else status = "Concluida! Use /claimdaily";
        } else {
            format(status, 32, "Progresso: %d/%d", PlayerInfo[playerid][pDailyMissionProgress][i], DailyMissions[i][dmTarget]);
        }
        format(msg, sizeof(msg), "%s%d. %s - %s\n", msg, i+1, DailyMissions[i][dmName], status);
    }
    ShowPlayerDialog(playerid, 4, DIALOG_STYLE_MSGBOX, "Missoes Diarias", msg, "OK", "");
    return 1;
}

CMD:claimdaily(playerid, params[]) {
    new claimed = 0;
    for (new i = 0; i < MAX_DAILY_MISSIONS; i++) {
        if (PlayerInfo[playerid][pDailyCompleted][i] && !PlayerInfo[playerid][pDailyClaimed][i]) {
            new xp = DailyMissions[i][dmRewardXP];
            new money = DailyMissions[i][dmRewardMoney];
            AddJobXP(playerid, xp);
            GivePlayerMoney(playerid, money);
            PlayerInfo[playerid][pMoney] += money;
            PlayerInfo[playerid][pDailyClaimed][i] = true;
            claimed++;
        }
    }
    if (claimed > 0) {
        new msg[128];
        format(msg, sizeof(msg), "Voce resgatou recompensas de %d missoes diarias!", claimed);
        SendClientMessage(playerid, 0x00FF00FF, msg);
        UpdateJobHUD(playerid);
    } else {
        SendClientMessage(playerid, 0xFF0000FF, "Nenhuma missao diaria para resgatar.");
    }
    return 1;
}

stock UpdateDailyProgress(playerid, missionType, amount = 1) {
    for (new i = 0; i < MAX_DAILY_MISSIONS; i++) {
        if (!PlayerInfo[playerid][pDailyCompleted][i] && DailyMissions[i][dmType] == missionType) {
            PlayerInfo[playerid][pDailyMissionProgress][i] += amount;
            if (PlayerInfo[playerid][pDailyMissionProgress][i] >= DailyMissions[i][dmTarget]) {
                PlayerInfo[playerid][pDailyCompleted][i] = 1;
                SendClientMessage(playerid, 0xFFFF00FF, "Missao diaria concluida! Use /claimdaily para resgatar a recompensa.");
            }
            UpdateJobHUD(playerid);
            break;
        }
    }
}

// ==================== MISSÕES ESPECIAIS ====================

ResetSpecialMissions() {
    for (new i = 0; i < MAX_SPECIAL_MISSIONS; i++) {
        new rand = random(5);
        switch(rand) {
            case 0: format(SpecialMissions[i][smName], 64, "Exterminador");
            case 1: format(SpecialMissions[i][smName], 64, "Correio");
            case 2: format(SpecialMissions[i][smName], 64, "Colecionador");
            case 3: format(SpecialMissions[i][smName], 64, "Mercenario");
            case 4: format(SpecialMissions[i][smName], 64, "Explorador");
        }
        format(SpecialMissions[i][smDescription], 128, "Complete a missao especial para grandes recompensas.");
        SpecialMissions[i][smRewardXP] = 100 + random(300);
        SpecialMissions[i][smRewardMoney] = 200 + random(500);
        SpecialMissions[i][smAvailable] = true;
        format(SpecialMissions[i][smObjective], 64, "Objetivo: Diversos");
    }
}

CMD:special(playerid, params[]) {
    new msg[1024];
    msg = "Missoes Especiais:\n\n";
    for (new i = 0; i < MAX_SPECIAL_MISSIONS; i++) {
        if (!SpecialMissions[i][smAvailable]) continue;
        new status[32];
        if (PlayerInfo[playerid][pSpecialCompleted][i]) {
            if (PlayerInfo[playerid][pSpecialClaimed][i]) status = "Concluida (Recompensa ja retirada)";
            else status = "Concluida! Use /claimspecial";
        } else {
            format(status, 32, "Progresso: %d/1", PlayerInfo[playerid][pSpecialMissionProgress][i]);
        }
        format(msg, sizeof(msg), "%s%d. %s - %s\n", msg, i+1, SpecialMissions[i][smName], status);
    }
    ShowPlayerDialog(playerid, 5, DIALOG_STYLE_MSGBOX, "Missoes Especiais", msg, "OK", "");
    return 1;
}

CMD:claimspecial(playerid, params[]) {
    new claimed = 0;
    for (new i = 0; i < MAX_SPECIAL_MISSIONS; i++) {
        if (PlayerInfo[playerid][pSpecialCompleted][i] && !PlayerInfo[playerid][pSpecialClaimed][i]) {
            new xp = SpecialMissions[i][smRewardXP];
            new money = SpecialMissions[i][smRewardMoney];
            AddJobXP(playerid, xp);
            GivePlayerMoney(playerid, money);
            PlayerInfo[playerid][pMoney] += money;
            PlayerInfo[playerid][pSpecialClaimed][i] = true;
            claimed++;
        }
    }
    if (claimed > 0) {
        new msg[128];
        format(msg, sizeof(msg), "Voce resgatou recompensas de %d missoes especiais!", claimed);
        SendClientMessage(playerid, 0x00FF00FF, msg);
        UpdateJobHUD(playerid);
    } else {
        SendClientMessage(playerid, 0xFF0000FF, "Nenhuma missao especial para resgatar.");
    }
    return 1;
}

stock UpdateSpecialProgress(playerid, missionIndex) {
    if (!SpecialMissions[missionIndex][smAvailable]) return;
    if (PlayerInfo[playerid][pSpecialCompleted][missionIndex]) return;
    PlayerInfo[playerid][pSpecialMissionProgress][missionIndex]++;
    if (PlayerInfo[playerid][pSpecialMissionProgress][missionIndex] >= 1) {
        PlayerInfo[playerid][pSpecialCompleted][missionIndex] = 1;
        SendClientMessage(playerid, 0xFFFF00FF, "Missao especial concluida! Use /claimspecial para resgatar.");
        UpdateJobHUD(playerid);
    }
}

// ==================== RANKJOB ====================

CMD:rankjob(playerid, params[]) {
    new rank = PlayerInfo[playerid][pJobRank];
    new msg[128];
    format(msg, sizeof(msg), "Seu rank no emprego: %s (Nivel %d)", JobRankNames[rank], PlayerInfo[playerid][pJobLevel]);
    SendClientMessage(playerid, JobRankColors[rank], msg);
    return 1;
}

// ==================== /helpjob ====================

CMD:helpjob(playerid, params[]) {
    new helpText[1024];
    helpText = "COMANDOS DO SISTEMA DE EMPREGOS:\n\n";
    strcat(helpText, "/jobs - Abre o menu para escolher um emprego.\n");
    strcat(helpText, "/work - Inicia o trabalho no seu emprego atual.\n");
    strcat(helpText, "/quitjob - Sai do emprego atual.\n");
    strcat(helpText, "/myjob - Mostra informacoes resumidas do seu emprego.\n");
    strcat(helpText, "/jobstats - Exibe estatisticas detalhadas (nivel, XP, ganhos).\n");
    strcat(helpText, "/rankjob - Mostra seu rank atual no emprego.\n");
    strcat(helpText, "/skills - Abre a lista de habilidades para aprender.\n");
    strcat(helpText, "/toggleskill <ID> - Ativa/desativa uma habilidade aprendida.\n");
    strcat(helpText, "/dailies - Mostra as missoes diarias e seu progresso.\n");
    strcat(helpText, "/claimdaily - Resgata as recompensas das missoes diarias concluidas.\n");
    strcat(helpText, "/special - Mostra as missoes especiais disponiveis.\n");
    strcat(helpText, "/claimspecial - Resgata as recompensas das missoes especiais concluidas.\n");
    ShowPlayerDialog(playerid, 6, DIALOG_STYLE_MSGBOX, "Ajuda - Empregos", helpText, "OK", "");
    return 1;
}

// ==================== SALVAMENTO ====================

LoadPlayerData(playerid) {
    new path[64], name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    format(path, sizeof(path), "Contas/%s.ini", name);
    if (!fexist(path)) return;
    new File:f = fopen(path, io_read);
    if (!f) return;
    new line[128];
    while (fread(f, line, sizeof(line))) {
        if (strfind(line, "JobLevel=", true) == 0) PlayerInfo[playerid][pJobLevel] = strval(line[9]);
        else if (strfind(line, "XP=", true) == 0) PlayerInfo[playerid][pJobXP] = strval(line[3]);
        else if (strfind(line, "Money=", true) == 0) PlayerInfo[playerid][pMoney] = strval(line[6]);
        else if (strfind(line, "SkillPoints=", true) == 0) PlayerInfo[playerid][pSkillPoints] = strval(line[12]);
        else if (strfind(line, "Skill", true) == 0) {
            new idx, val;
            sscanf(line, "Skill%d=%d", idx, val);
            if (idx >= 0 && idx < MAX_SKILLS) PlayerInfo[playerid][pSkills][idx] = val;
        }
    }
    fclose(f);
}

SavePlayerData(playerid) {
    new path[64], name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    format(path, sizeof(path), "Contas/%s.ini", name);
    new File:f = fopen(path, io_write);
    if (!f) return;
    new line[128];
    format(line, sizeof(line), "JobLevel=%d\n", PlayerInfo[playerid][pJobLevel]);
    fwrite(f, line);
    format(line, sizeof(line), "XP=%d\n", PlayerInfo[playerid][pJobXP]);
    fwrite(f, line);
    format(line, sizeof(line), "Money=%d\n", PlayerInfo[playerid][pMoney]);
    fwrite(f, line);
    format(line, sizeof(line), "SkillPoints=%d\n", PlayerInfo[playerid][pSkillPoints]);
    fwrite(f, line);
    for (new i = 0; i < MAX_SKILLS; i++) {
        format(line, sizeof(line), "Skill%d=%d\n", i, PlayerInfo[playerid][pSkills][i]);
        fwrite(f, line);
    }
    fclose(f);
}

// ==================== ADMIN COMANDOS ====================

CMD:givejobxp(playerid, params[]) {
    if (!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, 0xFF0000FF, "Apenas administradores RCON podem usar este comando.");
    new target, amount;
    if (sscanf(params, "ui", target, amount)) return SendClientMessage(playerid, 0xFF0000FF, "Use: /givejobxp <ID> <quantidade>");
    if (!IsPlayerConnected(target)) return SendClientMessage(playerid, 0xFF0000FF, "Jogador invalido.");
    AddJobXP(target, amount);
    new msg[128];
    format(msg, sizeof(msg), "Voce recebeu %d XP de emprego.", amount);
    SendClientMessage(target, 0x00FF00FF, msg);
    return 1;
}

// ==================== COMPILAÇÃO ====================
// ================================================================
