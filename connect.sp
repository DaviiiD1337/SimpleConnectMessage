#define PLUGIN_AUTHOR "kRatoss"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <colors>

public Plugin myinfo = 
{
	name = "Welcome Message",
	author = PLUGIN_AUTHOR,
	description = "",
	version = PLUGIN_VERSION,
	url = ""
};

public void OnPluginStart()
{
	HookEventEx("player_disconnect", OnPlrDisconnect, EventHookMode_Pre);
	HookEventEx("player_connect", OnPlrConnect, EventHookMode_Pre);
}


public void OnClientPutInServer(int Client)
{
	CreateTimer(GetRandomFloat(2.215, 4.575), displayJoinInfo, Client, TIMER_FLAG_NO_MAPCHANGE);
}

// Disable default message!

public void OnPlrConnect(Handle pEvent, const char[] eventName, bool bNoBCast)
{
	SetEventBroadcast(pEvent, true);
}

public void OnPlrDisconnect(Handle pEvent, const char[] eventName, bool bNoBCast)
{
	SetEventBroadcast(pEvent, true);
}

public Action displayJoinInfo(Handle pTimer, any Client)
{
	char sName[MAX_NAME_LENGTH];
	
	GetClientName(Client, sName, MAX_NAME_LENGTH);
	
	if(IsClientInGame(Client))
	{
		PrintToChat(Client, "**********************************");
		PrintToChat(Client, "Welcome \x03 %s", sName);
		PrintToChat(Client, "**********************************");
		PrintToChat(Client, "★ \x04ADD SERVER TO FAVORITES\x01 ★");		
	}
}