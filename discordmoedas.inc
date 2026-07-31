#include <YSI_Coding\y_hooks>
new stringModuloDC[250], stringDoacao[250];
new ticketdc; //Salva o id do ticket atual criado mais recentemente
new NickDC[35], Float:Valor, Forma[35], LinkComprovante[125], NickDCC[60];

new VinculandoDC[MAX_PLAYERS][118];
new DCC_Channel:VinculandoChannel[MAX_PLAYERS];
//new DCC_User:uservinculando[MAX_PLAYERS];
new codigodc[MAX_PLAYERS];
new tentativasdc[MAX_PLAYERS];
new hashdc[MAX_PLAYERS][25];

forward ConfirmarMoedas();
public ConfirmarMoedas()
{
	new DCC_Channel:channel = DCC_GetCreatedPrivateChannel(), DCC_Embed:embed2 = DCC_CreateEmbed();
	DCC_SetEmbedTitle(embed2, "ATENCAO!");
	DCC_SetEmbedColor(embed2, 0x6b1e1e);
    DCC_SetEmbedFooter(embed2, "Mdz Roleplay [SA-MP: PC/Android] - Todos os direitos reservados.", "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
    DCC_SetEmbedThumbnail(embed2, "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
 	DCC_SetEmbedDescription(embed2, stringDoacao);
	DCC_SendChannelEmbedMessage(channel, embed2, "");
    return 1;
}

forward Ativar();
public Ativar()
{
    DCC_SetChannelParentCategory(DCC_GetCreatedGuildChannel(), DCC_FindChannelById("1095840505931243590"));
	new DCC_Embed:embed3 = DCC_CreateEmbed();
	DCC_SetEmbedTitle(embed3, "ATIVACAO DE MOEDAS");
	DCC_SetEmbedColor(embed3, 0x6b1e1e);
	DCC_SetEmbedFooter(embed3, "Mdz Roleplay [SA-MP: PC/Android] - Todos os direitos reservados.", "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
	DCC_SetEmbedThumbnail(embed3, "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
	format(stringModuloDC, sizeof(stringModuloDC), "Solicitacao para ativacao de Moedas VIP de %s.", NickDCC);
	DCC_SetEmbedDescription(embed3, stringModuloDC);
	format(stringZCMD, sizeof stringZCMD, "%s", NickDC);
	DCC_AddEmbedField(embed3, "Nick", stringZCMD, true);
	format(stringZCMD, sizeof stringZCMD, "R$%.02f", Valor);
	DCC_AddEmbedField(embed3, "Valor Doado", stringZCMD, true);
	format(stringZCMD, sizeof stringZCMD, "%s", Forma);
	DCC_AddEmbedField(embed3, "Forma de Pagamento", stringZCMD, true);
	format(stringZCMD, sizeof stringZCMD, "%s", LinkComprovante);
	DCC_AddEmbedField(embed3, "Comprovante", stringZCMD, true);
	new ano, mes, dia;
	getdate(ano, mes, dia);
	new hora, minuto, segundo;
	gettime(hora, minuto, segundo);
	format(stringZCMD, sizeof stringZCMD, "%02d/%02d/%04d as %02d:%02d:%02d", dia, mes, ano, hora, minuto, segundo);
	DCC_AddEmbedField(embed3, "Data e Hora", stringZCMD, true);
	format(stringZCMD, sizeof stringZCMD, "#%04d", ticketdc-1);
	DCC_AddEmbedField(embed3, "ID", stringZCMD, true);
	format(stringZCMD, sizeof stringZCMD, "doacao-%04d", ticketdc);
	DCC_SendChannelEmbedMessage(DCC_GetCreatedGuildChannel(), embed3, "@everyone");
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(strfind(inputtext,"%s", true) != -1)
    {
        return 1;
    }
    if(dialogid == 7474)
    {
    	if(response)
    	{
    		format(stringZCMD, 100, "%d", codigodc[playerid]);
    		if(strcmp(inputtext, stringZCMD, true) == 0)
    		{
		 		new DCC_Embed:embed2 = DCC_CreateEmbed();
		 		new codigo = random(10000000);
		 		codigodc[playerid] = codigo;
		 		DCC_SetEmbedFooter(embed2, "Mdz Roleplay [SA-MP: PC/Android] - Todos os direitos reservados.", "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
		 		format(stringZCMD, 50, "CONTA VINCULADA!");
		        DCC_SetEmbedTitle(embed2, stringZCMD);
		        DCC_SetEmbedColor(embed2, 0x6b1e1e);
		        DCC_SetEmbedThumbnail(embed2, "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
		        DCC_SetEmbedDescription(embed2, stringZCMD);
		   		DCC_SendChannelEmbedMessage(VinculandoChannel[playerid], embed2, "");

		   		format(PlayerInfo[playerid][pDiscordVinculado], 99, "%s", VinculandoDC[playerid]);
		   		format(PlayerInfo[playerid][pDiscordHashtag], 50, "%s", hashdc[playerid]);
		   		format(stringZCMD, 200, "[Discord] {FFFFFF}Sua conta do servidor agora esta vinculada com a conta do discord: %s#%s!", PlayerInfo[playerid][pDiscordVinculado], hashdc[playerid]);
		   		SendClientMessage(playerid, 0x7289DAFF, stringZCMD);
		   		format(VinculandoDC[playerid], 5, "");
		   		new bool:bool1;
		   		DCC_HasGuildMemberRole(DCC_FindGuildById("1532586007826796655"), DCC_FindUserByName(PlayerInfo[playerid][pDiscordVinculado], PlayerInfo[playerid][pDiscordHashtag]), DCC_FindRoleById("1158088324272111677"), bool1);
		   		if(bool1 == false)
		   		{
		   			DCC_AddGuildMemberRole(DCC_FindGuildById("1532586007826796655"), DCC_FindUserByName(PlayerInfo[playerid][pDiscordVinculado], PlayerInfo[playerid][pDiscordHashtag]), DCC_FindRoleById("1158088324272111677"));
    			}
    		}
    		else
    		{
    			tentativasdc[playerid] ++;
    			if(tentativasdc[playerid] == 3)
    			{
		    		format(stringZCMD, 150, "%s#%s, %s errou a senha 3 vezes e a solicitacao para a vinculacao com o discord foi cancelada!", VinculandoDC[playerid], hashdc[playerid], PlayerName(playerid));
		    		DCC_SendChannelMessage(VinculandoChannel[playerid], stringZCMD);
		    		format(VinculandoDC[playerid], 5, "");
		    		SendClientMessage(playerid, COR_GREY, "voce errou o Codigo 3 vezes, a solicitação para a Vinculacao com o discord foi cancelada.");
    				return 1;
    			}
				format(stringZCMD, 250, "Vinculacao de Conta (%s - %s#%s)", PlayerName(playerid), VinculandoDC[playerid], hashdc[playerid]);
				format(MEGAString, 800, "{FFFFFF}Digite o Codigo que foi informado no discord aqui.\n\n{FFFFFF}Vinculando sua conta do discord com a do jogo, voce tera varios beneficios\n{FFFFFF}como: recuperar a conta, ter a TAG de vinculado no discord, usar o chat de boosters\n{FFFFFF}(caso seja), e entre outros beneficios que sera adicionado ao passar do tempo.\n\n{FA4C4C}* Codigo incorreto. voce possui %d/3 tentativas.\n\n{818689}Caso voce tenha solicitado a Vinculacao, digite o Codigo que foi enviado em seu DM,\n{818689}caso nao, clique no botao 'Cancelar'.", tentativasdc[playerid]);
				ShowPlayerDialog(playerid, 7474, DIALOG_STYLE_INPUT, stringZCMD, MEGAString, "Vincular", "Cancelar");
    		}
    	}
    	else
    	{
    		format(stringZCMD, 150, "%s#%s, %s cancelou a vinculacao a conta!", VinculandoDC[playerid], hashdc[playerid], PlayerName(playerid));
    		DCC_SendChannelMessage(VinculandoChannel[playerid], stringZCMD);
    		format(VinculandoDC[playerid], 5, "");
    		SendClientMessage(playerid, COR_GREY, "Tudo bem, caso queira vincular novamente, sao digitar o mesmo comando no discord!");
    	}
    }
	return 1;
}

public DCC_OnMessageCreate(DCC_Message:message)
{
	new DCC_Channel:channel;
	DCC_GetMessageChannel(message, channel);
 	new DCC_User:author;
	DCC_GetMessageAuthor(message, author);
	new stringDCC[500], command[70], params[128];
	DCC_GetMessageContent(message, stringDCC);
	sscanf(stringDCC, "s[65]d", command, params);

	if(!strcmp(command, "]ajudadsadsadsadsadsa", false))
	{
	    return 1;
	}

	if(!strcmp(command, "]ajuda", false))
	{
		DCC_SendChannelMessage(channel, "**Lista de comandos:**\n**-** ]id: Saber o ID de um jogador especifico pelo Nome, ID ou parte do Nick.\n**-** /vinculardiscord: Vincula a sua conta do jogo com a do Discord.\n**-** ]sugestao: Dar uma sugestao para o Servidor.\n**-** ]ativarmoedas: Ativa as moedas VIP que voce pagou por elas (faca isso no DM do BOT).\n**-** ]infoserver: Ver as estatisticas atuais do Servidor.");
	    return 1;
	}
	new bool:isBot;
	DCC_IsUserBot(author, isBot);
	if(!strcmp(command, "/vinculardiscord", false))
	{
		if(isBot){
			return 1;
		}
		new playerID;
		if(sscanf(stringDCC, "s[32]u", command, playerID)) return DCC_SendChannelMessage(channel, "USE: /vinculardiscord [ID/Parte do Nick]");
		if(!IsPlayerConnected(playerID) && !IsPlayerNPC(playerID)) return DCC_SendChannelMessage(channel, "Nao ha nenhum jogador on-line com esse ID/Nick!");
		if(!gPlayerLogged[playerID]) return DCC_SendChannelMessage(channel, "O Jogador esta na tela de login!");
		if(strlen(PlayerInfo[playerID][pDiscordVinculado]) >= 1) return DCC_SendChannelMessage(channel, "Este jogador ja esta vinculado com alguma conta do discord!");
		if(strlen(VinculandoDC[playerID]) >= 1) return DCC_SendChannelMessage(channel, "Alguem ja enviou uma solicitacao para vinculacao nessa conta!");
		new bool:bool1;
		DCC_HasGuildMemberRole(DCC_FindGuildById("1532586007826796655"), DCC_FindUserByName(PlayerInfo[playerID][pDiscordVinculado], PlayerInfo[playerID][pDiscordHashtag]), DCC_FindRoleById("1532561300322779217"), bool1);
		if(bool1 == true) return DCC_SendChannelMessage(channel, "Este discord ja esta vinculado a alguma conta no servidor.");
 		new DCC_Embed:embed2 = DCC_CreateEmbed();
 		new codigo = random(10000000);
 		codigodc[playerID] = codigo;
 		DCC_SetEmbedFooter(embed2, "Mdz Roleplay [SA-MP: PC/Android] - Todos os direitos reservados.", "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
 		format(stringZCMD, 200, "Seu codigo de validacao: %d", codigo);
        DCC_SetEmbedTitle(embed2, stringZCMD);
        DCC_SetEmbedColor(embed2, 0x6b1e1e);
        DCC_SetEmbedThumbnail(embed2, "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
        DCC_SetEmbedDescription(embed2, stringZCMD);
 		format(stringZCMD, sizeof stringZCMD, "%s", PlayerName(playerID));
  		DCC_AddEmbedField(embed2, "Nick", stringZCMD, true);
  	 	format(stringZCMD, sizeof stringZCMD, "%d", codigo);
  		DCC_AddEmbedField(embed2, "Codigo de Verificacao", stringZCMD, true);
   		DCC_SendChannelEmbedMessage(channel, embed2, "");

   		tentativasdc[playerID] = 0;

   		//uservinculando[playerID] = author;

	 	//new username[128];
		new nome[DCC_USERNAME_SIZE];
		new discrim[80];
		DCC_GetUserName(author, nome, DCC_USERNAME_SIZE);
		DCC_GetUserDiscriminator(author, discrim, sizeof discrim);
		//format(username, sizeof username, "%s#%s", nome, discrim);
		format(VinculandoDC[playerID], 110, "%s", nome);
		format(hashdc[playerID], 10, "%s", discrim);

		VinculandoChannel[playerID] = channel;

		format(stringZCMD, 250, "Vinculacao de Conta (%s - %s#%s)", PlayerName(playerID), VinculandoDC[playerID], hashdc[playerID]);
		ShowPlayerDialog(playerID, 7474, DIALOG_STYLE_INPUT, stringZCMD, "{FFFFFF}Digite o Codigo que foi informado no discord aqui.\n\n{FFFFFF}Vinculando sua conta do discord com a do jogo, voce tera varios beneficios\n{FFFFFF}como: recuperar a conta, ter a TAG de vinculado no discord, usar o chat de boosters\n{FFFFFF}(caso seja), e entre outros beneficios que sera adicionado ao passar do tempo.\n\n{818689}Caso voce tenha solicitado a Vinculacao, digite o Codigo que foi enviado em seu DM,\n{818689}caso nao, clique no botao 'Cancelar'.", "Vincular", "Cancelar");
   		return 1;
	}
	if(!strcmp(command, "]id", false))
	{
		if(isBot){
			return 1;
		}
		new playerID;
		if(sscanf(stringDCC, "s[32]u", command, playerID))
		{
		    DCC_SendChannelMessage(channel, "```USE: ]id [ID/Parte do Nick]```");
			return 1;
		}


		if(!IsPlayerConnected(playerID))
		{
	   	    DCC_SendChannelMessage(channel, "```Nao ha nenhum jogador on-line com esse ID/Nick!```");
			return 1;
		}

		if(!gPlayerLogged[playerID])
		{
	   	    DCC_SendChannelMessage(channel, "```O Jogador esta na tela de login!```");
			return 1;
		}
 		new DCC_Embed:embed2 = DCC_CreateEmbed();
 		new stringTitle[128];
 		if(PlayerMobile[playerID] == true && PlayerInfo[playerID][pConnectTime] <= 11)
 		{
 			format(stringTitle, sizeof stringTitle, ":cw_bell: %s", PlayerName(playerID));
		}
 		else if(PlayerMobile[playerID] == true && PlayerInfo[playerID][pConnectTime] >= 12)
 		{
 			format(stringTitle, sizeof stringTitle, ":cw_bell: %s", PlayerName(playerID));
 		}
   		else if(PlayerMobile[playerID] == false && PlayerInfo[playerID][pConnectTime] <= 11)
 		{
 			format(stringTitle, sizeof stringTitle, ":cw_bell: %s", PlayerName(playerID));
		}
 		else if(PlayerMobile[playerID] == false && PlayerInfo[playerID][pConnectTime] >= 12)
 		{
 			format(stringTitle, sizeof stringTitle, ":cw_bell: %s", PlayerName(playerID));
 		}

 		new stringSkin[128];
 		DCC_SetEmbedFooter(embed2, "Mdz Roleplay [SA-MP: PC/Android] - Todos os direitos reservados.", "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
 		format(stringSkin, sizeof stringSkin, "https://assets.open.mp/assets/images/skins/%d.png", GetPlayerSkin(playerID));
        DCC_SetEmbedTitle(embed2, stringTitle);
        DCC_SetEmbedColor(embed2, 0x6b1e1e);
        DCC_SetEmbedThumbnail(embed2, stringSkin);
        DCC_SetEmbedDescription(embed2, "");

 		format(stringZCMD, sizeof stringZCMD, "%d", playerID);
  		DCC_AddEmbedField(embed2, "ID", stringZCMD, true);

 		format(stringZCMD, sizeof stringZCMD, "%d", PlayerInfo[playerID][pLevel]);
  		DCC_AddEmbedField(embed2, "Level", stringZCMD, true);

    	format(stringZCMD, sizeof stringZCMD, "%d", GetPlayerPing(playerID));
  		DCC_AddEmbedField(embed2, "Ping", stringZCMD, true);


  		if(PlayerInfo[playerID][pJailTime] >= 1)
  		{

	  		if(PlayerInfo[playerID][pJailed] == 1)
	  		{
    			format(stringZCMD, sizeof stringZCMD, "Penitenciaria");
  				DCC_AddEmbedField(embed2, "Cadeia", stringZCMD, true);
	    		format(stringZCMD, sizeof stringZCMD, "%s", ConvertTime(PlayerInfo[playerID][pJailTime]));
				DCC_AddEmbedField(embed2, "Tempo", stringZCMD, true);
			}
	  		else if(PlayerInfo[playerID][pJailed] == 2)
	  		{
    			format(stringZCMD, sizeof stringZCMD, "Carandiru");
  				DCC_AddEmbedField(embed2, "Cadeia", stringZCMD, true);
	    		format(stringZCMD, sizeof stringZCMD, "%s", ConvertTime(PlayerInfo[playerID][pJailTime]));
				DCC_AddEmbedField(embed2, "Tempo", stringZCMD, true);
			}
	  		else if(PlayerInfo[playerID][pJailed] == 3)
	  		{
    			format(stringZCMD, sizeof stringZCMD, "Cadeia Admin");
  				DCC_AddEmbedField(embed2, "Cadeia", stringZCMD, true);
	    		format(stringZCMD, sizeof stringZCMD, "%s", ConvertTime(PlayerInfo[playerID][pJailTime]));
				DCC_AddEmbedField(embed2, "Tempo", stringZCMD, true);
			}
		}



  		if(PlayerInfo[playerID][pAdmin] >= 1)
  		{
  				new lolz[120];
				if(PlayerInfo[playerID][pSex] == 1)
				{
				if(PlayerInfo[playerID][pAdmin] == 1)lolz = "Aprendiz";
				if(PlayerInfo[playerID][pAdmin] == 2)lolz = "Estagiario";
				if(PlayerInfo[playerID][pAdmin] == 3)lolz = "Moderador";
				if(PlayerInfo[playerID][pAdmin] == 4)lolz = "Auxiliar";
				if(PlayerInfo[playerID][pAdmin] == 349)lolz = "Helper";
				if(PlayerInfo[playerID][pAdmin] == 1337)lolz = "Master";
				if(PlayerInfo[playerID][pAdmin] == 1338)lolz = "Master+";
				if(PlayerInfo[playerID][pAdmin] == 1339)lolz = "Gerente";
				if(PlayerInfo[playerID][pAdmin] == 1340)lolz = "Diretor";
				if(PlayerInfo[playerID][pAdmin] == 1341)lolz = "Dono";
				if(PlayerInfo[playerID][pAdmin] == 1342)lolz = "Fundador";
				}
 				else if(PlayerInfo[playerID][pSex] == 2)
				{
				if(PlayerInfo[playerID][pAdmin] == 1)lolz = "Aprendiz";
				if(PlayerInfo[playerID][pAdmin] == 2)lolz = "Estagiraria";
				if(PlayerInfo[playerID][pAdmin] == 3)lolz = "Moderadora";
				if(PlayerInfo[playerID][pAdmin] == 4)lolz = "Auxiliar";
				if(PlayerInfo[playerID][pAdmin] == 349)lolz = "Helper";
				if(PlayerInfo[playerID][pAdmin] == 1337)lolz = "Master";
				if(PlayerInfo[playerID][pAdmin] == 1338)lolz = "Master+";
				if(PlayerInfo[playerID][pAdmin] == 1339)lolz = "Gerente";
				if(PlayerInfo[playerID][pAdmin] == 1340)lolz = "Diretora";
				if(PlayerInfo[playerID][pAdmin] == 1341)lolz = "Dona";
				if(PlayerInfo[playerID][pAdmin] == 1342)lolz = "Fundadora";
				}
	    		format(stringZCMD, sizeof stringZCMD, "%s", lolz);
				DCC_AddEmbedField(embed2, "Cargo Administrativo", stringZCMD, true);
  		}
   		DCC_SendChannelEmbedMessage(channel, embed2, "");
  	    return 1;
	}
	if(!strcmp(command, "]infoserver", true))
	{
			new PlayerConectado;
			foreach(new i: Player)
			{
				if(IsPlayerConnected(i))
				{
					PlayerConectado++;
				}
			}
			new DCC_Embed:embed2 = DCC_CreateEmbed();
			format(stringZCMD, sizeof stringZCMD, "%d/%d", PlayerConectado, 43);
            DCC_AddEmbedField(embed2, "Jogadores Online", stringZCMD, true);

			format(stringZCMD, sizeof stringZCMD, "%d", IDConta);
            DCC_AddEmbedField(embed2, "Contas Criadas", stringZCMD, true);

			format(stringZCMD, sizeof stringZCMD, "%d", estatisticasplayer);
            DCC_AddEmbedField(embed2, "Quantidade de Acessos", stringZCMD, true);

			format(stringZCMD, sizeof stringZCMD, "%d", estatisticasplayer2);
            DCC_AddEmbedField(embed2, "Quantidade de Registros", stringZCMD, true);
		    DCC_SetEmbedTitle(embed2, GetWeekDay());
            DCC_SetEmbedColor(embed2, 0x6b1e1e);
            DCC_SetEmbedFooter(embed2, "Mdz Roleplay [SA-MP: PC/Android] - Todos os direitos reservados.", "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
            DCC_SetEmbedThumbnail(embed2, "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
            DCC_SetEmbedDescription(embed2, "");
            DCC_SendChannelEmbedMessage(channel, embed2, "");
	  	    return 1;
	}

	if(!strcmp(command, "]aviso", true))
	{
		if(isBot){
			return 1;
		}
		if(sscanf(stringDCC, "s[32]s[720]", command, stringZCMD))
		{
		    DCC_SendChannelMessage(channel, "```USE: ]aviso [Mensagem]```");
			return 1;
		}
		new bool:role1;
        DCC_HasGuildMemberRole(DCC_FindGuildById("1532586007826796655"), author, DCC_FindRoleById("1532561170060279898"), role1);
  		new bool:role2;
        DCC_HasGuildMemberRole(DCC_FindGuildById("1532586007826796655"), author, DCC_FindRoleById("1532561170060279898"), role2);
        if(role1 == false && role2 == false)
        {
            DCC_SendChannelMessage(channel, "```ERRO: Voce nao e um Owner/Fundador!```");
			return 1;
		}
 		if(strfind(stringZCMD, "everyone", true) != -1 || strfind(stringZCMD, "here", true) != -1 || strfind(stringZCMD, "<@", true) != -1 || strfind(stringZCMD, "@", true) != -1)
		{
		    DCC_SendChannelMessage(channel, "```ERRO: Voce nao pode marcar everyone, here e nem membros do Discord!```");
		    return 1;
		}
		if(strlen(stringZCMD) >= 501)
		{
		    DCC_SendChannelMessage(channel, "```ERRO: Sua mensagem precisa ter menos de 500 caracteres!```");
			return 1;
		}
		DCC_DeleteMessage(message);
		new DCC_Embed:embed2 = DCC_CreateEmbed();
        DCC_SetEmbedTitle(embed2, "Aviso");
        DCC_SetEmbedColor(embed2, 0x6b1e1e);
        DCC_SetEmbedFooter(embed2, "Mdz Roleplay [SA-MP: PC/Android] - Todos os direitos reservados.", "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
        DCC_SetEmbedThumbnail(embed2, "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
        DCC_SetEmbedDescription(embed2, stringZCMD);
   		DCC_SendChannelEmbedMessage(channel, embed2, "");
	    return 1;
	}
	if(!strcmp(command, "]ativarmoedas", true))
	{
			if(AtivarDiscord == 1) return DCC_SendChannelMessage(channel, "```ERRO: O sistema de ativar moedas vip esta desativado no (/menusistema).```");
			if(sscanf(stringDCC, "s[32]s[32]fs[32]s[115]", command, NickDC, Valor, Forma, LinkComprovante))
			{
				DCC_SendChannelMessage(channel, "```USE: ]ativarmoedas [Nick no Servidor] [Valor] [Forma de Pagamento] [Link do Comprovante]```");
				return 1;
			}
			if(strcmp(Forma, "Pix", true) == 0 || strcmp(Forma, "GiftCard", true) == 0)
			{
				if(strfind(LinkComprovante, "https://", true) != -1)
				{
					new DOF2DC[100];
					format(DOF2DC, sizeof(DOF2DC), "Players/Contas/%s.ini", NickDC);
					if(!fexist(DOF2DC))
					{
						DCC_SendChannelMessage(channel, "```Essa conta nao existe nos nossos bancos de dados.```");
						return 1;
					}

					new DCC_Embed:embed2 = DCC_CreateEmbed();
					format(stringModuloDC, sizeof(stringModuloDC), "DOACAO #%04d EM ANALISE!", ticketdc);
				    DCC_SetEmbedTitle(embed2, stringModuloDC);
		            DCC_SetEmbedColor(embed2, 0x6b1e1e);
		            DCC_SetEmbedFooter(embed2, "Mdz Roleplay [SA-MP: PC/Android] - Todos os direitos reservados.", "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
		            DCC_SetEmbedThumbnail(embed2, "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
		            DCC_SetEmbedDescription(embed2, "Ola, seu ticket para ativacao das suas moedas foi aberto e dentro do prazo de 72 Horas um de nossos Fundadores/Donos ativarao suas moedas em sua conta, nao se preocupe, voce sera avisado aqui quando ja estiver ativo.");
		            format(stringZCMD, sizeof stringZCMD, "%s", NickDC);
		            DCC_AddEmbedField(embed2, "Nickname", stringZCMD, true);
		            format(stringZCMD, sizeof stringZCMD, "%d", DOF2_GetInt(DOF2DC, "P Level"));
		            DCC_AddEmbedField(embed2, "Level", stringZCMD, true);
		            format(stringZCMD, sizeof stringZCMD, "%s", GetOrgName(DOF2_GetInt(DOF2DC, "Membro")));
		            DCC_AddEmbedField(embed2, "Organizacao", stringZCMD, true);
		            DCC_SendChannelEmbedMessage(channel, embed2, "");
		            format(stringZCMD, 50, "doacao %04d", ticketdc);
		            DCC_CreateGuildChannel(DCC_FindGuildById("1202795598378434640"), stringZCMD, GUILD_TEXT, "Ativar");
					new nome[DCC_USERNAME_SIZE];
					new discrim[80];
					DCC_GetUserName(author, nome, DCC_USERNAME_SIZE);
					DCC_GetUserDiscriminator(author, discrim, sizeof discrim);
					format(NickDCC, sizeof NickDCC, "%s#%s", nome, discrim);
		            format(stringZCMD, sizeof stringZCMD, "doacao-%04d", ticketdc);
					format(DOF2DC, sizeof(DOF2DC), "Doacoes/%s.ini", stringZCMD);
					if(!fexist(DOF2DC))
					{
						DOF2_CreateFile(DOF2DC);
						new iddiscordp[DCC_ID_SIZE];
						DCC_GetUserId(author, iddiscordp, DCC_ID_SIZE);
						DOF2_SetString(DOF2DC, "IDDC", iddiscordp);
						DOF2_SetInt(DOF2DC, "id", ticketdc);
						DOF2_SetString(DOF2DC, "Nick", NickDC);
						DOF2_SetFloat(DOF2DC, "Valor", Valor);
						DOF2_SetString(DOF2DC, "Forma", Forma);
						DOF2_SetString(DOF2DC, "LinkComprovante", LinkComprovante);
						DOF2_SaveFile();
					}
					else
					{
						new iddiscordp[DCC_ID_SIZE];
						DCC_GetUserId(author, iddiscordp, DCC_ID_SIZE);
						DOF2_SetString(DOF2DC, "IDDC", iddiscordp);
						DOF2_SetInt(DOF2DC, "id", ticketdc);
						DOF2_SetString(DOF2DC, "Nick", NickDC);
						DOF2_SetFloat(DOF2DC, "Valor", Valor);
						DOF2_SetString(DOF2DC, "Forma", Forma);
						DOF2_SetString(DOF2DC, "LinkComprovante", LinkComprovante);
						DOF2_SaveFile();
					}
	 	            ticketdc++;
				}
				else
				{
					if(strcmp(Forma, "GiftCard", true) == 0)
					{
							new DOF2DC[100];
							format(DOF2DC, sizeof(DOF2DC), "Players/Contas/%s.ini", NickDC);
							if(!fexist(DOF2DC))
							{
								DCC_SendChannelMessage(channel, "```Essa conta nao existe nos nossos bancos de dados.```");
								return 1;
							}
							new DCC_Embed:embed2 = DCC_CreateEmbed();
							format(stringModuloDC, sizeof(stringModuloDC), "DOACAO #%04d EM ANALISE!", ticketdc);
						    DCC_SetEmbedTitle(embed2, stringModuloDC);
				            DCC_SetEmbedColor(embed2, 0x6b1e1e);
				            DCC_SetEmbedFooter(embed2, "Mdz Roleplay [SA-MP: PC/Android] - Todos os direitos reservados.", "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
				            DCC_SetEmbedThumbnail(embed2, "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
				            DCC_SetEmbedDescription(embed2, "Ola, seu ticket para ativacao das suas moedas foi aberto e dentro do prazo de 72 Horas um de nossos Fundadores/Donos ativarao suas moedas em sua conta, nao se preocupe, voce sera avisado aqui quando ja estiver ativo.");
				            format(stringZCMD, sizeof stringZCMD, "%s", NickDC);
				            DCC_AddEmbedField(embed2, "Nickname", stringZCMD, true);
				            format(stringZCMD, sizeof stringZCMD, "%d", DOF2_GetInt(DOF2DC, "P Level"));
				            DCC_AddEmbedField(embed2, "Level", stringZCMD, true);
				            format(stringZCMD, sizeof stringZCMD, "%s", GetOrgName(DOF2_GetInt(DOF2DC, "Membro")));
				            DCC_AddEmbedField(embed2, "Organizacao", stringZCMD, true);
				            DCC_SendChannelEmbedMessage(channel, embed2, "");
				            format(stringZCMD, 50, "doacao %04d", ticketdc);
				            DCC_CreateGuildChannel(DCC_FindGuildById("1202795598378434640"), stringZCMD, GUILD_TEXT, "Ativar");
							new nome[DCC_USERNAME_SIZE];
							new discrim[80];
							DCC_GetUserName(author, nome, DCC_USERNAME_SIZE);
							DCC_GetUserDiscriminator(author, discrim, sizeof discrim);
							format(NickDCC, sizeof NickDCC, "%s#%s", nome, discrim);
				            format(stringZCMD, sizeof stringZCMD, "doacao-%04d", ticketdc);
							format(DOF2DC, sizeof(DOF2DC), "Doacoes/%s.ini", stringZCMD);
							if(!fexist(DOF2DC))
							{
								DOF2_CreateFile(DOF2DC);
								new iddiscordp[DCC_ID_SIZE];
								DCC_GetUserId(author, iddiscordp, DCC_ID_SIZE);
								DOF2_SetString(DOF2DC, "IDDC", iddiscordp);
								DOF2_SetInt(DOF2DC, "id", ticketdc);
								DOF2_SetString(DOF2DC, "Nick", NickDC);
								DOF2_SetFloat(DOF2DC, "Valor", Valor);
								DOF2_SetString(DOF2DC, "Forma", Forma);
								DOF2_SetString(DOF2DC, "LinkComprovante", LinkComprovante);
								DOF2_SaveFile();
							}
							else
							{
								new iddiscordp[DCC_ID_SIZE];
								DCC_GetUserId(author, iddiscordp, DCC_ID_SIZE);
								DOF2_SetString(DOF2DC, "IDDC", iddiscordp);
								DOF2_SetInt(DOF2DC, "id", ticketdc);
								DOF2_SetString(DOF2DC, "Nick", NickDC);
								DOF2_SetFloat(DOF2DC, "Valor", Valor);
								DOF2_SetString(DOF2DC, "Forma", Forma);
								DOF2_SetString(DOF2DC, "LinkComprovante", LinkComprovante);
								DOF2_SaveFile();
							}
			 	            ticketdc++;	
					}
					else
					{
						DCC_SendChannelMessage(channel, "Este link de comprovante e invalido, tente hospedar a imagem do comprovante no site do: https://imgur.com/.");
					}
				}
			}
			else
			{
				DCC_SendChannelMessage(channel, "Desculpe, mas aceitamos somente GiftCard. Compras por PIX, Cartao de Credito ou Boleto devera ser feita pelo site.");
			}
	  	    return 1;
	}
	if(!strcmp(command, "]negar", true))
	{
		new channelname[50], DOF2DC[100];
		new Motivo[101];
		DCC_GetChannelName(channel, channelname, sizeof(channelname));
		if(strfind(channelname, "doacao-", true) != -1)
		{
			if(sscanf(stringDCC, "s[32]s[100]", command, Motivo))
			{
				DCC_SendChannelMessage(channel, "```USE: ]negar [Motivo]```");
				return 1;
			}
			format(DOF2DC, sizeof(DOF2DC), "Doacoes/%s.ini", channelname);
			if(fexist(DOF2DC))
			{
		 	    new username[128];
				new nome[DCC_USERNAME_SIZE];
				new discrim[80];
				DCC_GetUserName(author, nome, DCC_USERNAME_SIZE);
				DCC_GetUserDiscriminator(author, discrim, sizeof discrim);
				format(username, sizeof username, "%s#%s", nome, discrim);


	            new iddiscord64[128];
	            format(iddiscord64, sizeof iddiscord64, DOF2_GetString(DOF2DC, "IDDC"));
	            new DCC_User:user = DCC_FindUserById(iddiscord64);
				format(stringDoacao, sizeof stringDoacao, "Ola, houve um erro na confirmacao de sua doacao, seguinte erro: **( %s )**, mensagem enviada por: %s. Caso tenha duvidas entre em contato conosco.\n\n**ID do Ticket:** #%04d", Motivo, username, DOF2_GetInt(DOF2DC, "id"));
				DCC_CreatePrivateChannel(user, "ConfirmarMoedas");

				DCC_DeleteChannel(channel);
				DOF2_RemoveFile(DOF2DC);
			}
			else
			{
				DCC_SendChannelMessage(channel, "```Essa doacao nao foi encontrada no banco de dados!```");
			}
		}
		else
		{
			DCC_SendChannelMessage(channel, "```Voce nao esta em nenhum canal de tickets de moedas.```");
		}

		return 1;
	}
	if(!strcmp(command, "]confirmar", true))
	{
		new channelname[50], DOF2DC[100];
		new Moedas, Bonus;
		DCC_GetChannelName(channel, channelname, sizeof(channelname));
		if(strfind(channelname, "doacao-", true) != -1)
		{
			if(sscanf(stringDCC, "s[32]dd", command, Moedas, Bonus))
			{
				DCC_SendChannelMessage(channel, "```USE: ]confirmar [Moedas] [Moedas Bonus (use apenas para ofertas)]```");
				return 1;
			}
			if(Moedas == 0) return DCC_SendChannelMessage(channel, "```Voce nao pode confirmar 0 moedas. Em caso de negar a doacao use ]negar.```");
			format(DOF2DC, sizeof(DOF2DC), "Doacoes/%s.ini", channelname);
			if(fexist(DOF2DC))
			{
				new DOF2DC2[100];
				format(DOF2DC2, sizeof(DOF2DC2), "Players/Contas/%s.ini", DOF2_GetString(DOF2DC, "Nick"));
				if(!fexist(DOF2DC2)) return DCC_SendChannelMessage(channel, "```A conta que as moedas seria ativada nao esta criada, pode ser que o player tenha mudado seu nick. Use ]negar pedindo para fazer outra solicitacao.```");
				
		 	    new username[128];
				new nome[DCC_USERNAME_SIZE];
				new discrim[80];
				DCC_GetUserName(author, nome, DCC_USERNAME_SIZE);
				DCC_GetUserDiscriminator(author, discrim, sizeof discrim);
				format(username, sizeof username, "%s#%s", nome, discrim);

				if(!IsPlayerOnline(DOF2_GetString(DOF2DC, "Nick"))) //n ta online
				{
					new moedas2 = 0;
					moedas2 = DOF2_GetInt(DOF2DC2, "ReceberCoins");
					DOF2_SetInt(DOF2DC2, "ReceberCoins", moedas2+Moedas+Bonus);
					DOF2_SaveFile();

					format(stringZCMD, sizeof(stringZCMD), "*1340* Adm-Cmd: %s (no discord) ativou (%s) Moedas VIP para %s!", username, ConvertMoney(Moedas+Bonus), DOF2_GetString(DOF2DC, "Nick"));
					ABroadCast(COR_OBS,stringZCMD,1340);

					format(stringZCMD, sizeof(stringZCMD), "%s (no discord) ativou (%s) Moedas VIP para %s!", username, ConvertMoney(Moedas+Bonus), DOF2_GetString(DOF2DC, "Nick"));
					RecebeuMoeda(stringZCMD);
				}
				else //ta online
				{
					foreach(new i: Player)
					{
						if(strcmp(DOF2_GetString(DOF2DC, "Nick"), PlayerName(i), true) == 0)
						{
							if(gPlayerLogged[i])
							{
								format(stringZCMD, sizeof(stringZCMD), "*1340* Adm-Cmd: %s (no discord) ativou (%s) Moedas VIP para %s!", username, ConvertMoney(Moedas+Bonus), DOF2_GetString(DOF2DC, "Nick"));
								ABroadCast(COR_OBS,stringZCMD,1340);

								format(stringZCMD, sizeof(stringZCMD), "%s (no discord) ativou (%s) Moedas VIP para %s!", username, ConvertMoney(Moedas+Bonus), DOF2_GetString(DOF2DC, "Nick"));
								RecebeuMoeda(stringZCMD);

							    PlayerInfo[i][pReceberCoins] += Moedas+Bonus;

								format(stringZCMD, sizeof stringZCMD, "[Compra Confirmada] voce fez uma compra e agora possui: [%s] Moedas VIP's a serem resgatadas, digite /menuvip para recebê-las!", ConvertMoney(PlayerInfo[i][pReceberCoins]));
								SendClientMessage(i, 0x00B9FFFF, stringZCMD);
							}
							else
							{
								new moedas2 = 0;
								moedas2 += DOF2_GetInt(DOF2DC2, "ReceberCoins");
								DOF2_SetInt(DOF2DC2, "ReceberCoins", moedas2+Moedas+Bonus);
								DOF2_SaveFile();

								format(stringZCMD, sizeof(stringZCMD), "*1340* Adm-Cmd: %s (no discord) ativou (%s) Moedas VIP para %s!", username, ConvertMoney(Moedas+Bonus), DOF2_GetString(DOF2DC, "Nick"));
								ABroadCast(COR_OBS,stringZCMD,1340);

								format(stringZCMD, sizeof(stringZCMD), "%s (no discord) ativou (%s) Moedas VIP para %s!", username, ConvertMoney(Moedas+Bonus), DOF2_GetString(DOF2DC, "Nick"));
								RecebeuMoeda(stringZCMD);
							}
							break;
						}
					}
				}

				new DCC_Embed:embed2 = DCC_CreateEmbed();
			    DCC_SetEmbedTitle(embed2, "DOACAO");
	            DCC_SetEmbedColor(embed2, 0x6b1e1e);
	            DCC_SetEmbedFooter(embed2, "Mdz Roleplay [SA-MP: PC/Android] - Todos os direitos reservados.", "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
	            DCC_SetEmbedThumbnail(embed2, "https://i.pinimg.com/736x/a1/bf/05/a1bf055de15d80726a9450b1db373c35.jpg");
	            DCC_SetEmbedDescription(embed2, " ");
	            format(stringZCMD, sizeof stringZCMD, "%s", DOF2_GetString(DOF2DC, "Nick"));
	            DCC_AddEmbedField(embed2, "Nick", stringZCMD, true);
	            format(stringZCMD, sizeof stringZCMD, "R$%.02f", DOF2_GetFloat(DOF2DC, "Valor"));
	            DCC_AddEmbedField(embed2, "Valor Doado", stringZCMD, true);
	            if(Bonus == 0){ format(stringZCMD, sizeof stringZCMD, "%s", ConvertMoney(Moedas)); }
	            else
	            {
	            	format(stringZCMD, sizeof stringZCMD, "%s (+%s de bonus) | Total: %s MV", ConvertMoney(Moedas), ConvertMoney(Bonus), ConvertMoney(Moedas + Bonus));
	            }
	            DCC_AddEmbedField(embed2, "Quantidade de Moedas", stringZCMD, true);
	            format(stringZCMD, sizeof stringZCMD, "%s", DOF2_GetString(DOF2DC, "Forma"));
	            DCC_AddEmbedField(embed2, "Forma de Pagamento", stringZCMD, true);
	            format(stringZCMD, sizeof stringZCMD, "%s", DOF2_GetString(DOF2DC, "LinkComprovante"));
	            DCC_AddEmbedField(embed2, "Comprovante", stringZCMD, true);
				new ano, mes, dia;
				getdate(ano, mes, dia);
				new hora, minuto, segundo;
	 			gettime(hora, minuto, segundo);
	            format(stringZCMD, sizeof stringZCMD, "%02d/%02d/%04d as %02d:%02d:%02d", dia, mes, ano, hora, minuto, segundo);
	            DCC_AddEmbedField(embed2, "Data e Hora", stringZCMD, true);
	            format(stringZCMD, sizeof stringZCMD, "#%04d", DOF2_GetInt(DOF2DC, "id"));
	            DCC_AddEmbedField(embed2, "ID", stringZCMD, true);
	            DCC_SendChannelEmbedMessage(DCC_FindChannelById("1202795598378434640"), embed2, "");

	            new iddiscord64[128];
	            format(iddiscord64, sizeof iddiscord64, DOF2_GetString(DOF2DC, "IDDC"));
	            new DCC_User:user = DCC_FindUserById(iddiscord64);
				format(stringDoacao, sizeof stringDoacao, "Ola! Sua compra de Moedas VIP foi confirmada e o valor de Moedas VIP foram debitadas em sua conta! Para resgata-las use o comando /lojavip e clique em 'Receber Moedas'. Qualquer duvida ou problema entre em contato conosco, obrigado pela sua compra.");
				DCC_CreatePrivateChannel(user, "ConfirmarMoedas");

				DCC_DeleteChannel(channel);

				DOF2_RemoveFile(DOF2DC);
			}
			else
			{
				DCC_SendChannelMessage(channel, "```Essa doacao nao foi encontrada no banco de dados!```");
			}
		}
		else
		{
			DCC_SendChannelMessage(channel, "```Voce nao esta em nenhum canal de tickets de moedas.```");
		}
		return 1;
	}


	if(strfind(command, "]", true) != -1)
	{
		format(stringModuloDC, sizeof(stringModuloDC), "```css\n[ALERTA] O comando que voce digitou (%s) nao foi reconhecido, use: ]ajuda.```", command);
		DCC_SendChannelMessage(channel, stringModuloDC);
	}
	return 1;
}
