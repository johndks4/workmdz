require("lib.moonloader")
local imgui = require("mimgui")
local vKeys = require('vKeys')
local game_keys = require 'game.keys'
local inicfg = require("inicfg")
local sampfuncs = require "sampfuncs"
local ffi = require "ffi"
local sW, sH = getScreenResolution()
local memory = require("memory")
local faicons = require("fAwesome5")
local events = require 'lib.samp.events'
local hack = require 'lib.samp.events'
local sampev = require 'samp.events'
local encoding = require("encoding")
local mad = require 'MoonAdditions'
local notf = import 'imgui_notf.lua'
font_flag = require('moonloader').font_flag
local wm = require("windows.message")
local var_0_68, var_0_69 = pcall(import, "imgui_notf.lua")
encoding.default = 'CP1251'
key = require("vkeys") 
local u8 = encoding.UTF8
local directIni = 'Aim-Assist by Scar.ini'
local ini = inicfg.load(inicfg.load({
	main = {
		themes = 0;
	},
}, directIni))
inicfg.save(ini, directIni)
require("lib.samp.events").onSetPlayerDrunk = function (slot0)
	if status2 then
		return false 
	end
end

local auth_key, client_ver = "FF2BE5E6F5D9392F57C4E66F7AD78767277C6E4F6B", "0.3.7"

local floatbuffer = imgui.new.float()
local floatbuffer2 = imgui.new.float()
local floatbuffer3 = imgui.new.float()
local floatbuffer4 = imgui.new.float()
local floatbuffer5 = imgui.new.float()
local floatbuffer6 = imgui.new.float()
local floatbuffer7 = imgui.new.float()
local floatbuffer8 = imgui.new.float()
local floatbuffer9 = imgui.new.float()
local floatbuffer10 = imgui.new.float()
local floatbuffer11 = imgui.new.float()
local floatbuffer12 = imgui.new.float()
local var_0_12 = imgui.ImVec2(-0.1, 0)

bypass = false
local pbazuca = false
local process = false
local test = false
local state1 = false
local fsync = false
local fun = false
local hehe = false
local id = -1

ffi.cdef([[
    typedef unsigned long DWORD;

    struct d3ddeviceVTBL {
        void *QueryInterface;
        void *AddRef;
        void *Release;
        void *TestCooperativeLevel;
        void *GetAvailableTextureMem;
        void *EvictManagedResources;
        void *GetDirect3D;
        void *GetDeviceCaps;
        void *GetDisplayMode;
        void *GetCreationParameters;
        void *SetCursorProperties;
        void *SetCursorPosition;
        void *ShowCursor;
        void *CreateAdditionalSwapChain;
        void *GetSwapChain;
        void *GetNumberOfSwapChains;
        void *Reset;
        void *Present;
        void *GetBackBuffer;
        void *GetRasterStatus;
        void *SetDialogBoxMode;
        void *SetGammaRamp;
        void *GetGammaRamp;
        void *CreateTexture;
        void *CreateVolumeTexture;
        void *CreateCubeTexture;
        void *CreateVertexBuffer;
        void *CreateIndexBuffer;
        void *CreateRenderTarget;
        void *CreateDepthStencilSurface;
        void *UpdateSurface;
        void *UpdateTexture;
        void *GetRenderTargetData;
        void *GetFrontBufferData;
        void *StretchRect;
        void *ColorFill;
        void *CreateOffscreenPlainSurface;
        void *SetRenderTarget;
        void *GetRenderTarget;
        void *SetDepthStencilSurface;
        void *GetDepthStencilSurface;
        void *BeginScene;
        void *EndScene;
        void *Clear;
        void *SetTransform;
        void *GetTransform;
        void *MultiplyTransform;
        void *SetViewport;
        void *GetViewport;
        void *SetMaterial;
        void *GetMaterial;
        void *SetLight;
        void *GetLight;
        void *LightEnable;
        void *GetLightEnable;
        void *SetClipPlane;
        void *GetClipPlane;
        void *SetRenderState;
        void *GetRenderState;
        void *CreateStateBlock;
        void *BeginStateBlock;
        void *EndStateBlock;
        void *SetClipStatus;
        void *GetClipStatus;
        void *GetTexture;
        void *SetTexture;
        void *GetTextureStageState;
        void *SetTextureStageState;
        void *GetSamplerState;
        void *SetSamplerState;
        void *ValidateDevice;
        void *SetPaletteEntries;
        void *GetPaletteEntries;
        void *SetCurrentTexturePalette;
        void *GetCurrentTexturePalette;
        void *SetScissorRect;
        void *GetScissorRect;
        void *SetSoftwareVertexProcessing;
        void *GetSoftwareVertexProcessing;
        void *SetNPatchMode;
        void *GetNPatchMode;
        void *DrawPrimitive;
        void* DrawIndexedPrimitive;
        void *DrawPrimitiveUP;
        void *DrawIndexedPrimitiveUP;
        void *ProcessVertices;
        void *CreateVertexDeclaration;
        void *SetVertexDeclaration;
        void *GetVertexDeclaration;
        void *SetFVF;
        void *GetFVF;
        void *CreateVertexShader;
        void *SetVertexShader;
        void *GetVertexShader;
        void *SetVertexShaderConstantF;
        void *GetVertexShaderConstantF;
        void *SetVertexShaderConstantI;
        void *GetVertexShaderConstantI;
        void *SetVertexShaderConstantB;
        void *GetVertexShaderConstantB;
        void *SetStreamSource;
        void *GetStreamSource;
        void *SetStreamSourceFreq;
        void *GetStreamSourceFreq;
        void *SetIndices;
        void *GetIndices;
        void *CreatePixelShader;
        void *SetPixelShader;
        void *GetPixelShader;
        void *SetPixelShaderConstantF;
        void *GetPixelShaderConstantF;
        void *SetPixelShaderConstantI;
        void *GetPixelShaderConstantI;
        void *SetPixelShaderConstantB;
        void *GetPixelShaderConstantB;
        void *DrawRectPatch;
        void *DrawTriPatch;
        void *DeletePatch;
    };

    struct d3ddevice {
        struct d3ddeviceVTBL** vtbl;
    };
]])

font = renderCreateFont('Arial', 11, font_flag.SHADOW + font_flag.BOLD)
cars = {
"Landstalker", "Bravura", "Buffalo", "Linerunner", "Pereniel", "Sentinel", "Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus", "Voodoo", "Pony",
"Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam", "Esperanto", "Taxi", "Washington", "Bobcat", "Mr Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer",
"Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach", "Cabbie", "Stallion", "Rumpo", "RC Bandit",
"Romero", "Packer", "Monster Truck", "Admiral", "Squalo", "Seasparrow", "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee",
"Caddy", "Solair", "Berkley's RC Van", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic", "Sanchez", "Sparrow", "Patriot",
"Quad", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX", "Burrito", "Camper", "Marquis", "Baggage", "Dozer",
"Maverick", "News Chopper", "Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking", "Blista Compact", "Police Maverick", "Boxville",
"Benson", "Mesa", "RC Goblin", "Hotring Racer", "Hotring Racer", "Bloodring Banger", "Rancher", "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle",
"Cropdust", "Stunt", "Tanker", "RoadTrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck",
"Fortune", "Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer", "Remington", "Slamvan", "Blade", "Freight", "Streak", "Vortex",
"Vincent", "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder", "Primo", "Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada",
"Yosemite", "Windsor", "Monster Truck", "Monster Truck", "Uranus", "Jester", "Sultan", "Stratum", "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma",
"Savanna", "Bandito", "Freight", "Trailer", "Kart", "Mower", "Duneride", "Sweeper", "Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400",
"Newsvan", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club", "Trailer", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car (LS)",
"Police Car (SF)", "Police Car (LV)", "Police Ranger", "Picador", "S.W.A.T. Van", "Alpha", "Phoenix", "Glendale", "Sadler", "Luggage Trailer", "Luggage Trailer",
"Stair Trailer", "Boxville", "Farm Plow", "Utility Trailer"
}
colors = {
0x000000FF, 0xF5F5F5FF, 0x2A77A1FF, 0x840410FF, 0x263739FF, 0x86446EFF, 0xD78E10FF, 0x4C75B7FF, 0xBDBEC6FF, 0x5E7072FF,
0x46597AFF, 0x656A79FF, 0x5D7E8DFF, 0x58595AFF, 0xD6DAD6FF, 0x9CA1A3FF, 0x335F3FFF, 0x730E1AFF, 0x7B0A2AFF, 0x9F9D94FF,
0x3B4E78FF, 0x732E3EFF, 0x691E3BFF, 0x96918CFF, 0x515459FF, 0x3F3E45FF, 0xA5A9A7FF, 0x635C5AFF, 0x3D4A68FF, 0x979592FF,
0x421F21FF, 0x5F272BFF, 0x8494ABFF, 0x767B7CFF, 0x646464FF, 0x5A5752FF, 0x252527FF, 0x2D3A35FF, 0x93A396FF, 0x6D7A88FF,
0x221918FF, 0x6F675FFF, 0x7C1C2AFF, 0x5F0A15FF, 0x193826FF, 0x5D1B20FF, 0x9D9872FF, 0x7A7560FF, 0x989586FF, 0xADB0B0FF,
0x848988FF, 0x304F45FF, 0x4D6268FF, 0x162248FF, 0x272F4BFF, 0x7D6256FF, 0x9EA4ABFF, 0x9C8D71FF, 0x6D1822FF, 0x4E6881FF,
0x9C9C98FF, 0x917347FF, 0x661C26FF, 0x949D9FFF, 0xA4A7A5FF, 0x8E8C46FF, 0x341A1EFF, 0x6A7A8CFF, 0xAAAD8EFF, 0xAB988FFF,
0x851F2EFF, 0x6F8297FF, 0x585853FF, 0x9AA790FF, 0x601A23FF, 0x20202CFF, 0xA4A096FF, 0xAA9D84FF, 0x78222BFF, 0x0E316DFF,
0x722A3FFF, 0x7B715EFF, 0x741D28FF, 0x1E2E32FF, 0x4D322FFF, 0x7C1B44FF, 0x2E5B20FF, 0x395A83FF, 0x6D2837FF, 0xA7A28FFF,
0xAFB1B1FF, 0x364155FF, 0x6D6C6EFF, 0x0F6A89FF, 0x204B6BFF, 0x2B3E57FF, 0x9B9F9DFF, 0x6C8495FF, 0x4D8495FF, 0xAE9B7FFF,
0x406C8FFF, 0x1F253BFF, 0xAB9276FF, 0x134573FF, 0x96816CFF, 0x64686AFF, 0x105082FF, 0xA19983FF, 0x385694FF, 0x525661FF,
0x7F6956FF, 0x8C929AFF, 0x596E87FF, 0x473532FF, 0x44624FFF, 0x730A27FF, 0x223457FF, 0x640D1BFF, 0xA3ADC6FF, 0x695853FF,
0x9B8B80FF, 0x620B1CFF, 0x5B5D5EFF, 0x624428FF, 0x731827FF, 0x1B376DFF, 0xEC6AAEFF, 0x000000FF,
0x177517FF, 0x210606FF, 0x125478FF, 0x452A0DFF, 0x571E1EFF, 0x010701FF, 0x25225AFF, 0x2C89AAFF, 0x8A4DBDFF, 0x35963AFF,
0xB7B7B7FF, 0x464C8DFF, 0x84888CFF, 0x817867FF, 0x817A26FF, 0x6A506FFF, 0x583E6FFF, 0x8CB972FF, 0x824F78FF, 0x6D276AFF,
0x1E1D13FF, 0x1E1306FF, 0x1F2518FF, 0x2C4531FF, 0x1E4C99FF, 0x2E5F43FF, 0x1E9948FF, 0x1E9999FF, 0x999976FF, 0x7C8499FF,
0x992E1EFF, 0x2C1E08FF, 0x142407FF, 0x993E4DFF, 0x1E4C99FF, 0x198181FF, 0x1A292AFF, 0x16616FFF, 0x1B6687FF, 0x6C3F99FF,
0x481A0EFF, 0x7A7399FF, 0x746D99FF, 0x53387EFF, 0x222407FF, 0x3E190CFF, 0x46210EFF, 0x991E1EFF, 0x8D4C8DFF, 0x805B80FF,
0x7B3E7EFF, 0x3C1737FF, 0x733517FF, 0x781818FF, 0x83341AFF, 0x8E2F1CFF, 0x7E3E53FF, 0x7C6D7CFF, 0x020C02FF, 0x072407FF,
0x163012FF, 0x16301BFF, 0x642B4FFF, 0x368452FF, 0x999590FF, 0x818D96FF, 0x99991EFF, 0x7F994CFF, 0x839292FF, 0x788222FF,
0x2B3C99FF, 0x3A3A0BFF, 0x8A794EFF, 0x0E1F49FF, 0x15371CFF, 0x15273AFF, 0x375775FF, 0x060820FF, 0x071326FF, 0x20394BFF,
0x2C5089FF, 0x15426CFF, 0x103250FF, 0x241663FF, 0x692015FF, 0x8C8D94FF, 0x516013FF, 0x090F02FF, 0x8C573AFF, 0x52888EFF,
0x995C52FF, 0x99581EFF, 0x993A63FF, 0x998F4EFF, 0x99311EFF, 0x0D1842FF, 0x521E1EFF, 0x42420DFF, 0x4C991EFF, 0x082A1DFF,
0x96821DFF, 0x197F19FF, 0x3B141FFF, 0x745217FF, 0x893F8DFF, 0x7E1A6CFF, 0x0B370BFF, 0x27450DFF, 0x071F24FF, 0x784573FF,
0x8A653AFF, 0x732617FF, 0x319490FF, 0x56941DFF, 0x59163DFF, 0x1B8A2FFF, 0x38160BFF, 0x041804FF, 0x355D8EFF, 0x2E3F5BFF,
0x561A28FF, 0x4E0E27FF, 0x706C67FF, 0x3B3E42FF, 0x2E2D33FF, 0x7B7E7DFF, 0x4A4442FF, 0x28344EFF
}

local pDevice = ffi.cast("struct d3ddevice*", 0xC97C28)
local SetTextureStageState = ffi.cast("long(__stdcall*)(void*, unsigned long, unsigned long, unsigned long)", pDevice.vtbl[0].SetTextureStageState)
local GetTextureStageState = ffi.cast("long(__stdcall*)(void*, unsigned long, unsigned long, unsigned int*)", pDevice.vtbl[0].GetTextureStageState)

local dwConstant = ffi.new("unsigned int[1]")
local dwARG0 = ffi.new("unsigned int[1]")
local dwARG1 = ffi.new("unsigned int[1]")
local dwARG2 = ffi.new("unsigned int[1]")

-- BLUE - online but not stream-in
-- RED - stream-in
-- GREEN - stream-in but afk

local lines = {}
local nicks = {}
local count = 0
local scj = false
local dupe1 = false
local kd = 361
local dardmg = false
local target = -1

local cast = ffi.cast("void(__thiscall*)(void*)", 0x59F180)

local prefix = "{00AAFF}["..thisScript().name.."]{FFFFFF}: "
local prefixerr = "{ff0000}["..thisScript().name.."]{FFFFFF}: "
local ChamsQuery = {}


function message2(text)
	return sampAddChatMessage('{FF0000}[Fake Spawn V2]:{FFFFFF} '..text, 0xFF0000)
end

script_version_title = "V10.0"

samem = require("SAMemory")
samem.require("CPed")
samem.require("CTrain")

require 'lib.sampfuncs'
local MOP = false
id = nil
local sync = true
ncr = false
local mplataforma = false
local votroll = false
local ready = false
local icon_char = 'A'
local d3dx9_43 = ffi.load('d3dx9_43.dll')

local OFFSET = {x = -60, y = 0}
local draw = true

local var_0_17 = samem.cast("CVehicle **", samem.player_vehicle)
local var_0_0 = 500
local radius = 150 -- радиус прицела, можно менять на своё усмотрение, как удобно.
KEY = key.VK_J -- кнопка активации
active = true -- активен ли функционал скрипта по умолчанию. true - активен, false - неактивен
trailer = nil -- хендл трейлера. Изменять не нужно.
local var_0_1 = 24
local var_0_2 = 3
local sw, sh = getScreenResolution()
local font = renderCreateFont("Arial", 12, 1 + 4) -- P.S. in MonetLoader only Arial Bold is available (every font is defaulted to it)
local var_0_1 = false
local var_0_2 = false
local var_0_3 = false
local var_0_4 = false
local fastSpeed = 9.0 -- Define a velocidade rápida
local var_0_5 = false
local players = {}
local antic = true
local var_0_6 = false
local var_0_34 = 0
local pow = 0.3
tagname = thisScript().name:gsub('.lua', '')
tag = '{FFBB00}['..tagname..'] {FFFFFF}'

bike = {[481] = true, [509] = true, [510] = true}
moto = {[448] = true, [461] = true, [462] = true, [463] = true, [468] = true, [471] = true, [521] = true, [522] = true, [523] = true, [581] = true, [586] = true}

KEY_SECOND = VK_U
KEY_FIRST = VK_M
KEY_THIRD = VK_SUBTRACT
KEY_FOURTH = VK_MULTIPLY
SPEED_DIFF = 0.1

local akey = 0x74 -- Êëàâèøà àêòèâàöèè
local set = {
	player_tags_dist = 225.0, -- Äàëüíîñòü wallhack
	font_shadow = 1 -- Îòðèñîâêà òåíè âîçëå øðèôòîâ. 0/1 - âêë/âûêë ñîîòâåòñòâåííî
}

-- Ñëóæåáíûå ïåðåìåííûå
local workability = false
local pD3DFont_sampStuff = renderCreateFont("Tahoma", 10, 0x4) -- FCR_BORDER
local pD3DFontFixedSmall = renderCreateFont("Small Fonts", 8, 0x4) -- FCR_BORDER
local g_dwSAMP_Addr = -1
local g_SAMP = -1
local g_Players = -1
local g_playerTagInfo = {}
for i = 0, 1004 do
	g_playerTagInfo[i] = {tagPosition = {fX = 0.0, fY = 0.0, fZ = 0.0}, tagOffsetY = 0.0, isStairStacked = false, stairStackedOffset = 0.0, isPastMaxDistance = false}
end

-- Îôôñåòû
local SAMP_INFO_OFFSET = {
	[1] = 0x21A0F8,
	[2] = 0x21A100,
	[3] = 0x2ACA24
}
local SAMP_SCOREBOARD_INFO =  {
	[1] = 0x21A0B4,
	[2] = 0x21A0BC,
	[3] = 0x2AC9DC
}
local SAMP_PPOOLS_OFFSET = {
	[1] = 0x3CD,
	[2] = 0x3C5,
	[3] = 0x3DE
}
local SAMP_PPOOL_PLAYER_OFFSET = {
	[1] = 0x18,
	[2] = 0x8,
	[3] = 0x8
}

-- Íà÷àëî ìîäóëÿ ñ ôóíêöèÿìè
local function isVehicleClassSmall(vehicleHandle)
	if vehicleHandle ~= nil then
		local vehicleModelId = getCarModel(vehicleHandle)
		for i, v in ipairs({441, 457, 464, 465, 485, 501, 530, 564, 571, 572, 574, 583, 594}) do -- VEHICLE_CLASS_MINI
			if v == vehicleModelId then
				return true
			end
		end
	end
	return false
end

local function join_argb(a, r, g, b)
	if a ~= nil and r ~= nil and g ~= nil and b ~= nil then
		local argb = b  -- b
		argb = bit.bor(argb, bit.lshift(g, 8))  -- g
		argb = bit.bor(argb, bit.lshift(r, 16)) -- r
		argb = bit.bor(argb, bit.lshift(a, 24)) -- a
		return argb
	end
end

local function explode_argb(argb)
	if argb ~= nil then
		local a = bit.band(bit.rshift(argb, 24), 0xFF)
		local r = bit.band(bit.rshift(argb, 16), 0xFF)
		local g = bit.band(bit.rshift(argb, 8), 0xFF)
		local b = bit.band(argb, 0xFF)
		return a, r, g, b
	end
end

local function CalcScreenCoors(fX, fY, fZ)
	if fX ~= nil and fY ~= nil and fZ ~= nil then
		-- C++-ifyed function 0x71DA00, formerly called by CHudSA::CalcScreenCoors
		-- Get the static view matrix
		local dwM = 0xB6FA2C

		local m_11 = memory.getfloat(dwM + 0 * 4, true)
		local m_12 = memory.getfloat(dwM + 1 * 4, true)
		local m_13 = memory.getfloat(dwM + 2 * 4, true)

		local m_21 = memory.getfloat(dwM + 4 * 4, true)
		local m_22 = memory.getfloat(dwM + 5 * 4, true)
		local m_23 = memory.getfloat(dwM + 6 * 4, true)

		local m_31 = memory.getfloat(dwM + 8 * 4, true)
		local m_32 = memory.getfloat(dwM + 9 * 4, true)
		local m_33 = memory.getfloat(dwM + 10 * 4, true)

		local m_41 = memory.getfloat(dwM + 12 * 4, true)
		local m_42 = memory.getfloat(dwM + 13 * 4, true)
		local m_43 = memory.getfloat(dwM + 14 * 4, true)

		-- Get the static virtual screen (x,y)-sizes
		local dwLenX = memory.getuint32(0xC17044, true)
		local dwLenY = memory.getuint32(0xC17048, true)

		-- Do a transformation
		local frX = fZ * m_31 + fY * m_21 + fX * m_11 + m_41
		local frY = fZ * m_32 + fY * m_22 + fX * m_12 + m_42
		local frZ = fZ * m_33 + fY * m_23 + fX * m_13 + m_43

		-- Get the correct screen coordinates
		local fRecip = 1.0 / frZ
		frX = frX * (fRecip * dwLenX)
		frY = frY * (fRecip * dwLenY)
		return frX, frY, frZ
	end
end

local function sampPatchDisableNameTags(patch)
	if patch ~= nil and type(patch) == "boolean" then
		local SAMP_PATCH_DISABLE_NAMETAGS = 0x70D40
		local SAMP_PATCH_DISABLE_NAMETAGS_HP = 0x6FC30
		local g_dwSAMP_Addr = getModuleHandle("samp.dll")
		writeMemory(g_dwSAMP_Addr + SAMP_PATCH_DISABLE_NAMETAGS, 1, (patch and 0xC3 or 0x55), true)
		writeMemory(g_dwSAMP_Addr + SAMP_PATCH_DISABLE_NAMETAGS_HP, 1, (patch and 0xC3 or 0x55), true)
	end
end

local function PrintShadow(font, text, x, y, color)
	if font ~= nil and text ~= nil and x ~= nil and y ~= nil and color ~= nil then
		if set.font_shadow == 1 then
			local tempColor = bit.band(bit.rshift(color, 16), 0xffff) -- HIWORD
			tempColor = bit.band(bit.rshift(tempColor, 8), 0xffff) -- HIBYTE
			local shadow = join_argb(tempColor, 0, 0, 0)
			renderFontDrawText(font, text, x + 1, y + 1, shadow)
		end
		renderFontDrawText(font, text, x, y, color)
	end
end

local function getCharCoordinatesFixed(ped)
	if ped ~= nil then
		local dwPED = getCharPointer(ped) + 0x0
		local dwAddress = memory.getuint32(dwPED + 0x14, true)
		local fX = memory.getfloat(dwAddress + 0x30, true)
		local fY = memory.getfloat(dwAddress + 0x34, true)
		local fZ = memory.getfloat(dwAddress + 0x38, true)
		return fX, fY, fZ
	end
end

local function getSampDll()
	local g_dwSAMP_Addr = getModuleHandle("samp.dll")
	if g_dwSAMP_Addr ~= nil then
		return g_dwSAMP_Addr
	end
	return -1
end

local function getSampVersion()
	local g_dwSAMP_Addr = getModuleHandle("samp.dll")
	if g_dwSAMP_Addr ~= nil then
		local version = memory.getuint8(g_dwSAMP_Addr + 0x1036, true)
		if version ~= nil then
			return (version == 0xD8 and 1) or (version == 0xA8 and 2) or (version == 0x78 and 3)
		end
	end
	return -1
end

local function getSampInfoStruct()
	local g_dwSAMP_Addr = getModuleHandle("samp.dll")
	if g_dwSAMP_Addr ~= nil then
		local sampVer = getSampVersion()
		if sampVer ~= -1 then
			local g_SAMP = memory.getuint32(g_dwSAMP_Addr + SAMP_INFO_OFFSET[sampVer], true)
			if g_SAMP ~= nil then
				return g_SAMP
			end
		end
	end
	return -1
end

local function isSampScoreboardOpened()
	local g_dwSAMP_Addr = getModuleHandle("samp.dll")
	if g_dwSAMP_Addr ~= nil then
		local sampVer = getSampVersion()
		if sampVer ~= -1 then
			local scoreboard_struct = memory.getuint32(g_dwSAMP_Addr + SAMP_SCOREBOARD_INFO[sampVer], true)
			if scoreboard_struct ~= nil then
				local represent = memory.getint8(scoreboard_struct, true)
				if represent ~= nil then
					if represent == 1 then
						return true
					elseif represent == 0 then
						return false
					end
				end
			end
		end
	end
	return -1
end

local function getSampPlayerPoolStruct()
	local g_SAMP = getSampInfoStruct()
	if g_SAMP ~= nil then
		local sampVer = getSampVersion()
		if sampVer ~= -1 then
			local ppools = memory.getuint32(g_SAMP + SAMP_PPOOLS_OFFSET[sampVer], true)
			if ppools ~= nil then
				local g_Players = memory.getuint32(ppools + SAMP_PPOOL_PLAYER_OFFSET[sampVer], true)
				if g_Players ~= nil then
					return g_Players
				end
			end
		end
	end
	return -1
end


local bool = setmetatable({}, {
	__index = var_0_4
})

speed = 1.0
all_anims = {'abseil', 'arrestgun', 'atm', 'bike_elbowl', 'bike_elbowr', 'bike_fallr', 'bike_fall_off', 'bike_pickupl', 'bike_pickupr', 'bike_pullupl', 'bike_pullupr', 'bomber', 'car_alignhi_lhs', 'car_alignhi_rhs', 'car_align_lhs', 'car_align_rhs', 'car_closedoorl_lhs', 'car_closedoorl_rhs', 'car_closedoor_lhs', 'car_closedoor_rhs', 'car_close_lhs', 'car_close_rhs', 'car_crawloutrhs', 'car_dead_lhs', 'car_dead_rhs', 'car_doorlocked_lhs', 'car_doorlocked_rhs', 'car_fallout_lhs', 'car_fallout_rhs', 'car_getinl_lhs', 'car_getinl_rhs', 'car_getin_lhs', 'car_getin_rhs', 'car_getoutl_lhs', 'car_getoutl_rhs', 'car_getout_lhs', 'car_getout_rhs', 'car_hookertalk', 'car_jackedlhs', 'car_jackedrhs', 'car_jumpin_lhs', 'car_lb', 'car_lb_pro', 'car_lb_weak', 'car_ljackedlhs', 'car_ljackedrhs', 'car_lshuffle_rhs', 'car_lsit', 'car_open_lhs', 'car_open_rhs', 'car_pulloutl_lhs', 'car_pulloutl_rhs', 'car_pullout_lhs', 'car_pullout_rhs', 'car_qjacked', 'car_rolldoor', 'car_rolldoorlo', 'car_rollout_lhs', 'car_rollout_rhs', 'car_shuffle_rhs', 'car_sit', 'car_sitp', 'car_sitplo', 'car_sit_pro', 'car_sit_weak', 'car_tune_radio', 'climb_idle', 'climb_jump', 'climb_jump2fall', 'climb_jump_b', 'climb_pull', 'climb_stand', 'climb_stand_finish', 'cower', 'crouch_roll_l', 'crouch_roll_r', 'dam_arml_frmbk', 'dam_arml_frmft', 'dam_arml_frmlt', 'dam_armr_frmbk', 'dam_armr_frmft', 'dam_armr_frmrt', 'dam_legl_frmbk', 'dam_legl_frmft', 'dam_legl_frmlt', 'dam_legr_frmbk', 'dam_legr_frmft', 'dam_legr_frmrt', 'dam_stomach_frmbk', 'dam_stomach_frmft', 'dam_stomach_frmlt', 'dam_stomach_frmrt', 'door_lhinge_o', 'door_rhinge_o', 'drivebyl_l', 'drivebyl_r', 'driveby_l', 'driveby_r', 'drive_boat', 'drive_boat_back', 'drive_boat_l', 'drive_boat_r', 'drive_l', 'drive_lo_l', 'drive_lo_r', 'drive_l_pro', 'drive_l_pro_slow', 'drive_l_slow', 'drive_l_weak', 'drive_l_weak_slow', 'drive_r', 'drive_r_pro', 'drive_r_pro_slow', 'drive_r_slow', 'drive_r_weak', 'drive_r_weak_slow', 'drive_truck', 'drive_truck_back', 'drive_truck_l', 'drive_truck_r', 'drown', 'duck_cower', 'endchat_01', 'endchat_02', 'endchat_03', 'ev_dive', 'ev_step', 'facanger', 'facgum', 'facsurp', 'facsurpm', 'factalk', 'facurios', 'fall_back', 'fall_collapse', 'fall_fall', 'fall_front', 'fall_glide', 'fall_land', 'fall_skydive', 'fight2idle', 'fighta_1', 'fighta_2', 'fighta_3', 'fighta_block', 'fighta_g', 'fighta_m', 'fightidle', 'fightshb', 'fightshf', 'fightsh_bwd', 'fightsh_fwd', 'fightsh_left', 'fightsh_right', 'flee_lkaround_01', 'floor_hit', 'floor_hit_f', 'fucku', 'gang_gunstand', 'gas_cwr', 'getup', 'getup_front', 'gum_eat', 'guncrouchbwd', 'guncrouchfwd', 'gunmove_bwd', 'gunmove_fwd', 'gunmove_l', 'gunmove_r', 'gun_2_idle', 'gun_butt', 'gun_butt_crouch', 'gun_stand', 'handscower', 'handsup', 'hita_1', 'hita_2', 'hita_3', 'hit_back', 'hit_behind', 'hit_front', 'hit_gun_butt', 'hit_l', 'hit_r', 'hit_walk', 'hit_wall', 'idlestance_fat', 'idlestance_old', 'idle_armed', 'idle_chat', 'idle_csaw', 'idle_gang1', 'idle_hbhb', 'idle_rocket', 'idle_stance', 'idle_taxi', 'idle_tired', 'jetpack_idle', 'jog_femalea', 'jog_malea', 'jump_glide', 'jump_land', 'jump_launch', 'jump_launch_r', 'kart_drive', 'kart_l', 'kart_lb', 'kart_r', 'kd_left', 'kd_right', 'ko_shot_face', 'ko_shot_front', 'ko_shot_stom', 'ko_skid_back', 'ko_skid_front', 'ko_spin_l', 'ko_spin_r', 'pass_smoke_in_car', 'phone_in', 'phone_out', 'phone_talk', 'player_sneak', 'player_sneak_walkstart', 'roadcross', 'roadcross_female', 'roadcross_gang', 'roadcross_old', 'run_1armed', 'run_armed', 'run_civi', 'run_csaw', 'run_fat', 'run_fatold', 'run_gang1', 'run_left', 'run_old', 'run_player', 'run_right', 'run_rocket', 'run_stop', 'run_stopr', 'run_wuzi', 'seat_down', 'seat_idle', 'seat_up', 'shot_leftp', 'shot_partial', 'shot_partial_b', 'shot_rightp', 'shove_partial', 'smoke_in_car', 'sprint_civi', 'sprint_panic', 'sprint_wuzi', 'swat_run', 'swim_tread', 'tap_hand', 'tap_handp', 'turn_180', 'turn_l', 'turn_r', 'walk_armed', 'walk_civi', 'walk_csaw', 'walk_doorpartial', 'walk_drunk', 'walk_fat', 'walk_fatold', 'walk_gang1', 'walk_gang2', 'walk_old', 'walk_player', 'walk_rocket', 'walk_shuffle', 'walk_start', 'walk_start_armed', 'walk_start_csaw', 'walk_start_rocket', 'walk_wuzi', 'weapon_crouch', 'woman_idlestance', 'woman_run', 'woman_runbusy', 'woman_runfatold', 'woman_runpanic', 'woman_runsexy', 'woman_walkbusy', 'woman_walkfatold', 'woman_walknorm', 'woman_walkold', 'woman_walkpro', 'woman_walksexy', 'woman_walkshop', 'xpressscratch'}

local getBonePosition = ffi.cast("int (__thiscall*)(void*, float*, int, bool)", 0x5E4280)
local props = { 
	[0716] = true, [0733] = true, [0737] = true, [0792] = true, [1211] = true, [1216] = true, [1220] = true,
	[1223] = true, [1224] = true, [1226] = true, [1229] = true, [1230] = true, [1231] = true, [1232] = true,
	[1233] = true, [1257] = true, [1258] = true, [1280] = true, [1283] = true, [1284] = true, [1285] = true,
	[1286] = true, [1287] = true, [1288] = true, [1289] = true, [1290] = true, [1291] = true, [1293] = true,
	[1294] = true, [1297] = true, [1300] = true, [1315] = true, [1350] = true, [1351] = true, [1352] = true,
	[1373] = true, [1374] = true, [1375] = true, [1408] = true, [1411] = true, [1412] = true, [1413] = true,
	[1418] = true, [1438] = true, [1440] = true, [1447] = true, [1460] = true, [1461] = true, [1468] = true,
	[1478] = true, [1568] = true, [3276] = true, [3460] = true, [3516] = true, [3853] = true, [3855] = true
}
local icons = {
    --[weaponId] ={'weapon name', 'char'}
      [0] = {'fist', '%'},
      [1] = {'Brassknuckle', 'B'},
      [2] = {'Golfclub', '>'},
      [3] = {'Nightstick', '('},
      [4] = {'Knife', 'C'},
      [5] = {'Bat', '?'},
      [6] = {'Shovel', '&'},
      [7] = {'Poolstick', ''}, --!
      [8] = {'Katana', '!'},
      [9] = {'Chainsaw bezopila', '1'},
  
      [10] = {'dildo1', 'E'},
      [11] = {'dildo2', 'E'},
      [12] = {'dildo3', 'E'},
      --[13] = {'', ''},
      [14] = {'flower', '$'},
      [15] = {'òðîñòü', '#'},
      [16] = {'grenade', '@'},
      [17] = {'smoke', 'C'},
      [18] = {'molotov', ''}, --!
      [19] = {'c4', '<'},
  
      --[20] = {'', ''},
      --[21] = {'', ''},
      [22] = {'9mm', '6'},
      [23] = {'silenced', '2'},
      [24] = {'deagle', '3'},
      [25] = {'shothun', '='},
      [26] = {'obrez', '0'},
      [27] = {'spas', '+'},
      [28] = {'uzi', 'I'},
      [29] = {'mp5', '8'},
      [30] = {'AK47', 'H'},
  
      [31] = {'m4', '5'},
      [32] = {'tec9', '7'},
      [33] = {'rifle', '.'},
      [34] = {'sniper', ''}, --!
      [35] = {'rpg', '4'},
      [36] = {'Rocket Launcher HS', ')'},
      [37] = {'Flamethrower', '*'},
      [38] = {'Minigun', 'F'},
      [39] = {'C4', ''}, --!
      
      [40] = {'BOMB DETONATOR', ''},
      [41] = {'spray', '/'},
      [42] = {'fire exhauser', ','},
      [43] = {'camera', ''}, --!
      [44] = {'ÏÍÂ', ''}, --!
      [45] = {'ÏÍÂ', ''}, --!
      [46] = {'PARASUTE', ''},  --!
}

function getweaponname(arg_5_0)
	return ({
		[0] = "Fist",
		"Brass Knuckles",
		"Golf Club",
		"Nightstick",
		"Knife",
		"Baseball Bat",
		"Shovel",
		"Pool Cue",
		"Katana",
		"Chainsaw",
		"Purple Dildo",
		"Dildo",
		"Vibrator",
		"Silver Vibrator",
		"Flowers",
		"Cane",
		"Grenade",
		"Tear Gas",
		"Molotov Cocktail",
		nil,
		nil,
		nil,
		"9mm",
		"Silenced 9mm",
		"Desert Eagle",
		"Shotgun",
		"Sawnoff Shotgun",
		"Combat Shotgun",
		"Micro SMG/Uzi",
		"MP5",
		"AK-47",
		"M4",
		"Tec-9",
		"Country Rifle",
		"Sniper Rifle",
		"RPG",
		"HS Rocket",
		"Flamethrower",
		"Minigun",
		"Satchel Charge",
		"Detonator",
		"Spraycan",
		"Fire Extinguisher",
		"Camera",
		"Night Vis Goggles",
		"Thermal Goggles",
		"Parachute"
	})[arg_5_0]
end


local icon_char = 'A'
local d3dx9_43 = ffi.load('d3dx9_43.dll')

local OFFSET = {x = -60, y = 0}
local draw = true
local autoteste = false
local nolic = false
local bypass2 = false
local notInCarYet = true
local firstTimeSitInCar = 0
local antiaimbot = false
local troll15 = false
bypass = false
flymode = 0  
speed = 1.0
radarHud = 0
time = 0
keyPressed = 0
local var_117_0 = 12216136
local floodpm = false
local var_0_2 = 100
local getBonePosition = ffi.cast("int (__thiscall*)(void*, float*, int, bool)", 0x5E4280)
local cx = representIntAsFloat(readMemory(0xB6EC10, 4, false))
local cy = representIntAsFloat(readMemory(0xB6EC14, 4, false))
local w, h = getScreenResolution()
local xc, yc = w * cy, h * cx


local font = renderCreateFont("Arial", 11, 15)

local var_0_29 = {
	isPlayerru = false,
}

local aim = {
    renderWindow = {
        renderWindow = imgui.new.bool()
    },
	
    CheckBox = {
		themes = imgui.new.int(0),
		renderSettings = imgui.new.bool();
        antistun = imgui.new.bool(),
		teste12 = imgui.new.bool(),
        teste13 = imgui.new.bool(),
        teste14 = imgui.new.bool(),
        teste15 = imgui.new.bool(),
		teste16 = imgui.new.bool(),
		teste17 = imgui.new.bool(),
		teste18 = imgui.new.bool(),
		teste19 = imgui.new.bool(),
		teste20 = imgui.new.bool(),
		teste21 = imgui.new.bool(),
teste22 = imgui.new.bool(),
teste23 = imgui.new.bool(),
teste24 = imgui.new.bool(),
teste25 = imgui.new.bool(),
teste26 = imgui.new.bool(),
teste27 = imgui.new.bool(),
silentFov = imgui.new.float(),
silentMaxDist = imgui.new.float(),
missRatio = imgui.new.float(),
teste28 = imgui.new.bool(),
teste29 = imgui.new.bool(),
teste30 = imgui.new.bool(),
teste31 = imgui.new.bool(),
teste32 = imgui.new.bool(),
silentAim = imgui.new.bool(),
silentShootWalls = imgui.new.bool(),
teste33 = imgui.new.bool(),
teste34 = imgui.new.bool(),
teste35 = imgui.new.bool(),
teste36 = imgui.new.bool(),
teste37 = imgui.new.bool(),
teste38 = imgui.new.bool(),
teste39 = imgui.new.bool(),
teste40 = imgui.new.bool(),
teste41 = imgui.new.bool(),
teste42 = imgui.new.bool(),
teste43 = imgui.new.bool(),
teste44 = imgui.new.bool(),
teste45 = imgui.new.bool(),
teste46 = imgui.new.bool(),
teste47 = imgui.new.bool(),
teste48 = imgui.new.bool(),
teste49 = imgui.new.bool(),
teste50 = imgui.new.bool(),
teste51 = imgui.new.bool(),
teste52 = imgui.new.bool(),
teste53 = imgui.new.bool(),
teste54 = imgui.new.bool(),
teste55 = imgui.new.bool(),
teste56 = imgui.new.bool(),
teste57 = imgui.new.bool(),
teste58 = imgui.new.bool(),
teste59 = imgui.new.bool(),
teste60 = imgui.new.bool(),
teste61 = imgui.new.bool(),
teste62 = imgui.new.bool(),
teste63 = imgui.new.bool(),
teste64 = imgui.new.bool(),
teste65 = imgui.new.bool(),
teste66 = imgui.new.bool(),
teste67 = imgui.new.bool(),
teste68 = imgui.new.bool(),
teste69 = imgui.new.bool(),
teste70 = imgui.new.bool(),
teste71 = imgui.new.bool(),
teste72 = imgui.new.bool(),
teste73 = imgui.new.bool(),
teste74 = imgui.new.bool(),
teste75 = imgui.new.bool(),
teste76 = imgui.new.bool(),
teste77 = imgui.new.bool(),
teste78 = imgui.new.bool(),
teste79 = imgui.new.bool(),
teste80 = imgui.new.bool(),
teste81 = imgui.new.bool(),
teste82 = imgui.new.bool(),
teste83 = imgui.new.bool(),
teste84 = imgui.new.bool(),
teste85 = imgui.new.bool(),
teste86 = imgui.new.bool(),
teste87 = imgui.new.bool(),
teste88 = imgui.new.bool(),
teste89 = imgui.new.bool(),
teste90 = imgui.new.bool(),
teste91 = imgui.new.bool(),
teste92 = imgui.new.bool(),
teste93 = imgui.new.bool(),
teste94 = imgui.new.bool(),
teste95 = imgui.new.bool(),
teste96 = imgui.new.bool(),
teste97 = imgui.new.bool(),
teste98 = imgui.new.bool(),
teste99 = imgui.new.bool(),
teste100 = imgui.new.bool(),
teste101 = imgui.new.bool(),
teste102 = imgui.new.bool(),
teste103 = imgui.new.bool(),
teste104 = imgui.new.bool(),
teste105 = imgui.new.bool(),
teste106 = imgui.new.bool(),
teste107 = imgui.new.bool(),
teste108 = imgui.new.bool(),
teste109 = imgui.new.bool(),
teste110 = imgui.new.bool(),
teste111 = imgui.new.bool(),
teste112 = imgui.new.bool(),
teste113 = imgui.new.bool(),
teste114 = imgui.new.bool(),
teste115 = imgui.new.bool(),
teste116 = imgui.new.bool(),
teste117 = imgui.new.bool(),
teste118 = imgui.new.bool(),
teste119 = imgui.new.bool(),
teste120 = imgui.new.bool(),
teste121 = imgui.new.bool(),
teste122 = imgui.new.bool(),
teste123 = imgui.new.bool(),
teste124 = imgui.new.bool(),
teste125 = imgui.new.bool(),
teste126 = imgui.new.bool(),
teste127 = imgui.new.bool(),
teste128 = imgui.new.bool(),
teste129 = imgui.new.bool(),
teste130 = imgui.new.bool(),
teste131 = imgui.new.bool(),
teste132 = imgui.new.bool(),
teste133 = imgui.new.bool(),
teste134 = imgui.new.bool(),
teste135 = imgui.new.bool(),
teste136 = imgui.new.bool(),
teste137 = imgui.new.bool(),
teste138 = imgui.new.bool(),
teste139 = imgui.new.bool(),
teste140 = imgui.new.bool(),
teste141 = imgui.new.bool(),
teste142 = imgui.new.bool(),
teste143 = imgui.new.bool(),
teste144 = imgui.new.bool(),
teste145 = imgui.new.bool(),
teste146 = imgui.new.bool(),
teste147 = imgui.new.bool(),
teste148 = imgui.new.bool(),
teste149 = imgui.new.bool(),
teste150 = imgui.new.bool(),
teste151 = imgui.new.bool(),
teste152 = imgui.new.bool(),
teste153 = imgui.new.bool(),
teste154 = imgui.new.bool(),
teste155 = imgui.new.bool(),
teste156 = imgui.new.bool(),
teste157 = imgui.new.bool(),
teste158 = imgui.new.bool(),
teste159 = imgui.new.bool(),
teste160 = imgui.new.bool(),
teste161 = imgui.new.bool(),
teste162 = imgui.new.bool(),
teste163 = imgui.new.bool(),
teste164 = imgui.new.bool(),
teste165 = imgui.new.bool(),
teste166 = imgui.new.bool(),
teste167 = imgui.new.bool(),
teste168 = imgui.new.bool(),
teste169 = imgui.new.bool(),
teste170 = imgui.new.bool(),
teste171 = imgui.new.bool(),
teste172 = imgui.new.bool(),
teste173 = imgui.new.bool(),
teste174 = imgui.new.bool(),
teste175 = imgui.new.bool(),
teste176 = imgui.new.bool(),
teste177 = imgui.new.bool(),
teste178 = imgui.new.bool(),
teste179 = imgui.new.bool(),
teste180 = imgui.new.bool(),
teste181 = imgui.new.bool(),
teste182 = imgui.new.bool(),
teste183 = imgui.new.bool(),
teste184 = imgui.new.bool(),
teste185 = imgui.new.bool(),
teste186 = imgui.new.bool(),
teste187 = imgui.new.bool(),
teste188 = imgui.new.bool(),
teste189 = imgui.new.bool(),
teste190 = imgui.new.bool(),
teste191 = imgui.new.bool(),
teste192 = imgui.new.bool(),
teste193 = imgui.new.bool(),
teste194 = imgui.new.bool(),
teste195 = imgui.new.bool(),
teste196 = imgui.new.bool(),
teste197 = imgui.new.bool(),
teste198 = imgui.new.bool(),
teste199 = imgui.new.bool(),
teste200 = imgui.new.bool(),
teste201 = imgui.new.bool(),
teste202 = imgui.new.bool(),
teste203 = imgui.new.bool(),
teste204 = imgui.new.bool(),
teste205 = imgui.new.bool(),
teste206 = imgui.new.bool(),
teste207 = imgui.new.bool(),
teste208 = imgui.new.bool(),
teste209 = imgui.new.bool(),
teste210 = imgui.new.bool(),
teste211 = imgui.new.bool(),
teste212 = imgui.new.bool(),
teste213 = imgui.new.bool(),
teste214 = imgui.new.bool(),
teste215 = imgui.new.bool(),
teste216 = imgui.new.bool(),
teste217 = imgui.new.bool(),
teste218 = imgui.new.bool(),
teste219 = imgui.new.bool(),
teste220 = imgui.new.bool(),
teste221 = imgui.new.bool(),
teste222 = imgui.new.bool(),
teste223 = imgui.new.bool(),
teste224 = imgui.new.bool(),
teste225 = imgui.new.bool(),
teste226 = imgui.new.bool(),
teste227 = imgui.new.bool(),
teste228 = imgui.new.bool(),
teste229 = imgui.new.bool(),
teste230 = imgui.new.bool(),
teste231 = imgui.new.bool(),
teste232 = imgui.new.bool(),
teste233 = imgui.new.bool(),
teste234 = imgui.new.bool(),
teste235 = imgui.new.bool(),
teste236 = imgui.new.bool(),
teste237 = imgui.new.bool(),
teste238 = imgui.new.bool(),
teste239 = imgui.new.bool(),
teste240 = imgui.new.bool(),
teste241 = imgui.new.bool(),
teste242 = imgui.new.bool(),
teste243 = imgui.new.bool(),
    },
}

function main()
	if not initialized then
		if not isSampAvailable() then
			return false
		end

		repeat
			wait(500) 
		until isSampAvailable()
		wait(5000)		
        show_loading_status()
		initialized = true
		iniLoad()
	end
	font = renderCreateFont("Verdana", 10, 9)
	font1 = renderCreateFont("Tahoma", 8, 13)
	font2 = renderCreateFont("Tahoma", 10, 4)
	font3 = renderCreateFont("Arial", 8, 6)
	if var_0_68 then
		var_0_69.addNotification("Scarllet Menu:\n Carregado com sucesso", 4, 1)
		wait(3000)
		var_0_69.addNotification(string.format("Iniciado as: %s | Data: %s", os.date("%X"), os.date("%x")), 6, 1)

		local var_7_0, var_7_1 = sampGetPlayerIdByCharHandle(PLAYER_PED)
		local var_7_2 = sampGetPlayerNickname(var_7_1)  

		var_0_69.addNotification(string.format("Bem vindo de volta, %s", var_7_2), 8, 1)
	end
	  
    repeat wait(0) until isSampAvailable()
    wait(1000) 
	sampRegisterChatCommand("tp", cmdWarp)
	sampRegisterChatCommand('smenudestrancar', unlockCmd)
		if isKeyControlAvailable() then
			if isKeyDown(KEY_FIRST) and isKeyJustPressed(KEY_SECOND) then
				local x, y, z = getCharCoordinates(PLAYER_PED)
				local succ, veh = findAllRandomVehiclesInSphere(x, y, z, 400, false, false)
				while succ do
					local succ2, v = sampGetVehicleIdByCarHandle(veh)
					if succ2 then unlockVeh(v) end
					succ, veh = findAllRandomVehiclesInSphere(x, y, z, 400, true, false)
				end
				printString('dveri razblokirovany!', 1500)
			end
		end
	sampRegisterChatCommand('smenupbazuca', bazuka)
	sampRegisterChatCommand('smenufakekillv2', takedmg)
	sampRegisterChatCommand('smenucriarveh', CreateCar)
	sampRegisterChatCommand("smenufakekill", fakekill)
	sampRegisterChatCommand("smenuflybypass", function() 
		byp = not byp
		printStringNow(string.format("~r~ Smenu Fly Bypass - %s", byp and "ativado" or "desativado"), 1000)
	end)
	

    sampRegisterChatCommand("smenukill", function(arg)
        local playerID = tonumber(arg)
        if playerID then 
            sampSendGiveDamage(playerID, var_0_0, var_0_1, var_0_2)
        end
    end)     
    sampRegisterChatCommand("smenuskin", setSkinFunc)
    sampRegisterChatCommand("smenujetpack", jetpackp)
    sampRegisterChatCommand("smenuespiar", spectation)
    sampRegisterChatCommand("smenucrash", crashmobiles)
	sampRegisterChatCommand('grudar', re)
	sampRegisterChatCommand("ap", AutoPilot)
	sampRegisterChatCommand("ap.speed", Speed)
	sampRegisterChatCommand("ap.stop", Stop)
    sampRegisterChatCommand('caron', function()
        car = not car
        sampAddChatMessage(car and '[Scarllet Menu] CarOn Ligado' or '[Scarllet Menu] CarOn nao foi possivel ligar', -1)
        lua_thread.create(function()
            while true do wait(10)
                if car then
                local car = storeCarCharIsInNoSave(PLAYER_PED)
                if not isCarEngineOn(car) then
                    switchCarEngine(car, 1)
                end
            end
        end
    end)
end)
	sampRegisterChatCommand("PARMA", getweapon)
    sampRegisterChatCommand("scarlletmenu", function()
        aim.renderWindow.renderWindow[0] = not aim.renderWindow.renderWindow[0]
    end)
	
    while true do
        wait(0)
        
		if wasKeyPressed(0xBC) and not sampIsCursorActive() then -- VK_COMMA
			aim.renderWindow.renderWindow[0] = not aim.renderWindow.renderWindow[0]
		end
		

        if res and time ~= nil then
            sampDisconnectWithReason("quit")
            wait(time * 1000)
            sampSetGamestate(1)
            res = false
        elseif res and time == nil then
            sampDisconnectWithReason("quit")
            wait(15500)
            sampSetGamestate(1)
            res = false
        end
		
		if aim.CheckBox.teste19[0] then
		end
		
		if aim.CheckBox.teste20[0] then
				sampSendSpawn()
			end
		
	    if aim.CheckBox.teste21[0] and isKeyDown(VK_RBUTTON) and not isCharDead(PLAYER_PED) then
			lua_thread.create(function()
				local var_17_0 = readMemory(11989944, 4, 0) + 1948

				if readMemory(var_17_0, 4, 0) > 0 then
					local var_17_1 = 12006488
					local var_17_2 = var_17_1 + 34

					writeMemory(var_17_2, 4, 255, 0)
					wait(100)

					local var_17_3 = readMemory(11989944, 4, 0) + 1948

					writeMemory(var_17_3, 4, 0, 0)
				end
			end)
		end

			

		if aim.CheckBox.teste150[0] then
			local var_58_101, var_58_102, var_58_103 = getCharCoordinates(PLAYER_PED)
			local var_58_104, var_58_105 = findAllRandomObjectsInSphere(var_58_101, var_58_102, var_58_103, 100, 1)
		
			if var_58_104 then
				setObjectCollision(var_58_105, false)
			end
		end

		if aim.CheckBox.teste157[0] then
			taskDead(PLAYER_PED)
			wait(170)
			sampSpawnPlayer(PLAYER_PED)
		end


		if aim.CheckBox.teste183[0] then
			for k, veh in pairs(getAllVehicles()) do
				if doesVehicleExist(veh) then
					local _, carid = sampGetVehicleIdByCarHandle(veh)
					if _ then
						printStringNow("send: ~p~"..veh, 1337)
						setCarRotationVelocity(veh, 0.5, 0.5, 0.5) 
						addToCarRotationVelocity(veh, 0.1, 0.1, 0.1) 
						applyForceToCar(veh, 0, 0, 10) 
						wait(100)
					end
				end
			end
		end
		
		

		if aim.CheckBox.teste182[0] then
            if isCharInAnyCar(PLAYER_PED) and getDriverOfCar(getCarCharIsUsing(PLAYER_PED)) == 1 then 
				local PLAYER_POS = {getCharCoordinates(PLAYER_PED)} 
				local result, handle = findAllRandomVehiclesInSphere(PLAYER_POS[1], PLAYER_POS[2], PLAYER_POS[3], 70, true, true)
				if result and handle ~= storeCarCharIsInNoSave(PLAYER_PED) and getDriverOfCar(handle) == -1 then
					local vehicleId = select(2, sampGetVehicleIdByCarHandle(handle))
					TRAILER_SYNC(vehicleId, PLAYER_POS[1], PLAYER_POS[2], PLAYER_POS[3])
					wait(45)
					TRAILER_SYNC(0, PLAYER_POS[1], PLAYER_POS[2], PLAYER_POS[3])
					printStringNow('teleportando ~r~veículo: ' .. vehicleId, 1000)
				end
			else
				sampAddChatMessage('{696969}[Scarllet Menu] {FFFFFF}  Você não está em um carro! O lag veiculos foi desativado ', -1)
				aim.CheckBox.teste182[0] = false;
			end
		end

		if aim.CheckBox.teste156[0] then
			result, mid = sampGetPlayerIdByCharHandle(PLAYER_PED)
			id = sampGetMaxPlayerId(false)

			wait(0)
			sampSendDeathByPlayer(math.random(0, id), math.random(0, 25))
		end
		
		if aim.CheckBox.teste238[0] then
			for iter_18_68, iter_18_69 in ipairs(getAllChars()) do
				if isCharOnScreen(iter_18_69) then
					local var_18_453 = {
						getCharCoordinates(playerPed)
					}
					local var_18_454 = false
					local var_18_455, var_18_456 = sampGetPlayerIdByCharHandle(iter_18_69)

					if var_18_455 then
						var_18_454 = true
					end

					if var_18_454 and iter_18_69 ~= playerPed then
						local var_18_457 = {
							getCharCoordinates(iter_18_69)
						}
						local var_18_458 = {
							convert3DCoordsToScreen(var_18_457[1] + 0.3, var_18_457[2], var_18_457[3] - 1)
						}
						local var_18_459 = getDistanceBetweenCoords3d(var_18_453[1], var_18_453[2], var_18_453[3], var_18_457[1], var_18_457[2], var_18_457[3])
						local var_18_460 = string.format("%.1f", var_18_459)

						renderFontDrawText(font, var_18_460 .. "m", var_18_458[1], var_18_458[2], 4278255360, false)
					end
				end
			end
		end

		if aim.CheckBox.teste155[0] then
			local veh = getAllVehicles()
			for i = 0, #veh do
				local _, vid = sampGetVehicleIdByCarHandle(veh[i])
				if _ then
					if isCarOnScreen(veh[i]) then
						local x, y, z = getCarCoordinates(veh[i])
						local xw, yw
						
						xw, yw = convert3DCoordsToScreen(x, y, z)
						
						renderFontDrawText(font, '{FFFFFF}ID: {2CB6DD}'..vid, xw, yw, -1)
					end
				end
			end
		end
		
		
	

		if aim.CheckBox.teste154[0] then
			memory.write(0x5109AC, 235, 1, true)
			memory.write(0x5109C5, 235, 1, true)
			memory.write(0x5231A6, 235, 1, true)
			memory.write(0x52322D, 235, 1, true)
			memory.write(0x5233BA, 235, 1, true)
			ncr = true
		else
			memory.write(0x5109AC, 122, 1, true)
			memory.write(0x5109C5, 122, 1, true)
			memory.write(0x5231A6, 117, 1, true)
			memory.write(0x52322D, 117, 1, true)
			memory.write(0x5233BA, 117, 1, true)
			ncr = false
		end		
		if aim.CheckBox.teste153[0] then
			local dfov = floatbuffer7[0]
			local crosshairSize = dfov * 27 -- Ajuste o fator multiplicativo conforme necessário
			local crosshairPos = {convertGameScreenCoordsToWindowScreenCoords(339.1, 179.1)}
			renderFigure2D(crosshairPos[1], crosshairPos[2], crosshairSize, crosshairSize, 0xFF00FF00) -- Verde
		end
		
		
		
		
		for i = 0, sampGetMaxPlayerId(true) do
			if sampIsPlayerConnected(i) then
				local find, handle = sampGetCharHandleBySampPlayerId(i)
				if find then
					if isCharOnScreen(handle) then
						local myPos = {GetBodyPartCoordinates(3, PLAYER_PED)}
						local enPos = {GetBodyPartCoordinates(3, handle)}
						if (isLineOfSightClear(myPos[1], myPos[2], myPos[3], enPos[1], enPos[2], enPos[3], true, true, false, true, true)) then
							color = 0xFF00FF00
						else
							color = 0xFFFF0000
						end
					end
				end
			end
		end
		

		if aim.CheckBox.teste152 then
			local var_24_7, var_24_8 = getScreenResolution()
	
			if aim.CheckBox.teste152 then
				local var_24_9 = renderGetFontDrawTextLength(font, "Scarllet Menu. " .. tostring(thisScript().version) .. " " .. script_version_title .. " |", false)
	
				renderFontDrawText(font, "Scarllet Menu. " .. tostring(thisScript().version) .. " " .. script_version_title .. " |", var_24_7 - (var_24_9 + 33), var_24_8 - 30 + 7, string.format("0xFFB5B8B1"))
			else
				local var_24_10 = renderGetFontDrawTextLength(font, "Scarllet Menu. " .. tostring(thisScript().version) .. " " .. script_version_title, false)
	
				renderFontDrawText(font, "Scarllet Menu. " .. tostring(thisScript().version) .. " " .. script_version_title, var_24_7 - (var_24_10 + 3), var_24_8 - 30 + 7, string.format("0xFFB5B8B1"))
			end
		end
		
		
		
	

		if aim.CheckBox.teste144[0] then
			memory.setfloat(0x8D2E64, 0)            
		else
			memory.setfloat(0x8D2E64, memory.getfloat(0x8D2E64))
		end

			if aim.CheckBox.teste148[0] and isCharInAnyCar(PLAYER_PED) then
				setCarEngineOn(storeCarCharIsInNoSave(PLAYER_PED), true)
			end

			if aim.CheckBox.teste149[0] and not isPauseMenuActive() then
				for iter_66_25 = 0, 999 do
					local var_66_99, var_66_100 = sampGetCharHandleBySampPlayerId(iter_66_25)
		
					if var_66_99 then
						local var_66_101 = sampGetPlayerColor(iter_66_25)
						local var_66_102, var_66_103, var_66_104, var_66_105 = explode_argb(var_66_101)
						local var_66_106 = join_argb(255, var_66_103, var_66_104, var_66_105)
						local var_66_107 = {}
		
						var_66_107.x, var_66_107.y, var_66_107.z = getCharCoordinates(var_66_100)
		
						local var_66_108 = {
							{
								x = var_66_107.x + 0.5,
								y = var_66_107.y + 0.5,
								z = var_66_107.z + 1
							},
							{
								x = var_66_107.x + 0.5,
								y = var_66_107.y - 0.5,
								z = var_66_107.z + 1
							},
							{
								x = var_66_107.x - 0.5,
								y = var_66_107.y - 0.5,
								z = var_66_107.z + 1
							},
							{
								x = var_66_107.x - 0.5,
								y = var_66_107.y + 0.5,
								z = var_66_107.z + 1
							},
							{
								x = var_66_107.x + 0.5,
								y = var_66_107.y + 0.5,
								z = var_66_107.z + 1
							},
							{
								x = var_66_107.x - 0.5,
								y = var_66_107.y + 0.5,
								z = var_66_107.z + 1
							},
							{
								x = var_66_107.x - 0.5,
								y = var_66_107.y + 0.5,
								z = var_66_107.z - 1
							},
							{
								x = var_66_107.x - 0.5,
								y = var_66_107.y - 0.5,
								z = var_66_107.z - 1
							},
							{
								x = var_66_107.x - 0.5,
								y = var_66_107.y - 0.5,
								z = var_66_107.z + 1
							},
							{
								x = var_66_107.x - 0.5,
								y = var_66_107.y - 0.5,
								z = var_66_107.z - 1
							},
							{
								x = var_66_107.x + 0.5,
								y = var_66_107.y - 0.5,
								z = var_66_107.z - 1
							},
							{
								x = var_66_107.x + 0.5,
								y = var_66_107.y - 0.5,
								z = var_66_107.z + 1
							},
							{
								x = var_66_107.x + 0.5,
								y = var_66_107.y - 0.5,
								z = var_66_107.z - 1
							},
							{
								x = var_66_107.x + 0.5,
								y = var_66_107.y + 0.5,
								z = var_66_107.z - 1
							},
							{
								x = var_66_107.x - 0.5,
								y = var_66_107.y + 0.5,
								z = var_66_107.z - 1
							},
							{
								x = var_66_107.x + 0.5,
								y = var_66_107.y + 0.5,
								z = var_66_107.z - 1
							}
						}
		
						if isPointsOnScreen(var_66_108) then
							local var_66_109 = dynamic_array(#var_66_108)
		
							for iter_66_26, iter_66_27 in ipairs(var_66_108) do
								var_66_109[iter_66_26].x, var_66_109[iter_66_26].y = convert3DCoordsToScreen(iter_66_27.x, iter_66_27.y, iter_66_27.z)
							end
		
							for iter_66_28, iter_66_29 in ipairs(var_66_109) do
								if iter_66_28 == #var_66_109 then
									renderDrawLine(iter_66_29.x, iter_66_29.y, var_66_109[1].x, var_66_109[1].y, 1, var_66_106)
								else
									renderDrawLine(iter_66_29.x, iter_66_29.y, var_66_109[iter_66_28 + 1].x, var_66_109[iter_66_28 + 1].y, 1, var_66_106)
								end
							end
						end
					end
				end
			end
	

		if aim.CheckBox.teste146[0] then
			memory.write(9867640, 1, 1, true)
		else
			memory.write(9867640, 0, 1, true)
		end

		if aim.CheckBox.teste145[0] then
			local animationSpeed2 = floatbuffer2[0] or 2.5 -- Use o valor do sliderfloat, ou 2.5 se não estiver definido
		
			-- Lista de animações de armas
			local pGunsAnimations = {
				"PYTHON_CROUCHFIRE", "PYTHON_FIRE", "PYTHON_FIRE_POOR", "PYTHON_CROCUCHRELOAD",
				"RIFLE_CROUCHFIRE", "RIFLE_CROUCHLOAD", "RIFLE_FIRE", "RIFLE_FIRE_POOR", "RIFLE_LOAD",
				"SHOTGUN_CROUCHFIRE", "SHOTGUN_FIRE", "SHOTGUN_FIRE_POOR",
				"SILENCED_CROUCH_RELOAD", "SILENCED_CROUCH_FIRE", "SILENCED_FIRE", "SILENCED_RELOAD",
				"TEC_crouchfire", "TEC_crouchreload", "TEC_fire", "TEC_reload",
				"UZI_crouchfire", "UZI_crouchreload", "UZI_fire", "UZI_fire_poor", "UZI_reload",
				"idle_rocket", "Rocket_Fire", "run_rocket", "walk_rocket", "WALK_start_rocket",
				"WEAPON_sniper"
			}
		
			-- Ajuste a velocidade da animação para cada animação de arma
			for _, animation in pairs(pGunsAnimations) do
				setCharAnimSpeed(PLAYER_PED, animation, animationSpeed2)
			end
		end
		
		
		
		
		
		
		if aim.CheckBox.teste22[0] and isKeyCheckAvailable() then
    if isCharOnFoot(PLAYER_PED) and isKeyDown(VK_1) then
        setGameKeyState(16, 256)
        wait(10)
        setGameKeyState(16, 0)
    end
end

        if aim.CheckBox.teste23[0] then
		setCharAnimSpeed(PLAYER_PED, "SPRINT_PANIC", 1.3)
			setCharAnimSpeed(PLAYER_PED, "SWIM_CRAWL", 21)
			setCharAnimSpeed(PLAYER_PED, "FIGHTA_2", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTA_1", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTA_3", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTA_M", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTA_G", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTB_1", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTB_2", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTB_3", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTB_G", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTC_1", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTC_2", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTC_3", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTC_G", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTD_1", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTD_2", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTD_3", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTD_G", 2)
			setCharAnimSpeed(PLAYER_PED, "GUN_BUTT", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTKICK", 2)
			setCharAnimSpeed(PLAYER_PED, "FIGHTKICK_B", 2)
		end
		
		if aim.CheckBox.teste24[0] then
    for k, v in ipairs(getAllVehicles()) do
        deleteCar(v)
    end
end

        if isPlayerPlaying(PLAYER_HANDLE) and aim.CheckBox.teste26[0] and isKeyCheckAvailable() and isKeyDown(VK_M) then
	writeMemory(var_117_0 + 51, 1, 1, false)
	wait(0)
	writeMemory(var_117_0 + 348, 1, 1, false)
	writeMemory(var_117_0 + 349, 1, 5, false)

	if reduceZoom then
		writeMemory(var_117_0 + 100, 4, representFloatAsInt(300), false)
	end

	while isKeyDown(VK_M) do
		wait(80)
	end

	writeMemory(var_117_0 + 50, 1, 1, false)
end

		
if aim.CheckBox.teste18[0] then
    -- Retrieve the screen coordinates of the player's body part
    local x, y = convert3DCoordsToScreen(getBodyPartCoordinates(1, PLAYER_PED))
    
    -- Get all vehicles and iterate through them
    for k, i in ipairs(getAllVehicles()) do
        -- Check if the vehicle is on the screen
        if isCarOnScreen(i) then
            -- Retrieve the screen coordinates of the vehicle
            local px, py = convert3DCoordsToScreen(getCarCoordinates(i))
            
            -- Render the line with the thickness from the slider value
            local thickness = floatbuffer8[0]  -- Ensure this value is properly updated by your slider
            renderDrawLine(x, y, px, py, thickness, 0xAAFF0000)
        end
    end
end

		
    if aim.CheckBox.teste17[0] then
        for iter_20_7, iter_20_8 in pairs(getAllChars()) do
			if iter_20_8 ~= playerPed and doesCharExist(iter_20_8) and isCharOnScreen(iter_20_8) then
				local var_20_217, var_20_218, var_20_219 = GetBodyPartCoordinates(33, iter_20_8)
				local var_20_220, var_20_221 = convert3DCoordsToScreen(var_20_217, var_20_218, var_20_219)

				renderFontDrawText(font, string.format("ID DA SKIN: %d", getCharModel(iter_20_8)), var_20_220, var_20_221, 4279591101)
			end
		end
	end
    

            if aim.CheckBox.teste27[0] and isKeyJustPressed(VK_X) and not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive() and not sampIsScoreboardOpen() and not sampIsDialogActive() then
			if isCharInAnyCar(PLAYER_PED) then
				freezeCarPosition(storeCarCharIsInNoSave(PLAYER_PED), false)
			else
				setPlayerControl(PLAYER_HANDLE, true)
				freezeCharPosition(PLAYER_PED, false)
				clearCharTasksImmediately(PLAYER_PED)
			end
		end	
		
		 if aim.CheckBox.teste28[0] and getCharHealth(PLAYER_PED) <= 25 then
         setCharHealth(PLAYER_PED, 0)
        end

		if aim.CheckBox.teste176[0] and isCharInAnyCar(PLAYER_PED) then
			local var_9_12 = storeCarCharIsInNoSave(PLAYER_PED)

			isCarInAirProper(var_9_12)
			setCarCollision(var_9_12, true)
			setCarHydraulics(var_9_12, true)

			if isCarInAirProper(var_9_12) then
				setCarCollision(var_9_12, true)
			end
		end
         
		if aim.CheckBox.teste179[0] then
		if isKeyDown(65) and wasKeyPressed(77) then
			sync = not sync
			sampAddChatMessage(sync and '{ffff00}[AntiRvanka] {ffffff}Protecao ativada' or '{ffff00}[AntiRvanka] {ffffff}Protecao desativada', -1)
		end
	end
		if aim.CheckBox.teste178[0] and isCharInAnyCar(PLAYER_PED) and not isCharOnAnyBike(PLAYER_PED) then
			lua_thread.create(function()
				local var_20_0 = storeCarCharIsInNoSave(PLAYER_PED)

				for iter_20_0 = 0, 5 do
					fixCarDoor(var_20_0, iter_20_0)
				end

				for iter_20_1 = 0, 6 do
					fixCarPanel(var_20_0, iter_20_1)
				end

				wait(50)

				for iter_20_2 = 0, 5 do
					popCarDoor(var_20_0, iter_20_2, true)
				end

				for iter_20_3 = 0, 6 do
					popCarPanel(var_20_0, iter_20_3, true)
				end
			end)
		end

		if aim.CheckBox.teste177[0] and isCharOnAnyBike(PLAYER_PED) and isKeyDown(87) or isKeyDown(16) then
			setCharCanBeKnockedOffBike(PLAYER_PED, true)
		else
			setCharCanBeKnockedOffBike(PLAYER_PED, false)
		end

		if aim.CheckBox.teste175[0] and isKeyDown(VK_U) and wasKeyPressed(VK_J) and isCharInAnyCar(PLAYER_PED) then
			local var_9_29, var_9_30, var_9_31 = getCarCoordinates(storeCarCharIsInNoSave(PLAYER_PED))

			warpCharFromCarToCoord(PLAYER_PED, var_9_29, var_9_30, var_9_31)
		end

		if aim.CheckBox.teste174[0] then
			local var_58_66 = sampGetPlayerColor(iter_58_1)
					local var_58_67, var_58_68, var_58_69, var_58_70 = explode_argb(var_58_66)
					local var_58_71 = join_argb(255, var_58_68, var_58_69, var_58_70)
					local var_58_72 = {
						convert3DCoordsToScreen(GetBodyPartCoordinates(3, PLAYER_PED))
					}
					local var_58_73 = {
						convert3DCoordsToScreen(GetBodyPartCoordinates(3, var_58_63))
					}

					renderDrawLine(var_58_72[1], var_58_72[2], var_58_73[1], var_58_73[2], 2, var_58_71)
					renderDrawPolygon(var_58_73[1], var_58_73[2], 10, 10, 16, 0, var_58_71)
				end

				if aim.CheckBox.teste198[0] and isCharOnFoot(PLAYER_PED) and not sampIsDialogActive() and not sampIsChatInputActive() and not isSampfuncsConsoleActive() and not isCharShooting(PLAYER_PED) then
					lua_thread.create(function()
						if isKeyDown(VK_C) then
							setGameKeyState(16, 256)
							wait(0)
							setGameKeyState(16, 0)
						end
					end)
				end

				if aim.CheckBox.teste202[0] then
					wait(50)
					setCharHeading(PLAYER_PED, 10)
					wait(50)
					setCharHeading(PLAYER_PED, 20)
					wait(50)
					setCharHeading(PLAYER_PED, 40)
					wait(50)
					setCharHeading(PLAYER_PED, 80)
					wait(50)
					setCharHeading(PLAYER_PED, 160)
					wait(50)
					setCharHeading(PLAYER_PED, 320)
					wait(50)
					setCharHeading(PLAYER_PED, 360)
				end

				if aim.CheckBox.teste205[0] then
					axisx = readMemory(11987996, 4, false)
					axisy = readMemory(11987992, 4, false)
			
					if axisx ~= axisy then
						writeMemory(11987992, 4, axisx, false)
					end
				elseif not aim.CheckBox.teste205[0] then
					memory.setuint32(5382798, 11987992)
				end

				if aim.CheckBox.teste207[0] then
					showCrosshairInstantlyPatch(true)
				elseif not aim.CheckBox.teste207[0] then
					showCrosshairInstantlyPatch(false)
				end

					if aim.CheckBox.teste237[0] and not isPauseMenuActive() and not sampIsChatInputActive() and isCharOnAnyBike(PLAYER_PED) and ({
						[481] = true,
						[509] = true,
						[510] = true
					})[getCarModel(storeCarCharIsInNoSave(PLAYER_PED))] and isKeyJustPressed(VK_C) then
						setVirtualKeyDown(17, true)
						wait(300)
						setVirtualKeyDown(17, false)
			
						local var_18_248 = storeCarCharIsInNoSave(PLAYER_PED)
						local var_18_249, var_18_250, var_18_251 = getCarSpeedVector(storeCarCharIsInNoSave(PLAYER_PED))
			
						if not isCarInAirProper(var_18_248) and var_18_251 < 7 then
							applyForceToCar(storeCarCharIsInNoSave(PLAYER_PED), 0, 0, 0.44, 0, 0, 0)
						end
					end

				if aim.CheckBox.teste236[0] then
					memory.setint8(0xB7CEE4, 1)
				end	

				if aim.CheckBox.teste243[0] then
				end
				



				if aim.CheckBox.teste242[0] then
					if isKeyDown(VK_A) and isKeyJustPressed(VK_B) then
						local x, y, z = getCharCoordinates(PLAYER_PED)
						local succ, veh = findAllRandomVehiclesInSphere(x, y, z, 400, false, false)
						while succ do
							local succ2, v = sampGetVehicleIdByCarHandle(veh)
							if succ2 then unlockVeh(v) end
							succ, veh = findAllRandomVehiclesInSphere(x, y, z, 400, true, false)
						end
						printString('Veiculos Destrancados!', 1500)
					end
				end

				if aim.CheckBox.teste241[0] then
					dupe1 = not dupe1
					if dupe1 then
					end
					wait(kd)
					if dupe1 then
						sampSendChat("/guardararma")
					end
				end
				
				
				

				if aim.CheckBox.teste235[0] then
					veh = getAllVehicles()
					for k, v in ipairs(veh) do
						if isCarOnScreen(v) then
							model = cars[getCarModel(v) - 399] .. ' (' .. tostring(select(2, sampGetVehicleIdByCarHandle(v))) .. ')'
							clr, _ = getCarColours(v)
							cx, cy, cz = getCarCoordinates(v)
							x, y = convert3DCoordsToScreen(cx, cy, cz)
							length = renderGetFontDrawTextLength(font, model, true)
							height = renderGetFontDrawHeight(font)
							textcolor = 0xFF00B811
							
							if getCarDoorLockStatus(v) == 2 then
								textcolor = 0xFFEC0000
							end
							
							renderFontDrawText(font, model, x - (length + 5 + 18) / 2, y - (height + 7 + 14) / 2, textcolor, true)
							renderDrawBox(x + (length + 5 - 18) / 2, y - (7 + 14) / 2 - 9, 18, 18, 0xFFFFFFFF)
							renderDrawBox(x + (length + 5 - 18) / 2 + 2, y - (7 + 14) / 2 - 7, 14, 14, 0xFF000000 + colors[clr + 1] / 0x100)
							
							healthbox = length + 5 + 18 + 8
							healthbox2 = healthbox * (getCarHealth(v) / 1000)
							renderDrawBox(x - healthbox / 2 - 1, y + (height + 7 - 14) / 2, healthbox + 2, 14, 0xFF000000)
							renderDrawBox(x - healthbox / 2, y + (height + 7 - 14) / 2 + 1, healthbox, 12, 0xFF0084DF)
							renderDrawBox(x - healthbox / 2, y + (height + 7 - 14) / 2 + 1, healthbox2, 12, 0xFF005C9B)		
					end
				end
			end
				
				
				
				

				if aim.CheckBox.teste234[0] then
					if not isGamePaused() then
						g_dwSAMP_Addr = getSampDll() -- Ïðîâåðÿåì ÷òî SAMP çàãðóæåí
						g_SAMP = getSampInfoStruct() -- Ïðîâåðÿåì ÷òî ñòðóêòóðû SAMP çàãðóæåíû
						g_Players = getSampPlayerPoolStruct() -- Ïðîâåðÿåì ÷òî ñòðóêòóðà èãðîêîâ çàãðóæåíà
						if isKeyJustPressed(akey) then
							workability = not workability
							if g_dwSAMP_Addr ~= -1 and g_SAMP ~= -1 then
								sampPatchDisableNameTags(workability)
							end
						end
						local stopThrd = false -- Êàê ðåàëèçîâàòü îïåðàòîð continue â Lua íà àäåêâàòíîì óðîâíå ÿ íå åáó, ïîýòîìó çäåñü êîñòûëè
						-- don't run during certain samp events
						if g_dwSAMP_Addr ~= -1 and g_SAMP ~= -1 then
							-- Scoreboard open? F10 key down?
							if isSampScoreboardOpened() or isKeyDown(0x79) then
								stopThrd = true
							end
						end
						if workability and stopThrd == false then
							-- for tracking player states as we iterate through
							local isPedESPCollided = {}
							local isPedESPStairStacked = {}
							-- alignment settings
							local ESP_tag_player_pixelOffsetY = -10
							local ESP_tag_player_D3DBox_pixelOffsetX = -0.5
							local ESP_tag_player_D3DBox_pixelOffsetY = -0.5
							local ESP_tag_player_posOffsetZ = 1.0
							local ESP_tag_player_espHeight = 20.0
							-- trash values to use during iterations
							local vh, va
							local iGTAID, iGTAID_Inner, selfGTAID;
							local iterPosition, ourPosition -- ourPosMinusIter íå ïîòðåáîâàëîñü, çàìåíåíî íà getDistanceBetweenCoords3d
							local poss, screenposs
							-- get our info
							if isCharInAnyCar(PLAYER_PED) then
								-- RC Vehicle Fix (Not showing names of recently streamed in players
								-- while being in a RC Vehicle)
								local carX, carY, carZ = getCarCoordinates(storeCarCharIsInNoSave(PLAYER_PED))
								ourPosition = {x = carX, y = carY, z = carZ}
							else
								local charX, charY, charZ = getCharCoordinates(PLAYER_PED)
								ourPosition = {x = charX, y = charY, z = charZ}
							end
							-- get our scripting ID so we can exclude ourself
							selfGTAID = 1
							-- get initial variables for peds streamed in
							local peds = getAllChars()
							for iterpos, iterPed in pairs(peds) do
								-- get player id
								iGTAID = iterpos
								-- ignore if it's us
								if not (iGTAID == selfGTAID) then
									-- RC Vehicle fix (not showing names of players in RC vehicles)
									if isCharInAnyCar(iterPed) then
										local veh = storeCarCharIsInNoSave(iterPed)
										if isVehicleClassSmall(veh) and getDriverOfCar(veh) == iterPed then
											local carX, carY, carZ = getCarCoordinates(veh)
											iterPosition = {fX = carX, fY = carY, fZ = carZ}
										else
											local charX, charY, charZ = getCharCoordinatesFixed(iterPed) -- Ïîôèêøåíî: ïåðñîíàæ â ÒÑ, è Lua ïî íåèçâåñòíîé ïðè÷èíå âîçâðàùàåò êîîðäèíàòû ÒÑ âìåñòî êîîðäèíàò ïåðñîíàæà
											iterPosition = {fX = charX, fY = charY, fZ = charZ}
										end
									else
										local charX, charY, charZ = getCharCoordinates(iterPed)
										iterPosition = {fX = charX, fY = charY, fZ = charZ}
									end
									-- check if it's farther than set.player_tags_dist
									if getDistanceBetweenCoords3d(ourPosition.x, ourPosition.y, ourPosition.z, iterPosition.fX, iterPosition.fY, iterPosition.fZ) < set.player_tags_dist then
										g_playerTagInfo[iGTAID].isPastMaxDistance = false
										-- get the player position in 2D
										poss = {x = 0.0, y = 0.0, z = 0.0}
										poss.x = iterPosition.fX
										poss.y = iterPosition.fY
										poss.z = iterPosition.fZ + ESP_tag_player_posOffsetZ
										screenposs = {x = 0.0, y = 0.0, z = 0.0}
										screenposs.x, screenposs.y, screenposs.z = CalcScreenCoors(poss.x, poss.y, poss.z)
										-- check if the iter is culled or not
										if screenposs.z > 1.0 then
											-- global, set ESP position for tagOffsetY use
											g_playerTagInfo[iGTAID].tagPosition.fX = screenposs.x
											g_playerTagInfo[iGTAID].tagPosition.fY = screenposs.y
											g_playerTagInfo[iGTAID].tagPosition.fZ = screenposs.z
										else
											g_playerTagInfo[iGTAID].tagOffsetY = 0.0
											g_playerTagInfo[iGTAID].isPastMaxDistance = true
										end
									else
										g_playerTagInfo[iGTAID].isPastMaxDistance = true
									end
								end
							end
							-- remove staircase problem
							for iterpos, iterPed in pairs(peds) do
								-- get player id
								iGTAID = iterpos
								-- ignore if it's us
								if not (iGTAID == selfGTAID) then
									-- filter out "ok" ESP
									if not (g_playerTagInfo[iGTAID].isPastMaxDistance or not g_playerTagInfo[iGTAID].isStairStacked and g_playerTagInfo[iGTAID].tagOffsetY < 40.0) then
										-- detect stair stacking per frame if ESP isn't already stair stacked
										if not g_playerTagInfo[iGTAID].isStairStacked then
											for iterInnerpos, iterInnerPed in pairs(peds) do
												-- get player id
												iGTAID_Inner = iterInnerpos
												-- ignore if it's us or isPastMaxDistance
												if not (g_playerTagInfo[iGTAID_Inner].isPastMaxDistance or iGTAID_Inner == iGTAID) then
													-- test to see who comes out on top
													if math.abs(g_playerTagInfo[iGTAID].tagPosition.fX - g_playerTagInfo[iGTAID_Inner].tagPosition.fX) <= 100.0 and math.abs((g_playerTagInfo[iGTAID].tagPosition.fY - (g_playerTagInfo[iGTAID].tagOffsetY / 2.0)) - (g_playerTagInfo[iGTAID_Inner].tagPosition.fY - g_playerTagInfo[iGTAID_Inner].tagOffsetY)) <= ESP_tag_player_espHeight then
														isPedESPStairStacked[iGTAID] = false
													end
												end -- 3rd continue
											end
											-- setup stair stack variables needed to un stack the ESP
											if isPedESPStairStacked[iGTAID] then
												g_playerTagInfo[iGTAID].isStairStacked = true
												g_playerTagInfo[iGTAID].stairStackedOffset = g_playerTagInfo[iGTAID].tagOffsetY / 2.0
											end
										end -- end inner while - detect stair stacking
										-- lower the offsets for stair stacked ESP
										-- and turn off stack status of ESP that reaches the "available" offset
										if g_playerTagInfo[iGTAID].isStairStacked then
											g_playerTagInfo[iGTAID].tagOffsetY = g_playerTagInfo[iGTAID].tagOffsetY - 5.0
											g_playerTagInfo[iGTAID].stairStackedOffset = g_playerTagInfo[iGTAID].stairStackedOffset - 5.0
											if g_playerTagInfo[iGTAID].stairStackedOffset < 5.0 then
												g_playerTagInfo[iGTAID].stairStackedOffset = 0.0
												g_playerTagInfo[iGTAID].isStairStacked = false
											end
										end
									end -- 2nd continue
								end -- 1st continue
							end -- end outer while - remove staircase problem
							-- detect & adjust for ESP collisions
							for iterpos, iterPed in pairs(peds) do
								-- get player id
								iGTAID = iterpos
								-- we isPastMaxDistance or stairstacked, move along
								if not (g_playerTagInfo[iGTAID].isPastMaxDistance or g_playerTagInfo[iGTAID].isStairStacked) then
									for iterInnerpos, iterInnerPed in pairs(peds) do
										-- get player id
										iGTAID_Inner = iterInnerpos
										-- filter out isPastMaxDistance, stairstacked, and same Ped
										if not (g_playerTagInfo[iGTAID].isPastMaxDistance or g_playerTagInfo[iGTAID_Inner].isStairStacked or iGTAID == iGTAID_Inner) then
											-- player is within range, figure out if there's collision
											if math.abs(g_playerTagInfo[iGTAID].tagPosition.fX - g_playerTagInfo[iGTAID_Inner].tagPosition.fX) <= 100.0 and math.abs((g_playerTagInfo[iGTAID].tagPosition.fY - g_playerTagInfo[iGTAID].tagOffsetY) - (g_playerTagInfo[iGTAID_Inner].tagPosition.fY - g_playerTagInfo[iGTAID_Inner].tagOffsetY)) <= ESP_tag_player_espHeight then
												-- collision, figure out who gets to stay
												if g_playerTagInfo[iGTAID].tagPosition.fZ < g_playerTagInfo[iGTAID_Inner].tagPosition.fZ then
													-- playerID "g_pTI_i" is farther, it should move up
													g_playerTagInfo[iGTAID_Inner].tagOffsetY = g_playerTagInfo[iGTAID_Inner].tagOffsetY + 5.0
													isPedESPCollided[iGTAID_Inner] = true
												elseif g_playerTagInfo[iGTAID].tagPosition.fZ > g_playerTagInfo[iGTAID_Inner].tagPosition.fZ then
													-- playerID "i" is farther, it should move up
													-- we should only need normal upward movement here
													g_playerTagInfo[iGTAID].tagOffsetY = g_playerTagInfo[iGTAID].tagOffsetY + 5.0
													isPedESPCollided[iGTAID] = true
												else
													-- both playerIDs are the same position @_@ so prefer the lower ID#
													if iGTAID < iGTAID_Inner then
														g_playerTagInfo[iGTAID_Inner].tagOffsetY = g_playerTagInfo[iGTAID_Inner].tagOffsetY + 5.0
														isPedESPCollided[iGTAID_Inner] = true
													else
														g_playerTagInfo[iGTAID].tagOffsetY = g_playerTagInfo[iGTAID].tagOffsetY + 5.0
														isPedESPCollided[iGTAID] = true
													end
												end
											end
											-- are we jigglin?  everybody likes ta jiggle.
											if math.abs(g_playerTagInfo[iGTAID].tagPosition.fX - g_playerTagInfo[iGTAID_Inner].tagPosition.fX) <= 100.0 and math.abs((g_playerTagInfo[iGTAID].tagPosition.fY - g_playerTagInfo[iGTAID].tagOffsetY) - (g_playerTagInfo[iGTAID_Inner].tagPosition.fY - g_playerTagInfo[iGTAID_Inner].tagOffsetY)) - 5.0 <= ESP_tag_player_espHeight then
												if g_playerTagInfo[iGTAID].tagPosition.fZ < g_playerTagInfo[iGTAID_Inner].tagPosition.fZ then
													isPedESPCollided[iGTAID_Inner] = true
												else
													isPedESPCollided[iGTAID] = true
												end
											end
										end -- 2nd continue
									end -- end inner while
									-- return tagOffsetY to zero if needed
									if not isPedESPCollided[iGTAID] then
										if g_playerTagInfo[iGTAID].tagOffsetY >= 5.0 then
											g_playerTagInfo[iGTAID].tagOffsetY = g_playerTagInfo[iGTAID].tagOffsetY - 5.0
										else
											g_playerTagInfo[iGTAID].tagOffsetY = 0.0
										end
									end
								end -- 1st continue
							end -- end outer while
							-- start render ESP tags
							local h, playerBaseY -- w íå ïîíàäîáèëîñü (íå èñïîëüçóåòñÿ íèãäå, äàæå â îðèãèíàëüíîì ñóðñå)
							for iterpos, iterPed in pairs(peds) do
								-- get player id
								iGTAID = iterpos
								-- ignore if isPastMaxDistance or if it's us
								if not (g_playerTagInfo[iGTAID].isPastMaxDistance or iGTAID == selfGTAID) then
									playerBaseY = g_playerTagInfo[iGTAID].tagPosition.fY - g_playerTagInfo[iGTAID].tagOffsetY + ESP_tag_player_pixelOffsetY
									local iSAMPID
									if g_Players ~= -1 then
										if isSampfuncsLoaded() then
											local result, tempId = sampGetPlayerIdByCharHandle(iterPed)
											if result then
												iSAMPID = tempId
											end
										end
									end
									-- get Ped health
									-- works in single player, but SAMP maintains its own player health
									--vh = iterPed->GetHealth();
									-- get samp health
									local brk = false -- Î÷åðåäíûå êîñòûëè èç-çà îïåðàòîðà continue
									if g_Players ~= -1 then
										if iSAMPID ~= nil then
											vh = sampGetPlayerHealth(iSAMPID)
											va = sampGetPlayerArmor(iSAMPID)
										else
											-- SA-MP running, but was not a remote player
											brk = true
										end
									else
										vh = getCharHealth(iterPed)
										va = getCharArmour(iterPed)
									end
									if brk == false then
										local color = join_argb(75, 0, 200, 0)
										if vh > 100.0 then vh = 100.0 end
										if vh < 100.0 and vh > 60.0 then
											color = join_argb(111, 0, 200, 0)
										elseif vh < 60.0 and vh > 20.0 then
											color = join_argb(111, 200, 200, 0)
										elseif vh < 20.0 and vh > 0.0 then
											color = join_argb(111, 200, 0, 0)
										end
										renderDrawBox(g_playerTagInfo[iGTAID].tagPosition.fX + ESP_tag_player_D3DBox_pixelOffsetX, playerBaseY + ESP_tag_player_D3DBox_pixelOffsetY, 100.0, 10.0, join_argb(111, 0, 0, 0))
										renderDrawBox(g_playerTagInfo[iGTAID].tagPosition.fX + 1.0 + ESP_tag_player_D3DBox_pixelOffsetX, playerBaseY + 1.0 + ESP_tag_player_D3DBox_pixelOffsetY, vh - 2.0, 8.0, color)
										if va > 0.0 then
											if va > 100.0 then va = 100.0 end
											va = va / 1.0
											renderDrawBox(g_playerTagInfo[iGTAID].tagPosition.fX + ESP_tag_player_D3DBox_pixelOffsetX, playerBaseY + ESP_tag_player_D3DBox_pixelOffsetY, va - 1.0, 10.0, join_argb(111, 0, 0, 0))
											renderDrawBox(g_playerTagInfo[iGTAID].tagPosition.fX + 1.0 + ESP_tag_player_D3DBox_pixelOffsetX, playerBaseY + 1.0 + ESP_tag_player_D3DBox_pixelOffsetY, va - 2.0, 8.0, join_argb(111, 220, 220, 220))
										end
										-- this should also calculate the anti-aliasing top edge somehow
										h = renderGetFontDrawHeight(pD3DFontFixedSmall) + 1
										-- already check if player is ok before
										-- so now we only need to check if samp is running
										if g_Players == -1 then
											PrintShadow(pD3DFontFixedSmall, "H: " .. getCharHealth(iterPed) .. ", A: " .. getCharArmour(iterPed), g_playerTagInfo[iGTAID].tagPosition.fX + 8.0, playerBaseY - h + 10.0, join_argb(130, 0xFF, 0x6A, 0))
										else
											if isSampfuncsLoaded() then
												PrintShadow(pD3DFontFixedSmall, "H: " .. sampGetPlayerHealth(iSAMPID) .. ", A: " .. sampGetPlayerArmor(iSAMPID), g_playerTagInfo[iGTAID].tagPosition.fX + 8.0, playerBaseY - h + 10.0, join_argb(130, 0xFF, 0x6A, 0))
												-- render the main nametag last so it's on top
												-- this should calculate the anti-aliasing top edge somehow
												h = renderGetFontDrawHeight(pD3DFont_sampStuff) - 1
												local _, r, g, b = explode_argb(sampGetPlayerColor(iSAMPID))
												PrintShadow(pD3DFont_sampStuff, sampGetPlayerNickname(iSAMPID) .. " (" .. iSAMPID .. ")", g_playerTagInfo[iGTAID].tagPosition.fX, playerBaseY - h, join_argb(0xDD, r, g, b))
												-- w = renderGetFontDrawHeight(pD3DFont_sampStuff)
												if sampIsPlayerPaused(iSAMPID) then
													renderFontDrawText(pD3DFontFixedSmall, "AFK", g_playerTagInfo[iGTAID].tagPosition.fX + ESP_tag_player_D3DBox_pixelOffsetX + 100.0 + 2.0, playerBaseY + ESP_tag_player_D3DBox_pixelOffsetY - 2.0, join_argb(0xFF, 0xF0, 0xF0, 0xF0))
												end
											end
										end
									end
								end
							end
						end
					end
				end
			


				if aim.CheckBox.teste232[0] then
						for i = 0, sampGetMaxPlayerId(true) do
							if sampIsPlayerConnected(i) then
								local find, handle = sampGetCharHandleBySampPlayerId(i)
								if find then
									if isCharOnScreen(handle) then
										local myPos = { GetBodyPartCoordinates(3, PLAYER_PED) }
										local enPos = { GetBodyPartCoordinates(3, handle) }
										if isLineOfSightClear(myPos[1], myPos[2], myPos[3], enPos[1], enPos[2], enPos[3], true, true, false, true, true) then
											color = 0xFF0000FF -- Azul
										else
											color = 0xFFFF0000
										end
					
										local t = { 3, 4, 5, 51, 52, 41, 42, 31, 32, 33, 21, 22, 23, 2 }
										for v = 1, #t do
											local pos1 = { GetBodyPartCoordinates(t[v], handle) }
											local pos2 = { GetBodyPartCoordinates(t[v] + 1, handle) }
											local pos1Screen = { convert3DCoordsToScreen(pos1[1], pos1[2], pos1[3]) }
											local pos2Screen = { convert3DCoordsToScreen(pos2[1], pos2[2], pos2[3]) }
											renderDrawLine(pos1Screen[1], pos1Screen[2], pos2Screen[1], pos2Screen[2], 1, color)
										end
									end
								end
							end
						end
					end
					

				if aim.CheckBox.teste231[0] then
					local x, y = convert3DCoordsToScreen(getBodyPartCoordinates(1, PLAYER_PED))
					for k, v in ipairs(getAllChars()) do
						if doesCharExist(v) and isCharOnScreen(v) and v ~= 1 then
							local color = sampGetPlayerColor(select(2, sampGetPlayerIdByCharHandle(v)))
							local aa, rr, gg, bb = explode_argb(color)
							-- Mudança da cor para azul
							local color = join_argb(255, 0, 0, 255) -- Azul
							local px, py = convert3DCoordsToScreen(getBodyPartCoordinates(1, v))
							renderDrawLine(x, y, px, py, 1, color)
						end
					end
				end
				

				if aim.CheckBox.teste230[0] then
					requestAnimation("TATTOOS")
					local result = hasAnimationLoaded("TATTOOS")
					if result then
						taskPlayAnim(PLAYER_PED, "TAT_Sit_Out_O", "TATTOOS", 100.0, true, true, true, true, 900)
					end
				else
					
				end

				if aim.CheckBox.teste229[0] then
					if a == nil or a == false then
						a = true
						taskSetIgnoreWeaponRangeFlag(PLAYER_PED, true)
						printStringNow("~g~ATIVADO", 1500)
					end
				else
					if a == true then
						a = false
						taskSetIgnoreWeaponRangeFlag(PLAYER_PED, false)
						printStringNow("~r~DESATIVADO", 1500)
					end
				end
				
				weapon = getCurrentCharWeapon(PLAYER_PED)
				local result = isCharShooting(PLAYER_PED)
				if a == true and result and (weapon == 24 or weapon == 25) then
					wait(100)
					clearCharTasksImmediately(PLAYER_PED)
				end
				

				if aim.CheckBox.teste228[0] then
					lua_thread.create(function()
						for a = 0, sampGetMaxPlayerId(false) do
							if sampIsPlayerConnected(a) then
								local name = sampGetPlayerNickname(a)
								local path = 'moonloader/adm_list.txt'
								local file = io.open(path, 'r+')
								if file ~= nil then
									for line in file:lines() do
										if name == line then
											count = count + 1
											table.insert(nicks, line)
										end
									end
									file:close()
								end
							end
						end
						if #nicks > 25 then
							sampAddChatMessage('Este script nao permite mais do que 25 administradores.')
						elseif #nicks == 0 then
							sampAddChatMessage('Nao ha administradores na lista.', -1)
						else
							sampAddChatMessage('Total de administradores online: '..getÑorrectWordByNumber(count)..':', -1)
							for admins = 1, #nicks do
								for b = 0, sampGetMaxPlayerId(false) do
									if sampIsPlayerConnected(b) then
										if sampGetPlayerNickname(b) == nicks[admins] then
											_, ped = sampGetCharHandleBySampPlayerId(b)
											if doesCharExist(ped) then
												if sampIsPlayerPaused(b) then
													sampAddChatMessage(nicks[admins]..'('..b..')', 0x00FF00)
												else
													sampAddChatMessage(nicks[admins]..'('..b..')', 0xFF0000)
												end
											else
												sampAddChatMessage(nicks[admins]..'('..b..')', 0x0000FF)
											end
										end
									end
								end
							end
						end
						nicks = {}
						count = 0
					end)
				end
				

					if aim.CheckBox.teste227[0] and isKeyDown(VK_R) then
						while isKeyDown(VK_R) do
							wait(0)
			
							if not sampIsCursorActive() and isCharOnFoot(PLAYER_PED) and wasKeyPressed(VK_R) then
								sampSetSpecialAction(68)
							elseif wasKeyReleased(VK_R) then
								sampSetSpecialAction(0)
							end
						end
					end

				if aim.CheckBox.teste226[0] then
					ApplyPlayerAnimation('PED', 'cower', 4.1, true, true, true, true, 0)
					local result, x, y, z = getCoordinatesInFrontOfChar(1, -0.3)
					if result then
						wait(1500)
						PlaySound(32201, x, y, z)
						wait(500)
						createObject(19208, x, y, z)
						wait(500)
						ClearPlayerAnimation()
					end
				end
				

				if aim.CheckBox.teste225[0] then
					for i = 0, sampGetMaxPlayerId() do
						if sampIsPlayerConnected(i) then
							local result, handlePed = sampGetCharHandleBySampPlayerId(i)
							local color_ped = sampGetPlayerColor(i)
							local a, r, g, b = explode_argb(color_ped)
							local color = join_argb(255, r, g, b)
							if result and doesCharExist(handlePed) and isCharOnScreen(handlePed) then
								local pos = {getCharCoordinates(PLAYER_PED)}
								local whpos = {getCharCoordinates(handlePed)}
								local x1, y1 = convert3DCoordsToScreen(pos[1], pos[2], pos[3])
								local x2, y2 = convert3DCoordsToScreen(whpos[1], whpos[2], whpos[3])
								renderDrawPolygon(x1, y1, 8, 8, 16, 0.0, color)
								renderDrawLine(x1, y1, x2, y2, 2, color)
								renderDrawPolygon(x2, y2, 8, 8, 16, 0.0, color)
								local whpos = {GetBodyPartCoordinates(8, handlePed)}
								local x1, y1 = convert3DCoordsToScreen(pos[1], pos[2], pos[3])
								local x2, y2 = convert3DCoordsToScreen(whpos[1], whpos[2], whpos[3])
								local _, id = sampGetPlayerIdByCharHandle(handlePed)
								local nick = sampGetPlayerNickname(id)
								renderFontDrawText(font, nick.." | ID ["..id.."]" , x2, y2 - 50, color, -1)
							end
						end
					end
				end

				if aim.CheckBox.teste224[0] then
					for k,v in pairs(getAllChars()) do
						if v ~= PLAYER_PED then
							if ChamsQuery[v] then
								if not isCharOnScreen(v) then			
									RemoveFromChamsQuery(v)
								end
							elseif isCharOnScreen(v) then
								AddPlayerToChamsQuery(v, -1)
							end
						end
					end
				else
					-- Desativa o código, removendo todos os jogadores da lista de consulta
					for k,v in pairs(ChamsQuery) do
						RemoveFromChamsQuery(k)
					end
				end
				


				if aim.CheckBox.teste221[0] then
					memory.setint8(9867628, 1)
				else
					memory.setint8(9867628, 0)
				end

				if aim.CheckBox.teste219[0] then
					for i = 1, 4096 do
						local pickup = sampGetPickupHandleBySampId(i)
						if pickup ~= 0 then
							local pool = sampGetPickupPoolPtr()
							local mdid = (i * 20) + 61444 + pool
							local pickupmodel = readMemory(mdid, 4, false)
							
							local x, y, z = getPickupCoordinates(pickup)
							local px, py, pz = getCharCoordinates(playerPed)
							local rad = getDistanceBetweenCoords3d(px, py, pz, x, y, z)
							if isPointOnScreen(x, y, z, 0) and aim.CheckBox.teste219[0] then
								local cx, cy = convert3DCoordsToScreen(x, y, z)
								renderFontDrawText(font, string.format("Pickup: {31F5FC} %d {FFBEBEBE} Modelo:{31F5FC} %d", i, pickupmodel), cx, cy, 0xFFBEBEBE)
							end
						end
					end
				end
				
				

				if aim.CheckBox.teste218[0] then
					for i = 1, 1000 do
						local obj = sampGetObjectHandleBySampId(i)
						if doesObjectExist(obj) then
							local res, x, y, z = getObjectCoordinates(obj)
							local objmodel = getObjectModel(obj)
							local px, py, pz = getCharCoordinates(playerPed)
							local rad = getDistanceBetweenCoords3d(px, py, pz, x, y, z)
							if isPointOnScreen(x, y, z, 0) and aim.CheckBox.teste218[0] then
								local cx, cy = convert3DCoordsToScreen(x, y, z)
								renderFontDrawText(font, string.format("Objeto:{31F5FC} %d {FFBEBEBE} Modelo: {31F5FC} %d", i, objmodel), cx, cy, 0xFFBEBEBE)
							end
						end
					end
				end
				

				if aim.CheckBox.teste217[0] then
					deleteObject(3459)
				deleteObject(1294)
				deleteObject(3854)
				deleteObject(1278)
				deleteObject(1308)
				deleteObject(1307)
				deleteObject(3463)
				deleteObject(1290)

				local var_3_3, var_3_4, var_3_5, var_3_6 = getTargetBlipCoordinates()

				handlecar = storeCarCharIsInNoSave(PLAYER_PED)

				setCarCruiseSpeed(handlecar, 30)
				carGotoCoordinates(handlecar, var_3_4, var_3_5, var_3_6)
			end

				if aim.CheckBox.teste216[0] then
					taskPlayAnim(PLAYER_PED, "BIKES_BACK", "BIKES", 9, true, false, false, false, 5000)
		        end

				if aim.CheckBox.teste215[0] then
					setCharHealth(PLAYER_PED, 100)
					wait(10)
					setCharHealth(PLAYER_PED, 30)
					wait(10)
					setCharHealth(PLAYER_PED, 10)
					wait(10)
					setCharHealth(PLAYER_PED, 60)
					wait(10)
					setCharHealth(PLAYER_PED, 90)
				end
				

				if aim.CheckBox.teste212[0] then
					local animationSpeed3 = floatbuffer6[0] or 2.5 
					local all_anims = {
						"abseil",
						"arrestgun",
						"atm",
						"bike_elbowl",
						"bike_elbowr",
						"bike_fallr",
						"bike_fall_off",
						"bike_pickupl",
						"bike_pickupr",
						"bike_pullupl",
						"bike_pullupr",
						"bomber",
						"car_alignhi_lhs",
						"car_alignhi_rhs",
						"car_align_lhs",
						"car_align_rhs",
						"car_closedoorl_lhs",
						"car_closedoorl_rhs",
						"car_closedoor_lhs",
						"car_closedoor_rhs",
						"car_close_lhs",
						"car_close_rhs",
						"car_crawloutrhs",
						"car_dead_lhs",
						"car_dead_rhs",
						"car_doorlocked_lhs",
						"car_doorlocked_rhs",
						"car_fallout_lhs",
						"car_fallout_rhs",
						"car_getinl_lhs",
						"car_getinl_rhs",
						"car_getin_lhs",
						"car_getin_rhs",
						"car_getoutl_lhs",
						"car_getoutl_rhs",
						"car_getout_lhs",
						"car_getout_rhs",
						"car_hookertalk",
						"car_jackedlhs",
						"car_jackedrhs",
						"car_jumpin_lhs",
						"car_lb",
						"car_lb_pro",
						"car_lb_weak",
						"car_ljackedlhs",
						"car_ljackedrhs",
						"car_lshuffle_rhs",
						"car_lsit",
						"car_open_lhs",
						"car_open_rhs",
						"car_pulloutl_lhs",
						"car_pulloutl_rhs",
						"car_pullout_lhs",
						"car_pullout_rhs",
						"car_qjacked",
						"car_rolldoor",
						"car_rolldoorlo",
						"car_rollout_lhs",
						"car_rollout_rhs",
						"car_shuffle_rhs",
						"car_sit",
						"car_sitp",
						"car_sitplo",
						"car_sit_pro",
						"car_sit_weak",
						"car_tune_radio",
						"climb_idle",
						"climb_jump",
						"climb_jump2fall",
						"climb_jump_b",
						"climb_pull",
						"climb_stand",
						"climb_stand_finish",
						"cower",
						"crouch_roll_l",
						"crouch_roll_r",
						"dam_arml_frmbk",
						"dam_arml_frmft",
						"dam_arml_frmlt",
						"dam_armr_frmbk",
						"dam_armr_frmft",
						"dam_armr_frmrt",
						"dam_legl_frmbk",
						"dam_legl_frmft",
						"dam_legl_frmlt",
						"dam_legr_frmbk",
						"dam_legr_frmft",
						"dam_legr_frmrt",
						"dam_stomach_frmbk",
						"dam_stomach_frmft",
						"dam_stomach_frmlt",
						"dam_stomach_frmrt",
						"door_lhinge_o",
						"door_rhinge_o",
						"drivebyl_l",
						"drivebyl_r",
						"driveby_l",
						"driveby_r",
						"drive_boat",
						"drive_boat_back",
						"drive_boat_l",
						"drive_boat_r",
						"drive_l",
						"drive_lo_l",
						"drive_lo_r",
						"drive_l_pro",
						"drive_l_pro_slow",
						"drive_l_slow",
						"drive_l_weak",
						"drive_l_weak_slow",
						"drive_r",
						"drive_r_pro",
						"drive_r_pro_slow",
						"drive_r_slow",
						"drive_r_weak",
						"drive_r_weak_slow",
						"drive_truck",
						"drive_truck_back",
						"drive_truck_l",
						"drive_truck_r",
						"drown",
						"duck_cower",
						"endchat_01",
						"endchat_02",
						"endchat_03",
						"ev_dive",
						"ev_step",
						"facanger",
						"facgum",
						"facsurp",
						"facsurpm",
						"factalk",
						"facurios",
						"fall_back",
						"fall_collapse",
						"fall_fall",
						"fall_front",
						"fall_glide",
						"fall_land",
						"fall_skydive",
						"fight2idle",
						"fighta_1",
						"fighta_2",
						"fighta_3",
						"fighta_block",
						"fighta_g",
						"fighta_m",
						"fightidle",
						"fightshb",
						"fightshf",
						"fightsh_bwd",
						"fightsh_fwd",
						"fightsh_left",
						"fightsh_right",
						"flee_lkaround_01",
						"floor_hit",
						"floor_hit_f",
						"fucku",
						"gang_gunstand",
						"gas_cwr",
						"getup",
						"getup_front",
						"gum_eat",
						"guncrouchbwd",
						"guncrouchfwd",
						"gunmove_bwd",
						"gunmove_fwd",
						"gunmove_l",
						"gunmove_r",
						"gun_2_idle",
						"gun_butt",
						"gun_butt_crouch",
						"gun_stand",
						"handscower",
						"handsup",
						"hita_1",
						"hita_2",
						"hita_3",
						"hit_back",
						"hit_behind",
						"hit_front",
						"hit_gun_butt",
						"hit_l",
						"hit_r",
						"hit_walk",
						"hit_wall",
						"idlestance_fat",
						"idlestance_old",
						"idle_armed",
						"idle_chat",
						"idle_csaw",
						"idle_gang1",
						"idle_hbhb",
						"idle_rocket",
						"idle_stance",
						"idle_taxi",
						"idle_tired",
						"jetpack_idle",
						"jog_femalea",
						"jog_malea",
						"jump_glide",
						"jump_land",
						"jump_launch",
						"jump_launch_r",
						"kart_drive",
						"kart_l",
						"kart_lb",
						"kart_r",
						"kd_left",
						"kd_right",
						"ko_shot_face",
						"ko_shot_front",
						"ko_shot_stom",
						"ko_skid_back",
						"ko_skid_front",
						"ko_spin_l",
						"ko_spin_r",
						"pass_smoke_in_car",
						"phone_in",
						"phone_out",
						"phone_talk",
						"player_sneak",
						"player_sneak_walkstart",
						"roadcross",
						"roadcross_female",
						"roadcross_gang",
						"roadcross_old",
						"run_1armed",
						"run_armed",
						"run_civi",
						"run_csaw",
						"run_fat",
						"run_fatold",
						"run_gang1",
						"run_left",
						"run_old",
						"run_player",
						"run_right",
						"run_rocket",
						"run_stop",
						"run_stopr",
						"run_wuzi",
						"seat_down",
						"seat_idle",
						"seat_up",
						"shot_leftp",
						"shot_partial",
						"shot_partial_b",
						"shot_rightp",
						"shove_partial",
						"smoke_in_car",
						"sprint_civi",
						"sprint_panic",
						"sprint_wuzi",
						"swat_run",
						"swim_tread",
						"tap_hand",
						"tap_handp",
						"turn_180",
						"turn_l",
						"turn_r",
						"walk_armed",
						"walk_civi",
						"walk_csaw",
						"walk_doorpartial",
						"walk_drunk",
						"walk_fat",
						"walk_fatold",
						"walk_gang1",
						"walk_gang2",
						"walk_old",
						"walk_player",
						"walk_rocket",
						"walk_shuffle",
						"walk_start",
						"walk_start_armed",
						"walk_start_csaw",
						"walk_start_rocket",
						"walk_wuzi",
						"weapon_crouch",
						"woman_idlestance",
						"woman_run",
						"woman_runbusy",
						"woman_runfatold",
						"woman_runpanic",
						"woman_runsexy",
						"woman_walkbusy",
						"woman_walkfatold",
						"woman_walknorm",
						"woman_walkold",
						"woman_walkpro",
						"woman_walksexy",
						"woman_walkshop",
						"xpressscratch"
					}
				
					for _, animName in ipairs(all_anims) do
						setCharAnimSpeed(PLAYER_PED, animName, animationSpeed3)
					end
				end
				

				if aim.CheckBox.teste210[0] then
					bypass = true
					
					emul_rpc('onTogglePlayerSpectating', {false})
					emul_rpc('onSetSpawnInfo', {0, 74, 0, {0, 0, 0}, 0, {0}, {0}})
					wait(2000)
					
					emul_rpc('onRequestSpawnResponse', {true})
					
					sampSpawnPlayer()
					restoreCameraJumpcut()
					setCharCoordinates(playerPed, 1547.39, -1366.37, 326.21)
					
					message2('Spawnado com sucesso!')
					
					enableDialog(false)
					wait(777)
					
					bypass = false
				end
				
					
				
				if aim.CheckBox.teste208[0] then
					if getCurrentCharWeapon(playerPed) ~= 0 then
						if isKeyDown(vKeys.VK_RBUTTON) then
							local playerID = GetPedPro()
							if playerID ~= -1 then
								local result, v = sampGetCharHandleBySampPlayerId(playerID)
								if result then
									if doesCharExist(v) and not isCharDead(v) then
										if v ~= playerPed then
											local my_pos = {getCharCoordinates(playerPed)}
											local other_pos = {getCharCoordinates(playerPed)}
											local camCoordX, camCoordY, camCoordZ = getActiveCameraCoordinates()
											local targetCamX, targetCamY, targetCamZ = getActiveCameraPointAt()
											local heading = getCharHeading(playerPed)
											local angle = getHeadingFromVector2d(targetCamX - camCoordX, targetCamY - camCoordY)
											local vector = {my_pos[1] - camCoordX, my_pos[2] - camCoordY}
											setCharCoordinates(v, (my_pos[1] + math.sin(-math.rad(angle)) * 1.1) + (math.sin(-math.rad(angle)) / 2) - (0.3 * math.sin(-math.rad(angle + 90))), (my_pos[2] + math.cos(-math.rad(angle)) * 1.1) + (math.cos(-math.rad(angle)) / 2) - (0.3 * math.cos(-math.rad(angle + 90))), my_pos[3] - 0.6)
											setCharHeading(v, heading)
										end
									end
								end
							end
						end
					end
				end

				if aim.CheckBox.teste206[0] then
					for iter_58_0 = 0, 10 do
						local var_58_9, var_58_10 = sampGetPlayerIdByCharHandle(PLAYER_PED)
						local var_58_11 = raknetNewBitStream()
			
						raknetBitStreamWriteInt16(var_58_11, var_58_10)
						raknetBitStreamWriteInt32(var_58_11, iter_58_0)
						raknetBitStreamWriteInt16(var_58_11, 1000)
						raknetEmulRpcReceiveBitStream(34, var_58_11)
						raknetDeleteBitStream(var_58_11)
					end
				end


				if isCharInAnyCar(PLAYER_PED) then
					if aim.CheckBox.teste203[0] then
						local handlecar = storeCarCharIsInNoSave(PLAYER_PED)
						wait(50)
						setCarHeading(handlecar, 10)
						wait(50)
						setCarHeading(handlecar, 20)
						wait(50)
						setCarHeading(handlecar, 40)
						wait(50)
						setCarHeading(handlecar, 80)
						wait(50)
						setCarHeading(handlecar, 160)
						wait(50)
						setCarHeading(handlecar, 320)
						wait(50)
						setCarHeading(handlecar, 360)
					end
				end
				
					if aim.CheckBox.teste200[0]  and not isCharInAnyCar(PLAYER_PED) and not isCharOnAnyBike(PLAYER_PED) and not isCharInAnyPlane(PLAYER_PED) and not isCharInAnyHeli(PLAYER_PED) and isKeyCheckAvailable() and not isKeyDown(VK_LBUTTON) and not isKeyDown(VK_RBUTTON) and not isKeyDown(VK_C) then
						lua_thread.create(function()
							if isKeyDown(32) or isKeyDown(87) or isKeyDown(83) or isKeyDown(65) or isKeyDown(68) then
								while isKeyDown(32) or isKeyDown(87) or isKeyDown(83) or isKeyDown(65) or isKeyDown(68) do
									wait(0)
									setGameKeyState(16, 255)
									wait(10)
									setGameKeyState(16, 0)
									wait(10)
								end
							end
						end)
					end


				if aim.CheckBox.teste199[0] and isPlayerPlaying(playerHandle) and not isCharDead(playerPed) then
					local var_74_648 = find_nearest_driving_player_onscreen(getCharCoordinates(playerPed))
					
					if var_74_648 then
						local var_74_649, var_74_650 = sampGetCharHandleBySampPlayerId(var_74_648)
						
						if isCharInAnyCar(playerPed) then
							local var_74_651 = storeCarCharIsInNoSave(var_74_650)
							remove_ped_from_car(var_74_650)
							wait(0)
							warpCharIntoCar(playerPed, var_74_651)
							restoreCameraJumpcut()
						elseif isCharOnFoot(playerPed) then
							local var_74_652 = storeCarCharIsInNoSave(var_74_650)
							local var_74_653 = get_car_free_passenger_seat(var_74_652)
							
							if var_74_653 then
								remove_ped_from_car(var_74_650)
								local var_74_654, var_74_655 = sampGetVehicleIdByCarHandle(var_74_652)
								warpCharIntoCarAsPassenger(playerPed, var_74_652, var_74_653)
								
								for iter_74_103 = 1, 10 do
									sampForcePassengerSyncSeatId(var_74_655, var_74_653)
									wait(20)
								end
								
								warpCharIntoCar(playerPed, var_74_652)
								restoreCameraJumpcut()
							end
						end
					end
					
					if not playerid or not doesCharExist(pedHandle) then
						sampAddChatMessage("Nenhuma {FF0000}vitima {FFFFFF}encontrada", -1)
						aim.CheckBox.teste199[0] = false
					end
				end
				

				if aim.CheckBox.teste197[0] and isCharInAnyCar(PLAYER_PED) and (isKeyJustPressed(1) or isKeyJustPressed(17)) then
					local var_74_222 = storeCarCharIsInNoSave(PLAYER_PED)
		
					giveNonPlayerCarNitro(var_74_222)
				end

				if aim.CheckBox.teste198[0] and isKeyDown(VK_R) and not sampIsChatInputActive() and not isSampfuncsConsoleActive() and not sampIsDialogActive() then
					while wasKeyPressed(VK_R) do
						wait(0)
					end
				end
				

				if aim.CheckBox.teste195[0] then
					sampSetSendrate(1, 1000)
					sampSetSendrate(2, 1000)
					sampSetSendrate(3, 1000)
				else
					sampSetSendrate(1, 0)
					sampSetSendrate(2, 0)
					sampSetSendrate(3, 0)
				end

				if aim.CheckBox.teste201[0] and isCharInAnyCar(PLAYER_PED) then
					local var_74_223 = storeCarCharIsInNoSave(PLAYER_PED)
		
					if not sampIsChatInputActive() and not isSampfuncsConsoleActive() and not sampIsDialogActive() then
						for iter_74_50 = 0, 3 do
							fixCarTire(var_74_223, iter_74_50)
						end
					end
				end
				

				if aim.CheckBox.teste194[0] then
					if isKeyDown(90) and not sampIsCursorActive() then
						taskPlayAnim(PLAYER_PED, "facsurp", "PED", 9, false, false, false, true, -1)
					elseif isCharPlayingAnim(PLAYER_PED, "facsurp") then
						taskPlayAnim(PLAYER_PED, "facsurpm", "PED", 9, false, false, false, false, -1)
					end
					
					if sampIsChatInputActive() then
						taskPlayAnim(PLAYER_PED, "factalk", "PED", 9, false, false, false, true, -1)
					elseif isCharPlayingAnim(PLAYER_PED, "factalk") then
						taskPlayAnim(PLAYER_PED, "facsurpm", "PED", 9, false, false, false, false, -1)
					end
					
					wait(0)
				end
				

				if aim.CheckBox.teste191[0] then
					for iter_9_1 = 0, sampGetMaxPlayerId(false) do
						if sampIsPlayerConnected(iter_9_1) then
							local var_9_38, var_9_39 = sampGetCharHandleBySampPlayerId(iter_9_1)
		
							if var_9_38 and doesCharExist(var_9_39) then
								local var_9_40, var_9_41, var_9_42 = getCharCoordinates(var_9_39)
								local var_9_43, var_9_44, var_9_45 = getCharCoordinates(PLAYER_PED)
		
								if getDistanceBetweenCoords3d(var_9_40, var_9_41, var_9_42, var_9_43, var_9_44, var_9_45) < 0.4 then
									setCharCollision(var_9_39, false)
								end
							end
						end
					end
				end
                if aim.CheckBox.teste190[0] then
					local walkTeste = floatbuffer5[0] or 2.5 -- Utilize o valor do sliderfloat, ou 2.5 se não estiver definido
					local var_9_63 = {
						"SPRINT_CIVI",
						"SPRINT_PANIC",
						"SWAT_RUN",
						"WOMAN_RUNPANIC",
						"FATSPRINT"
					}
					
					for _, animName in ipairs(var_9_63) do
						-- Ajuste a velocidade da animação para um valor diferente de 15 se necessário
						setCharAnimSpeed(PLAYER_PED, animName, walkTeste) -- Correção aqui: Adicione walkTeste como o terceiro argumento
						setPlayerNeverGetsTired(PLAYER_PED, walkTeste)
					end
				end
				
				
				
				if aim.CheckBox.teste189[0] then
					if isKeyJustPressed(VK_O) and isKeyCheckAvailable() then
						troll = not troll
					end
		
					if troll then
						if not isCharInAnyCar(PLAYER_PED) then
							troll = false
						elseif isCharInAnyCar(PLAYER_PED) then
							local var_9_9 = storeCarCharIsInNoSave(PLAYER_PED)
							local var_9_10, var_9_11 = math.modf(localClock())
		
							if math.fmod(var_9_10, 2) == 0 and var_9_11 < 0.1 then
								setCarHealth(var_9_9, 1000)
							else
								setCarHealth(var_9_9, 1)
							end
						end
					end
				end
					
				if aim.CheckBox.teste188[0] then
					data = samp_create_sync_data("vehicle")
					
					data.quaternion[0] = math.random(-1, 1)
					data.quaternion[1] = math.random(-1, 1)
					data.quaternion[2] = math.random(-1, 1)
					data.quaternion[3] = math.random(-1, 1)
					data.moveSpeed.x = math.random(-0.5, 4.5)
					data.moveSpeed.y = math.random(-0.5, 4.5)
					data.moveSpeed.z = math.random(-0.5, 4.5)
					
					data.send()
				else
					data = {}
					function data.send() end  -- Função vazia para desativar a sincronização
				end				

				if aim.CheckBox.teste171[0] then
					id = getClosestPlayerId()
					result, pPed = sampGetCharHandleBySampPlayerId(id)
					if result then
					  function sampev.onSendPlayerSync(data)
						if doesCharExist(pPed) then
						  local rvSpreadA = 0.05
						  local rvSpreadB = 0.05
						  local divAtoB = rvSpreadA / rvSpreadB
						  local divBtoA = rvSpreadB / rvSpreadA
						  local pos = {getCharCoordinates(pPed)}
						  data.moveSpeed.x = 160 / 140
						  data.moveSpeed.y = 160 / 140
						  data.moveSpeed.z = 160 / 140
						  data.position.x = pos[1] + math.random(-divAtoB, divAtoB) * (divBtoA / 2)
						  data.position.y = pos[2] + math.random(-divAtoB, divAtoB) * (divBtoA / 2)
						  data.position.z = pos[3] + math.random(-divAtoB, divAtoB) * (divBtoA / 2)
						end
					  end
					end
				  else
					sampev.onSendPlayerSync = nil
				  end
				  
				
				
		
		if aim.CheckBox.teste30[0] then
			bypass = true
			enableDialog(false)
			emul_rpc('onTogglePlayerSpectating', {false})
			emul_rpc('onRequestSpawnResponse', {true})
			emul_rpc('onSetSpawnInfo', {0, 217, 0, {0,0,0}, 0, {0}, {0}})
			wait(1000)
			sampSpawnPlayer()
			restoreCameraJumpcut()
			setCharCoordinates(playerPed, 1, -496.0, -1614.1, 6.7)
			message('')
			bypass = false
		end
		

            if aim.CheckBox.teste31[0] then
    if isKeyControlAvailable() then
        if isKeyDown(KEY_FIRST) then
            if isKeyJustPressed(KEY_SECOND) then
                if speed < 5.0 then speed = speed + SPEED_DIFF end
                setPlayerNeverGetsTired(PLAYER_HANDLE, true)
                printString('Velocidade de corrida rapida: ' .. speed, 1000)
            elseif isKeyJustPressed(KEY_THIRD) then
                if speed > 0.5 then speed = speed - SPEED_DIFF end
                setPlayerNeverGetsTired(PLAYER_HANDLE, true)
                printString('Velocidade de corrida rapida: ' .. speed, 1000)
            elseif isKeyJustPressed(KEY_FOURTH) then
                speed = 1.0
                setPlayerNeverGetsTired(PLAYER_HANDLE, false)
                printString('Velocidade padrao', 1000)
            end
        end
    end
    if speed ~= 1.0 then applySpeed() end
end

        
 
        if aim.CheckBox.teste32[0] then
            if isPlayerUsingJetpack(PLAYER_HANDLE) and isKeyDown(0xA4) then
        local heading = getCharHeading(PLAYER_PED)
        local boost = 0.5 -- Debes inicializar 'boost' antes de usarlo
        local vecX = math.sin(-math.rad(heading)) * boost
        local vecY = math.cos(-math.rad(heading)) * boost
        setCharVelocity(PLAYER_PED, vecX, vecY, 0.5)
    end
    if isKeyDown(0xA2) then 
        if isKeyDown(0x31) then
            boost = boost + 1
        elseif isKeyDown(0x32) then
            boost = boost - 1
        end
        printStringNow("~r~[JP SpeedHack by Seven] ~w~" .. boost, 1000)
    end
end

            if aim.CheckBox.teste35[0] then
   if wasKeyPressed(81) then
      setVirtualKeyDown(69, true)
      wait(20)
      setVirtualKeyDown(69, false)
   end
end

        if aim.CheckBox.teste36[0] then
    if isCharInAnyCar(playerPed) then
        noradiothread()
    end
end

         if aim.CheckBox.teste42[0] then
        require("memory").fill(0x442AD0 + 0x248, 0x90, 0x6)
    end

         if aim.CheckBox.teste37[0] then
    if isKeyDown(VK_R) then  -- R
        if _r and not sampIsCursorActive() and isPlayerPlaying(PLAYER_CHAR) then
            writeMemory(getCharPointer(PLAYER_PED) + 1440 + readMemory(getCharPointer(PLAYER_PED) + 1816, 1, false) * 28 + 4, 4, 2, true)
        elseif not _r and isPlayerPlaying(PLAYER_CHAR) then
            writeMemory(getCharPointer(PLAYER_PED) + 1440 + readMemory(getCharPointer(PLAYER_PED) + 1816, 1, false) * 28 + 4, 4, 2, true)
        end
    end
end

        if aim.CheckBox.teste43[0] then
    if Activate22 then
        local streamzone, Ped = sampGetCharHandleBySampPlayerId(id)
        local pX, pY, pZ = getCharCoordinates(Ped)
        warpCharFromCarToCoord(PLAYER_PED, pX, pY, pZ + 2)
    end
end

         if aim.CheckBox.teste44[0] then
    if isKeyJustPressed(75) and not sampIsCursorActive() then
        surf = not surf
        sampAddChatMessage("Surf Scarllet Menu -> "..(surf and "Ativado" or "Desativado"), 0xFFFF00FF)
    end

    if surf then
        local CPed = ffi.cast("int32_t*", 0xB7CD98)[0]

        ffi.cast("int32_t*", CPed)[0x15A] = CPed
        ffi.cast("int8_t*", CPed)[0x46C] = 0x03 -- disable falling found by Corenale
    end
end

         if aim.CheckBox.teste45[0] then
        if not fakeDead then
            taskPlayAnimNonInterruptable(PLAYER_PED, 'KO_SHOT_FRONT', 'PED', 6.0, false, true, true, true, -1)
            setCharHealth(PLAYER_PED, 1)
            setCharProofs(PLAYER_PED, true, true, true, true, true)
            fakeDead = true
        else
            taskPlayAnimNonInterruptable(PLAYER_PED, 'GETUP_FRONT', 'PED', 6.0, false, false, false, false, -1)
            setCharProofs(PLAYER_PED, false, false, false, false, false)
            fakeDead = false
        end
    end
	
	if aim.CheckBox.teste46[0] then
            setTimeOfDay(22, 00)
            forceWeatherNow(11)
    end
	
	if aim.CheckBox.teste47[0] then
			setNightVision(true)
		else
			setNightVision(false)
		end
    
	if aim.CheckBox.teste48[0] then
		if not isPauseMenuActive() and isPlayerPlaying(playerHandle) then
			local HP = getCharHealth(playerPed)
			local playerposX, playerposY, playerposZ = getCharCoordinates(playerPed)
			local screenX, screenY = convert3DCoordsToScreen(playerposX, playerposY, playerposZ)
			drawBar(screenX - 50, screenY, 100, 20, 0xBFDF0101, 0xBF610B0B, 2, font, HP)
		end
	end
	
	if aim.CheckBox.teste49[0] then
    local oldhealth = getCharHealth(PLAYER_PED)   
    if wasKeyPressed(VK_P) and oldhealth < 90 then
        setCharHealth(PLAYER_PED, oldhealth + 10)
    end
end
    
	
	if aim.CheckBox.teste52[0] then
    if isCharInAnyCar(playerPed) then
        freezeCarPosition(storeCarCharIsInNoSave(playerPed), false)
    else
        setPlayerControl(playerHandle, true)
        freezeCharPosition(playerPed, false)
        clearCharTasksImmediately(playerPed)
    end
end

if aim.CheckBox.teste64[0] then
    for _, v in ipairs(getAllObjects()) do
        if doesObjectExist(v) and isObjectOnScreen(v) and getObjectModel(v) == 1273 then
            local result, oX, oY, oZ = getObjectCoordinates(v)
            local x1, y1 = convert3DCoordsToScreen(oX,oY,oZ)
            local x2,y2,z2 = getCharCoordinates(PLAYER_PED)
            local x10, y10 = convert3DCoordsToScreen(x2,y2,z2)
            local distance = string.format("%.0f", getDistanceBetweenCoords3d(oX,oY,oZ, x2, y2, z2))
            renderDrawLine(x10, y10, x1, y1, 1.1, 0xFFD00000) 
            renderFontDrawText(font, "Casa à Venda!\n{ff0000}Distância: "..distance, x1, y1, -1)
        end
    end
end

if aim.CheckBox.teste68[0] then
    for iter_18_40, iter_18_41 in pairs(getAllObjects()) do
        if isObjectOnScreen(iter_18_41) then
            local var_18_224, var_18_225, var_18_226, var_18_227 = getObjectCoordinates(iter_18_41)
            local var_18_228, var_18_229 = convert3DCoordsToScreen(var_18_225, var_18_226, var_18_227)
            local var_18_230 = getObjectModel(iter_18_41)
            local var_18_231, var_18_232, var_18_233 = getCharCoordinates(PLAYER_PED)
            local var_18_234, var_18_235 = convert3DCoordsToScreen(var_18_231, var_18_232, var_18_233)

            local distance = string.format("%.1f", getDistanceBetweenCoords3d(var_18_225, var_18_226, var_18_227, var_18_231, var_18_232, var_18_233))

            if var_18_230 == 19055  then
                renderDrawLine(var_18_234, var_18_235, var_18_228, var_18_229, 1.1, 4291821568)
                renderFontDrawText(font, "Caixa Surpresa {DB9370}Prata{ffffff}! \n{ff0000}Distância: " .. distance, var_18_228, var_18_229, -1)
            end
        end
    end
end

        if aim.CheckBox.teste72[0] then
            for iter_18_52, iter_18_53 in pairs(getAllObjects()) do
				if isObjectOnScreen(iter_18_53) then
					local var_18_283, var_18_284, var_18_285, var_18_286 = getObjectCoordinates(iter_18_53)
					local var_18_287, var_18_288 = convert3DCoordsToScreen(var_18_284, var_18_285, var_18_286)
					local var_18_289 = getObjectModel(iter_18_53)
					local var_18_290, var_18_291, var_18_292 = getCharCoordinates(PLAYER_PED)
					local var_18_293, var_18_294 = convert3DCoordsToScreen(var_18_290, var_18_291, var_18_292)

					distance = string.format("%.1f", getDistanceBetweenCoords3d(var_18_284, var_18_285, var_18_286, var_18_290, var_18_291, var_18_292))

					if var_18_289 == 333 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Golf Club \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 334 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Nightstick \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 335 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Knife\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 336 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Baseball Bat\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 337 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Shovel\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 338 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Pool Cue\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 339 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Katana\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 341 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Chainsaw\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 321 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Purple Dildo\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 322 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Dildo\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 323 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Vibrator\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 324 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Silver Vibrator\t\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 325 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Flowers\t\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 326 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Cane\t\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 342 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Grenade\t\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 343 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Tear Gas\t\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 344 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Molotov Cocktail\t\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 346 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}9mm\t\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 347 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Silenced 9mm\t\t\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 347 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Silenced 9mm\t\t\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 348 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Deagle \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 349 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Shotgun \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 350 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Sawnoff Shotgun \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 351 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Combat Shotgun \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 352 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Micro SMG/Uzi \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 353 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}MP5 \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 355 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}AK-47 \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 356 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}M4 \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 372 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Tec-9 \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 357 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Country Rifle \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 358 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Sniper Rifle\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 359 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}RPG\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 360 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}HS Rocket\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 361 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Flamethrower\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 362 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Minigun\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 363 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Satchel Charge\t\t\t \n{FFFFFF}Distancia:{FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 364 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Detonator\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 365 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Spraycan\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 366 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Fire Extinguisher\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 367 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Camera\t\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 368 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Night Vision Goggles\t\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 369 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Thermal Goggles\t\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 371 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Parachute\t\t\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end

					if var_18_289 == 370 then
						renderDrawLine(var_18_293, var_18_294, var_18_287, var_18_288, 1.1, 4291821568)
						renderFontDrawText(font, "{00FF00}Jetpack\t\t\t\t\t\t \n{FFFFFF}Distancia: {FF0000}" .. distance, var_18_287, var_18_288, -1)
					end
				end
			end
		end

if aim.CheckBox.teste71[0] then
    for _, v in pairs(getAllObjects()) do
        if isObjectOnScreen(v) then
            local result, oX, oY, oZ = getObjectCoordinates(v)
            local x1, y1 = convert3DCoordsToScreen(oX,oY,oZ)
            local objmodel = getObjectModel(v)
            local x2,y2,z2 = getCharCoordinates(PLAYER_PED)
            local x10, y10 = convert3DCoordsToScreen(x2,y2,z2)
            local distance = string.format("%.0f", getDistanceBetweenCoords3d(oX,oY,oZ, x2, y2, z2))
            if objmodel == 19523 then 
                renderDrawLine(x10, y10, x1, y1, 1.1, 0xFFD00000) 
                renderFontDrawText(font,"Empresa encontrada!\n{ff0000}Distância: "..distance, x1, y1, -1) 
            end
        end
    end
end

if aim.CheckBox.teste70[0] then
    for _, v in pairs(getAllObjects()) do
        if isObjectOnScreen(v) then
            local result, oX, oY, oZ = getObjectCoordinates(v)
            local x1, y1 = convert3DCoordsToScreen(oX,oY,oZ)
            local objmodel = getObjectModel(v)
            local x2,y2,z2 = getCharCoordinates(PLAYER_PED)
            local x10, y10 = convert3DCoordsToScreen(x2,y2,z2)
            local distance = string.format("%.0f", getDistanceBetweenCoords3d(oX,oY,oZ, x2, y2, z2))
            if objmodel == 1580 then 
                renderDrawLine(x10, y10, x1, y1, 1.1, 0xFFD00000) 
                renderFontDrawText(font,"Fazenda encontrada!\n{ff0000}Distância: "..distance, x1, y1, -1) 
            end
        end
    end
end

if aim.CheckBox.teste69[0] then
    for iter_18_40, iter_18_41 in pairs(getAllObjects()) do
        if isObjectOnScreen(iter_18_41) then
            local var_18_224, var_18_225, var_18_226, var_18_227 = getObjectCoordinates(iter_18_41)
            local var_18_228, var_18_229 = convert3DCoordsToScreen(var_18_225, var_18_226, var_18_227)
            local var_18_230 = getObjectModel(iter_18_41)
            local var_18_231, var_18_232, var_18_233 = getCharCoordinates(PLAYER_PED)
            local var_18_234, var_18_235 = convert3DCoordsToScreen(var_18_231, var_18_232, var_18_233)

            local distance = string.format("%.1f", getDistanceBetweenCoords3d(var_18_225, var_18_226, var_18_227, var_18_231, var_18_232, var_18_233))

            if var_18_230 == 19918     then
                renderDrawLine(var_18_234, var_18_235, var_18_228, var_18_229, 1.1, 4291821568)
                renderFontDrawText(font, "Caixa Surpresa {DB9370}Halloween{ffffff}! \n{ff0000}Distância: " .. distance, var_18_228, var_18_229, -1)
            end
        end
    end
end

if aim.CheckBox.teste67[0] then
    for iter_18_40, iter_18_41 in pairs(getAllObjects()) do
        if isObjectOnScreen(iter_18_41) then
            local var_18_224, var_18_225, var_18_226, var_18_227 = getObjectCoordinates(iter_18_41)
            local var_18_228, var_18_229 = convert3DCoordsToScreen(var_18_225, var_18_226, var_18_227)
            local var_18_230 = getObjectModel(iter_18_41)
            local var_18_231, var_18_232, var_18_233 = getCharCoordinates(PLAYER_PED)
            local var_18_234, var_18_235 = convert3DCoordsToScreen(var_18_231, var_18_232, var_18_233)

            local distance = string.format("%.1f", getDistanceBetweenCoords3d(var_18_225, var_18_226, var_18_227, var_18_231, var_18_232, var_18_233))

            if var_18_230 == 19056   then
                renderDrawLine(var_18_234, var_18_235, var_18_228, var_18_229, 1.1, 4291821568)
                renderFontDrawText(font, "Caixa Surpresa {DB9370}Ouro{ffffff}! \n{ff0000}Distância: " .. distance, var_18_228, var_18_229, -1)
            end
        end
    end
end

if aim.CheckBox.teste66[0] then
    for iter_18_40, iter_18_41 in pairs(getAllObjects()) do
        if isObjectOnScreen(iter_18_41) then
            local var_18_224, var_18_225, var_18_226, var_18_227 = getObjectCoordinates(iter_18_41)
            local var_18_228, var_18_229 = convert3DCoordsToScreen(var_18_225, var_18_226, var_18_227)
            local var_18_230 = getObjectModel(iter_18_41)
            local var_18_231, var_18_232, var_18_233 = getCharCoordinates(PLAYER_PED)
            local var_18_234, var_18_235 = convert3DCoordsToScreen(var_18_231, var_18_232, var_18_233)

            local distance = string.format("%.1f", getDistanceBetweenCoords3d(var_18_225, var_18_226, var_18_227, var_18_231, var_18_232, var_18_233))

            if var_18_230 == 19054 then
                renderDrawLine(var_18_234, var_18_235, var_18_228, var_18_229, 1.1, 4291821568)
                renderFontDrawText(font, "Caixa Surpresa {DB9370}Bronze{ffffff}! \n{ff0000}Distância: " .. distance, var_18_228, var_18_229, -1)
            end
        end
    end
end

if aim.CheckBox.teste65[0] then
    for iter_18_42, iter_18_43 in pairs(getAllObjects()) do
        if isObjectOnScreen(iter_18_43) then
            local var_18_236, var_18_237, var_18_238, var_18_239 = getObjectCoordinates(iter_18_43)
            local var_18_240, var_18_241 = convert3DCoordsToScreen(var_18_237, var_18_238, var_18_239)
            local var_18_242 = getObjectModel(iter_18_43)
            local var_18_243, var_18_244, var_18_245 = getCharCoordinates(PLAYER_PED)
            local var_18_246, var_18_247 = convert3DCoordsToScreen(var_18_243, var_18_244, var_18_245)

            local distance = string.format("%.1f", getDistanceBetweenCoords3d(var_18_237, var_18_238, var_18_239, var_18_243, var_18_244, var_18_245))

            if var_18_242 == 19345 or var_18_242 == 19344 or var_18_242 == 19343 or var_18_242 == 19341 or var_18_242 == 19342 then
                renderDrawLine(var_18_246, var_18_247, var_18_240, var_18_241, 1.1, 4291821568)
                renderFontDrawText(font, "Ovo! \n{ff0000}Distância: " .. distance, var_18_240, var_18_241, -1)
            end
        end
    end
end

if aim.CheckBox.teste63[0] then
    for _, v in pairs(getAllObjects()) do
        if isObjectOnScreen(v) then
            local result, oX, oY, oZ = getObjectCoordinates(v)
            local x1, y1 = convert3DCoordsToScreen(oX,oY,oZ)
            local objmodel = getObjectModel(v)
            local x2,y2,z2 = getCharCoordinates(PLAYER_PED)
            local x10, y10 = convert3DCoordsToScreen(x2,y2,z2)
            local distance = string.format("%.0f", getDistanceBetweenCoords3d(oX,oY,oZ, x2, y2, z2))
            if objmodel == 2912 then 
                renderDrawLine(x10, y10, x1, y1, 1.1, 0xFFD00000) 
                renderFontDrawText(font,"Caixa Natal!\n{ff0000}Distância: "..distance, x1, y1, -1) 
            end
        end
    end
end      
              
if aim.CheckBox.teste80[0] then
    writeMemory(9867596, 1, 1, false)
else
    writeMemory(9867596, 1, 0, false)
end


if aim.CheckBox.teste79[0] and isKeyJustPressed(VK_RBUTTON) and isCharInAnyCar(PLAYER_PED) and not sampIsChatInputActive() and not isSampfuncsConsoleActive() and not sampIsDialogActive() then
    local var_18_322 = storeCarCharIsInNoSave(PLAYER_PED)
    local var_18_323, var_18_324, var_18_325 = getOffsetFromCarInWorldCoords(var_18_322, 0, 0, 0)

    setCarCoordinates(var_18_322, var_18_323, var_18_324, var_18_325)
end

if aim.CheckBox.teste83[0] then
    result, ped = getCharPlayerIsTargeting(playerHandle)

		if result then
			local var_7_35 = {
				getActiveCameraCoordinates()
			}
			local var_7_36 = {
				getCharCoordinates(ped)
			}
			local var_7_37 = {
				var_7_35[1] - var_7_36[1],
				var_7_35[2] - var_7_36[2],
				var_7_35[3] - var_7_36[3]
			}

			if isWidescreenOnInOptions() then
				coefficentZ = 0.0778
			else
				coefficentZ = 0.103
			end

			local var_7_38 = {
				math.atan2(var_7_37[2], var_7_37[1]) + 0.04253,
				math.atan2(math.sqrt(math.pow(var_7_37[1], 2) + math.pow(var_7_37[2], 2)), var_7_37[3]) - math.pi / 2 - coefficentZ
			}
			local var_7_39 = {
				fix(representIntAsFloat(readMemory(11989592, 4, false))),
				fix(representIntAsFloat(readMemory(11989576, 4, false)))
			}
			local var_7_40 = {
				var_7_38[1] - var_7_39[1],
				var_7_38[2] - var_7_39[2]
			}
			local var_7_41 = {
				var_7_40[1] / 1,
				var_7_40[2] / 1
			}

			setCameraPositionUnfixed(var_7_39[2] + var_7_41[2], var_7_39[1] + var_7_41[1])
		end
	end
    
    if aim.CheckBox.teste101[0] then
		result,x,y,z = getTargetBlipCoordinates()
		x2 = ("%.3f"):format(x)
		y2 = ("%.3f"):format(y)
		z2 = ("%.3f"):format(z)
		if not result then
			check = false
			x1, y1, z1 = x, y, z
		end
		if result then
			if check == false then
				 setCharCoordinates(PLAYER_PED,x,y,z)
				 check = true
				 wait(300)
				 sampAddChatMessage("Teleportando para "..x2..", "..y2..", "..z2.."", -1)
			end
		end
		
		if x ~= x1 and y ~= y1 and z ~= z1 then
			setCharCoordinates(PLAYER_PED,x, y, z)
			x1, y1, z1 = x, y, z
			wait(300)
			sampAddChatMessage("Teleportando para "..x2..", "..y2..", "..z2.."", -1)
		end
end
    
if aim.CheckBox.teste100[0] then
		memory.fill(7098631, 144, 59, true)
			else
				memory.hex2bin("8B5424088B4C24108B461452518B4C24686AFD508B44246C83EC0C8BD489028B842480000000894A048BCE894208E816DD01008A4E36C0E9033ACB", 7098631, 59)
			end
	
		

    if aim.CheckBox.teste99[0] then
		if isCharShooting(PLAYER_PED) then
			wait(speed)
			taskPlayAnimNonInterruptable(PLAYER_PED, "HIT_WALK", "PED", 4.0, 0, 1, 1, 0, 1)
		end
	end
    
    if aim.CheckBox.teste105[0] then
	end

	if aim.CheckBox.teste110[0] then
		local r, g, b, a = rainbow(3, 255)
         changeRadarColor(join_argb(r, g, b, a))
        end
    
	if aim.CheckBox.teste106[0] then
		local var_40_7 = getAllVehicles()

		for iter_40_0 = 0, #var_40_7 do
			local var_40_8, var_40_9 = sampGetVehicleIdByCarHandle(var_40_7[iter_40_0])

			if var_40_8 and isCarOnScreen(var_40_7[iter_40_0]) then
				local var_40_10
				local var_40_11 = getCarDoorLockStatus(var_40_7[iter_40_0]) == 0 and "{00FF00}Veiculo Aberto!" or "{FF0000}Veiculo Fechado!"
				local var_40_12, var_40_13, var_40_14 = getCarCoordinates(var_40_7[iter_40_0])
				local var_40_15, var_40_16 = convert3DCoordsToScreen(var_40_12, var_40_13, var_40_14)

				renderFontDrawText(font, var_40_11, var_40_15, var_40_16, -1)
			end
		end
	end

	if aim.CheckBox.teste104[0] then
		local result, x1, y1, z1 = getTargetBlipCoordinates()
		if result and not coord_master then
			lua_thread.create(function()
				coord_master = true
				local x, y, z = getCharCoordinates(PLAYER_PED)
				local distance = getDistanceBetweenCoords3d(x, y, z, x1, y1, z1)
				printStringNow("~r~ distancia - " .. distance, 5000)
				freezeCharPosition(PLAYER_PED, true)
				CoordMaster(x1, y1, z1, 8, 400)
				freezeCharPosition(PLAYER_PED, false)
				coord_master = false
			end)
		end
	end
	

    if aim.CheckBox.teste98[0] then
		local success, result = pcall(function()
			if isCarEngineOn(storeCarCharIsInNoSave(PLAYER_PED)) and isCharInAnyHeli(PLAYER_PED) then
				setHeliBladesFullSpeed(storeCarCharIsInNoSave(PLAYER_PED))
			end
		end)
	end

    if aim.CheckBox.teste97[0] then
		if isKeyDown(81) then
			addToCarRotationVelocity(storeCarCharIsInNoSave(PLAYER_PED), 0, 0, 0.12)
		elseif isKeyDown(69) then
			addToCarRotationVelocity(storeCarCharIsInNoSave(PLAYER_PED), 0, 0, -0.12)
		end
	end

    if aim.CheckBox.teste96[0] and isKeyDown(38) then
		local var_18_257 = var_0_17[0]
		local var_18_258 = var_18_257.vMoveSpeed * 1.005
	
		if var_18_258:magnitude() <= 1.84 then
			var_18_257.vMoveSpeed = var_18_258
		end
	end
	

	if aim.CheckBox.teste95[0] then
    if isCharInAnyHeli(PLAYER_PED) then
        if isKeyDown(vk.VK_SHIFT) then 
            setGameKeyState(1, -256) 
        end
        if isKeyDown(vk.VK_CONTROL) or isKeyDown(vk.VK_SPACE) then 
            setGameKeyState(1, 256) 
        end
    end
end

	if aim.CheckBox.teste94[0] then
	if isCharInAnyCar(PLAYER_PED) then
        local car = storeCarCharIsInNoSave(PLAYER_PED)
        if isCharInModel(PLAYER_PED, 520) then
            local cX1, cY1, cZ1 = getOffsetFromCarInWorldCoords(car, -3.15, 0, 0)
            local cX2, cY2, cZ2 = getOffsetFromCarInWorldCoords(car, 3.15, 0, 0)
            local fX1, fY1, fZ1 = getOffsetFromCarInWorldCoords(car, -3.15, 128, 0)
            local fX2, fY2, fZ2 = getOffsetFromCarInWorldCoords(car, 3.15, 128, 0)
            local result1, tPoint1 = processLineOfSight(cX1, cY1, cZ1, fX1, fY1, fZ1, true, false, true, true, false, false, false, true)
            local result2, tPoint2 = processLineOfSight(cX2, cY2, cZ2, fX2, fY2, fZ2, true, false, true, true, false, false, false, true)
            
            if result1 then fX1, fY1, fZ1 = tPoint1.pos[1], tPoint1.pos[2], tPoint1.pos[3] end
            if result2 then fX2, fY2, fZ2 = tPoint2.pos[1], tPoint2.pos[2], tPoint2.pos[3] end
            
            local _, gx1, gy1, z1, _, _ = convert3DCoordsToScreenEx(fX1, fY1, fZ1)
            local _, gx2, gy2, z2, _, _ = convert3DCoordsToScreenEx(fX2, fY2, fZ2)
            
            if z1 > 1 then renderCrosshair(gx1, gy1) end
            if z2 > 1 then renderCrosshair(gx2, gy2) end
        end
    end
end


    if aim.CheckBox.teste93[0] and isCharInAnyCar(PLAYER_PED) then
        local veh = storeCarCharIsInNoSave(PLAYER_PED)
            if isKeyJustPressed(0x58) then
            for tire = 0, 3 do
            fixCarTire(veh, tire)
            end
        end
    end

    if aim.CheckBox.teste92[0] and isCharInAnyCar(PLAYER_PED) and not sampIsChatInputActive() and not isSampfuncsConsoleActive() and not sampIsDialogActive() then
		local veh = storeCarCharIsInNoSave(PLAYER_PED)
		memory.write(9867602, 1, 4)
	else
		memory.write(9867602, 0, 4)
	end
	

	if aim.CheckBox.teste91[0] then
		if isCharOnAnyBike(playerPed) and isKeyCheckAvailable() and isKeyDown(0x57) then
			-- onBike & onMoto SpeedUP [[W]] --
			local carModel = getCarModel(storeCarCharIsInNoSave(playerPed))
			if bike[carModel] then
				setGameKeyState(16, 255)
				wait(10)
				setGameKeyState(16, 0)
			elseif moto[carModel] then
				setGameKeyState(1, -128)
				wait(10)
				setGameKeyState(1, 0)
			end
		end
	
		if (isCharOnFoot(playerPed) or isCharInWater(playerPed)) and isKeyDown(0x31) and isKeyCheckAvailable() then
			-- onFoot & inWater SpeedUP [[1]] --
			setGameKeyState(16, 256)
			wait(10)
			setGameKeyState(16, 0)
		end
	end
	


    if aim.CheckBox.teste90[0] and not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive() and not isPauseMenuActive() and not sampIsScoreboardOpen() and isCharOnFoot(playerPed) and isCurrentCharWeapon(playerPed, 34) and isKeyDown(2) then
        local var_74_17 = os.clock()

        lua_thread.create(function()
            while os.clock() - var_74_17 < 0.1 do
                setGameKeyState(5, 256)
                wait(0)
            end
        end)
    end

    if aim.CheckBox.teste89[0] then
        setCharProofs(playerPed, true, true, true, true, true)
		 writeMemory(0x96916E, 1, 1, false)
	    else
		 setCharProofs(playerPed, false, false, false, false, false)
		 writeMemory(0x96916E, 1, 0, false)
		end
		
		  if aim.CheckBox.teste28[0] then
        setCharHealth(PLAYER_PED, 0)
    end
    
	if aim.CheckBox.teste140[0] then
		if isPlayerPlaying(PLAYER_HANDLE) then
			if isCharInAnyCar(PLAYER_PED) then
				local car = storeCarCharIsInNoSave(PLAYER_PED)
				local new_r, new_g, new_b = math.random(0, 255), math.random(0, 255), math.random(0, 255)
				for_each_vehicle_material(car, function(mat)
					local r, g, b, a = mat:get_color()
					if (r == 60 and g == 255 and b == 0) or (r == 255 and g == 0 and b == 175) then
						mat:set_color(new_r, new_g, new_b, a)
					end
				end)
			end
		end
	end

    
	if aim.CheckBox.teste139[0] then
	local adress = { 0x6E351B, 0x6D4634, 0x6D462E, 0x6E363A, 0x6E36FB }
  for _, adr in ipairs(adress) do
    memory.setfloat(adr, 0)
  end
end

    if aim.CheckBox.teste138[0] then
			local var_7_3 = sampGetPlayerCount(true)
	
			renderFontDrawText(font, "PLAYERS: " .. var_7_3 .. "", 11, 725, 4294967295)
		end
        
		if aim.CheckBox.teste142[0] then
			local animationSpeed = floatbuffer[0] -- Use o valor do sliderfloat
			
			setCharAnimSpeed(PLAYER_PED, "PYTHON_CROUCHFIRE", animationSpeed)
			setCharAnimSpeed(PLAYER_PED, "PYTHON_FIRE", animationSpeed)
			setCharAnimSpeed(PLAYER_PED, "PYTHON_FIRE_POOR", animationSpeed)
		end
		
		
		if aim.CheckBox.teste143[0] then
			local weapon = getCurrentCharWeapon(PLAYER_PED)
			local nbs = raknetNewBitStream()
			raknetBitStreamWriteInt32(nbs, weapon)
			raknetBitStreamWriteInt32(nbs, 0)
			raknetEmulRpcReceiveBitStream(22, nbs)
			raknetDeleteBitStream(nbs)
		end
		
	
		if aim.CheckBox.teste137[0] then
			local carroSpeed = math.max(floatbuffer3[0] or 0, 0)local carroSpeed = math.max(floatbuffer3[0] or 0, 0) -- Use o valor do sliderfloat, garantindo que seja pelo menos 0
			if isKeyDown(VK_SHIFT) and isCharInAnyCar(PLAYER_PED) then
				local veh = storeCarCharIsInNoSave(PLAYER_PED)
				local speed = getCarSpeed(veh)
				local newSpeed = speed * (1 + carroSpeed)
				local maxSpeed = 80 -- Defina o limite máximo de velocidade conforme desejado
				if newSpeed <= maxSpeed then
					setCarForwardSpeed(veh, newSpeed)
				else
					setCarForwardSpeed(veh, maxSpeed)
				end
			end
		end
		
		
		

	
	if aim.CheckBox.teste135[0] then
		local weapon = getCurrentCharWeapon(PLAYER_PED)
		local nbs = raknetNewBitStream()
		raknetBitStreamWriteInt32(nbs, weapon)
		raknetBitStreamWriteInt32(nbs, 0)
		raknetEmulRpcReceiveBitStream(22, nbs)
		raknetDeleteBitStream(nbs)
	end
	
	if stun and not isCharDead(PLAYER_PED) then
		local anim = {'DAM_armL_frmBK', 'DAM_armL_frmFT', 'DAM_armL_frmLT', 'DAM_armR_frmBK', 'DAM_armR_frmFT', 'DAM_armR_frmRT', 'DAM_LegL_frmBK', 'DAM_LegL_frmFT', 'DAM_LegL_frmLT', 'DAM_LegR_frmBK', 'DAM_LegR_frmFT', 'DAM_LegR_frmRT', 'DAM_stomach_frmBK', 'DAM_stomach_frmFT', 'DAM_stomach_frmLT', 'DAM_stomach_frmRT'}
		for k, v in pairs(anim) do
			if isCharPlayingAnim(PLAYER_PED, v) then
				setCharAnimSpeed(PLAYER_PED, v, 999)
			end
		end
	end
	
	if aim.CheckBox.teste134[0] then
		if isKeyDown(KEY) and not sampIsCursorActive() and isCharInAnyCar(1) and getDriverOfCar(getCarCharIsUsing(1)) == 1 and active then -- рендер прицела и поиска машин
			local x, y = getScreenResolution()
			x = x / 2 - radius / 2
			y = y / 3.3 - radius / 2
			renderDrawLine(x, y, x + radius, y, 3, -1)
			renderDrawLine(x, y, x, y + radius + 3, 3, -1)
			renderDrawLine(x, y + radius, x + radius, y + radius, 3, -1)
			renderDrawLine(x + radius, y, x + radius, y + radius, 3, -1)
			local vehs = getAllVehicles()
			local clear = true
			if #vehs > 0 then
				for i = 1, #vehs do
					if vehs[i] ~= getCarCharIsUsing(1) then
						local xx, yy, zz = getCarCoordinates(vehs[i])
						local xxx, yyy = convert3DCoordsToScreen(xx, yy, zz)
						local px, py, pz = getCharCoordinates(1)
						if xxx >= x and xxx <= x + radius and yyy >= y and yyy <= y + radius and isCarOnScreen(vehs[i]) and getDistanceBetweenCoords3d(px, py, pz, xx, yy, zz) <= 20 then
							renderDrawLine(xxx, yyy, x + radius / 2, y + radius / 2, 3, -1)
							trailer = vehs[i]
							clear = false
							break
						end
					end
				end
			end
			if clear then
				trailer = nil
			end
		end
		if not isKeyDown(KEY) and trailer ~= nil then
			if isCharInAnyCar(1) and doesVehicleExist(trailer) then
				if isTrailerAttachedToCab(trailer, getCarCharIsUsing(1)) then
					detachTrailerFromCab(trailer, getCarCharIsUsing(1))
					trailer = nil
				else
					attachTrailerToCab(trailer, getCarCharIsUsing(1))
				end
			end
			trailer = nil
		end
	end

	if aim.CheckBox.teste133[0] then
		local peds = getAllChars()
            for i=2, #peds do
                local _, id = sampGetPlayerIdByCharHandle(peds[i])
                if peds[i] ~= nil and isCharOnScreen(peds[i]) and not sampIsPlayerNpc(id) then
                    local x, y, z = getCharCoordinates(peds[i])
                    local xs, ys = convert3DCoordsToScreen(x, y, z)
                    if players[id] ~= nil then
                        renderFontDrawText(font, players[id], xs - 23, ys, 0xFF32FF16)
                    end
                end
            end 
        end
    
	if aim.CheckBox.teste128[0] then
	setCarHeavy(storeCarCharIsInNoSave(PLAYER_PED), heavymode)
	end
    
	if aim.CheckBox.teste129[0] then
end

if isKeyJustPressed(VK_END) and aim.CheckBox.teste130[0] then
	local var_39_33, var_39_34, var_39_35 = getCharCoordinates(playerPed)
	local var_39_36, var_39_37 = findAllRandomVehiclesInSphere(var_39_33, var_39_34, var_39_35, 350, true, true)

	if var_39_36 then
		warpCharIntoCar(playerPed, var_39_37)
		restoreCameraJumpcut()
	end
end
     
if aim.CheckBox.teste131[0] then
	if wasKeyPressed(VK_K) then
		for iter_2_0 = 0, 250 do
			if sampIsPlayerConnected(iter_2_0) then
				sampSendChat("/pm " .. iter_2_0 .. " Scarllet SAMP: Vai se fuder filho da puta | Seu merda, resto de aborto")
				printStringNow("~g~Noobs " .. iter_2_0, var_0_2)
				wait(var_0_2)
			end
		end
	end
end




	if aim.CheckBox.teste127[0] then
		if isCharInAnyCar(PLAYER_PED) then
			local camCoordX, camCoordY, camCoordZ = getActiveCameraCoordinates()
			local targetCamX, targetCamY, targetCamZ = getActiveCameraPointAt()
			setCarHeading(storeCarCharIsInNoSave(PLAYER_PED), getHeadingFromVector2d(targetCamX - camCoordX, targetCamY - camCoordY)) -- Corrigido playerPed para PLAYER_PED
			local car = storeCarCharIsInNoSave(PLAYER_PED)
			setCarProofs(car, true, true, true, true, true)
			if isKeyDown(VK_W) then
			end
		else
			sampAddChatMessage('Voce nao esta em um veiculo para usar o CarShot!', -1)
			aim.CheckBox.teste127[0] = false
		end
	end
	
	

	if aim.CheckBox.teste126[0] then
		if isCharInAnyCar(playerPed) then
			local car = storeCarCharIsInNoSave(playerPed)
			if getCarHealth(car) < 1000 then
				setCarHealth(car, 1000)
				sampAddChatMessage("[SMENU AUTO REPARO] A saude do seu veiculo foi restaurada.", 0xDC143C)
			end
		end
	end

	
	
		
	
		

	if aim.CheckBox.teste125[0] then
	if isCharInAnyCar(PLAYER_PED) and getDriverOfCar(storeCarCharIsInNoSave(PLAYER_PED)) == PLAYER_PED and not sampIsDialogActive() then
		local Handle = storeCarCharIsInNoSave(PLAYER_PED)
		memory.setint8(getCarPointer(Handle) + 0x40 + 0x0, isKeyDown(1) and 7 or 2, true)
		if isKeyDown(1) then
			setCarProofs(Handle, true, true, true, true, true)
			-->> Draw Pizda <<--
			local x, y = convert3DCoordsToScreen(getCarCoordinates(Handle))
			renderDrawPolygon(x, y, 22, 22, 4, 0, 0xFF000000)
			renderDrawPolygon(x, y, 20, 20, 4, 0, 0xFFffffff)
			renderDrawPolygon(x, y, 12, 12, 4, 0, 0xFF000000)
			renderDrawPolygon(x, y, 10, 10, 4, 0, 0xFFfff700)
		end
	end  
end
--[[
    +0x40 - Physical flags structure
        +0x0 = Movement physics flags
        Bit 1 = Unknown
        Bit 2 = Apply Gravity
        Bit 3 = Disable Collision Force
        Bit 4 = Collidable
        Bit 5 = Disable Turn Force
        Bit 6 = Disable Move Force
        Bit 7 = Infinite Mass
        Bit 8 = Disable Z
]]

    if aim.CheckBox.teste124[0] then
		local isDriver, car = getCarDrivenByPlayer(PLAYER_PED)
		if doesVehicleExist(car) and getCarSpeed(car) >= 10 then
			for i, object in ipairs(getAllObjects()) do
				local model = getObjectModel(object)
				if props[model] == true then
					sortOutObjectCollisionWithCar(object, car)
					if isVehicleTouchingObject(car, object) then
						 breakObject(object, 0)
						 break
					end
				end
			end
		end
	end
	

	if aim.CheckBox.teste120[0] then
    if isKeyDown(VK_C) and isKeyDown(VK_1) then
		if flymode == 0 then
			--setPlayerControl(playerchar, false)
			displayRadar(false)
			displayHud(false)	    
			posX, posY, posZ = getCharCoordinates(playerPed)
			angZ = getCharHeading(playerPed)
			angZ = angZ * -1.0
			setFixedCameraPosition(posX, posY, posZ, 0.0, 0.0, 0.0)
			angY = 0.0
			--freezeCharPosition(playerPed, false)
			--setCharProofs(playerPed, 1, 1, 1, 1, 1)
			--setCharCollision(playerPed, false)
			lockPlayerControl(true)
			flymode = 1
		--	sampSendChat('/anim 35')
		end
	end
	if flymode == 1 and not sampIsChatInputActive() and not isSampfuncsConsoleActive() then
		offMouX, offMouY = getPcMouseMovement()  
		  
		offMouX = offMouX / 4.0
		offMouY = offMouY / 4.0
		angZ = angZ + offMouX
		angY = angY + offMouY

		if angZ > 360.0 then angZ = angZ - 360.0 end
		if angZ < 0.0 then angZ = angZ + 360.0 end

		if angY > 89.0 then angY = 89.0 end
		if angY < -89.0 then angY = -89.0 end   

		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0        
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY      
		pointCameraAtPoint(poiX, poiY, poiZ, 2)

		curZ = angZ + 180.0
		curY = angY * -1.0      
		radZ = math.rad(curZ) 
		radY = math.rad(curY)                   
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 10.0     
		cosZ = cosZ * 10.0       
		sinY = sinY * 10.0                       
		posPlX = posX + sinZ 
		posPlY = posY + cosZ 
		posPlZ = posZ + sinY              
		angPlZ = angZ * -1.0
		--setCharHeading(playerPed, angPlZ)

		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0        
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY      
		pointCameraAtPoint(poiX, poiY, poiZ, 2)

		if isKeyDown(VK_W) then      
			radZ = math.rad(angZ) 
			radY = math.rad(angY)                   
			sinZ = math.sin(radZ)
			cosZ = math.cos(radZ)      
			sinY = math.sin(radY)
			cosY = math.cos(radY)       
			sinZ = sinZ * cosY      
			cosZ = cosZ * cosY 
			sinZ = sinZ * speed      
			cosZ = cosZ * speed       
			sinY = sinY * speed  
			posX = posX + sinZ 
			posY = posY + cosZ 
			posZ = posZ + sinY      
			setFixedCameraPosition(posX, posY, posZ, 0.0, 0.0, 0.0)      
		end 

		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0         
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY      
		pointCameraAtPoint(poiX, poiY, poiZ, 2)

		if isKeyDown(VK_S) then  
			curZ = angZ + 180.0
			curY = angY * -1.0      
			radZ = math.rad(curZ) 
			radY = math.rad(curY)                   
			sinZ = math.sin(radZ)
			cosZ = math.cos(radZ)      
			sinY = math.sin(radY)
			cosY = math.cos(radY)       
			sinZ = sinZ * cosY      
			cosZ = cosZ * cosY 
			sinZ = sinZ * speed      
			cosZ = cosZ * speed       
			sinY = sinY * speed                       
			posX = posX + sinZ 
			posY = posY + cosZ 
			posZ = posZ + sinY      
			setFixedCameraPosition(posX, posY, posZ, 0.0, 0.0, 0.0)
		end 

		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0        
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY      
		pointCameraAtPoint(poiX, poiY, poiZ, 2)
		  
		if isKeyDown(VK_A) then  
			curZ = angZ - 90.0
			radZ = math.rad(curZ)
			radY = math.rad(angY)
			sinZ = math.sin(radZ)
			cosZ = math.cos(radZ)
			sinZ = sinZ * speed
			cosZ = cosZ * speed
			posX = posX + sinZ
			posY = posY + cosZ
			setFixedCameraPosition(posX, posY, posZ, 0.0, 0.0, 0.0)
		end 

		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0        
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY
		pointCameraAtPoint(poiX, poiY, poiZ, 2)       

		if isKeyDown(VK_D) then  
			curZ = angZ + 90.0
			radZ = math.rad(curZ)
			radY = math.rad(angY)
			sinZ = math.sin(radZ)
			cosZ = math.cos(radZ)       
			sinZ = sinZ * speed
			cosZ = cosZ * speed
			posX = posX + sinZ
			posY = posY + cosZ      
			setFixedCameraPosition(posX, posY, posZ, 0.0, 0.0, 0.0)
		end 

		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0        
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY      
		pointCameraAtPoint(poiX, poiY, poiZ, 2)   

		if isKeyDown(VK_SPACE) then  
			posZ = posZ + speed
			setFixedCameraPosition(posX, posY, posZ, 0.0, 0.0, 0.0)
		end 

		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0       
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY      
		pointCameraAtPoint(poiX, poiY, poiZ, 2) 

		if isKeyDown(VK_SHIFT) then  
			posZ = posZ - speed
			setFixedCameraPosition(posX, posY, posZ, 0.0, 0.0, 0.0)
		end 

		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0       
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY      
		pointCameraAtPoint(poiX, poiY, poiZ, 2) 

		if keyPressed == 0 and isKeyDown(VK_F10) then
			keyPressed = 1
			if radarHud == 0 then
				displayRadar(true)
				displayHud(true)
				radarHud = 1
			else
				displayRadar(false)
				displayHud(false)
				radarHud = 0
			end
		end

		if wasKeyReleased(VK_F10) and keyPressed == 1 then keyPressed = 0 end

		if isKeyDown(187) then 
			speed = speed + 0.01
			printStringNow(speed, 1000)
		end 
					   
		if isKeyDown(189) then 
			speed = speed - 0.01 
			if speed < 0.01 then speed = 0.01 end
			printStringNow(speed, 1000)
		end   

		if isKeyDown(VK_C) and isKeyDown(VK_2) then
			--setPlayerControl(playerchar, true)
			displayRadar(true)
			displayHud(true)
			radarHud = 0	    
			angPlZ = angZ * -1.0
			--setCharHeading(playerPed, angPlZ)
			--freezeCharPosition(playerPed, false)
			lockPlayerControl(false)
			--setCharProofs(playerPed, 0, 0, 0, 0, 0)
			--setCharCollision(playerPed, true)
			restoreCameraJumpcut()
			setCameraBehindPlayer()
			flymode = 0     
		end
	end
end


	if aim.CheckBox.teste119[0] then
		local charInCar = isCharInAnyCar(PLAYER_PED)
          if charInCar then
              local vehi = storeCarCharIsInNoSave(PLAYER_PED)
              local myPosX, myPosY, myPosZ = getCharCoordinates(PLAYER_PED)
              local resultc, vehHandle = findAllRandomVehiclesInSphere(myPosX, myPosY, myPosZ, 25, true, true)
              
              if resultc and vehHandle ~= vehi then
                  setCarCollision(vehHandle, false)
              end
          else
              -- Fazer algo caso o personagem não esteja em um veículo
          end
      else
          local myPosX, myPosY, myPosZ = getCharCoordinates(PLAYER_PED)
          local resultc, vehHandle = findAllRandomVehiclesInSphere(myPosX, myPosY, myPosZ, 25, true, true)
      
          if resultc and vehHandle then
              setCarCollision(vehHandle, true)
          end
      end


	if aim.CheckBox.teste118[0] then
	for iter_74_13 = 0, sampGetMaxPlayerId(true) do
		if sampIsPlayerConnected(iter_74_13) then
			local var_74_50, var_74_51 = sampGetCharHandleBySampPlayerId(iter_74_13)

			if var_74_50 and isCharOnScreen(var_74_51) and not isCharInAnyCar(var_74_51) then
				local var_74_52 = {
					getCharCoordinates(PLAYER_PED)
				}
				local var_74_53 = {
					getCharCoordinates(var_74_51)
				}

				if math.sqrt(math.pow(var_74_53[1] - var_74_52[1], 2) + math.pow(var_74_53[2] - var_74_52[2], 2) + math.pow(var_74_53[3] - var_74_52[3], 2)) < 1 then
					setCharCollision(var_74_51, false)
				else
					setCharCollision(var_74_51, true)
				end
			end
		end
	end
end
	
	
	
	

    

	if aim.CheckBox.teste116[0] then
		for iter_20_9, iter_20_10 in pairs(getAllVehicles()) do
			if doesVehicleExist(iter_20_10) and isCarOnScreen(iter_20_10) then
				local var_20_222, var_20_223, var_20_224 = getOffsetFromCarInWorldCoords(iter_20_10, 0, 0, 0)
				local var_20_225, var_20_226 = convert3DCoordsToScreen(var_20_222, var_20_223, var_20_224)
	
				renderFontDrawText(font, string.format("[{2ecc71}ID: %d {FFFFFF}|| {e74c3c}Saude do veiculo: %d{FFFFFF}]", select(2, sampGetVehicleIdByCarHandle(iter_20_10)), getCarHealth(iter_20_10)), var_20_225, var_20_226, 4294967295)
			end
		end
	end

    if aim.CheckBox.teste115[0] then
		if isCharSwimming(PLAYER_PED) and isButtonPressed(0, 6) then mode = 1 end
		if mode == 1 and not isButtonPressed(0, 6) then mode = 0 end
		if mode == 1 then
			if platform then deleteObject(platform) end
			x, y, z = getCharCoordinates(PLAYER_PED)
			z = getWaterHeightAtCoords(x, y, true)
			platform = createObject(1685, x, y, z-2.75)
		else if platform then deleteObject(platform) end
		end
		wait(0)
	end

    if aim.CheckBox.teste87[0] then
        for i = 0, 2048 do 
            if sampIs3dTextDefined(i) then
                local text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById(i)
                if text:find("hp") then
                    admid = playerId
                    local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
                    if admid ~= myid then
                        local admres, admped = sampGetCharHandleBySampPlayerId(admid)
                        if admped then
                            admdoes = doesCharExist(admped)
                            if not admdoes then
                                local admname = sampGetPlayerNickname(admid)
                                if sms then
                                    notf.addNotification(string.format("Admin found:\nPlayer ID: [%d] %s", admid, admname), 500, os.date())
                                    sms = false
                                end
                                renderFontDrawText(font, "Admin found:", 49, 285, 0xFFFFFFFF, 0x90000000)
                                renderFontDrawText(font, string.format("[%d] %s", admid, admname), 49, 320, 0xFFFFFFFF, 0x90000000)
                            end
                        end
                    end
                end
            end
        end
    end
    
    
    if aim.CheckBox.teste85[0] then
        if isButtonPressed(PLAYER_HANDLE, 6) and isKeyJustPressed(vKeys.VK_R) then
            sendKey(4)
            setGameKeyState(17, 255)
            wait(55)
            setGameKeyState(6, 0)
            sendKey(2)
            setGameKeyState(18, 255)
        end
    end


if aim.CheckBox.teste81[0] and isCharInAnyCar(PLAYER_PED) and not sampIsChatInputActive() and not sampIsDialogActive() then
    local var_18_102 = 1

    var_0_29 = {}

    local var_18_103 = getCarCharIsUsing(PLAYER_PED)

    if getDriverOfCar(var_18_103) == -1 then
        pcall(sampForcePassengerSyncSeatId, var_0_29[1], var_0_29[2])
        pcall(sampForceUnoccupiedSyncSeatId, var_0_29[1], var_0_29[2])
    else
        pcall(sampForceVehicleSync, var_0_29[1])
    end

    local var_18_104 = getCarSpeed(var_18_103)

    setCarHeavy(var_18_103, false)
    setCarProofs(var_18_103, true, true, true, true, true)

    local var_18_105, var_18_106, var_18_107, var_18_108 = getPositionOfAnalogueSticks(0)
    local var_18_109 = var_18_105 / -64
    local var_18_110 = var_18_106 / 64

    setCarRotationVelocity(var_18_103, var_18_110, 0, var_18_109)

    local var_18_111 = false

    if isKeyDown(VK_W) then
        if var_18_111 then
            var_0_34 = var_0_34 + 0.6
        elseif var_18_104 <= 200 then
            var_0_34 = var_0_34 + 0.4
        end

        local var_18_112 = false
    elseif isKeyDown(VK_S) then
        if var_0_34 <= 0 then
            if var_18_104 == 0 then
                var_0_34 = -0.4
            else
                var_0_34 = var_0_34 - 0.5
            end

            local var_18_113 = true
        else
            var_0_34 = 0

            local var_18_114 = false
        end
    end

    if isKeyDown(VK_SPACE) then
        var_0_34 = 0

        setCarRotationVelocity(var_18_103, 0, 0, 0, 0)
        setCarRoll(var_18_103, 0)
    end

    setCarForwardSpeed(var_18_103, var_0_34 * var_18_102)

    if wasKeyPressed(VK_X) then
        while wasKeyPressed(VK_X) do
            wait(0)
        end
    end
end

if aim.CheckBox.teste78[0] and isCharInAnyCar(PLAYER_PED) then
    local veh = storeCarCharIsInNoSave(PLAYER_PED)
     setCarProofs(veh, true, true, true, true, true)
    end


            if aim.CheckBox.teste77[0] and isCharInAnyCar(PLAYER_PED) then
                local veh = storeCarCharIsInNoSave(PLAYER_PED)
                setCarHeavy(veh, true)
               end
         
       if aim.CheckBox.teste76[0] then
        local var_7_42 = true

		if var_7_42 and isCharInAnyCar(playerPed) and not sampIsDialogActive() and not sampIsChatInputActive() then
			local var_7_43 = storeCarCharIsInNoSave(playerPed)

			if isKeyDown(VK_K) then
				addToCarRotationVelocity(var_7_43, 0.5, 0, 0)
			end

			if isKeyDown(VK_I) then
				addToCarRotationVelocity(var_7_43, -0.5, 0, 0)
			end

			if isKeyDown(VK_U) then
				addToCarRotationVelocity(var_7_43, 0, -0.5, 0)
			end

			if isKeyDown(VK_O) then
				addToCarRotationVelocity(var_7_43, 0, 0.5, 0)
			end

			if isKeyDown(VK_L) then
				addToCarRotationVelocity(var_7_43, 0, 0, -0.5)
			end

			if isKeyDown(VK_J) then
				addToCarRotationVelocity(var_7_43, 0, 0, 0.5)
			end
		end
	end

        if aim.CheckBox.teste74[0] then
         writeMemory(5425646, 1, 1, true)
		else
			writeMemory(5425646, 1, 0, true)
		end

 
		if aim.CheckBox.teste73[0] then
			for i = 0, sampGetMaxPlayerId() do
				if sampIsPlayerConnected(i) then
					local result, handlePed = sampGetCharHandleBySampPlayerId(i)
					local color_ped = sampGetPlayerColor(i)
					local a, r, g, b = explode_argb(color_ped)
					local color = join_argb(255, r, g, b)
					if result and doesCharExist(handlePed) and isCharOnScreen(handlePed) then
						local pos = {getCharCoordinates(PLAYER_PED)}
						local whpos = {GetBodyPartCoordinates(8, handlePed)}
						local x1, y1 = convert3DCoordsToScreen(pos[1], pos[2], pos[3])
						local x2, y2 = convert3DCoordsToScreen(whpos[1], whpos[2], whpos[3])
						local _, id = sampGetPlayerIdByCharHandle(handlePed)
						local NickName = sampGetPlayerNickname(id)
						renderFontDrawText(font, "Jogador: "..NickName.."\nID ["..id.."]\nDistancia: ["..string.format('%0.2f', getDistanceBetweenCoords3d(pos[1], pos[2], pos[3], whpos[1], whpos[2], whpos[3])).."] M" , x2, y2 - 50, color, -1)
					end
				end
			end
		end
		

if aim.CheckBox.teste62[0] then
    for _, v in pairs(getAllObjects()) do
        if isObjectOnScreen(v) then
            local result, oX, oY, oZ = getObjectCoordinates(v)
            local x1, y1 = convert3DCoordsToScreen(oX,oY,oZ)
            local objmodel = getObjectModel(v)
            local x2,y2,z2 = getCharCoordinates(PLAYER_PED)
            local x10, y10 = convert3DCoordsToScreen(x2,y2,z2)
            local distance = string.format("%.0f", getDistanceBetweenCoords3d(oX,oY,oZ, x2, y2, z2))
            if objmodel == 19058 then 
                renderDrawLine(x10, y10, x1, y1, 1.1, 0xFFD00000) 
                renderFontDrawText(font,"Caixa RP!\n{ff0000}Distância: "..distance, x1, y1, -1) 
            end
        end
    end
end

if aim.CheckBox.teste61[0] then
    for _, v in ipairs(getAllObjects()) do
        if doesObjectExist(v) and isObjectOnScreen(v) and getObjectModel(v) == 1272 then
            local result, oX, oY, oZ = getObjectCoordinates(v)
            local x1, y1 = convert3DCoordsToScreen(oX,oY,oZ)
            local x2,y2,z2 = getCharCoordinates(PLAYER_PED)
            local x10, y10 = convert3DCoordsToScreen(x2,y2,z2)
            local distance = string.format("%.0f", getDistanceBetweenCoords3d(oX,oY,oZ, x2, y2, z2))
            renderDrawLine(x10, y10, x1, y1, 1.1, 0xFFD00000) 
            renderFontDrawText(font, "Casa Comprada!\n{ff0000}Distância: "..distance, x1, y1, -1)
        end
    end
end


    if aim.CheckBox.teste54[0] then
	local var_10_13, var_10_14, var_10_15 = getCharCoordinates(PLAYER_PED)

		if wasKeyPressed(VK_UP) and not sampIsChatInputActive() then
			setCharCoordinates(PLAYER_PED, var_10_13, var_10_14, var_10_15 + 2)
		end

		if wasKeyPressed(VK_DOWN) and not sampIsChatInputActive() then
			setCharCoordinates(PLAYER_PED, var_10_13, var_10_14, var_10_15 - 2)
		end

		obj1 = createObject(19372, var_10_13, var_10_14, var_10_15 - 2.85)

		setObjectQuaternion(obj1, 1.5, 0, 0.7, 0)
		wait(300)
		deleteObject(obj1)
	end
	
	if aim.CheckBox.teste55[0] then
    require("lib.samp.events").onSendClientJoin = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
        return {
            slot0,
            slot1,
            slot2,
            slot3,
            "39FB2DEEDB49ACFB8D4EECE6953D2507988CCCF4410",
            "0.3.7",
            slot6
        }
    end
end
    
	if aim.CheckBox.teste56[0] then
    if isKeyDown(90) and not sampIsCursorActive() then
        taskPlayAnim(PLAYER_PED, "facsurp", "PED", 9, false, false, false, true, -1)
    elseif isCharPlayingAnim(PLAYER_PED, "facsurp") then
        taskPlayAnim(PLAYER_PED, "facsurpm", "PED", 9, false, false, false, false, -1)
    end
    if sampIsChatInputActive() then
        taskPlayAnim(PLAYER_PED, "factalk", "PED", 9, false, false, false, true, -1)
    elseif isCharPlayingAnim(PLAYER_PED, "factalk") then
        taskPlayAnim(PLAYER_PED, "facsurpm", "PED", 9, false, false, false, false, -1)
    end
   


    
    if sampIsChatInputActive() then
        taskPlayAnim(PLAYER_PED, "factalk", "PED", 9, false, false, false, true, -1)
    elseif isCharPlayingAnim(PLAYER_PED, "factalk") then
        taskPlayAnim(PLAYER_PED, "facsurpm", "PED", 9, false, false, false, false, -1)
    end
    
    wait(0)
end

    if aim.CheckBox.teste57[0] then
    if isKeyDown(VK_RBUTTON) and not sampIsCursorActive() and not isCharInAnyCar(PLAYER_PED) then 
        sampSetChatDisplayMode(0)
        displayHud(false)
        
        while isKeyDown(VK_RBUTTON) do 
            wait(0) 
            sampSetChatDisplayMode(0) 
            displayHud(false) 
        end 
        
        sampSetChatDisplayMode(2)
        displayHud(true)
    end
end


     if aim.CheckBox.teste50[0] then 
     if isCharSittingInAnyCar(PLAYER_PED) then
        local x, y, z = getCharCoordinates(PLAYER_PED)
        local hpped = getCharHealth(PLAYER_PED)
        local armorped = getCharArmour(PLAYER_PED)
        local x1_ped, y1_ped = convert3DCoordsToScreen(x, y, z)
        local veh = storeCarCharIsInNoSave(PLAYER_PED)
        local x_car, y_car, z_car = getCarCoordinates(veh)
        local hpcar = getCarHealth(veh)
        local _, idcar = sampGetVehicleIdByCarHandle(veh)
        local a, b = getCarColours(veh)
        local x1_car, y1_car = convert3DCoordsToScreen(x_car, y_car, z_car)
        
        renderFontDrawText(font, 'hp: ['..hpped..']\narm: ['..armorped..']', x1_ped-70, y1_ped, -1)
        renderFontDrawText(font, 'hpcar: ['..hpcar..']\nid: ['..idcar..']\ncolor: ['..a..'|'..b..']', x1_car, y1_car, -1)
    else
        local x, y, z = getCharCoordinates(PLAYER_PED)
        local hpped = getCharHealth(PLAYER_PED)
        local armorped = getCharArmour(PLAYER_PED)
        local x1_ped, y1_ped = convert3DCoordsToScreen(x, y, z)
        
        renderFontDrawText(font, 'hp: ['..hpped..']\narm: ['..armorped..']', x1_ped-25, y1_ped, -1)
    end
end

            
            if aim.CheckBox.teste35[0] then
            end

            if aim.CheckBox.teste34[0] then
	if testCheat("QE") then
		MOP_()
	end
	if MOP and not sampIsCursorActive() then
		if not isCharInAnyCar(PLAYER_PED) then
			if isKeyDown(VK_1) then
				pow = pow + 0.01
				printStringNow("~y~ aumentando a velocidade "..pow, 1000)
			elseif isKeyDown(VK_2) then
				pow = pow - 0.01
				if pow < 0 then
					pow = 0
				end
				printStringNow("~y~ diminuindo a velocidade "..pow, 1000)
			end

			local x, y, z = getCharCoordinates(PLAYER_PED)
			local x1, y1, z1 = getActiveCameraCoordinates()
			local head = math.rad(getHeadingFromVector2d(x-x1, y-y1))

			if isKeyDown(87) then
				x = x - math.sin(-head+3.14)*pow
				y = y - math.cos(-head+3.14)*pow
			elseif isKeyDown(83) then
				x = x + math.sin(-head+3.14)*pow
				y = y + math.cos(-head+3.14)*pow
			end

			if isKeyDown(65) then
				head = math.rad(math.deg(head)+90) -- Corrección: head debe sobrescribirse directamente
				x = x - math.sin(-head+3.14)*pow
				y = y - math.cos(-head+3.14)*pow
			elseif isKeyDown(68) then
				head = math.rad(math.deg(head)-90) -- Corrección: head debe sobrescribirse directamente
				x = x - math.sin(-head+3.14)*pow
				y = y - math.cos(-head+3.14)*pow
			end

			if isKeyDown(16) then
				z = z - pow/2
			elseif isKeyDown(32) then
				z = z + pow/2
			end

			local sync = samp_create_sync_data("player")
			sync.position = {f(x), f(y), f(z-1)}
			sync.moveSpeed = {f(0), f(0), f(0)}

			local x2, y2, z2 = getCharCoordinates(PLAYER_PED)
			if x ~= x2 or y ~= y2 or z ~= z2 then
				sync.moveSpeed = {f(0.1), f(0.1), f(0.1)}
			end
			sync.send()

			setCharHeading(PLAYER_PED, math.deg(head))
			setCharCoordinates(PLAYER_PED, x, y, z-1)
		else
			MOP_()
		end
	end
end
            
			if aim.CheckBox.teste33[0] and isKeyJustPressed(VK_R) and not sampIsDialogActive() and not sampIsChatInputActive() and not sampIsScoreboardOpen() and not isSampfuncsConsoleActive() then
			while isKeyJustPressed(VK_R) do
				wait(0)
			end

			setVirtualKeyDown(1, true)
			wait(50)
			setVirtualKeyDown(1, false)
			wait(50)
			setVirtualKeyDown(2, true)
			wait(130)
			setVirtualKeyDown(VK_C, true)
			wait(44)
			setVirtualKeyDown(VK_C, false)
			wait(5)
			setVirtualKeyDown(1, true)
			wait(50)
			setVirtualKeyDown(1, false)
			wait(20)
			setVirtualKeyDown(2, false)
			wait(50)
			setVirtualKeyDown(VK_C, true)
			wait(50)
			setVirtualKeyDown(VK_C, false)
		end


		
		if aim.CheckBox.teste16[0] then
			for i = 0, sampGetMaxPlayerId(true) do
				if sampIsPlayerConnected(i) then
					local find, handle = sampGetCharHandleBySampPlayerId(i)
					if find then
						if isCharOnScreen(handle) then
							local myPos = { GetBodyPartCoordinates(3, PLAYER_PED) }
							local enPos = { GetBodyPartCoordinates(3, handle) }
							if isLineOfSightClear(myPos[1], myPos[2], myPos[3], enPos[1], enPos[2], enPos[3], true, true, false, true, true) then
								color = 0xFF00FF00
							else
								color = 0xFFFF0000
							end
		
							local headPos = { GetBodyPartCoordinates(8, handle) }
							local footPos = { GetBodyPartCoordinates(44, handle) }
		
							local pointOne = {
								x = headPos[1] - 0.5,
								y = headPos[2],
								z = headPos[3] + 0.35
							}
		
							local pointTwo = {
								x = headPos[1] + 0.5,
								y = headPos[2],
								z = headPos[3] - 0.35
							}
		
							local pointThree = {
								x = footPos[1] + 0.5,
								y = footPos[2],
								z = footPos[3] - 0.35
							}
		
							local pointOneScreen = { convert3DCoordsToScreen(pointOne.x, pointOne.y, pointOne.z) }
							local pointTwoScreen = { convert3DCoordsToScreen(pointTwo.x, pointTwo.y, pointOne.z) }
							local pointThreeScreen = { convert3DCoordsToScreen(pointOne.x, pointThree.y, pointThree.z) }
							local pointFourScreen = { convert3DCoordsToScreen(pointTwo.x, pointThree.y, pointThree.z) }
		
							local thickness = floatbuffer11[0] -- Utilizando o valor do buffer para ajustar a largura da linha
		
							renderDrawLine(pointOneScreen[1], pointOneScreen[2], pointTwoScreen[1], pointTwoScreen[2], thickness, color)
							renderDrawLine(pointThreeScreen[1], pointThreeScreen[2], pointFourScreen[1], pointFourScreen[2], thickness, color)
							renderDrawLine(pointOneScreen[1], pointOneScreen[2], pointThreeScreen[1], pointThreeScreen[2], thickness, color)
							renderDrawLine(pointTwoScreen[1], pointTwoScreen[2], pointFourScreen[1], pointFourScreen[2], thickness, color)
						end
					end
				end
			end
		end
		
		
	
		
		

		if aim.CheckBox.teste15[0] then
			for iter_98_0 = 0, sampGetMaxPlayerId(true) do
				if sampIsPlayerConnected(iter_98_0) then
					local var_98_0, var_98_1 = sampGetCharHandleBySampPlayerId(iter_98_0)
		
					if var_98_0 and isCharOnScreen(var_98_1) then
						local var_98_2 = {
							GetBodyPartCoordinates(3, PLAYER_PED)
						}
						local var_98_3 = {
							GetBodyPartCoordinates(3, var_98_1)
						}
		
						if isLineOfSightClear(var_98_2[1], var_98_2[2], var_98_2[3], var_98_3[1], var_98_3[2], var_98_3[3], true, true, false, true, true) then
							color = 4278255360
						else
							color = 4294901760
						end
		
						local var_98_4 = {
							convert3DCoordsToScreen(GetBodyPartCoordinates(3, PLAYER_PED))
						}
						local var_98_5 = {
							convert3DCoordsToScreen(GetBodyPartCoordinates(3, var_98_1))
						}
						
						local thickness = floatbuffer10[0]  -- Assuming floatbuffer controls thickness
						renderDrawLine(var_98_4[1], var_98_4[2], var_98_5[1], var_98_5[2], thickness, color)
					end
				end
			end
		end
		

		
if aim.CheckBox.teste14[0] then
    for i = 0, sampGetMaxPlayerId(true) do
        if sampIsPlayerConnected(i) then
            local find, handle = sampGetCharHandleBySampPlayerId(i)
            if find then
                if isCharOnScreen(handle) then
                    local myPos = { GetBodyPartCoordinates(3, PLAYER_PED) }
                    local enPos = { GetBodyPartCoordinates(3, handle) }
                    if isLineOfSightClear(myPos[1], myPos[2], myPos[3], enPos[1], enPos[2], enPos[3], true, true, false, true, true) then
                        color = 0xFF00FF00
                    else
                        color = 0xFFFF0000
                    end

                    local t = { 3, 4, 5, 51, 52, 41, 42, 31, 32, 33, 21, 22, 23, 2 }
                    for v = 1, #t do
                        local pos1 = { GetBodyPartCoordinates(t[v], handle) }
                        local pos2 = { GetBodyPartCoordinates(t[v] + 1, handle) }
                        local pos1Screen = { convert3DCoordsToScreen(pos1[1], pos1[2], pos1[3]) }
                        local pos2Screen = { convert3DCoordsToScreen(pos2[1], pos2[2], pos2[3]) }
                        
                        local thickness = floatbuffer9[0]  -- Assuming floatbuffer controls thickness
                        renderDrawLine(pos1Screen[1], pos1Screen[2], pos2Screen[1], pos2Screen[2], thickness, color)
                    end
                end
            end
        end
    end
end

		
		    if aim.CheckBox.teste13[0] then
				result, ped = getCharPlayerIsTargeting(playerHandle)
		if result then
			local myPos = {getActiveCameraCoordinates()}
			local enPos = {getCharCoordinates(ped)}
			local vector = {myPos[1] - enPos[1], myPos[2] - enPos[2], myPos[3] - enPos[3]}
			if isWidescreenOnInOptions() then coefficentZ = 0.0778 else coefficentZ = 0.103 end
			local angle = {(math.atan2(vector[2], vector[1]) + 0.04253), (math.atan2((math.sqrt((math.pow(vector[1], 2) + math.pow(vector[2], 2)))), vector[3]) - math.pi / 2 - coefficentZ)}
			local view = {fix(representIntAsFloat(readMemory(0xB6F258, 4, false))), fix(representIntAsFloat(readMemory(0xB6F248, 4, false)))}
			local difference = {angle[1] - view[1], angle[2] - view[2]}
			local smooth = {difference[1] / 1.0, difference[2] / 1.0}
			setCameraPositionUnfixed((view[2] + smooth[2]), (view[1] + smooth[1]))
		end
	end
	
	         if aim.CheckBox.teste12[0] then
			 end
			
		if aim.CheckBox.antistun[0] then
            for _, v in pairs(getAllObjects()) do
                if isObjectOnScreen(v) then
                    local result, oX, oY, oZ = getObjectCoordinates(v)
                    local x1, y1 = convert3DCoordsToScreen(oX,oY,oZ)
                    local objmodel = getObjectModel(v)
                    local x2,y2,z2 = getCharCoordinates(PLAYER_PED)
                    local x10, y10 = convert3DCoordsToScreen(x2,y2,z2)
                    distance = string.format("%.0f", getDistanceBetweenCoords3d(oX,oY,oZ, x2, y2, z2))
                    if objmodel == 19057 then renderDrawLine(x10, y10, x1, y1, 1.1, 0xFFD00000) renderFontDrawText(font,"Caixa Platina!\n{ff0000}Distancia: "..distance, x1, y1, -1) end
                end
            end
       end
    end
end



function imgui.CenterText(text)
    imgui.SetCursorPosX(imgui.GetWindowSize().x / 2 - imgui.CalcTextSize(text).x / 2)
    imgui.Text(text)
end

local function OnOffButton(text, sizeImVec2, bool)
    if bool then
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.06, 0.98, 0.52, 0.90)) -- Verde
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.06, 0.98, 0.22, 1.00)) -- Verde mais escuro quando hover
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.06, 0.98, 0.32, 1.00)) -- Verde um pouco mais claro quando ativo
    else
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.98, 0.06, 0.06, 0.40)) -- Vermelho quando desativado
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.98, 0.06, 0.06, 1.00)) -- Vermelho quando hover
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.98, 0.06, 0.06, 1.00)) -- Vermelho quando ativo
    end
    local result = imgui.Button(text, sizeImVec2)
    imgui.PopStyleColor(3)
    return result
end






local categories = {
    faicons.ICON_FA_RUNNING .. " JOGADOR",
    faicons.ICON_FA_EYE .. " VISUAL ",
    faicons.ICON_FA_VECTOR_SQUARE  .. " RENDERIZADOR",
    faicons.ICON_FA_CAR .. " VEICULO",
    faicons.ICON_FA_QUESTION .. " SOBRE O MENU",
    faicons.ICON_FA_COMMENT .. " COMANDOS",
    faicons.ICON_FA_ROCKET .. " TELEPORTE",
    faicons.ICON_FA_PUZZLE_PIECE .. " OUTROS",
    faicons.ICON_FA_FIRE .. " ARMAS ",
    faicons.ICON_FA_COG .. " MISC",
    faicons.ICON_FA_BOMB .. " TROLL ",
    faicons.ICON_FA_USER_PLUS .. " PROTECAO",
    faicons.ICON_FA_CROSSHAIRS .. " AIMBOT ",
	faicons.ICON_FA_MONEY_BILL .. " FARM MONEY ",
}

local category_id = 0;

function imgui.CenterText(text)
    imgui.SetCursorPosX(imgui.GetWindowSize().x / 2 - imgui.CalcTextSize(text).x / 2)
    imgui.Text(text)
end
        local newFrame = imgui.OnFrame(
    function() return aim.renderWindow.renderWindow[0] end,
    function(player)
		local var_6_0, var_6_1 = getScreenResolution()

		renderDrawBox(0, 0, var_6_0, var_6_1, 2147483648)

		local var_6_2, var_6_3 = getScreenResolution()
        local sizeX, sizeY = getScreenResolution()
        imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(760, 355), imgui.Cond.FirstUseEver)
		imgui.Begin(string.format("%s SCARLLET MENU | Autor: Scarllet SAMP %s", faicons.ICON_FA_BOLT, faicons.ICON_FA_BOLT), aim.renderWindow.renderWindow, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse);
		imgui.BeginChild('buttons', imgui.ImVec2(190, 325), true)
        imgui.TextColoredRGB('           {FFFAFA}Status: {00FF00}Conectado')
		imgui.CenterText(faicons.ICON_FA_BARS .. ' MENU PERMANENTE')
		imgui.CenterText(faicons.ICON_FA_CODE..' V10.0  | May 31 2024')
		imgui.TextColoredRGB("           {FFFAFA}Hora: " .. os.date("{35AF00}%H:%M:%S"))

        imgui.SetCursorPosY(80)
        for id, name in ipairs(categories) do
            if imgui.HeaderButton(name, imgui.ImVec2(170, 40), category_id == id and 0x5000FF50 or nil) then
                category_id = id
            end
        end

        imgui.EndChild(); imgui.SameLine()
        imgui.BeginChild('content', imgui.ImVec2(565, 310), true)
        if category_id == 1 then
            imgui.TextColoredRGB("{FFFAFA}Contagem de Jogadores: {9021D0}" .. playersrw .. "")
			imgui.TextColoredRGB("{FFFAFA}Jogadores no stream: {CA21D0}" .. playersrwstream .. "")
			imgui.TextColoredRGB("{FFFAFA}Status do Jogador: {22D9A1}" .. playerstatus .. "")
				if imgui.Button(" Limpar Memoria", var_0_12) then
					CleanMemory()
					sampAddChatMessage(" MEMORIA LIMPADA COM SUCESSO!", 16729344)
				end
			imgui.Separator()
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Fast Spawn", aim.CheckBox.teste20)
			if imgui.ToggleButton(faicons.ICON_FA_USER .. u8" Personagem Transparente", aim.CheckBox.teste173) then
				if aim.CheckBox.teste173 then
					SetRwObjectAlpha(playerPed, 150)
				else
					SetRwObjectAlpha(playerPed, 255)
				end
			else
				if not aim.CheckBox.teste173 then
					SetRwObjectAlpha(playerPed, 255)
				end
			end					
            imgui.ToggleButton(faicons.ICON_FA_USER..u8" God Mod", aim.CheckBox.teste89)
			imgui.ToggleButton(faicons.ICON_FA_MOBILE..u8" Checar Plataforma", aim.CheckBox.teste133)
			imgui.ToggleButton(faicons.ICON_FA_CHECK..u8" Checar Administradores", aim.CheckBox.teste228)
			imgui.SameLine(nil, 6) 
            imgui.TextQuestion(u8'Coloque o nick do adm na pasta (adm_list)')
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Pulsator", aim.CheckBox.teste215)
			imgui.SameLine(nil, 6) 
            imgui.TextQuestion(u8'A vida vai ficar oscilando')
			imgui.ToggleButton(faicons.ICON_FA_ENVELOPE..u8" Floodar PM", aim.CheckBox.teste131)
			imgui.SameLine(nil, 6) 
            imgui.TextQuestion(u8'Aperte a tecla K para poder ativar o flooder')
			imgui.ToggleButton(faicons.ICON_FA_POOP..u8" Cagar", aim.CheckBox.teste226)
			imgui.ToggleButton(faicons.ICON_FA_POOP..u8" Mijar", aim.CheckBox.teste227)
			imgui.SameLine(nil, 6) 
            imgui.TextQuestion(u8'Segure a tecla R para mijar')
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Atravessar Jogadores", aim.CheckBox.teste118)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Atravessar Carros", aim.CheckBox.teste119)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Atravessar Objetos", aim.CheckBox.teste150)
			imgui.ToggleButton(faicons.ICON_FA_CAMERA..u8" Nao restaurar camera", aim.CheckBox.teste154)
			imgui.ToggleButton(faicons.ICON_FA_RUNNING..u8" Correr Rapido V2", aim.CheckBox.teste22)
			imgui.SameLine(nil, 6)
            imgui.TextQuestion(u8'Aperte 1 para correr rapido')
			imgui.ToggleButton(faicons.ICON_FA_RUNNING..u8" Corrida Rapida V3", aim.CheckBox.teste31)
			imgui.SameLine(nil, 6)
            imgui.TextQuestion(u8'Tecla M e +. exemplo: aperte a tecla M e a tecla + para aumentar a velocidade, para diminuir aperte a tecla M e -')
			imgui.ToggleButton(faicons.ICON_FA_FIST_RAISED..u8" Soco Rapido", aim.CheckBox.teste23)
			imgui.ToggleButton(faicons.ICON_FA_USER_CLOCK..u8" Falso AFK", aim.CheckBox.teste25)
			imgui.ToggleButton(faicons.ICON_FA_MAP..u8" Fast Mapa", aim.CheckBox.teste26)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Nao Agachar", aim.CheckBox.teste198)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Corrida Automatica", aim.CheckBox.teste200)
			imgui.ToggleButton(faicons.ICON_FA_CAMERA..u8" Camera Hack", aim.CheckBox.teste120)
			imgui.SameLine(nil, 6)
            imgui.TextQuestion(u8'C+1 - liga, C+2 - desliga')
            imgui.ToggleButton(faicons.ICON_FA_ROCKET..u8" Parar Jetpack", aim.CheckBox.teste32)
			if imgui.ToggleButton(faicons.ICON_FA_ROCKET..u8" Puxar Jetpack", aim.CheckBox.teste38) then
    jetpackState = not jetpackState
    sampSetSpecialAction(jetpackState and 2 or 0)
end
            imgui.ToggleButton(faicons.ICON_FA_COPY..u8" Double Hit", aim.CheckBox.teste33)
            imgui.ToggleButton(faicons.ICON_FA_USER..u8" No Clip", aim.CheckBox.teste34)
            imgui.SameLine(nil, 6)
            imgui.TextQuestion(u8'Use Q/E e shift/ctrl para mover-se')
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Grudar nos Jogadores", aim.CheckBox.teste43)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Surf", aim.CheckBox.teste44)
			imgui.SameLine(nil, 6)
            imgui.TextQuestion(u8'Pressione K para ativar')
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Morte Falsa", aim.CheckBox.teste45)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Modo Noturno", aim.CheckBox.teste46)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Visao Noturna", aim.CheckBox.teste47)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Corrida Infinita", aim.CheckBox.teste236)
			if imgui.ToggleButton(faicons.ICON_FA_USER .. " Derrubar com 1 soco", aim.CheckBox.teste239) then
				memory.setint8(9867635, 1)
				end

				if not aim.CheckBox.teste239[0] then
					memory.setint8(9867635, 0)
				end

			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Barra de vida", aim.CheckBox.teste48)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Puxar vida", aim.CheckBox.teste49)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Informacoes do meu jogador", aim.CheckBox.teste50)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Super Pulo", aim.CheckBox.teste221)		
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Congelar Jogador", aim.CheckBox.teste52)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Fake Mobile", aim.CheckBox.teste55)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Ocultar chat ao mirar ou correr", aim.CheckBox.teste57)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Bloquear Animacoes do servidor", aim.CheckBox.teste59)
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Ficar encima de um objeto", aim.CheckBox.teste54)
            imgui.ToggleButton(faicons.ICON_FA_BROADCAST_TOWER..u8" Sem Radio", aim.CheckBox.teste36)
			if imgui.ToggleButton(faicons.ICON_FA_ERASER..u8' Limpar Chat', aim.CheckBox.teste40) then
                    memory.fill(sampGetChatInfoPtr() + 306, 0x0, 25200)
                    memory.write(sampGetChatInfoPtr() + 306, 25562, 4, 0x0)
                    memory.write(sampGetChatInfoPtr() + 0x63DA, 1, 1)
                    end
			if imgui.ToggleButton(faicons.ICON_FA_FIRE..u8' Pegar Fogo', aim.CheckBox.teste41) then
                    startCharFire(PLAYER_PED)
                    end
			
			imgui.ToggleButton(faicons.ICON_FA_USER..u8" Fast Spawn (Voce Morre e nasce imediatamente)", aim.CheckBox.teste42)		
			elseif category_id == 2 then
			imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Wall Hack Nomes + Linha", aim.CheckBox.teste225)
			imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Wall Hack Distancia", aim.CheckBox.teste238)
			imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Wall Hack Linha", aim.CheckBox.teste15)
			if aim.CheckBox.teste15[0] then
			imgui.SliderFloat('Grossura do wh linha', floatbuffer10, 1, 10)
			end
			imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Wall Hack Ossos", aim.CheckBox.teste14)
			if aim.CheckBox.teste14[0] then
			imgui.SliderFloat('Grossura do wh ossos', floatbuffer9, 1, 10)
			end
			imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Wall Hack Chams", aim.CheckBox.teste224)
			imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Wall Hack Players na tela", aim.CheckBox.teste138)
            imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Wall Hack Caixa", aim.CheckBox.teste16)
			if aim.CheckBox.teste16[0] then
			imgui.SliderFloat('Grossura do wh caixa', floatbuffer11, 1, 10)
			end
			imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Wall Hack Caixa 3D", aim.CheckBox.teste149)
			imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Wall Hack Sobeit", aim.CheckBox.teste234)
			imgui.SameLine(nil, 6)
			imgui.TextQuestion(u8'Aperte F5 para ativar/desativar')
            imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Wall Hack Skin ID", aim.CheckBox.teste17)
            imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Wall Hack Informacoes", aim.CheckBox.teste73)
            imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Wall Hack Veiculos", aim.CheckBox.teste18)
			if aim.CheckBox.teste18[0] then
			imgui.SliderFloat('Grossura do wh veiculos', floatbuffer8, 1, 10)
			end
			imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Wall Hack Veiculos V2", aim.CheckBox.teste235)
			imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Wall Hack Info Veiculo", aim.CheckBox.teste116)
			imgui.ToggleButton(faicons.ICON_FA_EYE..u8" Desenhar FOV", aim.CheckBox.teste153)
			if aim.CheckBox.teste153[0] then
			imgui.SliderFloat('Tamanho do fov', floatbuffer7, 1, 10)
			end
        elseif category_id == 3 then
        imgui.ToggleButton(faicons.ICON_FA_HOME..u8" Renderizar casas compradas", aim.CheckBox.teste61)
        imgui.ToggleButton(faicons.ICON_FA_GIFT..u8" Renderizar Caixa RP", aim.CheckBox.teste62)
        imgui.ToggleButton(faicons.ICON_FA_GIFT..u8" Renderizar Caixa Natal", aim.CheckBox.teste63)
        imgui.ToggleButton(faicons.ICON_FA_GIFT..u8" Renderizar Caixa Bronze", aim.CheckBox.teste66)
        imgui.ToggleButton(faicons.ICON_FA_GIFT..u8" Renderizar Caixa Ouro", aim.CheckBox.teste67)
        imgui.ToggleButton(faicons.ICON_FA_GIFT..u8" Renderizar Caixa Prata", aim.CheckBox.teste68)
        imgui.ToggleButton(faicons.ICON_FA_GIFT..u8" Renderizar Caixa Hallowen", aim.CheckBox.teste69)
        imgui.ToggleButton(faicons.ICON_FA_HOME..u8" Renderizar Casas liberadas/avenda", aim.CheckBox.teste64)
        imgui.ToggleButton(faicons.ICON_FA_EGG..u8" Renderizar Ovos de pascoa", aim.CheckBox.teste65)
        imgui.ToggleButton(faicons.ICON_FA_HOME..u8" Renderizar Fazendas", aim.CheckBox.teste70)
        imgui.ToggleButton(faicons.ICON_FA_HOME..u8" Renderizar Empresas", aim.CheckBox.teste71)
        imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Renderizar armas dropadas", aim.CheckBox.teste72)
    elseif category_id == 4 then
		imgui.ToggleButton(faicons.ICON_FA_BICYCLE..u8" Super pulo de bike", aim.CheckBox.teste237)
		imgui.SameLine(nil, 6)
		imgui.TextQuestion(u8'Tecla C para ativar')
        imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Fps up car", aim.CheckBox.teste74)
        imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Dancar com o carro", aim.CheckBox.teste76)
        imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'(J-L-K-I-U-O) para dancar com o carro')
        imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Modo Tank", aim.CheckBox.teste77)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Status do veiculo", aim.CheckBox.teste106)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Anexar Reboque", aim.CheckBox.teste134)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" TP veiculo proximo", aim.CheckBox.teste130)
	    imgui.SameLine(nil, 6)
		imgui.TextQuestion(u8'Aperte END para se teletransportar para o veiculo mais proximo de voce')
        imgui.ToggleButton(faicons.ICON_FA_CAR..u8" GM Carro", aim.CheckBox.teste78)
		imgui.ToggleButton(faicons.ICON_FA_CAR_ALT..u8" Deletar Carros", aim.CheckBox.teste24)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Carro RGB", aim.CheckBox.teste140)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Imundar lataria do veiculo", aim.CheckBox.teste178)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Nao cair de motos/bicicletas", aim.CheckBox.teste177)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Adicionar Hydraulicas ao veiculo", aim.CheckBox.teste176)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Saida rapida", aim.CheckBox.teste175)
		imgui.SameLine(nil, 6)
		imgui.TextQuestion(u8'Aperte U+J para sair rapidamente do veiculo')
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Ver id dos carros", aim.CheckBox.teste155)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Boost Veiculo", aim.CheckBox.teste137)
		imgui.SameLine(nil, 6)
		imgui.TextQuestion(u8'Pressione Shift para ativar o speed hack')
		if aim.CheckBox.teste137[0] then
		imgui.SliderFloat('Velocidade', floatbuffer3, 1, 10)
		end
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Dirigir na agua", aim.CheckBox.teste92)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Consertar Rodas", aim.CheckBox.teste93)
		imgui.SameLine(nil, 6)
		imgui.TextQuestion(u8'Aperte X para consertar a roda')
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Bug da setinha", aim.CheckBox.teste91)
		imgui.SameLine(nil, 6)
		imgui.TextQuestion(u8'Em uma motocicleta/bike/quad: mantenha a tecla W | Durante a corrida: segure W + 1 | Ao nadar: pressione | De bicicleta: segure shift esquerdo')
        imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Voar com Carro", aim.CheckBox.teste81)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Destrancar Veiculos", aim.CheckBox.teste242)
			imgui.SameLine(nil, 6)
            imgui.TextQuestion(u8'Aperte A+B para destrancar os veiculos da area de stream')
        if imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Nao ser ejetado", aim.CheckBox.teste82) then
            naoejetado = not naoejetado
        end
		
        imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Desvirar Carro", aim.CheckBox.teste79)
        imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Aperte o botao direito do mouse para desvirar o seu veiculo')
        imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Handling", aim.CheckBox.teste80)
		if imgui.ToggleButton(faicons.ICON_FA_CAR .. u8" Dirigir sem licensa", aim.CheckBox.teste223) then
			nolic = not nolic
			sampAddChatMessage(' ' .. (nolic and '{00AA00}Ativado' or '{AA0000}Desativado'), 0x007FFF)
		end
		
		if nolic and isCharInAnyCar(1) and ((os.clock() - firstTimeSitInCar) > 1) then
			sampForceOnfootSync()
			sampSendEnterVehicle(select(2, sampGetVehicleIdByCarHandle(storeCarCharIsInNoSave(1))))
		end
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Gasolina Infinita", aim.CheckBox.teste148)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Auto Reparo", aim.CheckBox.teste126)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Car Shot", aim.CheckBox.teste127)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Nitro Infinito", aim.CheckBox.teste197)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Girar Veiculo", aim.CheckBox.teste198)
		imgui.SameLine(nil, 6)
		imgui.TextQuestion(u8'Aperte R')
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Heavy", aim.CheckBox.teste128)
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Conducao Segura", aim.CheckBox.teste125)
		imgui.SameLine(nil, 6)
		imgui.TextQuestion(u8'Quando voce mantem pressionado o RMB em um veiculo, o modo "Ramming Loshpeds" e ativado. Usando este modo, voce pode colidir com os Loshpeds! Se eles esbarrarem em voce enquanto segura RMB, voce estara fodido		')
		imgui.ToggleButton(faicons.ICON_FA_CAR..u8" Pilares Inatingiveis", aim.CheckBox.teste124)
		imgui.SameLine(nil, 6)
		imgui.TextQuestion(u8'Quando voce bate em um poste de luz ou em uma pequena cerca na beira da estrada, seu carro nao gira 21324125 graus em todos os eixos, mas voce continuara dirigindo com calma e o objeto contra o qual bateu simplesmente quebrara.		')
		imgui.ToggleButton(faicons.ICON_FA_PLANE..u8" Mira para o hydra", aim.CheckBox.teste94)
		imgui.ToggleButton(faicons.ICON_FA_PLANE..u8" Hydra Skill", aim.CheckBox.teste139)
		imgui.SameLine(nil, 6)
		imgui.TextQuestion(u8'Remove o limite de tiros de um hydra e de uma arma leve')
		imgui.ToggleButton(faicons.ICON_FA_PLANE..u8" Helicoptero Keys", aim.CheckBox.teste95)
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'os controles de seta foram alterados, agora voce pode inclinar-se para frente pressionando SHIFT e inclinar-se para tras pressionando CTRL ou SPACE .')
        imgui.ToggleButton(faicons.ICON_FA_PLANE..u8" Aceleracao do Helicoptero", aim.CheckBox.teste96)
		imgui.SameLine(nil, 6)
		imgui.TextQuestion(u8'Ao pressionar a seta para frente, havera uma aceleracao significativa')
		imgui.ToggleButton(faicons.ICON_FA_PLANE..u8" Melhoria na agilidade/manobrabilidade do Helicoptero", aim.CheckBox.teste97)
		imgui.ToggleButton(faicons.ICON_FA_PLANE..u8" Helice Rapida", aim.CheckBox.teste98)
		imgui.ToggleButton(faicons.ICON_FA_PLANE..u8" GM Helicoptero", aim.CheckBox.teste99)
		imgui.ToggleButton(faicons.ICON_FA_PLANE..u8" Colisao das laminas", aim.CheckBox.teste100)
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'As laminas do helicoptero nao atingiram obstaculos')
	elseif category_id == 5 then
		imgui.Separator()
    imgui.Text(faicons.ICON_FA_MAGIC .." Criado Por:")
    imgui.SameLine()
    imgui.Link(u8" Scarllet SA-MP", u8"https://discord.gg/7QmDMkcrKw")
	imgui.Text(faicons.ICON_FA_HANDS_HELPING .. " Apoio ")
		imgui.SameLine()

			if imgui.Link("Chat GPT", true) then
				os.execute("")
			end
	imgui.Text(faicons.ICON_FA_GLOBE .. " Discord do criador: scarllettt")
    imgui.Text(faicons.ICON_FA_EXCLAMATION .. " Um script repleto de funcoes poderosas, totalmente gratuito")
	imgui.Separator()
    elseif category_id == 6 then
        imgui.Text(faicons.ICON_FA_GEM..u8" /PARMA")
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Puxe qualquer arma, use /parma (id da arma e a quantidade de municao)')
		imgui.Text(faicons.ICON_FA_GEM..u8" /SMENUPBAZUCA ")
		imgui.SameLine(nil, 6)
		imgui.TextQuestion(u8'Puxe uma bazuca (nao sei se ta dando kick kkk)')
        imgui.Text(faicons.ICON_FA_GEM..u8" /GRUDAR")
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Ative a funcao GRUDAR NOS JOGADORES primeiro e depois use /grudar e o id do jogador')
        imgui.Text(faicons.ICON_FA_GEM..u8" /TP")
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Use /tp para teletransportar para qualquer jogador.. (no stt (war em las vegas) esta dando tp para qualquer jogador no modo free roam)')
        imgui.Text(faicons.ICON_FA_GEM..u8" /SMENUFAKEKILL")
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Faca qualquer jogador te matar falsamente, use o comando /fakekill e o id do jogador e da arma')
		imgui.Text(faicons.ICON_FA_GEM..u8" /SMENUFAKEKILLV2 ")
		imgui.SameLine(nil, 6)
		imgui.TextQuestion(u8'Fake kill v2, o jogador ira te matar falsamente, ira floodar morte no chat kill')
        imgui.Text(faicons.ICON_FA_GEM..u8" /CARON ")
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Ative somente quando estiver no veiculo')
        imgui.Text(faicons.ICON_FA_GEM..u8" /SMENUSKIN ")
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Famoso fskin, puxe qualquer skin do samp')
        imgui.Text(faicons.ICON_FA_GEM..u8" /SMENUJETPACK ")
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Puxe um jetpack, dependendo do servidor ele pode resetar o jetpack')
        imgui.Text(faicons.ICON_FA_GEM..u8" /SMENUESPIAR")
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Espie/tele qualquer jogador perto de voce')
        imgui.Text(faicons.ICON_FA_GEM..u8" /SMENUKILL")
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'mate qualquer jogador por id, use o comando /smenukill e o id do jogador')
        imgui.Text(faicons.ICON_FA_GEM..u8" /SMENUCRASH ")
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Crashe os mobiles, em algumas cidades nao ira funcionar')
		imgui.Text(faicons.ICON_FA_GEM..u8" /SMENUFLYBYPASS ")
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Voce nao sera kickado por usar o noclip ou surf em algumas cidades')
		imgui.Text(faicons.ICON_FA_GEM..u8" /SMENUDESTRANCAR (ID DO VEICULO) ")
		imgui.Text(faicons.ICON_FA_GEM..u8" /SMENUCRIARVEH ")
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Puxe veiculos, infelizmente eh visual, mais da pra se divertir. exemplo de como spawnar: smenucriarveh 513 1 1')
	elseif category_id == 7 then
		imgui.ToggleButton(faicons.ICON_FA_SATELLITE.." Teleporte Marca", aim.CheckBox.teste101)
		if imgui.ToggleButton(faicons.ICON_FA_SATELLITE..u8' Setar Posicao [FARM]', aim.CheckBox.teste102) then
			if aim.CheckBox.teste102 then
				posX, posY, posZ = getCharCoordinates(PLAYER_PED)
			end	
		end
		
		if imgui.ToggleButton(faicons.ICON_FA_SATELLITE..u8' Teleportar para Posicao[FARM]', aim.CheckBox.teste103) then
			if aim.CheckBox.teste103 then
				setCharCoordinates(playerPed, posX, posY, posZ)
			end
		end

		imgui.ToggleButton(faicons.ICON_FA_SATELLITE..u8' Teleporte sem kick', aim.CheckBox.teste104)
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Marque o local no mapa e depois ative.')
		imgui.ToggleButton(faicons.ICON_FA_SATELLITE..u8' Piloto Automatico', aim.CheckBox.teste105)
		imgui.SameLine(nil, 6)
		imgui.TextQuestion(u8' Coloque uma marca no mapa e digite o comando /ap . Para regular a velocidade, escreva o comando /ap.speed <numero> (onde numero e a velocidade), para parar a maquina - /ap.stop')
	    if imgui.Button(u8'Prefeitura', imgui.ImVec2(-1, 0), imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1478.1964111328, -1768.5966796875, 18.795742034912) end
	if imgui.Button(u8'Pier de LS', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 372.56359863281, -1924.3315429688, 7.5459003448486)
end

    if imgui.Button(u8'Fazenda Snake', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, -1050.1379394531, -1193.2882080078, 128.99102783203)
end
					
                    if imgui.Button(u8'Fazenda 2 ', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -496.0, -1614.1, 6.7) end
                    if imgui.Button(u8'Posto de Gasolina Idlewood ', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1940.9970703125, -1772.8754882813, 13.640625) end
                    if imgui.Button(u8'Posto de Gasolina Idlewood ', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1940.9970703125, -1772.8754882813, 13.640625) end
                    if imgui.Button(u8'Posto de Gasolina Vinewood', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1004.0513305664, -937.53216552734, 42.328125) end
                    if imgui.Button(u8'Posto de Gasolina Flint', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -94.609550476074, -1167.8970947266, 2.5139181613922) end
                    if imgui.Button(u8'Posto de Gasolina Montgomery', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1383.1936035156, 465.18173217773, 20.19614982605) end
                    if imgui.Button(u8'Posto de Gasolina Whetstone', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -1608.7600097656, -2715.4501953125, 48.9453125) end
                    if imgui.Button(u8'Posto de Gasolina Dillimore', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 655.65386962891, -564.86437988281, 16.3359375) end
					if imgui.Button(u8'Alhambra', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1837.0396728516, -1682.3881835938, 13.322811126709) end
                    if imgui.Button(u8'Ten Green Bottles', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2310.046875, -1643.4952392578, 14.827047348022) end
                    if imgui.Button(u8'Pig Pen ', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2421.4692382813, -1219.2479248047, 25.561580657959) end
                    if imgui.Button(u8'Santa-Maria Club ', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 387.17837524414, -1817.8424072266, 7.84095287323) end
                    if imgui.Button(u8'Dillimore Club)', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 681.65246582031, -473.34588623047, 16.536296844482) end
                    if imgui.Button(u8'Laverra Bar', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 172.2103729248, -152.71015930176, 1.5752477645874) end
					if imgui.Button(u8'Ammo Nation de Los-Santos', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1368.9831542969, -1279.6940917969, 13.546875) end
                    if imgui.Button(u8'Ammo Nation de Las-Venturas', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 2155.0, 943.4, 10.8)
end

					if imgui.Button(u8'Ammo Nation de Willowfield', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2400.5166015625, -1981.9871826172, 13.546875) end
                    if imgui.Button(u8'Ammo Nation de Palomino Creek', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2333.0966796875, 61.568500518799, 26.70578956604) end
					imgui.Separator()
					imgui.Text(u8"                                                Loja de Roupas:")
					imgui.Separator()
					if imgui.Button(u8'Sub Urban ', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2112.8325195313, -1211.4580078125, 23.962867736816) end
                    if imgui.Button(u8'Binco', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2244.3754882813, -1665.5632324219, 15.4765625) end
                    if imgui.Button(u8'Victim', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 461.70254516602, -1500.7846679688, 31.045440673828) end
					imgui.Text(u8"                                                Concessionarias de carros:")
					if imgui.Button(u8'Concessionaria de motos ', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1015.3969116211, -1550.5540771484, 14.859375) end
                    if imgui.Button(u8'Concessionaria de LS ', imgui.ImVec2(-1, 0)) then setCblharCoordinates(1, 2131.6999511719, -1151.3000488281, 24.061372756958) end
                    if imgui.Button(u8'Concessionaria de LS 2', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 542.27917480469, -1293.7728271484, 17.262386322021) end
                    if imgui.Button(u8'Elite Cars', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 942.90002441406, -1477.4000244141, 13.546875) end
	imgui.Separator()
	
    imgui.Text(u8"                                                Rede Paradox Teleportes")
	
	
	
if imgui.Button(u8'Spawn LS', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1152.0, -1770.5, 16.0)
end

if imgui.Button(u8'Prefeitura LS', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1478.1964111328, -1768.5966796875, 18.795742034912)
end

if imgui.Button(u8'Final do parkour| Lan house', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1997.6, -3202.3, 95.7)
end

	
	if imgui.Button(u8'Lan House', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1273.5, -1729.9, 13.6)
end

if imgui.Button(u8'Esgoto', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1362.2, -1736.7, 13.4)
end

if imgui.Button(u8'Praca LS', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1481.6, -1699.5, 14.0)
end

if imgui.Button(u8'Centro de Licencas', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1411.5, -1699.6, 13.5)
end

if imgui.Button(u8'Penitenciaria', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1797.5, -1579.0, 14.1)
end

if imgui.Button(u8'Hospital', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1172.1, -1323.4, 15.4)
end

if imgui.Button(u8'Banco', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1465.2, -1009.9, 26.8)
end

if imgui.Button(u8'Loterica', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1631.7, -1163.7, 23.9)
end

if imgui.Button(u8'Mercado Negro', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1615.6, -1498.4, 14.2)
end

if imgui.Button(u8'Motel', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 925.4, -1716.6, 13.5)
end

if imgui.Button(u8'Puteiro', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 2421.4, -1228.7, 24.9)
end

if imgui.Button(u8'Motel Jefferson', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 2223.8, -1159.8, 25.7)
end

if imgui.Button(u8'Fabrica de drogas', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 279.9, -213.8, 1.4)
end

if imgui.Button(u8'Imobiliaria', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 333.5, -1343.1, 14.5)
end

if imgui.Button(u8'Loja de acessorios', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1328.7, -1277, 13.4)
end

    imgui.Text(u8"                                              Rede Paradox| HQ de empregos")
	
if imgui.Button(u8'HQ advogados', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1657.2, -1399.0, 13.5)
end

if imgui.Button(u8'HQ caminhoneiros', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, -75.2, -1141.7, 4.2)
end

if imgui.Button(u8'HQ segurancas', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 2031.9, -1337.9, 23.8)
end

if imgui.Button(u8'HQ motorista de onibus', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1797.7, -2353, 13.5)
end

if imgui.Button(u8'HQ fazendeiros', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, -99.3, -24.1, 3.1)
end
if crashserv then
	slot0 = false
	slot1, slot2, slot3 = getCharCoordinates(PLAYER_PED)
	slot4 = getCharCoordinates(PLAYER_PED)

	for slot8, slot9 in pairs(getAllVehicles()) do
		slot10, slot24.vehicleId = sampGetVehicleIdByCarHandle(slot9)

		if slot10 and getDriverOfCar(slot9) == -1 and getDistanceBetweenCoords3d(slot1, slot2, slot3, getCarCoordinates(slot9)) < 20000 then
			slot12, slot13, slot14 = getCarCoordinates(slot9)
			slot15 = -math.rad(getHeadingFromVector2d(slot12 - slot1, slot13 - slot2))
			slot16 = getDistanceBetweenCoords3d(slot12, slot13, slot14, slot1, slot2, slot3)
			slot17, slot18, slot19 = getCharCoordinates(PLAYER_PED)
			slot20 = math.random(-20, 20)
			slot21 = math.random(-20, 20)
			slot22 = math.random(-20, 20)
			slot23 = 0 / 0
			slot24 = samp_create_sync_data("unoccupied")
			slot24.seatId = slot23
			slot24.vehicleHealth = slot23
			slot24.roll = {
				-0.99413418769836,
				-0.10728088766336,
				0.01371858920902
			}
			slot24.direction = {
				0.10740028321743,
				-0.99418157339096,
				0.0082817962393165
			}
			slot24.moveSpeed = {
				0.06,
				0,
				0
			}
			slot24.position = {
				slot1 - math.random(-20, 20),
				slot2 - math.random(-20, 20),
				slot3 - math.random(-20, 20)
			}

			slot24.send()

			slot24.position = {
				slot1 - math.random(-20, 20),
				slot2 - math.random(-20, 20),
				slot3 - math.random(-20, 20)
			}

			slot24.send()

			slot28 = 20
			slot24.position = {
				slot1 - math.random(-20, 20),
				slot2 - math.random(-20, 20),
				slot3 - math.random(-20, slot28)
			}

			slot24.send()

			for slot28 = 1, 2 do
				slot24.position = {
					slot17 - math.random(-90, 90),
					slot18 - math.random(-90, 90),
					slot18 - math.random(-90, 90)
				}

				slot24.send()

				slot24.position = {
					slot17 - math.random(-90, 90),
					slot18 - math.random(-90, 90),
					slot18 - math.random(-90, 90)
				}

				slot24.send()
			end

			wait(0)
		end
	end

	wait(500)
end
if imgui.Button(u8'HQ lixeiros', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 2195.7, -1977.2, 13.6)
end

if imgui.Button(u8'Hq agente penitenciario', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1797.5, -1579.0, 14.1)
end

if imgui.Button(u8'HQ coveiro', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 929.4, -1090.7, 24.3)
end

if imgui.Button(u8'HQ carteiro', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1227.8, -987.2, 43.5)
end

if imgui.Button(u8'HQ pizzaboy', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 2091.6, -1807.6, 13.5)
end

if imgui.Button(u8'HQ minerador', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1059.3, -72.9, 21.9)
end

if imgui.Button(u8'HQ sorveteiro', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 976.2, -1264.4, 17.0)
end

if imgui.Button(u8'HQ vendedor de produtos LS', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1772.3, -2025, 14.1)
end

if imgui.Button(u8'HQ taxista', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 621.8, -1510.4, 15.0)
end

if imgui.Button(u8'HQ carro forte', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1540.4, -1014.1, 24.1)
end

if imgui.Button(u8'Vendedor de produtos LV', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 2766.9, 914.0, 11.1)
end

imgui.Text(u8"                                              Rede Paradox| Fazendas")

if imgui.Button(u8'Fazenda ID 0', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, -375.1, -1439.8, 25.7)
end

if imgui.Button(u8'Fazenda ID 1', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, -21.7, -2507.6, 36.7)
end

if imgui.Button(u8'Fazenda ID 2', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, -1090.2, -1635.7, 76.4)
end

if imgui.Button(u8'Fazenda ID 3', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, -1441.1, -1535.9, 101.8)
end

imgui.Text(u8"                                              Rede Paradox| Entregar| Caminhoneiro")

if imgui.Button(u8'Entrega BaySide', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, -2390.9, 2217.0, 5.6)
end

imgui.Text(u8"                                              Horizonte Roleplay")

if imgui.Button(u8'Aeroporto LS/Spawn LS', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1685.6, -2238.2, 13.5)
end

if imgui.Button(u8'Estacionamento Aeroporto LS', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1542.0, -2273.3, 13.5)
end

if imgui.Button(u8'Prefeitura HZRP', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1478.1964111328, -1768.5966796875, 18.795742034912)
end

if imgui.Button(u8'Estacionamento Prefeitura', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1483.0, -1723.0, 13.4)
end

if imgui.Button(u8'Departamento de Policia Civil', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1554.3, -1675.6, 16.2)
end

if imgui.Button(u8'Cobertura do Departamento de Polica Civil', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1568.4, -1690.5, 5.9)
end

if imgui.Button(u8'Banco HZRP', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 913.3, -994.6, 38.1)
end

if imgui.Button(u8'Concessionaria HZRP', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 542.1, -1293.3, 17.2)
end

if imgui.Button(u8'Estacionamento Concessionaria HZRP', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 565.8, -1282.6, 17.2)
end

if imgui.Button(u8'Producao de Materiais', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, -2156.9, -245.9, 36.5)
end

if imgui.Button(u8'Fazenda de drogas', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, -1019.8, -1635.9, 76.4)
end

if imgui.Button(u8'Desmanche de veiculos (LADO DE DENTRO)', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 566.3, 1197.6, 12.8)
end

if imgui.Button(u8'Desmanche de veiculos (LADO DE FORA)', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 549.8, 1188.7, 12.7)
end

if imgui.Button(u8' Mercado negro', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 2383.6, -649.1, 127.4)
end

if imgui.Button(u8'Industria de mercadoria', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, -163.2, -216.9, 1.4)
end

imgui.Text(u8"                                              Horizonte Roleplay| HQ Empregos")

if imgui.Button(u8' HQ taxista', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1588.8, -2221.9, 13.6)
end

if imgui.Button(u8' HQ gari', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 2210.2, -2022.8, 13.5)
end

if imgui.Button(u8' HQ cortador de grama', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1953.6, -1161.9, 20.9)
end

if imgui.Button(u8' HQ Motorista de onibus', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 2521.1, -2116.5, 13.5)
end

if imgui.Button(u8' HQ Operador de empilhadeira', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 2744.1, -2461.6, 13.6)
end

if imgui.Button(u8' HQ Coveiro', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 940.8, -1086.3, 24.3)
end

if imgui.Button(u8' HQ Maquinista', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 821.8, -1356.2, 13.5)
end

if imgui.Button(u8' HQ Bombeiros', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, -2024.0, 67.1, 28.5)
end

if imgui.Button(u8' HQ Cacador', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, -1640.6, -2239.3, 31.5)
end

if imgui.Button(u8' HQ Dnit', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 161.9, -51.5, 1.6)
end

if imgui.Button(u8' HQ Jornalista', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 1221.3, -1815.5, 16.6)
end

if imgui.Button(u8' HQ Petroleiro', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 299.0, 1415.2, 9.6)
end

if imgui.Button(u8' HQ Transportador', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 2748.4, -1449.2, 13.6)
end
imgui.Text(u8"                                              Garagems de Pinturas")

if imgui.Button(u8'Garagem de pintura 1', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 2644.5, -2030.6, 13.5)
end
	imgui.Text(u8"                                                Restaurantes:")
	 if imgui.Button(u8'Idlewood Pizza', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2105.48828125, -1806.4924316406, 13.5546875) end
    if imgui.Button(u8'Cluckin Bell', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2397.8305664063, -1899.1685791016, 13.546875) end
    if imgui.Button(u8'Cluckin Bell 2', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2419.7043457031, -1509.0753173828, 24) end
    if imgui.Button(u8'Burger Time', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1038.2746582031, -1340.7316894531, 13.741436004639) end
    if imgui.Button(u8'Vinewood Burger', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1199.3143310547, -918.13702392578, 43.122867584229) end
    if imgui.Button(u8'Marina Burger', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 810.48480224609, -1616.1948242188, 13.546875) end
    if imgui.Button(u8'Montgomery Pizza', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1367.5319824219, 248.43533325195, 19.566932678223) end
    if imgui.Button(u8'McDonalds', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1726.2082519531, -1451.3031005859, 13.926980018616) end
    if imgui.Button(u8'Palomino Creek Pizza', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2331.8149414063, 75.006401062012, 26.620975494385) end
	imgui.Separator()
if imgui.Button(u8'Bugar Jogador', imgui.ImVec2(-1, 0)) then
    setCharCoordinates(1, 258.5, -4.5, 5.5)
end

if imgui.Button(u8'Aeroporto de LS', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1959.6827392578, -2188.9782714844, 13.546875) end
if imgui.Button(u8'ea de San Fierro', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -2488.4272460938, -1642.6081542969, 483.9921875) end
if imgui.Button(u8'El Corona', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1833.6618652344, -1842.6287841797, 13.578125) end
if imgui.Button(u8'Verona', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1081.3001708984, -1696.9486083984, 13.546875) end
if imgui.Button(u8'Flint', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -78.371086120605, -1169.8858642578, 2.1355676651001) end
if imgui.Button(u8'Dillimore', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 691.14813232422, -506.2737121582, 16.3359375) end
if imgui.Button(u8'Glen Park', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1836.5141601563, -1445.0113525391, 13.596225738525) end
if imgui.Button(u8'East Los Santos', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2713.5778808594, -1108.9180908203, 69.578239440918) end
if imgui.Button(u8'Willowfield', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2723.8000488281, -2026.6881103516, 13.547199249268) end
if imgui.Button(u8'Ganton', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2424.2973632813, -1742.7287597656, 13.546577453613) end
if imgui.Button(u8'Whetstone', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -1562.6029052734, -2733.0229492188, 48.743457794189) end
	if imgui.Button(u8'Las-Colinas', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2792.8869628906, -1087.5419921875, 30.71875) end
    if imgui.Button(u8'Downtown LS', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1310.1291503906, -1366.796875, 13.506427764893) end
	if imgui.Button(u8'Commerce Restaurant', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1498.4421386719, -1580.5283203125, 13.549827575684) end
    if imgui.Button(u8'Local Bugado', imgui.ImVec2(-1, 0), imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 0, 0, 0) end
	if imgui.Button(u8'Centro de licencas', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1415.5, -1702.8000488281, 13.539485931396) end
	if imgui.Button(u8'Grove Street', imgui.ImVec2(-1, 0), imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2492.0607910156, -1665.0775146484, 13.343752) end
    if imgui.Button(u8'Conselho Militar', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 573.20001220703, -1574.1999511719, 16.1796875) end
    if imgui.Button(u8'Cassino', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1022.5225219727, -1127.1722412109, 23.890293121338) end
    if imgui.Button(u8'Centro de Entretenimento', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 369.8337097168, -2044.2868652344, 7.671875) end
    if imgui.Button(u8'Local de Spawn (Cidade)', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 338.46868896484, -1525.4985351563, 33.307426452637) end
    if imgui.Button(u8'Local de Spawn (Estacao)', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1153.1375732422, -1755.5554199219, 13.627891540527) end
    if imgui.Button(u8'Igreja', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 307.96365356445, -220.8189239502, 1.5688990354538) end
		 if imgui.Button(u8'Fabrica LS/SF', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -51.262928009033, -231.53201293945, 6.7646160125732) end
		 if imgui.Button(u8'Casino Gold Stars', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1022.1699829102, -1133.9000244141, 23.828125) end
		 if imgui.Button(u8'Caligulas Palace Casino', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2179.212890625, 1676.203125, 11.046875) end
		 if imgui.Button(u8'Casino Floor Casino', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1658.6943359375, 2259.54443359375, 10.8203125) end
		 if imgui.Button(u8'Club', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2507.13940429688, 1247.13256835938, 10.8203125) end
		 if imgui.Button(u8'Girls XXX Strip Club', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2506.6494140625, 2129.15478515625, 10.8203125) end
		 if imgui.Button(u8'Lemmings Pedestrians', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2014.46105957031, 2356.97924804688, 10.8203125) end
		 if imgui.Button(u8'Nude Strippers Daily Strip Club', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2543.13793945313, 1018.91442871094, 10.8125171661377) end
		 if imgui.Button(u8'Police Hq LV', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2286.89965820313, 2424.51220703125, 10.8203125) end
		 if imgui.Button(u8'Spawn De LS', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1682.73156738281, -2264.05786132813, 13.5079345703125) end
		 if imgui.Button(u8'Alhambra Club', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1828.20690917969, -1682.60571289063, 13.546875) end
		 if imgui.Button(u8'Los Santos : Atrium', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1722.0576171875, -1605.82824707031, 13.546875) end
if imgui.Button(u8'Los Santos : Candy Suxx Billboard', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 419.148376464844, -1368.41320800781, 41.140625) end
if imgui.Button(u8'Los Santos : Cathay Theater', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1022.50787353516, -1133.8857421875, 23.828125) end
if imgui.Button(u8'Los Santos : Cemetery', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 832.375915527344, -1101.96203613281, 24.296875) end
if imgui.Button(u8'Los Santos : CJs home', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2495.32275390625, -1685.42651367188, 13.5127220153809) end
if imgui.Button(u8'Los Santos : Colonel Fuhrbergers', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2820.60961914063, -1182.16235351563, 25.232967376709) end
if imgui.Button(u8'Los Santos : Didier Sachs Shop', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 450.887725830078, -1479.1318359375, 30.8057765960693) end
if imgui.Button(u8'Los Santos : Ghost Graffiti', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 927.000305175781, -1058.16821289063, 24.7002906799316) end
if imgui.Button(u8'Los Santos : Grotti (Ferrari) Billboard', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 487.795166015625, -1326.62707519531, 28.0078125) end
if imgui.Button(u8'Los Santos : GTA III and GTA: Vice City logos', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 788.071899414063, -1035.47729492188, 24.6282062530518) end
if imgui.Button(u8'Los Santos : Highest building of Los Santos', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1531.17175292969, -1357.61804199219, 329.453460693359) end
if imgui.Button(u8'Los Santos : Inside Track Betting', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1631.77648925781, -1167.0690979688, 24.078125) end
if imgui.Button(u8'Los Santos : Jefferson Hotel', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2221.89038085938, -1159.849609375, 25.7330799102783) end
if imgui.Button(u8'Los Santos : Jesus Saves', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2719.21704101563, -2009.17846679688, 13.5546875) end
if imgui.Button(u8'Los Santos : Lemmings Pole', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2392.33569335938, -1511.87316894531, 23.8348655700684) end
if imgui.Button(u8'Los Santos : Lowrider Competition', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1816.08728027344, -1929.91040039063, 13.5433483123779) end
if imgui.Button(u8'Los Santos : Market Station', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 826.761840820313, -1358.68713378906, -0.5078125) end
if imgui.Button(u8'Los Santos : Observatory', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1191.98645019531, -2036.88049316406, 69.0078125) end
if imgui.Button(u8'Los Santos : Ocean Docks', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2184.40185546875, -2260.38232421875, 13.4100790023804) end
if imgui.Button(u8'Los Santos : Police brutality', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1540.00646972656, -1627.77075195313, 13.3828125) end
if imgui.Button(u8'Los Santos : Police Departament', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1540.84509277344, -1675.45324707031, 13.5513896942139) end
if imgui.Button(u8'Los Santos : Roboi\'s Food Mart', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1350.62097167969, -1744.802734375, 13.3808469772339) end
if imgui.Button(u8'Los Santos : Stadium', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2684.78198242188, -1689.56359863281, 9.43039894104004) end
if imgui.Button(u8'Los Santos : Ten Green Bottles', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2304.39965820313, -1651.30908203125, 14.5202884674072) end
if imgui.Button(u8'Los Santos : The Pig Pen Strip Club', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2421.12280273438, -1228.55883789063, 24.8796482086182) end
if imgui.Button(u8'Los Santos : Tiki Theater', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2348.78637695313, -1463.54272460938, 24) end
if imgui.Button(u8'Los Santos : Triathalon', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 181.06819152832, -1866.71862792969, 3.04375839233398) end
if imgui.Button(u8'Los Santos : Verona Beach Gym', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 666.700561523438, -1880.67272949219, 5.46000003814697) end
if imgui.Button(u8'Los Santos : Vinewood Sign', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1386.48901367188, -822.793640136719, 73.6923141479492) end
if imgui.Button(u8'Los Santos : Vice City Hidden Package', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2354.03198242188, -1467.3642578125, 31.9559421539307) end
if imgui.Button(u8'Palomino Creek : Bank', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2306.333984375, -15.3912973403931, 26.7495651245117) end
if imgui.Button(u8'Palomino Creek : Cementry', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2240.06396484375, -61.6567649841309, 26.50661277771) end
if imgui.Button(u8'Palomino Creek : Empty Diner', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2337.83618164063, 6.2173113822937, 26.484375) end
if imgui.Button(u8'Palomino Creek : Glowing headstones', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2240.09130859375, -70.5344467163086, 26.5068187713623) end
if imgui.Button(u8'Palomino Creek : Rusty Wheelchair', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2123.24487304688, -90.2263793945313, 2.16398048400879) end
if imgui.Button(u8'Palomino Creek : Triathalon', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2139.28759765625, -65.8627624511719, 2.96075963973999) end
if imgui.Button(u8'Montgomery : Biowaste Well', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1277.96606445313, 292.559906005859, 19.5546875) end
if imgui.Button(u8'Montgomery : Inside Track Betting', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 1292.03247070313, 269.481689453125, 19.5546875) end
if imgui.Button(u8'Dillimore : Max Pane - Bulletproof Glass', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 658.372924804688, -569.527587890625, 16.3359375) end
if imgui.Button(u8'Dillimore : Police Departament', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 635.456298828125, -571.612915039063, 16.3359375) end
if imgui.Button(u8'Blueberry : Liquor Store', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 254.497406005859, -66.0255889892578, 1.578125) end
if imgui.Button(u8'Blueberry : Locals Only Shop', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 276.548187255859, -157.536209106445, 1.5704517364502) end
if imgui.Button(u8'Fern Ridge : Catalina\'s Ex-boyfriends', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 843.333190917969, -23.9582138061523, 62.7258110046387) end
if imgui.Button(u8'Angel Pine : Vice City Maps', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -2177.60961914063, -2437.34497070313, 30.625) end
if imgui.Button(u8'Flint County : Nazca Symbol', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -687.696716308594, -1017.00006103516, 73.6602172851563) end
if imgui.Button(u8'Flint County : Suicidal Photographer', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -61.9707489013672, -1622.80908203125, 3.51299381256104) end
if imgui.Button(u8'Red County : North Rock', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, 2570.11279296875, -644.1416015625, 136.548034667969) end
if imgui.Button(u8'San Fierro : Actual Piece of Cable', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -2540.97973632813, 1228.51245117188, 37.421875) end
if imgui.Button(u8'San Fierro : Airport', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -1425.78784179688, -292.410827636719, 14.1484375) end
if imgui.Button(u8'San Fierro : Big Pointy Building', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -1754.5322265625, 885.199584960938, 295.875) end
if imgui.Button(u8'Mercado Negro', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -2072.2719726563, 1551.2646484375, 13.423308372498) end
if imgui.Button(u8'Armazem de Atacado', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -51.262928009033, -231.53201293945, 6.7646160125732) end
    if imgui.Button(u8'Armazem de Serraria', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -531.00122070313, -71.339096069336, 62.767597198486) end
    if imgui.Button(u8'Fabrica de Armas', imgui.ImVec2(-1, 0)) then setCharCoordinates(1, -583.08642578125, -505.21231079102, 25.56462097168) end
	elseif category_id == 8 then
		if imgui.ToggleButton(faicons.ICON_FA_ARROW_UP .. u8' Tapa para cima', aim.CheckBox.teste108) then
			local X, Y, Z = getCharCoordinates(PLAYER_PED)
         setCharCoordinates(PLAYER_PED, X, Y, Z+10)
		end
		if imgui.ToggleButton(faicons.ICON_FA_ARROW_DOWN .. u8' Tapa para baixo', aim.CheckBox.teste109) then
			local X, Y, Z = getCharCoordinates(PLAYER_PED)
         setCharCoordinates(PLAYER_PED, X, Y, Z-10)
		end

		imgui.ToggleButton(faicons.ICON_FA_UNDO.. u8' Player 360', aim.CheckBox.teste202)
		imgui.ToggleButton(faicons.ICON_FA_UNDO.. u8' Carro 360', aim.CheckBox.teste203)
		imgui.ToggleButton(faicons.ICON_FA_USER..u8" Anim Fuck", aim.CheckBox.teste216)
		imgui.ToggleButton(faicons.ICON_FA_EXCLAMATION_TRIANGLE..u8" Bypass", aim.CheckBox.teste233)
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Esse bypass serve para voce matar todos os jogadores, utilize algum mod pra matar os jogadores, pois o menu nao tem essa funcao ainda. resumindo: o bypass serve para voce nao ser kickado ao azaralhar no servidor com algum mod.')
		imgui.ToggleButton(faicons.ICON_FA_USER..u8" Piloto Automatico", aim.CheckBox.teste217)
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Marque o local no mapa e ative')
		if imgui.ToggleButton(faicons.ICON_FA_OBJECT_UNGROUP..u8" Nao deixar objeto cair", aim.CheckBox.teste213) then
		naocairob = not naocairob
		end
		imgui.ToggleButton(faicons.ICON_FA_USER.. u8' Radar RGB', aim.CheckBox.teste110)
		if imgui.ToggleButton(faicons.ICON_FA_USER .. u8' Efeito Radiacao', aim.CheckBox.teste111) then
			lua_thread.create(function()
				repeat
					setCharHealth(PLAYER_PED, getCharHealth(PLAYER_PED) - 1)
					wait(1000)
				until not aim.CheckBox.teste111[0] or getCharHealth(PLAYER_PED) == 3 
			end)
		end
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'A cada segundo voce tera 1 HP retirado ate que restem 3 HP')
		imgui.ToggleButton(faicons.ICON_FA_USER .. u8' Atirar estando na agua', aim.CheckBox.teste115)
		if imgui.ToggleButton(faicons.ICON_FA_USER .. u8' Puxar Colete', aim.CheckBox.teste113) then
			addArmourToChar(PLAYER_PED, 100)
		end
		
		
		if imgui.ToggleButton(faicons.ICON_FA_USER .. u8' Puxar Vida', aim.CheckBox.teste114) then
			lua_thread.create(function()
				setCharHealth(PLAYER_PED, math.min(100 + getCharHealth(PLAYER_PED), 100))
			end)
		end
		imgui.SameLine(nil, 5)

        imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
		if imgui.Button(faicons.ICON_FA_EXCLAMATION_TRIANGLE .. ' Fake Spawn') then
			aim.CheckBox.teste30[0] = not aim.CheckBox.teste30[0]
		end
        
		imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
		if imgui.Button(faicons.ICON_FA_EXCLAMATION_TRIANGLE .. ' Voip Troll') then
			votroll = not votroll
			ready = false
			freezeCharPosition(PLAYER_PED, votroll)
			prepare()
			sampAddChatMessage('Iniciando Voip ' .. (votroll and '{00FF00}Sucesso' or '{FF0000}Falha'), -1)
			if votroll then
				sampAddChatMessage('Audio enviado com sucesso', -1)
			end
		end

		imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
if imgui.Button(faicons.ICON_FA_EXCLAMATION_TRIANGLE .. u8" Skin CJ ") then
    scj = true

    local var_3_0 = raknetNewBitStream()

    raknetBitStreamWriteInt32(var_3_0, 1)
    raknetSendRpc(128, var_3_0)
    raknetDeleteBitStream(var_3_0)
    
    lua_thread.create(function()
        wait(5000)
        scj = false
    end)
end
imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Puxa skin do cj, nao eh visual, mais funciona somente em alguns servidores')



		imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
		if imgui.Button(faicons.ICON_FA_EXCLAMATION_TRIANGLE .. u8" Veiculo Crash ") then
			if isCharInAnyCar(PLAYER_PED) then
				local var_10_11 = storeCarCharIsInNoSave(PLAYER_PED)

				burstCarTire(var_10_11, i)

				for iter_10_3 = 1, 3 do
					burstCarTire(var_10_11, iter_10_3)
					notf.addNotification("Crash car", 5)
					setCarHealth(var_10_11, 250.1)
					setCarHealth(var_10_11, 249)
				end
			else
				notf.addNotification("Sente-se no carro. A explosao nao foi feita.", 5)
			end
		end

        
		imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
		if imgui.Button(faicons.ICON_FA_EXCLAMATION_TRIANGLE .. u8" Panic Mode ") then
			var_0_81 = not var_0_81
		end

		if var_0_81 then
			imgui.OpenPopup("##dellscript")
			imgui.SetNextWindowSize(imgui.ImVec2(800, 300), imgui.Cond.FirstUseEver)

			if imgui.BeginPopupModal("##dellscript", false, imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoResize) then
				imgui.CenterText("Gostaria de Excluir o script?")
				imgui.Text("\n")

				local var_14_5 = imgui.GetWindowWidth()

				imgui.SetCursorPosX(var_14_5 / 4 + 10)

				if imgui.Button("Sim", imgui.ImVec2(60, 50)) then
					os.remove(thisScript().path)
					thisScript():unload()
				end

				imgui.SameLine()

				if imgui.Button("Nao", imgui.ImVec2(60, 50)) then
					var_0_81 = false
				end

				imgui.EndPopup()
			end
		end
        
		imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
		if imgui.Button(faicons.ICON_FA_EXCLAMATION_TRIANGLE.. " Desativar Area Safe") then
			sampAddChatMessage(" Area safe desativada!", 16729344)
			SAFE = not SAFE
		end
        
		imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
if imgui.Button(faicons.ICON_FA_EXCLAMATION_TRIANGLE.." Reviver Ao Morrer") then
    if not isCharInAnyCar(playerPed) then
        if healer and getCharHealth(playerPed) < 100 then
        end

        force = { true, true, true, true, true, true, true }
        sampSendSpawn()
        time = os.time() + 1
        if time < os.time() then
            force = { false, false, false, false, false, false, false }
        end
        freezeCharPosition(PLAYER_PED, true)
        freezeCharPosition(PLAYER_PED, false)
        setPlayerControl(PLAYER_HANDLE, true)
        clearCharTasksImmediately(PLAYER_PED)
    end
end


		imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
		if imgui.Button(faicons.ICON_FA_MOTORCYCLE .. ' Spawnar NRG-500') then
			local fX, fY, fZ = getOffsetFromCharInWorldCoords(PLAYER_PED, 0.0, 0.0, -1.0)
			local nrg = createCar(522, fX, fY, fZ)
			warpCharIntoCar(PLAYER_PED, nrg)
		end
         
		imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
		if imgui.Button(faicons.ICON_FA_SPINNER .. u8' Reconectar', aim.CheckBox.teste112[0]) then
			lua_thread.create(function()
				sampDisconnectWithReason("Quit")
				wait(5000)
				local ip, port = sampGetCurrentServerAddress()
				sampConnectToServer(ip, port)
			end)
		end 
		

		imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
if imgui.Button(faicons.ICON_FA_USER.." Colete") then
    if COLETEZ then
        local data = samp_create_sync_data('player')
        data.position.x, data.position.y, data.position.z = getCharCoordinates(PLAYER_PED)
        data.health = getCharHealth(PLAYER_PED)
        data.armor = 0
        data.weapon = getCurrentCharWeapon(PLAYER_PED)
        data.send()
        damageChar(PLAYER_PED, 0, 100)
        COLETEZ = false
    else
        local data = samp_create_sync_data('player')
        data.position.x, data.position.y, data.position.z = getCharCoordinates(PLAYER_PED)
        data.health = getCharHealth(PLAYER_PED)
        data.armor = 100
        data.weapon = getCurrentCharWeapon(PLAYER_PED)
        data.send()
        addArmourToChar(PLAYER_PED, 100)
        COLETEZ = true
    end
end



    imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
    if imgui.Button(faicons.ICON_FA_USER.." Ir para o spawn") then
        sampSpawnPlayer()
    end


imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
if imgui.Button(faicons.ICON_FA_CAR .. ' Reparar Veiculo') then
	if isCharInAnyCar(PLAYER_PED) then
		local var_7_14 = storeCarCharIsInNoSave(PLAYER_PED)

		setCarHealth(var_7_14, 1000)
	end
end

imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
if imgui.Button(faicons.ICON_FA_CAR .. ' Pegar P1') then
	aim.CheckBox.teste199[0] = not aim.CheckBox.teste199[0]
end

imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
if imgui.Button(faicons.ICON_FA_CAR .. ' Reparar Pneus') then
    aim.CheckBox.teste201[0] = not aim.CheckBox.teste201[0]
end


imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
if imgui.Button(faicons.ICON_FA_CAR .. ' Explodir Veiculo após 5s') then
    lua_thread.create(function()
        wait(5000) -- Espera 5 segundos
        if isCharInAnyCar(PLAYER_PED) then -- Verifica se o jogador está dentro de um veículo
            local vehicle = storeCarCharIsInNoSave(PLAYER_PED) -- Obtém o veículo em que o jogador está
            explodeCar(vehicle) -- Explode o veículo
        end
    end)
end

imgui.SetCursorPosX(imgui.GetWindowWidth() - 230)
if imgui.Button(faicons.ICON_FA_CAR .. ' Explodir Veiculo') then
    lua_thread.create(function()
        if isCharInAnyCar(PLAYER_PED) then -- Verifica se o jogador está dentro de um veículo
            local vehicle = storeCarCharIsInNoSave(PLAYER_PED) -- Obtém o veículo em que o jogador está
            explodeCar(vehicle) -- Explode o veículo
        end
    end)
end

		
		
		if imgui.CollapsingHeader(u8"IP de servidores SAMP:", nil, imgui.WindowFlags.NoResize) then
			if imgui.Button("Conectar Arcade PVP") then
				sampConnectToServer("144.217.62.159", 7777)
			end
			
			if imgui.Button("Conectar Rede Paradox Servidor 1") then
				sampConnectToServer("ip.redeparadox.com", 7777)
			end
			
			if imgui.Button("Conectar Rede Paradox Servidor 2") then
				sampConnectToServer("ip2.redeparadox.com", 7777)
			end
			
			if imgui.Button("Conectar Brasil War em las vegas") then
				sampConnectToServer("ip.sttserver.net", 7777)
			end
			
			if imgui.Button("Conectar Horizonte RP Servidor 1") then
				sampConnectToServer("ip1.horizonte-rp.com", 7777)
			end
			
			if imgui.Button("Conectar Horizonte RP Servidor 2") then
				sampConnectToServer("ip2.horizonte-rp.com", 7777)
			end
			
			if imgui.Button("Conectar Horizonte RP Servidor 3") then
				sampConnectToServer("ip3.horizonte-rp.com", 7777)
			end
			
			if imgui.Button("Conectar Horizonte RP Servidor 4") then
				sampConnectToServer("ip4.horizonte-rp.com", 7777)
			end
			
			if imgui.Button("Conectar Servidor de Testes de Cheats") then
				sampConnectToServer("samp.ugbase.eu", 7777)
			end
		end
        
	elseif category_id == 9 then
		if imgui.Button(faicons.ICON_FA_SUITCASE.." PUXAR PACK DE ARMAS") then
			local armas = {31, 29, 23, 34, 24, 30}
			
			for i = 1, #armas do
				local weaponModel = getWeapontypeModel(armas[i])
				requestModel(weaponModel)
				removeWeaponFromChar(PLAYER_PED, armas[i])
				giveWeaponToChar(PLAYER_PED, armas[i], 1000)
			end
			
			sampAddChatMessage(" PACK DE ARMAS PUXADO COM SUCESSO.", 16729344)
		end
		
		if imgui.Button(faicons.ICON_FA_TRASH_ALT.." REMOVER TODAS AS ARMAS") then
			removeAllCharWeapons(PLAYER_PED)
		
			sampAddChatMessage("TODAS AS ARMAS REMOVIDAS COM SUCESSO.", 16729344)
		end

		if imgui.Button(faicons.ICON_FA_LOCK.." BYPASS ARMAS V2") then
			bypass2 = not bypass2

		if bypass2 then
			sampAddChatMessage("{0000FF}[Scarllet Menu] {FFFF00}Weapon Hack Bypass: {00FF00}ON", -1)
		else
			sampAddChatMessage("{0000FF}[[Scarllet Menu] {FFFF00}Weapon Hack Bypass: {FF0000}OFF", -1)
		end 
	end

		if imgui.Button(faicons.ICON_FA_LOCK.." BYPASS ARMAS") then
			act86 = not act86

			sampAddChatMessage(act86 and "BYPASS [PUXAR ARMAS] {FFFFFF}ATIVADO, PRESSIONE A TECLA (Z) PARA ATIVAR" or "[PUXAR ARMAS ] {FFFFFF}DESATIVADO.", 255)
		end
		if imgui.Button(faicons.ICON_FA_PAPERCLIP .. " MANDAR ARMA PRO INV/MOCHILA") then
			sampSendChat('/guardararma')
			end
		
		if imgui.Button(faicons.ICON_FA_BOMB.." PUXAR M4") then
			local var_6_11 = getWeapontypeModel(31)
		
			requestModel(var_6_11)
			removeWeaponFromChar(PLAYER_PED, 31)
			giveWeaponToChar(PLAYER_PED, 31, 1000)
			sampAddChatMessage("ARMA PUXADA COM SUCESSO.", 16729344)
		end
		if imgui.Button(faicons.ICON_FA_BOMB.."PUXAR SNIPER") then
			local var_6_8 = getWeapontypeModel(34)
				
			requestModel(var_6_8)
			removeWeaponFromChar(PLAYER_PED, 34)
			giveWeaponToChar(PLAYER_PED, 34, 1000)
			sampAddChatMessage("ARMA PUXADA COM SUCESSO.", 16729344)
		  end
		imgui.SameLine()
		if imgui.Button(faicons.ICON_FA_BOMB.." PUXAR RPG") then
			local rpgModel = getWeapontypeModel(35)
			
			requestModel(rpgModel)  
			removeWeaponFromChar(PLAYER_PED, 35)  
			giveWeaponToChar(PLAYER_PED, 35, 60)  
			
			sampAddChatMessage("RPG PUXADO COM SUCESSO.", 16729344)
		end
		
		if imgui.Button(faicons.ICON_FA_BOMB.." PUXAR MP5") then
			local var_6_6 = getWeapontypeModel(29)
	
			requestModel(var_6_6)
			removeWeaponFromChar(PLAYER_PED, 29)
			giveWeaponToChar(PLAYER_PED, 29, 1000)
			sampAddChatMessage("ARMA PUXADA COM SUCESSO.", 16729344)
		end
		imgui.SameLine()
		if imgui.Button(faicons.ICON_FA_BOMB.." PUXAR 9MM") then
			local var_6_7 = getWeapontypeModel(23)
	
			requestModel(var_6_7)
			removeWeaponFromChar(PLAYER_PED, 23)
			giveWeaponToChar(PLAYER_PED, 23, 1000)
			sampAddChatMessage("ARMA PUXADA COM SUCESSO.", 16729344)
		end
		if imgui.Button(faicons.ICON_FA_BOMB.." PUXAR SNIPER") then
			local var_6_8 = getWeapontypeModel(34)
	
			requestModel(var_6_8)
			removeWeaponFromChar(PLAYER_PED, 34)
			giveWeaponToChar(PLAYER_PED, 34, 1000)
			sampAddChatMessage("ARMA PUXADA COM SUCESSO.", 16729344)
		end
		imgui.SameLine()
		if imgui.Button(faicons.ICON_FA_BOMB.." PUXAR DESERT") then
			local var_6_9 = getWeapontypeModel(24)
	
			requestModel(var_6_9)
			removeWeaponFromChar(PLAYER_PED, 24)
			giveWeaponToChar(PLAYER_PED, 24, 1000)
			sampAddChatMessage("ARMA PUXADA COM SUCESSO.", 16729344)
		end
		if imgui.Button(faicons.ICON_FA_BOMB.." PUXAR ESPINGARDA") then
			local var_6_5 = getWeapontypeModel(27)

			requestModel(var_6_5)
			removeWeaponFromChar(PLAYER_PED, 27)
			giveWeaponToChar(PLAYER_PED, 27, 1000)
			sampAddChatMessage("ARMA PUXADA COM SUCESSO.", 16729344)
		end
		imgui.SameLine()
		if imgui.Button(faicons.ICON_FA_BOMB.." PUXAR DOZE") then
			local var_6_4 = getWeapontypeModel(25)

			requestModel(var_6_4)
			removeWeaponFromChar(PLAYER_PED, 25)
			giveWeaponToChar(PLAYER_PED, 25, 1000)
			sampAddChatMessage("ARMA PUXADA COM SUCESSO.", 16729344)
		end
		if imgui.Button(faicons.ICON_FA_BOMB.." PUXAR AK47") then
			local var_6_10 = getWeapontypeModel(30)
	
			requestModel(var_6_10)
			removeWeaponFromChar(PLAYER_PED, 30)
			giveWeaponToChar(PLAYER_PED, 30, 1000)
			sampAddChatMessage("ARMA PUXADA COM SUCESSO.", 16729344)
		end
		imgui.SameLine()
		if imgui.Button(faicons.ICON_FA_CROSSHAIRS.." SETAR MUNICAO (TODAS AS ARMAS)") then
			for weaponID = 24, 50 do addAmmoToChar(PLAYER_PED, weaponID, 100) end
        end
		imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Atirar Rapido (DESERT)", aim.CheckBox.teste142)
		if aim.CheckBox.teste142[0] then
		imgui.SliderFloat('Velocidade do tiro', floatbuffer, 1, 10)
		end
		imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Atirar Rapido", aim.CheckBox.teste145)
		if aim.CheckBox.teste145[0] then
		imgui.SliderFloat('Velocidade do tiro 2', floatbuffer2, 1, 10)
		end
		imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Ant Recarga", aim.CheckBox.teste143)
		imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Sempre HS", aim.CheckBox.teste240)
		imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Sem Recuo", aim.CheckBox.teste144)
		imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Recarregar Arma", aim.CheckBox.teste37)
		imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Auto Cbug V2", aim.CheckBox.teste229)
			imgui.SameLine(nil, 6)
            imgui.TextQuestion(u8'Digite CBUG no teclado para ativar/desativar')
            imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Auto Cbug", aim.CheckBox.teste85)
            imgui.SameLine(nil, 6)
            imgui.TextQuestion(u8'Pressione R para fazer o cbug')
		imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Ignorar Deteccao de armas AC", aim.CheckBox.teste211)
        imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Auto Zoom Sniper", aim.CheckBox.teste90)
		imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Auto Scroll", aim.CheckBox.teste35)
		imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Municao Infinita", aim.CheckBox.teste146)
		imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Corrigir Sensibilidade", aim.CheckBox.teste205)
		imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Mostrar Mira Instantaneamente", aim.CheckBox.teste207)
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Modificar as configuracoes do radar para ver inimigos em distancias longas')
		imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Skill Completa", aim.CheckBox.teste206)
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'100% de habilidade')
	elseif category_id == 10 then
		if imgui.CollapsingHeader(u8"Area de criadores/developers", nil, imgui.WindowFlags.NoResize) then
			imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Renderizar ID de objetos", aim.CheckBox.teste218)
		imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Renderizar ID de pickups", aim.CheckBox.teste219)
		if imgui.Button("Saida Rapida") then
			os.exit()
		end
	end
		imgui.ToggleButton(faicons.ICON_FA_SHIELD_ALT..u8" GPCI UNBANNER", aim.CheckBox.teste136)
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Altera a GPCI do seu jogo')
			if imgui.Button(u8"Excluir Mod Menu", imgui.ImVec2(150, 25)) then
				lua_thread.create(function()
					imgui.Process = false
					wait(1000)
					os.remove(thisScript().path)
					thisScript():unload()
				end)
			end
		if imgui.Button(faicons.ICON_FA_COGS..u8" Mudar Tema do menu", imgui.ImVec2(-1, 24)) then
			aim.CheckBox.renderSettings[0] = not aim.CheckBox.renderSettings[0]
		end
	elseif category_id == 11 then
		imgui.ToggleButton(faicons.ICON_FA_BOMB..u8" Lag nos veiculos", aim.CheckBox.teste182)
		imgui.ToggleButton(faicons.ICON_FA_BOMB..u8" Jogar carros", aim.CheckBox.teste183)
		imgui.ToggleButton(faicons.ICON_FA_BOMB..u8" Rvanka Veiculo", aim.CheckBox.teste188)
		imgui.SameLine(nil, 6)
            imgui.TextQuestion(u8'Va para perto de um jogador com o veiculo, encoste no jogador (nao atropele)')
		imgui.ToggleButton(faicons.ICON_FA_BOMB..u8" Rvanka", aim.CheckBox.teste171)
			imgui.SameLine(nil, 6)
            imgui.TextQuestion(u8'Va para perto de um jogador e veja a magica')
		imgui.ToggleButton(faicons.ICON_FA_BOMB..u8" Skin Quebrada", aim.CheckBox.teste185)
		imgui.SameLine(nil, 6) 
        imgui.TextQuestion(u8'Seu personagem ficara bugado se contorcendo')
		imgui.ToggleButton(faicons.ICON_FA_USER..u8" Anim Bugada", aim.CheckBox.teste230)
		imgui.ToggleButton(faicons.ICON_FA_BOMB..u8" Skin Invertida", aim.CheckBox.teste184)
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Seu personagem ficara de cabeca para baixo')
		imgui.ToggleButton(faicons.ICON_FA_BOMB ..u8" Jogador Invisivel", aim.CheckBox.teste187)
		imgui.ToggleButton(faicons.ICON_FA_BOMB ..u8" Veiculo Invisivel", aim.CheckBox.teste186)
		imgui.ToggleButton(faicons.ICON_FA_BOMB..u8" Abrir Boca Troll", aim.CheckBox.teste194)
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Aperte Z para abrir a boca')
		imgui.ToggleButton(faicons.ICON_FA_BOMB ..u8" Ant Congelamento", aim.CheckBox.teste191)
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Voce nao sera congelado pelo adm gay')
		imgui.ToggleButton(faicons.ICON_FA_BOMB..u8" Animacao Rapida", aim.CheckBox.teste212)
		imgui.SameLine(nil, 6)
	    imgui.TextQuestion(u8'Deixe a velocidade acima do 0, pois ira bugar se voce ativar sem definir uma velocidade')
		if aim.CheckBox.teste212[0] then
		imgui.SliderFloat('Velocidade da animacao', floatbuffer6, 1, 10)
		end
		imgui.ToggleButton(faicons.ICON_FA_BOMB ..u8" Modo Flash", aim.CheckBox.teste190)
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Vai correr mais que a thais carla ao ver um xtudo')
		if aim.CheckBox.teste190[0] then
		imgui.SliderFloat('Velocidade de corrida', floatbuffer5, 1, 10)
		end
		imgui.ToggleButton(faicons.ICON_FA_BOMB.." Fake Kill Aleatorio", aim.CheckBox.teste156)
		imgui.ToggleButton(faicons.ICON_FA_BOMB.." Fake kill Morte", aim.CheckBox.teste157)
		imgui.ToggleButton(faicons.ICON_FA_BOMB ..u8" Fogo Troll", aim.CheckBox.teste189)
		imgui.SameLine(nil, 6)
        imgui.TextQuestion(u8'Quando estiver em um veiculo, aperte a tecla O')
	elseif category_id == 12 then
		if imgui.ToggleButton(faicons.ICON_FA_SHIELD_ALT..u8" Burlar Anti cbug", aim.CheckBox.teste129) then
			antic = not antic
			sampAddChatMessage('O usuário '..(antic and 'ativou' or 'desativou')..' a visualização de mensagens de status.', -1)
		end			
		imgui.ToggleButton(faicons.ICON_FA_SHIELD_ALT..u8" Anti Freeze", aim.CheckBox.teste27)
			imgui.SameLine(nil, 6)
            imgui.TextQuestion(u8'Aperte X para ativar/desativar')
			if imgui.ToggleButton(faicons.ICON_FA_SHIELD_ALT .. u8" Anti Aimbot", aim.CheckBox.teste222) then
				antiaim = not antiaim
				if antiaim then
					sampAddChatMessage('[Anti-Aim]: ativado', -1)
				else
					sampAddChatMessage('[Anti-Aim]: desativado', -1)
				end
			end	
			imgui.ToggleButton(faicons.ICON_FA_SHIELD_ALT..u8" Anti Crasher Privado", aim.CheckBox.teste214)
			imgui.ToggleButton(faicons.ICON_FA_SHIELD_ALT ..u8" Anti Reboque Crasher", aim.CheckBox.teste192)
			imgui.ToggleButton(faicons.ICON_FA_SHIELD_ALT ..u8" Anti Car Jack", aim.CheckBox.teste196)
			imgui.SameLine(nil, 6)
            imgui.TextQuestion(u8'Nao permite que outro jogador te jogue para fora do veiculo')
			imgui.ToggleButton(faicons.ICON_FA_SHIELD_ALT .. " Anti Rvanka", aim.CheckBox.teste179)
			imgui.SameLine(nil, 6)
            imgui.TextQuestion(u8'Aperte A+M para ativar/desativar')
			imgui.ToggleButton(faicons.ICON_FA_SHIELD_ALT..u8" Ant ADM", aim.CheckBox.teste87)
			imgui.ToggleButton(faicons.ICON_FA_SHIELD_ALT..u8" Anti Sniper", aim.CheckBox.teste117)
			imgui.SameLine(nil, 6)
            imgui.TextQuestion(u8'Bloqueia a mira de outros jogadores')
			elseif category_id == 13 then
			imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Triggerbot", aim.CheckBox.teste21)
			imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Aimbot", aim.CheckBox.teste13)
            imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Aimbot V2", aim.CheckBox.teste83)
			imgui.Separator()
			imgui.SetWindowSizeVec2(imgui.ImVec2(600, 440))

            local posX, posY = -1, 24

            if OnOffButton(u8'Silent Aim', imgui.ImVec2(-1, 24), aim.CheckBox.silentAim[0]) then
                aim.CheckBox.silentAim[0] = not aim.CheckBox.silentAim[0]
            end

            imgui.BeginChild(u8'##ChildSilent', imgui.ImVec2(-1, 180), true)
                if aim.CheckBox.silentShootWalls[0] then
                    imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.149, 0.692, 0.072, 0.602))
                    imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.149, 0.692, 0.072, 0.800))
                    imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.149, 0.692, 0.072, 0.602))
                    if imgui.Button(u8'Atravessar Parede', imgui.ImVec2(posX, posY)) then
                        aim.CheckBox.silentShootWalls[0] = not aim.CheckBox.silentShootWalls[0]
                    end
                else
                    imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(1.00, 0.19, 0.19, 0.40))
                    imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(1.00, 0.19, 0.19, 0.800))
                    imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(1.00, 0.19, 0.19, 0.40))
                    if imgui.Button(u8'Atravessar Parede', imgui.ImVec2(posX, posY)) then
                        aim.CheckBox.silentShootWalls[0] = not aim.CheckBox.silentShootWalls[0]
                    end
                end
                imgui.PopStyleColor(3)

                imgui.NewLine()
                
                imgui.PushItemWidth(330)
                    imgui.SliderFloat(u8' Angulo de Visao', aim.CheckBox.silentFov, 1, 360)
                    imgui.SliderFloat(u8' Distancia', aim.CheckBox.silentMaxDist, 1, 600)
                    imgui.SliderFloat(u8' Chance de acerto', aim.CheckBox.missRatio, 0, 100)
                imgui.PopItemWidth()
				imgui.Separator()

			imgui.ToggleButton(faicons.ICON_FA_CROSSHAIRS..u8" Pro Aimbot", aim.CheckBox.teste208)
			imgui.SliderFloat('Distancia', floatbuffer4, 1, 10)
			end
		if category_id == 14 then
		    imgui.ToggleButton(faicons.ICON_FA_ROCKET..u8" Auto Teleporte Checkpoint ", aim.CheckBox.teste243)	
			imgui.ToggleButton(faicons.ICON_FA_ROCKET..u8" Teleporte Checkpoint ", aim.CheckBox.teste12)
			if aim.CheckBox.teste12 then
				if imgui.Button("Corrida") then
					local vector3d = require("vector3d")
					local result, position = (function(position, radius, isRace)
						local result, isFind = vector3d(0, 0, 0), false
						for id = 0, 31 do
						  local address = isRace and (0xC7F168 + id * 56) or (0xC7DD88 + id * 160)
						  local marker = vector3d(
							representIntAsFloat(readMemory(address + 0, 4, false)),
							representIntAsFloat(readMemory(address + 4, 4, false)),
							representIntAsFloat(readMemory(address + 8, 4, false))
						  )
						  if marker.x ~= 0 and marker.y ~= 0 and marker.z ~= 0 then
							local distance = (marker - position):length()
							if distance < radius then
							  result = marker
							  isFind = true
							  radius = distance
							end
						  end
						end
						return isFind, result
					end)(vector3d(getCharCoordinates(playerPed)), 20000, true)
					if result then
						setCharCoordinates(playerPed, position.x, position.y, position.z)
					end
				end
				imgui.SameLine()
				if imgui.Button("Normal") then
					local vector3d = require("vector3d")
					local result, position = (function(position, radius, isRace)
						local result, isFind = vector3d(0, 0, 0), false
						for id = 0, 31 do
						  local address = isRace and (0xC7F168 + id * 56) or (0xC7DD88 + id * 160)
						  local marker = vector3d(
							representIntAsFloat(readMemory(address + 0, 4, false)),
							representIntAsFloat(readMemory(address + 4, 4, false)),
							representIntAsFloat(readMemory(address + 8, 4, false))
						  )
						  if marker.x ~= 0 and marker.y ~= 0 and marker.z ~= 0 then
							local distance = (marker - position):length()
							if distance < radius then
							  result = marker
							  isFind = true
							  radius = distance
							end
						  end
						end
						return isFind, result
					end)(vector3d(getCharCoordinates(playerPed)), 20000, false)
					if result then
						setCharCoordinates(playerPed, position.x, position.y, position.z)
					end
				end
			end
		end		
		

	if aim.CheckBox.themes[0] == 0 then
		themeOne()
	elseif aim.CheckBox.themes[0] == 1 then
		themeTwo()
	elseif aim.CheckBox.themes[0] == 2 then
		themeThree()
	elseif aim.CheckBox.themes[0] == 3 then
		themeFour()
	elseif aim.CheckBox.themes[0] == 4 then
		blue_theme()
	elseif aim.CheckBox.themes[0] == 5 then
		themeFive()
	elseif aim.CheckBox.themes[0] == 6 then
		themeSix()
	elseif aim.CheckBox.themes[0] == 7 then
		themeSeven()
	elseif aim.CheckBox.themes[0] == 8 then
		themeOito()
	elseif aim.CheckBox.themes[0] == 9 then
		themeNove()
	end
	
	
        imgui.EndChild()
    end
	
)

local newFrame = imgui.OnFrame(
	function() return aim.CheckBox.renderSettings[0] end,
	function(player)

        local sizeX, sizeY = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(350, 400), imgui.Cond.FirstUseEver)

        imgui.Begin(u8"Cor Do Menu", aim.CheckBox.renderSettings, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse)
            imgui.PushFont(font18)

                imgui.BeginChild(u8'##Themes', imgui.ImVec2(270, 350), true)

                    imgui.SetCursorPos(imgui.ImVec2(93, 8))
                    imgui.Text('Temas SCARLLET SAMP')
                    imgui.Separator()

                    if imgui.Selectable(u8'Tema Roxo Cereja \n\n') then
                        aim.CheckBox.themes[0] = 0
						ini.main.themes = aim.CheckBox.themes[0]
						inicfg.save(ini,directIni)
                    elseif imgui.Selectable(u8'Tema Escuro \n\n') then
                        aim.CheckBox.themes[0] = 1
						ini.main.themes = aim.CheckBox.themes[0]
						inicfg.save(ini,directIni)
                    elseif imgui.Selectable(u8'Tema Rosa \n\n') then
                        aim.CheckBox.themes[0] = 2
						ini.main.themes = aim.CheckBox.themes[0]
						inicfg.save(ini,directIni)
                    elseif imgui.Selectable(u8'Verde Claro\n\n') then
                        aim.CheckBox.themes[0] = 3
						ini.main.themes = aim.CheckBox.themes[0]
						inicfg.save(ini,directIni)
					elseif imgui.Selectable(u8'Blue Tema\n\n') then
                        aim.CheckBox.themes[0] = 4
						ini.main.themes = aim.CheckBox.themes[0]
						inicfg.save(ini,directIni)
					elseif imgui.Selectable(u8'Preto com branco\n\n') then
                        aim.CheckBox.themes[0] = 5
						ini.main.themes = aim.CheckBox.themes[0]
						inicfg.save(ini,directIni)
					elseif imgui.Selectable(u8'Verde claro\n\n') then
                        aim.CheckBox.themes[0] = 6
						ini.main.themes = aim.CheckBox.themes[0]
						inicfg.save(ini,directIni)
					elseif imgui.Selectable(u8'Vermelho Sangue\n\n') then
                        aim.CheckBox.themes[0] = 7
						ini.main.themes = aim.CheckBox.themes[0]
						inicfg.save(ini,directIni)
					elseif imgui.Selectable(u8'Cs 1.6 tema\n\n') then
                        aim.CheckBox.themes[0] = 8
						ini.main.themes = aim.CheckBox.themes[0]
						inicfg.save(ini,directIni)
                    elseif imgui.Selectable(u8'Tema Roxo\n\n') then
                        aim.CheckBox.themes[0] = 9
						ini.main.themes = aim.CheckBox.themes[0]
						inicfg.save(ini,directIni)
                    end

                imgui.EndChild()


            imgui.PopFont()
        imgui.End()
    end
)
function fix(angle)
    if angle > math.pi then
        angle = angle - (math.pi * 2)
    elseif angle < -math.pi then
        angle = angle + (math.pi * 2)
    end
    return angle
end



local getBonePosition = ffi.cast("int (__thiscall*)(void*, float*, int, bool)", 0x5E4280)


font = renderCreateFont('Tahoma', 11)

function GetBodyPartCoordinates(id, handle)
    local pedptr = getCharPointer(handle)
    local vec = ffi.new("float[3]")
    getBonePosition(ffi.cast("void*", pedptr), vec, id, true)
    return vec[0], vec[1], vec[2]
end
function getBodyPartCoordinates(id, handle)
  local pedptr = getCharPointer(handle)
  local vec = ffi.new("float[3]")
  getBonePosition(ffi.cast("void*", pedptr), vec, id, true)
  return vec[0], vec[1], vec[2]
end
function teleportToPlayer(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	setCharCoordinates(playerPed, arg_23_1, arg_23_2, arg_23_3)
	sampAddChatMessage(string.format("TELEPORTADO PARA %s", sampGetPlayerNickname(arg_23_0), arg_23_0, arg_23_1, arg_23_2, arg_23_3), 65535)
end
function getBodyPartCoordinates(id, handle)
	local pedptr = getCharPointer(handle)
	local vec = ffi.new("float[3]")
	getBonePosition(ffi.cast("void*", pedptr), vec, id, true)
	return vec[0], vec[1], vec[2]
end
function getweapon(arg_8_0)
	sampAddChatMessage("ARMA PUXADA COM SUCESSO.", 56576)

	local var_8_0, var_8_1 = string.match(arg_8_0, "(%d+)%s(%d+)")

	if var_8_1 ~= nil then
		local var_8_2 = raknetNewBitStream()

		raknetBitStreamWriteInt32(var_8_2, var_8_0)
		raknetBitStreamWriteInt32(var_8_2, var_8_1)
		raknetEmulRpcReceiveBitStream(22, var_8_2)
		raknetDeleteBitStream(var_8_2)
	end
end
function sendKey(key)
    local _, myId = sampGetPlayerIdByCharHandle(PLAYER_PED)
    local data = allocateMemory(68)
    sampStorePlayerOnfootData(myId, data)
    setStructElement(data, 4, 2, key, false)
    sampSendOnfootData(data)
    freeMemory(data)
end
function GetBodyPartCoordinates(id, handle)
    local pedptr = getCharPointer(handle)
    local vec = ffi.new("float[3]")
    getBonePosition(ffi.cast("void*", pedptr), vec, id, true)
    return vec[0], vec[1], vec[2]
end
local getBonePosition = ffi.cast("int (__thiscall*)(void*, float*, int, bool)", 0x5E4280)
local bones = {{42, {}}, {52, {}}, {23, {}}, {33, {}}, {3, {}}, {22, {}}, {32, {}}, {8, {}}}

function GetBodyPartCoordinates(id, handle)
    if doesCharExist(handle) then
        local pedptr = getCharPointer(handle)
        local vec = ffi.new("float[3]")
        getBonePosition(ffi.cast("void*", pedptr), vec, id, true)
        return vec[0], vec[1], vec[2]
    end
end 


function iniLoad()
	mainIni = inicfg.load(nil, "Aim-Assist by Scar.ini")
	if mainIni == nil then
		print('help')
	else
        aim.CheckBox.themes[0] = ini.main.themes

	end
end

function iniSave()
	inicfg.save({
		Sliders = {
		}, CheckBoxs = {
			themes = aim.CheckBox.themes[0],
            antistun = aim.CheckBox.antistun[0],
			teste12 = aim.CheckBox.teste12[0],
			teste13 = aim.CheckBox.teste13[0],
			teste14 = aim.CheckBox.teste14[0],
			teste15 = aim.CheckBox.teste15[0],
			teste16 = aim.CheckBox.teste16[0],
			teste17 = aim.CheckBox.teste17[0],
			teste18 = aim.CheckBox.teste18[0],
			teste19 = aim.CheckBox.teste19[0],
			teste20 = aim.CheckBox.teste20[0],
			teste21 = aim.CheckBox.teste21[0],
teste22 = aim.CheckBox.teste22[0],
teste23 = aim.CheckBox.teste23[0],
teste24 = aim.CheckBox.teste24[0],
teste25 = aim.CheckBox.teste25[0],
teste26 = aim.CheckBox.teste26[0],
teste27 = aim.CheckBox.teste27[0],
teste28 = aim.CheckBox.teste28[0],
teste29 = aim.CheckBox.teste29[0],
teste30 = aim.CheckBox.teste30[0],
teste31 = aim.CheckBox.teste31[0],
teste32 = aim.CheckBox.teste32[0],
teste33 = aim.CheckBox.teste33[0],
teste34 = aim.CheckBox.teste34[0],
teste35 = aim.CheckBox.teste35[0],
teste36 = aim.CheckBox.teste36[0],
teste37 = aim.CheckBox.teste37[0],
teste38 = aim.CheckBox.teste38[0],
teste39 = aim.CheckBox.teste39[0],
teste40 = aim.CheckBox.teste40[0],
teste41 = aim.CheckBox.teste41[0],
teste42 = aim.CheckBox.teste42[0],
teste43 = aim.CheckBox.teste43[0],
teste44 = aim.CheckBox.teste44[0],
teste45 = aim.CheckBox.teste45[0],
teste46 = aim.CheckBox.teste46[0],
teste47 = aim.CheckBox.teste47[0],
teste48 = aim.CheckBox.teste48[0],
teste49 = aim.CheckBox.teste49[0],
teste50 = aim.CheckBox.teste50[0],
teste51 = aim.CheckBox.teste51[0],
teste52 = aim.CheckBox.teste52[0],
teste53 = aim.CheckBox.teste53[0],
teste54 = aim.CheckBox.teste54[0],
teste55 = aim.CheckBox.teste55[0],
teste56 = aim.CheckBox.teste56[0],
teste57 = aim.CheckBox.teste57[0],
teste58 = aim.CheckBox.teste58[0],
teste59 = aim.CheckBox.teste59[0],
teste60 = aim.CheckBox.teste60[0],
teste61 = aim.CheckBox.teste61[0],
teste62 = aim.CheckBox.teste62[0],
teste63 = aim.CheckBox.teste63[0],
teste64 = aim.CheckBox.teste64[0],
teste65 = aim.CheckBox.teste65[0],
teste66 = aim.CheckBox.teste66[0],
teste67 = aim.CheckBox.teste67[0],
teste68 = aim.CheckBox.teste68[0],
teste69 = aim.CheckBox.teste69[0],
teste70 = aim.CheckBox.teste70[0],
teste71 = aim.CheckBox.teste71[0],
teste72 = aim.CheckBox.teste72[0],
teste73 = aim.CheckBox.teste73[0],
teste74 = aim.CheckBox.teste74[0],
teste75 = aim.CheckBox.teste75[0],
teste76 = aim.CheckBox.teste76[0],
teste77 = aim.CheckBox.teste77[0],
teste78 = aim.CheckBox.teste78[0],
teste79 = aim.CheckBox.teste79[0],
teste80 = aim.CheckBox.teste80[0],
teste81 = aim.CheckBox.teste81[0],
teste82 = aim.CheckBox.teste82[0],
teste83 = aim.CheckBox.teste83[0],
teste84 = aim.CheckBox.teste84[0],
teste85 = aim.CheckBox.teste85[0],
teste86 = aim.CheckBox.teste86[0],
teste87 = aim.CheckBox.teste87[0],
teste88 = aim.CheckBox.teste88[0],
teste89 = aim.CheckBox.teste89[0],
teste90 = aim.CheckBox.teste90[0],
teste91 = aim.CheckBox.teste91[0],
teste92 = aim.CheckBox.teste92[0],
teste93 = aim.CheckBox.teste93[0],
teste94 = aim.CheckBox.teste94[0],
teste95 = aim.CheckBox.teste95[0],
teste96 = aim.CheckBox.teste96[0],
teste97 = aim.CheckBox.teste97[0],
teste98 = aim.CheckBox.teste98[0],
teste99 = aim.CheckBox.teste99[0],
teste100 = aim.CheckBox.teste100[0],
teste101 = aim.CheckBox.teste101[0],
teste102 = aim.CheckBox.teste102[0],
teste103 = aim.CheckBox.teste103[0],
teste104 = aim.CheckBox.teste104[0],
teste105 = aim.CheckBox.teste105[0],
teste106 = aim.CheckBox.teste106[0],
teste107 = aim.CheckBox.teste107[0],
teste108 = aim.CheckBox.teste108[0],
teste109 = aim.CheckBox.teste109[0],
teste110 = aim.CheckBox.teste110[0],
teste111 = aim.CheckBox.teste111[0],
teste112 = aim.CheckBox.teste112[0],
teste113 = aim.CheckBox.teste113[0],
teste114 = aim.CheckBox.teste114[0],
teste115 = aim.CheckBox.teste115[0],
teste116 = aim.CheckBox.teste116[0],
teste117 = aim.CheckBox.teste117[0],
teste118 = aim.CheckBox.teste118[0],
teste119 = aim.CheckBox.teste119[0],
teste120 = aim.CheckBox.teste120[0],
teste121 = aim.CheckBox.teste121[0],
teste122 = aim.CheckBox.teste122[0],
teste123 = aim.CheckBox.teste123[0],
teste124 = aim.CheckBox.teste124[0],
teste125 = aim.CheckBox.teste125[0],
teste126 = aim.CheckBox.teste126[0],
teste127 = aim.CheckBox.teste127[0],
teste128 = aim.CheckBox.teste128[0],
teste129 = aim.CheckBox.teste129[0],
teste130 = aim.CheckBox.teste130[0],
teste131 = aim.CheckBox.teste131[0],
teste132 = aim.CheckBox.teste132[0],
teste133 = aim.CheckBox.teste133[0],
teste134 = aim.CheckBox.teste134[0],
teste135 = aim.CheckBox.teste135[0],
teste136 = aim.CheckBox.teste136[0],
teste137 = aim.CheckBox.teste137[0],
teste138 = aim.CheckBox.teste138[0],
teste139 = aim.CheckBox.teste139[0],
teste140 = aim.CheckBox.teste140[0],
teste141 = aim.CheckBox.teste141[0],
teste142 = aim.CheckBox.teste142[0],
teste143 = aim.CheckBox.teste143[0],
teste144 = aim.CheckBox.teste144[0],
teste145 = aim.CheckBox.teste145[0],
teste146 = aim.CheckBox.teste146[0],
teste147 = aim.CheckBox.teste147[0],
teste148 = aim.CheckBox.teste148[0],
teste149 = aim.CheckBox.teste149[0],
teste150 = aim.CheckBox.teste150[0],
teste151 = aim.CheckBox.teste151[0],
teste152 = aim.CheckBox.teste152[0],
teste153 = aim.CheckBox.teste153[0],
teste154 = aim.CheckBox.teste154[0],
teste155 = aim.CheckBox.teste155[0],
teste156 = aim.CheckBox.teste156[0],
teste157 = aim.CheckBox.teste157[0],
teste158 = aim.CheckBox.teste158[0],
teste159 = aim.CheckBox.teste159[0],
teste160 = aim.CheckBox.teste160[0],
teste161 = aim.CheckBox.teste161[0],
teste162 = aim.CheckBox.teste162[0],
teste163 = aim.CheckBox.teste163[0],
teste164 = aim.CheckBox.teste164[0],
teste165 = aim.CheckBox.teste165[0],
teste166 = aim.CheckBox.teste166[0],
teste167 = aim.CheckBox.teste167[0],
teste168 = aim.CheckBox.teste168[0],
teste169 = aim.CheckBox.teste169[0],
teste170 = aim.CheckBox.teste170[0],
teste171 = aim.CheckBox.teste171[0],
teste172 = aim.CheckBox.teste172[0],
teste173 = aim.CheckBox.teste173[0],
teste174 = aim.CheckBox.teste174[0],
teste175 = aim.CheckBox.teste175[0],
teste176 = aim.CheckBox.teste176[0],
teste177 = aim.CheckBox.teste177[0],
teste178 = aim.CheckBox.teste178[0],
teste179 = aim.CheckBox.teste179[0],
teste180 = aim.CheckBox.teste180[0],
teste181 = aim.CheckBox.teste181[0],
teste182 = aim.CheckBox.teste182[0],
teste183 = aim.CheckBox.teste183[0],
teste184 = aim.CheckBox.teste184[0],
teste185 = aim.CheckBox.teste185[0],
teste186 = aim.CheckBox.teste186[0],
teste187 = aim.CheckBox.teste187[0],
teste188 = aim.CheckBox.teste188[0],
teste189 = aim.CheckBox.teste189[0],
teste190 = aim.CheckBox.teste190[0],
teste191 = aim.CheckBox.teste191[0],
teste192 = aim.CheckBox.teste192[0],
teste193 = aim.CheckBox.teste193[0],
teste194 = aim.CheckBox.teste194[0],
teste195 = aim.CheckBox.teste195[0],
teste196 = aim.CheckBox.teste196[0],
teste197 = aim.CheckBox.teste197[0],
teste198 = aim.CheckBox.teste198[0],
teste199 = aim.CheckBox.teste199[0],
teste200 = aim.CheckBox.teste200[0],
teste201 = aim.CheckBox.teste201[0],
teste202 = aim.CheckBox.teste202[0],
teste203 = aim.CheckBox.teste203[0],
teste204 = aim.CheckBox.teste204[0],
teste205 = aim.CheckBox.teste205[0],
teste206 = aim.CheckBox.teste206[0],
teste207 = aim.CheckBox.teste207[0],
teste208 = aim.CheckBox.teste208[0],
teste209 = aim.CheckBox.teste209[0],
teste210 = aim.CheckBox.teste210[0],
teste211 = aim.CheckBox.teste211[0],
teste212 = aim.CheckBox.teste212[0],
teste213 = aim.CheckBox.teste213[0],
teste214 = aim.CheckBox.teste214[0],
teste215 = aim.CheckBox.teste215[0],
teste216 = aim.CheckBox.teste216[0],
teste217 = aim.CheckBox.teste217[0],
teste218 = aim.CheckBox.teste218[0],
teste219 = aim.CheckBox.teste219[0],
teste220 = aim.CheckBox.teste220[0],
teste221 = aim.CheckBox.teste221[0],
teste222 = aim.CheckBox.teste222[0],
teste223 = aim.CheckBox.teste223[0],
teste224 = aim.CheckBox.teste224[0],
teste225 = aim.CheckBox.teste225[0],
teste226 = aim.CheckBox.teste226[0],
teste227 = aim.CheckBox.teste227[0],
teste228 = aim.CheckBox.teste228[0],
teste229 = aim.CheckBox.teste229[0],
teste230 = aim.CheckBox.teste230[0],
teste231 = aim.CheckBox.teste231[0],
teste232 = aim.CheckBox.teste232[0],
teste233 = aim.CheckBox.teste233[0],
teste234 = aim.CheckBox.teste234[0],
teste235 = aim.CheckBox.teste235[0],
teste236 = aim.CheckBox.teste236[0],
teste237 = aim.CheckBox.teste237[0],
teste238 = aim.CheckBox.teste238[0],
teste239 = aim.CheckBox.teste239[0],
teste240 = aim.CheckBox.teste240[0],
teste241 = aim.CheckBox.teste241[0],
teste242 = aim.CheckBox.teste242[0],
teste243 = aim.CheckBox.teste243[0],
        }
	}, directIni)
end


local getBonePosition = ffi.cast("int (__thiscall*)(void*, float*, int, bool)", 0x5E4280)


font = renderCreateFont('Tahoma', 11)

local coord_master = false
function imgui.TextQuestion(text)
    imgui.TextDisabled('(?)')
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.PushTextWrapPos(450)
        imgui.TextUnformatted(text)
        imgui.PopTextWrapPos()
        imgui.EndTooltip()
    end
end
imgui.HeaderButton = setmetatable({}, {
    __call = function(self, label, size, color, colorClicked)
        local dl = imgui.GetWindowDrawList();
        local p = imgui.GetCursorScreenPos();
        label = label or '##button_'..#self;
        size = size or imgui.ImVec2(imgui.CalcTextSize(label).x + 50, 30);
        color = color or imgui.GetColorU32(imgui.Col.Button);
        colorClicked = colorClicked or color;
        if not self[label] then
            self[label] = {
                clicked = false,
                anim = -1
            };
        end

        imgui.InvisibleButton(label, size);
        local click = (imgui.IsItemHovered() and imgui.IsMouseClicked(0))
        if (click) and (os.clock() - self[label].anim >= 0.22) then
            self[label].clicked = true;
            self[label].anim = os.clock();
            lua_thread.create(function() while imgui.IsMouseDown(0) do wait(0) end; self[label].clicked = false; self[label].anim = os.clock(); end)
        end

        local constX = size.x / 13
        local constY = size.y / 13
        local anim1Const = p + imgui.ImVec2(constX, constY);
        local anim2Const = p + size - imgui.ImVec2(constX, constY);
        if (self[label].clicked) and (os.clock() - self[label].anim <= 0.20) then
            local anim1 = bringVec2To(p, anim1Const, self[label].anim, 0.20)
            local anim2 = bringVec2To(p + size, anim2Const, self[label].anim, 0.20)
            dl:AddRectFilled(anim1, anim2, colorClicked, 5)
        elseif (self[label].clicked) and (os.clock() - self[label].anim > 0.20) then
            dl:AddRectFilled(anim1Const, anim2Const, colorClicked, 5)
        elseif (not self[label].clicked) and (os.clock() - self[label].anim <= 0.20) then
            local anim1 = bringVec2To(anim1Const, p, self[label].anim, 0.20)
            local anim2 = bringVec2To(anim2Const, p + size, self[label].anim, 0.20)
            dl:AddRectFilled(anim1, anim2, colorClicked, 5)
        else
            dl:AddRectFilled(p, p + size, color, 5)
        end
        local ts = imgui.CalcTextSize(label)
        local offset = imgui.ImVec2(ts.x / 2, ts.y / 2)
        if (self[label].clicked) and (os.clock() - self[label].anim <= 0.20) then
            imgui.SetWindowFontScale(1 - limit(os.clock() - self[label].anim, 0, 0.20))
            ts = imgui.CalcTextSize(label);
            offset = imgui.ImVec2(ts.x / 2, ts.y / 2);
            dl:AddText(imgui.ImVec2(size.x / 2, size.y / 2) + p - offset, -1, label)
            imgui.SetWindowFontScale(1)
        elseif (self[label].clicked) and (os.clock() - self[label].anim > 0.20) then
            imgui.SetWindowFontScale(0.80)
            ts = imgui.CalcTextSize(label);
            offset = imgui.ImVec2(ts.x / 2, ts.y / 2);
            dl:AddText(imgui.ImVec2(size.x / 2, size.y / 2) + p - offset, -1, label)
            imgui.SetWindowFontScale(1)
        elseif (not self[label].clicked) and (os.clock() - self[label].anim <= 0.20) then
            imgui.SetWindowFontScale(0.80 + limit(os.clock() - self[label].anim, 0, 0.20))
            ts = imgui.CalcTextSize(label);
            offset = imgui.ImVec2(ts.x / 2, ts.y / 2);
            dl:AddText(imgui.ImVec2(size.x / 2, size.y / 2) + p - offset, -1, label)
            imgui.SetWindowFontScale(1)
        else
            dl:AddText(imgui.ImVec2(size.x / 2, size.y / 2) + p - offset, -1, label)
        end
        return (imgui.IsItemHovered() and imgui.IsMouseReleased(0));
    end
})

function bringVec2To(from, to, start_time, duration)
    local timer = os.clock() - start_time
    if timer >= 0.00 and timer <= duration then
        local count = timer / (duration / 100)
        return imgui.ImVec2(
            from.x + (count * (to.x - from.x) / 100),
            from.y + (count * (to.y - from.y) / 100)
        ), true
    end
    return (timer > duration) and to or from, false
end
function limit(var, min, max)
    return var < min and min or (var > max and max or var)
end
function bazuka()
	if pbazuca then
		pbazuca = false
		removeWeaponFromChar(PLAYER_PED, 35)
		setCharProofs(PLAYER_PED, false, false, false, false, false)
		setPlayerFastReload(PLAYER_HANDLE, false)
		sampAddChatMessage('{FF5656}[SmenuBazuka]: {FFFFFF}Bazuca Puxada!', -1)
	else
		pbazuca = true
		local weap_model = getWeapontypeModel(35)
		requestModel(weap_model)
		loadAllModelsNow()
		giveWeaponToChar(PLAYER_PED, 35, 99999)
		setCharProofs(PLAYER_PED, true, true, true, true, true)
		setPlayerFastReload(PLAYER_HANDLE, true)
		sampAddChatMessage('{FF5656}[SmenuBazuka]: {FFFFFF}Bazuca Puxada!!', -1)
		lua_thread.create(bazuka2)
	end
end

function bazuka2()
	while pbazuca do
		wait(2)
		setCharProofs(PLAYER_PED, true, true, true, true, true)
		setCharCollision(PLAYER_PED, true)
		local X, Y, Z = getCharCoordinates(PLAYER_PED)
		local _, ped = findAllRandomCharsInSphere(X, Y, Z, 100, true, true)
		if _ then
			process = true
			local Xp, Yp, Zp = getCharCoordinates(ped)
			local dist = getDistanceBetweenCoords2d(Xp, Yp, X, Y)
			if dist > 3 then
				while dist > 3 do
					if X > Xp then
						X = X - 2
					else
						X = X + 2
					end
					if Y > Yp then
						Y = Y - 2
					else
						Y = Y + 2
					end
					if Z > Zp then
						Z = Z - 1
					else
						Z = Z + 1
					end
					local Zt = getGroundZFor3dCoord(X, Y, Z)
					local data = samp_create_sync_data('player')
					data.health = getCharHealth(PLAYER_PED)
					data.armor = getCharArmour(PLAYER_PED)
					data.weapon = getCurrentCharWeapon(PLAYER_PED)
					data.position.x = X
					data.position.y = Y
					data.position.z = Z
					data.send()
					dist = getDistanceBetweenCoords2d(Xp, Yp, X, Y)
				end
			end
			local data = samp_create_sync_data('player')
			data.health = getCharHealth(PLAYER_PED)
			data.armor = getCharArmour(PLAYER_PED)
			data.weapon = getCurrentCharWeapon(PLAYER_PED)
			data.position.x, data.position.y, data.position.z = getCharCoordinates(ped)
			data.send()
			wait(50)
			X, Y, Z = getCharCoordinates(PLAYER_PED)
			dist = getDistanceBetweenCoords2d(Xp, Yp, X, Y)
			if dist > 3 then
				while dist > 2 do
					if Xp > X then
						Xp = Xp - 2
					else
						Xp = Xp + 2
					end
					if Yp > Y then
						Yp = Yp - 2
					else
						Yp = Yp + 2
					end
					if Zp > Z then
						Zp = Zp - 1
					else
						Zp = Zp + 1
					end
					local Zt = getGroundZFor3dCoord(Xp, Yp, Zp)
					local data = samp_create_sync_data('player')
					data.health = getCharHealth(PLAYER_PED)
					data.armor = getCharArmour(PLAYER_PED)
					data.weapon = getCurrentCharWeapon(PLAYER_PED)
					data.position.x = Xp
					data.position.y = Yp
					data.position.z = Zp
					data.send()
					dist = getDistanceBetweenCoords2d(Xp, Yp, X, Y)
				end
			end
			local data = samp_create_sync_data('player')
			data.health = getCharHealth(PLAYER_PED)
			data.armor = getCharArmour(PLAYER_PED)
			data.weapon = getCurrentCharWeapon(PLAYER_PED)
			data.position.x, data.position.y, data.position.z = getCharCoordinates(PLAYER_PED)
			data.send()
			printStringNow('sended sync', 1000)
			wait(50)
			process = false
		end
	end
	setCharProofs(PLAYER_PED, false, false, false, false, false)
end
function sampev.onSendPlayerSync(data)
	if pbazuca or process then
		return false
	end
end

function onReceiveRpc(id, bitStream)
	if pbazuca or process then
		if id == 21 or id == 67 or id == 14 then
			return false
		end
	end
end
function imgui.ToggleButton(str_id, bool)
    local rBool = false

    if LastActiveTime == nil then
        LastActiveTime = {}
    end
    if LastActive == nil then
        LastActive = {}
    end

    local function ImSaturate(f)
        return f < 0.0 and 0.0 or (f > 1.0 and 1.0 or f)
    end

    local p = imgui.GetCursorScreenPos()
    local dl = imgui.GetWindowDrawList()

    local height = imgui.GetTextLineHeightWithSpacing()
    local width = height * 1.70
    local radius = height * 0.50
    local ANIM_SPEED = type == 2 and 0.10 or 0.15
    local butPos = imgui.GetCursorPos()

    if imgui.InvisibleButton(str_id, imgui.ImVec2(width, height)) then
        bool[0] = not bool[0]
        rBool = true
        LastActiveTime[tostring(str_id)] = os.clock()
        LastActive[tostring(str_id)] = true
    end

    imgui.SetCursorPos(imgui.ImVec2(butPos.x + width + 8, butPos.y + 2.5))
    imgui.Text( str_id:gsub('##.+', '') )

    local t = bool[0] and 1.0 or 0.0

    if LastActive[tostring(str_id)] then
        local time = os.clock() - LastActiveTime[tostring(str_id)]
        if time <= ANIM_SPEED then
            local t_anim = ImSaturate(time / ANIM_SPEED)
            t = bool[0] and t_anim or 1.0 - t_anim
        else
            LastActive[tostring(str_id)] = false
        end
    end

    local col_circle = bool[0] and imgui.ColorConvertFloat4ToU32(imgui.ImVec4(imgui.GetStyle().Colors[imgui.Col.ButtonActive])) or imgui.ColorConvertFloat4ToU32(imgui.ImVec4(imgui.GetStyle().Colors[imgui.Col.TextDisabled]))
    dl:AddRectFilled(p, imgui.ImVec2(p.x + width, p.y + height), imgui.ColorConvertFloat4ToU32(imgui.GetStyle().Colors[imgui.Col.FrameBg]), height * 0.5)
    dl:AddCircleFilled(imgui.ImVec2(p.x + radius + t * (width - radius * 2.0), p.y + radius), radius - 1.5, col_circle, 30)
    return rBool
end
function explode_argb(argb)
    local a = bit.band(bit.rshift(argb, 24), 0xFF)
    local r = bit.band(bit.rshift(argb, 16), 0xFF)
    local g = bit.band(bit.rshift(argb, 8), 0xFF)
    local b = bit.band(argb, 0xFF)
    return a, r, g, b
end
function getLocalId()
	local var_87_0, var_87_1 = sampGetPlayerIdByCharHandle(playerPed)

	return var_87_1
end
function join_argb(a, r, g, b) -- by FYP
    local argb = b  -- b
    argb = bit.bor(argb, bit.lshift(g, 8))  -- g
    argb = bit.bor(argb, bit.lshift(r, 16)) -- r
    argb = bit.bor(argb, bit.lshift(a, 24)) -- a
    return argb
end
function GetNearestPed()
    local maxDistance = nil
    maxDistance = 20000
    local nearestPED = -1
    for i = 0, sampGetMaxPlayerId(true) do
        if sampIsPlayerConnected(i) then
            local find, handle = sampGetCharHandleBySampPlayerId(i)
            if find then
                if isCharOnScreen(handle) then
                    local crosshairPos = {convertGameScreenCoordsToWindowScreenCoords(339.1, 179.1)}
                    local enPos = {getCharCoordinates(handle)}
                    local bonePos = {convert3DCoordsToScreen(enPos[1], enPos[2], enPos[3])}
                    local distance = math.sqrt((math.pow((bonePos[1] - crosshairPos[1]), 2) + math.pow((bonePos[2] - crosshairPos[2]), 2)))
                    if distance < 1.0 or distance > 80.0 then check = true else check = false end
                    if not check then
                        local myPos = {getCharCoordinates(playerPed)}
                        local enPos = {getCharCoordinates(handle)}
                        local distance = math.sqrt((math.pow((enPos[1] - myPos[1]), 2) + math.pow((enPos[2] - myPos[2]), 2) + math.pow((enPos[3] - myPos[3]), 2)))
                        if (distance < maxDistance) then
                            nearestPED = i
                            maxDistance = distance
                        end
                    end
                end
            end
        end
    end
    return nearestPED
end
function atp()
  tpres = true
end
function imgui.Link(label)

    local size = imgui.CalcTextSize(label)
    local p = imgui.GetCursorScreenPos()
    local p2 = imgui.GetCursorPos()
    local result = imgui.InvisibleButton(label, size)

    imgui.SetCursorPos(p2)

    if imgui.IsItemHovered() then

        imgui.TextColored(imgui.ImVec4(0, 1, 1, 1), label)
        imgui.GetWindowDrawList():AddLine(imgui.ImVec2(p.x, p.y + size.y), imgui.ImVec2(p.x + size.x, p.y + size.y), imgui.GetColorU32(0, 1, 0, 1))
    else
        imgui.TextColored(imgui.ImVec4(1, 0.15, 0.2, 1), label)
    end

    return result
end
function setSkinFunc(arg_131_0)
	if not panicEnabled then
		if arg_131_0:find("%d+ %d+") then
			local var_131_0, var_131_1 = arg_131_0:match("(%d+) (%d+)")

			if var_131_0 ~= nil then
				emul_rpc("onSetPlayerSkin", {
					tonumber(var_131_0),
					tonumber(var_131_1)
				})
			end
		elseif arg_131_0:find("%d+") then
			local var_131_2 = arg_131_0:match("(%d+)")

			emul_rpc("onSetPlayerSkin", {
				getLocalId(),
				tonumber(var_131_2)
			})
		end
	end
end
function Speed(arg)
	pSpeed = arg
	printStringNow(pSpeed, 2000)
end
function isKeyCheckAvailable()
	if not isSampfuncsLoaded() then
		return not isPauseMenuActive()
	end

	local var_66_0 = not isSampfuncsConsoleActive() and not isPauseMenuActive()

	if isSampLoaded() and isSampAvailable() then
		var_66_0 = var_66_0 and not sampIsChatInputActive() and not sampIsDialogActive()
	end

	return var_66_0
end
function sampev.onRemovePlayerFromVehicle()
    if naoejetado then
        return false
    end
end
function onReceiveRpc(arg_3_0, arg_3_1)
	if var_0_5 and arg_3_0 == 13 then
		return false
	end

	if var_0_5 and arg_3_0 == 87 then
		return false
	end
end
function sampev.onSendPlayerSync(arg_4_0)
	if var_0_1 then
		var_0_2 = not var_0_2
		samp_create_sync_data("aim").camMode = 0
	end

	if var_0_2 then
		sendSpectator(var_0_4)
	end

	if var_0_1 then
		var_0_6 = not var_0_6

		if var_0_6 then
			local var_4_0 = samp_create_sync_data("player")

			var_4_0.weapon = 40
			var_4_0.keysData = 128

			var_4_0.send()
			printStringNow("~r~Player Crasher", 500)

			return false
		end
	end
end
function sendSpectator(arg_5_0)
	if var_0_2 then
		local var_5_0 = samp_create_sync_data("aim")

		var_5_0.camMode = 51

		var_5_0.send()
	end
end
function drawBar(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4, arg_20_5, arg_20_6, arg_20_7, arg_20_8)
	renderDrawBoxWithBorder(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_5, arg_20_6, 4278190080)
	renderDrawBox(arg_20_0 + arg_20_6, arg_20_1 + arg_20_6, arg_20_2 / 100 * arg_20_8 - arg_20_6 * 2, arg_20_3 - 2 * arg_20_6, arg_20_4)

	local var_20_0 = renderGetFontDrawTextLength(arg_20_7, tostring(arg_20_8))
	local var_20_1 = renderGetFontDrawHeight(arg_20_7)

	renderFontDrawText(arg_20_7, tostring(arg_20_8), arg_20_0 + arg_20_2 / 2 - var_20_0 / 2, arg_20_1 + arg_20_3 / 2 - var_20_1 / 2, 4294967295)
end

function samp_create_sync_data(arg_6_0, arg_6_1)
	local var_6_0 = require("ffi")
	local var_6_1 = require("sampfuncs")
	local var_6_2 = require("samp.raknet")

	arg_6_1 = arg_6_1 or true

	local var_6_3 = ({
		player = {
			"PlayerSyncData",
			var_6_2.PACKET.PLAYER_SYNC,
			sampStorePlayerOnfootData
		},
		vehicle = {
			"VehicleSyncData",
			var_6_2.PACKET.VEHICLE_SYNC,
			sampStorePlayerIncarData
		},
		passenger = {
			"PassengerSyncData",
			var_6_2.PACKET.PASSENGER_SYNC,
			sampStorePlayerPassengerData
		},
		aim = {
			"AimSyncData",
			var_6_2.PACKET.AIM_SYNC,
			sampStorePlayerAimData
		},
		trailer = {
			"TrailerSyncData",
			var_6_2.PACKET.TRAILER_SYNC,
			sampStorePlayerTrailerData
		},
		unoccupied = {
			"UnoccupiedSyncData",
			var_6_2.PACKET.UNOCCUPIED_SYNC
		},
		bullet = {
			"BulletSyncData",
			var_6_2.PACKET.BULLET_SYNC
		},
		spectator = {
			"SpectatorSyncData",
			var_6_2.PACKET.SPECTATOR_SYNC
		}
	})[arg_6_0]
	local var_6_4 = "struct " .. var_6_3[1]
	local var_6_5 = var_6_0.new(var_6_4, {})
	local var_6_6 = tonumber(var_6_0.cast("uintptr_t", var_6_0.new(var_6_4 .. "*", var_6_5)))

	if arg_6_1 then
		local var_6_7 = var_6_3[3]

		if var_6_7 then
			local var_6_8
			local var_6_9

			if arg_6_1 == true then
				local var_6_10

				var_6_10, var_6_9 = sampGetPlayerIdByCharHandle(PLAYER_PED)
			else
				var_6_9 = tonumber(arg_6_1)
			end

			var_6_7(var_6_9, var_6_6)
		end
	end

	local function var_6_11()
		local var_7_0 = raknetNewBitStream()

		raknetBitStreamWriteInt8(var_7_0, var_6_3[2])
		raknetBitStreamWriteBuffer(var_7_0, var_6_6, var_6_0.sizeof(var_6_5))
		raknetSendBitStreamEx(var_7_0, var_6_1.HIGH_PRIORITY, var_6_1.UNRELIABLE_SEQUENCED, 1)
		raknetDeleteBitStream(var_7_0)
	end

	local var_6_12 = {
		__index = function(arg_8_0, arg_8_1)
			return var_6_5[arg_8_1]
		end,
		__newindex = function(arg_9_0, arg_9_1, arg_9_2)
			var_6_5[arg_9_1] = arg_9_2
		end
	}

	return setmetatable({
		send = var_6_11
	}, var_6_12)
end
function emul_rpc(arg_10_0, arg_10_1)
	local var_10_0 = require("samp.events.bitstream_io")
	local var_10_1 = require("samp.events.handlers")
	local var_10_2 = require("samp.events.extra_types")
	local var_10_3 = {
		onInitGame = {
			139
		},
		onPlayerJoin = {
			"int16",
			"int32",
			"bool8",
			"string8",
			137
		},
		onPlayerQuit = {
			"int16",
			"int8",
			138
		},
		onRequestClassResponse = {
			"bool8",
			"int8",
			"int32",
			"int8",
			"vector3d",
			"float",
			"Int32Array3",
			"Int32Array3",
			128
		},
		onRequestSpawnResponse = {
			"bool8",
			129
		},
		onSetPlayerName = {
			"int16",
			"string8",
			"bool8",
			11
		},
		onSetPlayerPos = {
			"vector3d",
			12
		},
		onSetPlayerPosFindZ = {
			"vector3d",
			13
		},
		onSetPlayerHealth = {
			"float",
			14
		},
		onTogglePlayerControllable = {
			"bool8",
			15
		},
		onPlaySound = {
			"int32",
			"vector3d",
			16
		},
		onSetWorldBounds = {
			"float",
			"float",
			"float",
			"float",
			17
		},
		onGivePlayerMoney = {
			"int32",
			18
		},
		onSetPlayerFacingAngle = {
			"float",
			19
		},
		onGivePlayerWeapon = {
			"int32",
			"int32",
			22
		},
		onSetPlayerTime = {
			"int8",
			"int8",
			29
		},
		onSetToggleClock = {
			"bool8",
			30
		},
		onPlayerStreamIn = {
			"int16",
			"int8",
			"int32",
			"vector3d",
			"float",
			"int32",
			"int8",
			32
		},
		onSetShopName = {
			"string256",
			33
		},
		onSetPlayerSkillLevel = {
			"int16",
			"int32",
			"int16",
			34
		},
		onSetPlayerDrunk = {
			"int32",
			35
		},
		onCreate3DText = {
			"int16",
			"int32",
			"vector3d",
			"float",
			"bool8",
			"int16",
			"int16",
			"encodedString4096",
			36
		},
		onSetRaceCheckpoint = {
			"int8",
			"vector3d",
			"vector3d",
			"float",
			38
		},
		onPlayAudioStream = {
			"string8",
			"vector3d",
			"float",
			"bool8",
			41
		},
		onRemoveBuilding = {
			"int32",
			"vector3d",
			"float",
			43
		},
		onCreateObject = {
			44
		},
		onSetObjectPosition = {
			"int16",
			"vector3d",
			45
		},
		onSetObjectRotation = {
			"int16",
			"vector3d",
			46
		},
		onDestroyObject = {
			"int16",
			47
		},
		onPlayerDeathNotification = {
			"int16",
			"int16",
			"int8",
			55
		},
		onSetMapIcon = {
			"int8",
			"vector3d",
			"int8",
			"int32",
			"int8",
			56
		},
		onRemoveVehicleComponent = {
			"int16",
			"int16",
			57
		},
		onRemove3DTextLabel = {
			"int16",
			58
		},
		onPlayerChatBubble = {
			"int16",
			"int32",
			"float",
			"int32",
			"string8",
			59
		},
		onUpdateGlobalTimer = {
			"int32",
			60
		},
		onShowDialog = {
			"int16",
			"int8",
			"string8",
			"string8",
			"string8",
			"encodedString4096",
			61
		},
		onDestroyPickup = {
			"int32",
			63
		},
		onLinkVehicleToInterior = {
			"int16",
			"int8",
			65
		},
		onSetPlayerArmour = {
			"float",
			66
		},
		onSetPlayerArmedWeapon = {
			"int32",
			67
		},
		onSetSpawnInfo = {
			"int8",
			"int32",
			"int8",
			"vector3d",
			"float",
			"Int32Array3",
			"Int32Array3",
			68
		},
		onSetPlayerTeam = {
			"int16",
			"int8",
			69
		},
		onPutPlayerInVehicle = {
			"int16",
			"int8",
			70
		},
		onSetPlayerColor = {
			"int16",
			"int32",
			72
		},
		onDisplayGameText = {
			"int32",
			"int32",
			"string32",
			73
		},
		onAttachObjectToPlayer = {
			"int16",
			"int16",
			"vector3d",
			"vector3d",
			75
		},
		onInitMenu = {
			76
		},
		onShowMenu = {
			"int8",
			77
		},
		onHideMenu = {
			"int8",
			78
		},
		onCreateExplosion = {
			"vector3d",
			"int32",
			"float",
			79
		},
		onShowPlayerNameTag = {
			"int16",
			"bool8",
			80
		},
		onAttachCameraToObject = {
			"int16",
			81
		},
		onInterpolateCamera = {
			"bool",
			"vector3d",
			"vector3d",
			"int32",
			"int8",
			82
		},
		onGangZoneStopFlash = {
			"int16",
			85
		},
		onApplyPlayerAnimation = {
			"int16",
			"string8",
			"string8",
			"bool",
			"bool",
			"bool",
			"bool",
			"int32",
			86
		},
		onClearPlayerAnimation = {
			"int16",
			87
		},
		onSetPlayerSpecialAction = {
			"int8",
			88
		},
		onSetPlayerFightingStyle = {
			"int16",
			"int8",
			89
		},
		onSetPlayerVelocity = {
			"vector3d",
			90
		},
		onSetVehicleVelocity = {
			"bool8",
			"vector3d",
			91
		},
		onServerMessage = {
			"int32",
			"string32",
			93
		},
		onSetWorldTime = {
			"int8",
			94
		},
		onCreatePickup = {
			"int32",
			"int32",
			"int32",
			"vector3d",
			95
		},
		onMoveObject = {
			"int16",
			"vector3d",
			"vector3d",
			"float",
			"vector3d",
			99
		},
		onEnableStuntBonus = {
			"bool",
			104
		},
		onTextDrawSetString = {
			"int16",
			"string16",
			105
		},
		onSetCheckpoint = {
			"vector3d",
			"float",
			107
		},
		onCreateGangZone = {
			"int16",
			"vector2d",
			"vector2d",
			"int32",
			108
		},
		onPlayCrimeReport = {
			"int16",
			"int32",
			"int32",
			"int32",
			"int32",
			"vector3d",
			112
		},
		onGangZoneDestroy = {
			"int16",
			120
		},
		onGangZoneFlash = {
			"int16",
			"int32",
			121
		},
		onStopObject = {
			"int16",
			122
		},
		onSetVehicleNumberPlate = {
			"int16",
			"string8",
			123
		},
		onTogglePlayerSpectating = {
			"bool32",
			124
		},
		onSpectatePlayer = {
			"int16",
			"int8",
			126
		},
		onSpectateVehicle = {
			"int16",
			"int8",
			127
		},
		onShowTextDraw = {
			134
		},
		onSetPlayerWantedLevel = {
			"int8",
			133
		},
		onTextDrawHide = {
			"int16",
			135
		},
		onRemoveMapIcon = {
			"int8",
			144
		},
		onSetWeaponAmmo = {
			"int8",
			"int16",
			145
		},
		onSetGravity = {
			"float",
			146
		},
		onSetVehicleHealth = {
			"int16",
			"float",
			147
		},
		onAttachTrailerToVehicle = {
			"int16",
			"int16",
			148
		},
		onDetachTrailerFromVehicle = {
			"int16",
			149
		},
		onSetWeather = {
			"int8",
			152
		},
		onSetPlayerSkin = {
			"int32",
			"int32",
			153
		},
		onSetInterior = {
			"int8",
			156
		},
		onSetCameraPosition = {
			"vector3d",
			157
		},
		onSetCameraLookAt = {
			"vector3d",
			"int8",
			158
		},
		onSetVehiclePosition = {
			"int16",
			"vector3d",
			159
		},
		onSetVehicleAngle = {
			"int16",
			"float",
			160
		},
		onSetVehicleParams = {
			"int16",
			"int16",
			"bool8",
			161
		},
		onChatMessage = {
			"int16",
			"string8",
			101
		},
		onConnectionRejected = {
			"int8",
			130
		},
		onPlayerStreamOut = {
			"int16",
			163
		},
		onVehicleStreamIn = {
			164
		},
		onVehicleStreamOut = {
			"int16",
			165
		},
		onPlayerDeath = {
			"int16",
			166
		},
		onPlayerEnterVehicle = {
			"int16",
			"int16",
			"bool8",
			26
		},
		onUpdateScoresAndPings = {
			"PlayerScorePingMap",
			155
		},
		onSetObjectMaterial = {
			84
		},
		onSetObjectMaterialText = {
			84
		},
		onSetVehicleParamsEx = {
			"int16",
			"int8",
			"int8",
			"int8",
			"int8",
			"int8",
			"int8",
			"int8",
			"int8",
			"int8",
			"int8",
			"int8",
			"int8",
			"int8",
			"int8",
			"int8",
			"int8",
			24
		},
		onSetPlayerAttachedObject = {
			"int16",
			"int32",
			"bool",
			"int32",
			"int32",
			"vector3d",
			"vector3d",
			"vector3d",
			"int32",
			"int32",
			113
		}
	}
	local var_10_4 = {
		onShowTextDraw = true,
		onSetObjectMaterialText = true,
		onVehicleStreamIn = true,
		onSetObjectMaterial = true,
		onInitMenu = true,
		onInitGame = true,
		onCreateObject = true
	}
	local var_10_5 = {
		Int32Array3 = true,
		PlayerScorePingMap = true
	}
	local var_10_6 = var_10_3[arg_10_0]

	if var_10_6 then
		local var_10_7 = raknetNewBitStream()

		if not var_10_4[arg_10_0] then
			local var_10_8 = #var_10_6 - 1

			if var_10_8 > 0 then
				for iter_10_0 = 1, var_10_8 do
					local var_10_9 = var_10_6[iter_10_0]

					if var_10_5[var_10_9] then
						var_10_2[var_10_9].write(var_10_7, arg_10_1[iter_10_0])
					else
						var_10_0[var_10_9].write(var_10_7, arg_10_1[iter_10_0])
					end
				end
			end
		elseif arg_10_0 == "onInitGame" then
			var_10_1.on_init_game_writer(var_10_7, arg_10_1)
		elseif arg_10_0 == "onCreateObject" then
			var_10_1.on_create_object_writer(var_10_7, arg_10_1)
		elseif arg_10_0 == "onInitMenu" then
			var_10_1.on_init_menu_writer(var_10_7, arg_10_1)
		elseif arg_10_0 == "onShowTextDraw" then
			var_10_1.on_show_textdraw_writer(var_10_7, arg_10_1)
		elseif arg_10_0 == "onVehicleStreamIn" then
			var_10_1.on_vehicle_stream_in_writer(var_10_7, arg_10_1)
		elseif arg_10_0 == "onSetObjectMaterial" then
			var_10_1.on_set_object_material_writer(var_10_7, arg_10_1, 1)
		elseif arg_10_0 == "onSetObjectMaterialText" then
			var_10_1.on_set_object_material_writer(var_10_7, arg_10_1, 2)
		end

		raknetEmulRpcReceiveBitStream(var_10_6[#var_10_6], var_10_7)
		raknetDeleteBitStream(var_10_7)
	end
end
function getTargetBlipCoordinatesFixed()
    local bool, x, y, z = getTargetBlipCoordinates(); if not bool then return false end
    requestCollision(x, y); loadScene(x, y, z)
    local bool, x, y, z = getTargetBlipCoordinates()
    return bool, x, y, z
end
function sampev.onPlayerChatBubble(id, col, dist, dur, msg)
	if flymode == 1 then
		return {id, col, 1488, dur, msg}
	end
end
function jetpackp()
	if activejetpackp then
		activejetpackp = false
		sampSetSpecialAction(0)
		sampAddChatMessage("{ff00ff} JetPack desativado!", 5)
	else
		activejetpackp = true
		sampSetSpecialAction(2)
		sampAddChatMessage("{ff00ff} JetPack ativado!", 5)
	end
end
function getMoveSpeed(heading)
    moveSpeed = {x = math.sin(-math.rad(heading)) * (0.250), y = math.cos(-math.rad(heading)) * (0.250), z = 0.25} 
    return moveSpeed
end

function CreateCar(id)
    vid, col1, col2 = id:match('(%d+) (%d+) (%d+)')
    if vid == nil then vid = id end if col1 == nil or col2 == nil then col1 = 1 col2 = 1 end
    vid, col1, col2 = tonumber(vid), tonumber(col1), tonumber(col2)
    if vid then 
        if vid <= 611 and vid >=  400 then
            if not hasModelLoaded(vid) then
				requestModel(vid)
				loadAllModelsNow()
            end
            if isCharInCar(PLAYER_PED, veh) then
				clearCharTasksImmediately(PLAYER_PED)
				deleteCar(veh)
				local nx, ny, nz  = getCharCoordinates(PLAYER_PED)
				veh = createCar(vid, nx, ny, nz - 1)
				warpCharIntoCar(PLAYER_PED, veh)
				changeCarColour(veh, col1, col2)
				sampAddChatMessage("[{00DD00}Smenuveh{FFFFFF}] - {FFC000}Este modelo de carro ainda nao foi adicionado e nao pode ser spawnado agora!", - 1)
			else
                local x, y, z  = getCharCoordinates(PLAYER_PED)
				veh = createCar(vid, x, y, z)
				warpCharIntoCar(PLAYER_PED, veh)
				changeCarColour(veh, col1, col2)
				sampAddChatMessage(string.format("[{00DD00}Smenuveh{FFFFFF}] - {FFC000}Veiculo ID {20E15D}%s {FFC000}foi spawnado com sucesso!", vid), - 1)
			end
        else
            sampAddChatMessage('[{00DD00}Smenuveh{FFFFFF}] - {FFC000}Numero de modelo nao especificado. Use {20E15D}/smenucriarveh [400-611] ', -1)
        end
    end
end
function sampev.onSendPlayerSync(data)
    if byp then
        for i = 0, 2 do
            data.quaternion[i] = 0
        end
        data.upDownKeys = 65408
        data.keysData = 8
        data.animationId = 1234
        data.animationFlags = 32770

        local heading = getCharHeading(PLAYER_PED)

        data.moveSpeed.x = math.sin(-math.rad(heading)) * 0.4
        data.moveSpeed.y = math.cos(-math.rad(heading)) * 0.4
        
        printStringNow("~>~ FlyHack Bypass ~<~", 500)
    end
end
function enableDialog(arg_8_0)
	require("memory").setint32(sampGetDialogInfoPtr() + 40, arg_8_0 and 1 or 0, true)
	sampToggleCursor(arg_8_0)
end
function message(text)
	return sampAddChatMessage('{ff0000}[SCARLLET-FAKESPAWN]: {ffffff}Voce foi spawnado{ffffff} '..text, 0xFF0000)
end

function sampev.onSendPlayerSync(arg_1_0)
	if aim.CheckBox.teste131[0] then
		arg_1_0.weapon = 0
	end
end


function foreachCar(func)
    local numVehicles = getNumOfVehicles()

    for i = 0, numVehicles - 1 do
        local vehicle = getCarHandle(i)

        if doesCarExist(vehicle) then
            func(vehicle)
        end
    end
end
function cmdWarp(arg_9_0)
	if #arg_9_0 > 0 then
		local var_9_0 = tonumber(arg_9_0)

		if sampIsPlayerConnected(var_9_0) then
			local var_9_1, var_9_2, var_9_3, var_9_4 = sampGetStreamedOutPlayerPos(var_9_0)

			if var_9_1 then
				teleportToPlayer(var_9_0, var_9_2 + 1, var_9_3 + 1, var_9_4)
			else
				local var_9_5, var_9_6 = sampGetCharHandleBySampPlayerId(var_9_0)

				if var_9_5 and doesCharExist(var_9_6) then
					local var_9_7, var_9_8, var_9_9 = getCharCoordinates(var_9_6)

					teleportToPlayer(var_9_0, var_9_7 + 1, var_9_8 + 1, var_9_9 - 1)
				else
					sampAddChatMessage(string.format("JOGADOR %s MUITO LONGE", sampGetPlayerNickname(var_9_0), var_9_0), 65535)
				end
			end
		else
			sampAddChatMessage(string.format("JOGADOR %d NAO ENCONTRADO", var_9_0), 65535)
		end
	end
end
function sampev.onUnoccupiedSync(id, data)
    players[id] = "PC"
end

function onReceiveRpc(id, bs)
	if aim.CheckBox.teste158[0] and id == 61 then return false end
	if aim.CheckBox.teste159[0] and id == 124 then return false end
	if aim.CheckBox.teste160[0] and id == 14 then return false end
	if aim.CheckBox.teste161[0] and id == 22 then return false end
	if aim.CheckBox.teste162[0] and id == 21 then return false end
	if aim.CheckBox.teste163[0] and id == 67 then return false end
	if aim.CheckBox.teste164[0] and id == 128 then return false end
	if aim.CheckBox.teste165[0] and id == 129 then return false end
	if aim.CheckBox.teste166[0] and id == 86 then return false end
	if aim.CheckBox.teste167[0] and id == 87 then return false end
	if aim.CheckBox.teste168[0] and id == 74 then return false end
	if aim.CheckBox.teste169[0] and id == 19 then return false end
	if aim.CheckBox.teste170[0] and id == 15 then return false end
end
function nameTagOn()
	local pStSet = sampGetServerSettingsPtr()
	NTdist = memory.getfloat(pStSet + 39) -- дальность
	NTwalls = memory.getint8(pStSet + 47) -- видимость через стены
	NTshow = memory.getint8(pStSet + 56) -- видимость тегов
	memory.setfloat(pStSet + 39, 1488.0)
	memory.setint8(pStSet + 47, 0)
	memory.setint8(pStSet + 56, 1)
end
function showfps()
	mostrarfps = not mostrarfps

	if mostrarfps then
		thread = lua_thread.create(function()
			while mostrarfps do
				wait(500)

				local var_4_0 = memory.getfloat(12045136, true)
				local var_4_1 = math.floor(var_4_0)

				printStyledString(var_4_1 .. "fps", 1000, 5)
				wait(500)
			end
		end)
	else
		thread:terminate()
	end
end
function prepare()
    if not votroll then
        lua_thread.create(function() 
            sampSendInteriorChange(getActiveInterior() + 1)
            wait(10)
            sampForceOnfootSync()
            wait(10)
            sampSendInteriorChange(getActiveInterior())
        end)
    end
end

function sampev.onSendPlayerSync(data)
    if votroll and ready then
        sendSpectator(data.position)
        return false
    end
end

function nameTagOff()
	local pStSet = sampGetServerSettingsPtr()
	memory.setfloat(pStSet + 39, NTdist)
	memory.setint8(pStSet + 47, NTwalls)
	memory.setint8(pStSet + 56, NTshow)
end


--- Events
function onExitScript()
	if NTdist then
		nameTagOff()
	end
end

function sampev.onPlayerSync(id, data)
    if data.keysData == 160 then
        players[id] = "PC"
    end
    if data.specialAction ~= 0 and data.specialAction ~= 1 then
        players[id] = "PC"
    end
    if data.leftRightKeys ~= nil then
        if data.leftRightKeys ~= 128 and data.leftRightKeys ~= 65408 then
            players[id] = "Mobile"
        else
            if players[id] ~= "Mobile" then
                players[id] = "PC"
            end
        end
    end
    if data.upDownKeys ~= nil then
        if data.upDownKeys ~= 128 and data.upDownKeys ~= 65408 then
            players[id] = "Mobile"
        else
            if players[id] ~= "Mobile" then
                players[id] = "PC"
            end
        end
    end
end
function onReceiveRpc(arg_24_0, arg_24_1)
	if var_0_33[0] and RPC[arg_24_0] then
		return false
	end

	if aim.CheckBox.teste233[0] and arg_24_0 == 128 then
		return false
	end

	if aim.CheckBox.teste233[0] and arg_24_0 == 129 then
		return false
	end

	if aim.CheckBox.teste233[0] and arg_24_0 == 86 then
		return false
	end

	if aim.CheckBox.teste233[0] and arg_24_0 == 87 then
		return false
	end

	if aim.CheckBox.teste233[0] and arg_24_0 == 19 then
		return false
	end
end

function sampev.onSetInterior(arg_25_0)
	if aim.CheckBox.teste233[0] then
		return false
	end
end


function sampev.onSetCameraBehind()
	if aim.CheckBox.teste233[0] then
		return false
	end
end

function sampev.onSetPlayerAttachedObject(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	if aim.CheckBox.teste233[0] then
		return false
	end
end
function showCursorForClickWarp(toggle)
    if toggle then
        sampSetCursorMode(CMODE_LOCKCAM)
    else
        sampToggleCursor(false)
    end
end
function sampev.onInterpolateCamera()
	if aim.CheckBox.teste233[0] then
		return false
	end
end

function sampev.onShowDialog()
	if aim.CheckBox.teste233[0] then
		return false
	end
end

function sampev.onApplyPlayerAnimation(arg_32_0)
	if aim.CheckBox.teste233[0] then
		return false
	end
end

function sampev.onClearPlayerAnimation(arg_33_0)
	if aim.CheckBox.teste233[0] then
		return false
	end
end

function sampev.onResetPlayerWeapons()
	if aim.CheckBox.teste233[0] then
		return false
	end
end

function sampev.onSetPlayerArmedWeapon(arg_35_0)
	if aim.CheckBox.teste233[0] then
		return false
	end
end

function sampev.onTogglePlayerControllable(arg_36_0)
	if aim.CheckBox.teste233[0] then
		return false
	end
end

function sampev.onGivePlayerWeapon(arg_37_0, arg_37_1)
	if aim.CheckBox.teste233[0] then
		return false
	end

	if aim.CheckBox.teste233[0] then
		if arg_37_0 == 0 and arg_37_1 == 0 then
			return false
		elseif arg_37_0 == 0 and arg_37_1 == 1 then
			return false
		end
	end
end

function sampev.onSetWeaponAmmo(arg_38_0, arg_38_1)
	if aim.CheckBox.teste233[0] then
		return false
	end

	if aim.CheckBox.teste233[0] then
		if arg_38_0 == 0 and arg_38_1 == 0 then
			return false
		elseif arg_38_0 == 0 and arg_38_1 == 1 then
			return false
		end
	end
end

function sampev.onSetPlayerFacingAngle(arg_39_0)
	if aim.CheckBox.teste233[0] then
		return false
	end
end

function imgui.TextColoredRGB(text)
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4
    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end
    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImVec4(r/255, g/255, b/255, a/255)
    end
    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else imgui.Text(u8(w)) end
        end
    end
    render_text(text)
end
function sampev.onSendPlayerSync(arg_234_0)
	if aim.CheckBox.teste117[0] then
		arg_234_0.specialAction = 3
	end
end
function sampev.onSendPlayerSync(data)
    if mplataforma then
        if data.keysData == 160 then
            data.keysData = 0
        end
        if data.specialAction ~= 0 and data.specialAction ~= 1 then
            data.specialAction = 0
        end
        
        if data.leftRightKeys == 128 then data.leftRightKeys = math.random(126, 130) end
        if data.leftRightKeys == 65408 then data.leftRightKeys = math.random(65406, 65410) end
    
        if data.upDownKeys == 128 then data.upDownKeys = math.random(126, 130) end
        if data.upDownKeys == 65408 then data.upDownKeys = math.random(65406, 65410) end
    end
end


function getClosestPlayerId()
	local minDist = 9999
	local closestId = -1
	local x, y, z = getCharCoordinates(PLAYER_PED)
	for i = 0, 999 do
		local streamed, pedID = sampGetCharHandleBySampPlayerId(i)
		if streamed then
			local xi, yi, zi = getCharCoordinates(pedID)
			local dist = math.sqrt( (xi - x) ^ 2 + (yi - y) ^ 2 + (zi - z) ^ 2 )
			if dist < minDist then
				minDist = dist
				closestId = i
			end
		end
	end
	return closestId
end
function sampev.onSendPlayerSync(data)
    if naocairobj then
        data.keysData = 0
    end
end

function sampev.onSetPlayerSpecialAction()
    if naocairobj then
        return false
    end
end
function sampev.onVehicleSync(id, vehid, data)
    if data.leftRightKeys ~= 0 then
        if data.leftRightKeys ~= 128 and data.leftRightKeys ~= 65408 then
            players[id] = "Mobile"
        end
    end
end
function sampev.onPlayerQuit(id)
    players[id] = nil
end
function sampev.onApplyPlayerAnimation(arg_85_0)
	if aim.CheckBox.teste59[0] and arg_85_0 == select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)) then
		return false
	end
end
function find_nearest_driving_player_onscreen(arg_228_0, arg_228_1, arg_228_2)
	local var_228_0 = find_nearest_ped(arg_228_0, arg_228_1, arg_228_2, function(arg_229_0)
		local var_229_0, var_229_1 = sampGetPlayerIdByCharHandle(arg_229_0)

		return isCharInAnyCar(arg_229_0) and isCharOnScreen(arg_229_0) and var_229_0
	end)

	if var_228_0 == nil then
		return nil
	end

	local var_228_1, var_228_2 = sampGetPlayerIdByCharHandle(var_228_0)

	return var_228_2
end
function find_nearest_ped(arg_231_0, arg_231_1, arg_231_2, arg_231_3)
	local var_231_0
	local var_231_1
	local var_231_2, var_231_3 = findAllRandomCharsInSphere(arg_231_0, arg_231_1, arg_231_2, 1000, false, true)

	while var_231_2 do
		wait(0)

		if arg_231_3(var_231_3) then
			local var_231_4, var_231_5, var_231_6 = getCharCoordinates(var_231_3)
			local var_231_7 = getDistanceBetweenCoords3d(arg_231_0, arg_231_1, arg_231_2, var_231_4, var_231_5, var_231_6)

			var_231_1 = var_231_3
		end

		var_231_2, var_231_3 = findAllRandomCharsInSphere(arg_231_0, arg_231_1, arg_231_2, 1000, true, true)
	end

	return var_231_1
end
function onWindowMessage(arg_8_0, arg_8_1, arg_8_2)
	if act86 and (arg_8_0 == wm.WM_KEYUP or arg_8_0 == wm.WM_SYSKEYUP) and not sampIsCursorActive() and arg_8_1 == key.VK_Z then
		bool = os.time() + 5
	end
end
function CleanMemory()
	callFunction(4249536, 1, 1, -1)
end
function onReceivePacket(arg_9_0, arg_9_1)
	if bool and type(bool) == "number" and bool >= os.time() then
		return false
	end

	return true
end



function remove_ped_from_car(arg_226_0)
	local var_226_0, var_226_1, var_226_2 = getCharCoordinates(arg_226_0)
	local var_226_3 = var_226_2 - 4

	warpCharFromCarToCoord(arg_226_0, var_226_0, var_226_1, var_226_3)
end
function get_car_free_passenger_seat(arg_227_0)
	local var_227_0 = getMaximumNumberOfPassengers(arg_227_0)

	for iter_227_0 = 0, var_227_0 do
		if isCarPassengerSeatFree(arg_227_0, iter_227_0) then
			return iter_227_0
		end
	end

	return nil
end
function GetPedPro()
    local floatbuffer4 = 100.0 -- Definindo o valor padrão para floatbuffer4
    local maxDistance = floatbuffer4
    local nearestPED = -1
    
    for i = 0, sampGetMaxPlayerId(true) do
        if sampIsPlayerConnected(i) then
            local find, handle = sampGetCharHandleBySampPlayerId(i)
            if find then
                if isCharOnScreen(handle) then
                    local crosshairPos = {convertGameScreenCoordsToWindowScreenCoords(339.1, 179.1)}
                    local enPos = {getCharCoordinates(handle)}
                    local bonePos = {convert3DCoordsToScreen(enPos[1], enPos[2], enPos[3])}
                    local distance = math.sqrt((math.pow((bonePos[1] - crosshairPos[1]), 2) + math.pow((bonePos[2] - crosshairPos[2]), 2)))
                    
                    if distance < 1.0 or distance > 80.0 then 
                        check = true 
                    else 
                        check = false 
                    end
                    
                    if not check then
                        local myPos = {getCharCoordinates(playerPed)}
                        local distance = getDistanceBetweenCoords3d(myPos[1], myPos[2], myPos[3], enPos[1], enPos[2], enPos[3])
                        
                        if distance < maxDistance then
                            nearestPED = i
                            maxDistance = distance
                        end
                    end
                end
            end
        end
    end
    return nearestPED
end


function find_nearest_driving_player_onscreen(arg_228_0, arg_228_1, arg_228_2)
	local var_228_0 = find_nearest_ped(arg_228_0, arg_228_1, arg_228_2, function(arg_229_0)
		local var_229_0, var_229_1 = sampGetPlayerIdByCharHandle(arg_229_0)

		return isCharInAnyCar(arg_229_0) and isCharOnScreen(arg_229_0) and var_229_0
	end)

	if var_228_0 == nil then
		return nil
	end

	local var_228_1, var_228_2 = sampGetPlayerIdByCharHandle(var_228_0)

	return var_228_2
end
function rand()
	return math.random(-50, 50) / 100
end

function sendBullet(type, id, weap)
    local res, handle = sampGetCharHandleBySampPlayerId(id)
    if weap == -1 or weap == nil then weap = getCurrentCharWeapon(1) end
    if res then
        local x, y, z = getCharCoordinates(handle)
        local data = samp_create_sync_data('bullet', true)
        data.targetType = type
        data.targetId = tonumber(id)
        data.origin.x, data.origin.y, data.origin.z = getActiveCameraCoordinates()
        data.target.x, data.target.y, data.target.z = x, y, z
        data.center.x, data.center.y, data.center.z = rand(),  rand(),  rand()
        data.weaponId = tonumber(weap)
        data.send()
        sampSendGiveDamage(id,getDamage(tonumber(weap)),tonumber(weap),3)
        setCharAmmo(1,weap,getAmmoInCharWeapon(1,weap)-1)
    end
end
function find_nearest_ped(arg_231_0, arg_231_1, arg_231_2, arg_231_3)
	local var_231_0
	local var_231_1
	local var_231_2, var_231_3 = findAllRandomCharsInSphere(arg_231_0, arg_231_1, arg_231_2, 1000, false, true)

	while var_231_2 do
		wait(0)

		if arg_231_3(var_231_3) then
			local var_231_4, var_231_5, var_231_6 = getCharCoordinates(var_231_3)
			local var_231_7 = getDistanceBetweenCoords3d(arg_231_0, arg_231_1, arg_231_2, var_231_4, var_231_5, var_231_6)

			var_231_1 = var_231_3
		end

		var_231_2, var_231_3 = findAllRandomCharsInSphere(arg_231_0, arg_231_1, arg_231_2, 1000, true, true)
	end

	return var_231_1
end
require("lib.samp.events").onSendPlayerSync = function (slot0)
	if slot0.animationId >= 1222 and slot0.animationId <= 1236 or slot0.animationId >= 1276 and slot0.animationId <= 1280 or slot0.animationId == 1193 or slot0.animationId == 1194 or slot0.animationId >= 1247 and slot0.animationId <= 1249 then
		slot0.animationId = 1236

		return slot0
	elseif slot0.animationId == 1197 or slot0.animationId == 1198 then
		slot0.animationId = 1195

		return slot0
	end
end
function sampev.onSendPlayerSync(data)
    if bypass then
        local sync = samp_create_sync_data('spectator')
         sync.position = {x = x, y = y, z = z}
         sync.position = data.position
         sync.send()
        return false
end
end
function getDistance(entity1, entity2)
    local pos1 = entity1.position
    local pos2 = entity2.position
    return ((pos1.x - pos2.x)^2 + (pos1.y - pos2.y)^2 + (pos1.z - pos2.z)^2)^0.5
end
function dynamic_array(arg_69_0)
	local var_69_0 = {}

	for iter_69_0 = 1, arg_69_0 do
		var_69_0[iter_69_0] = {
			__index = function(arg_70_0, arg_70_1)
				if iter_69_0 < arg_69_0 then
					arg_70_0[arg_70_1] = setmetatable({}, var_69_0[iter_69_0 + 1])

					return arg_70_0[arg_70_1]
				end
			end
		}
	end

	return setmetatable({}, var_69_0[1])
end
function isPointsOnScreen(arg_68_0)
	for iter_68_0, iter_68_1 in ipairs(arg_68_0) do
		if isPointOnScreen(iter_68_1.x, iter_68_1.y, iter_68_1.z, 0) then
			if iter_68_0 == #arg_68_0 then
				return true
			end
		else
			return false
		end
	end
end
function getNearestCar(player)
    local cars = aim.GetAllVehicles() -- Supondo que exista uma função aim.GetAllVehicles() que retorna todos os carros no jogo
    local nearestCar = nil
    local nearestDistance = math.huge
    
    for _, car in ipairs(cars) do
        local distance = getDistance(player, car)
        if distance < nearestDistance then
            nearestCar = car
            nearestDistance = distance
        end
    end
    
    return nearestCar
end
function adminvision()
	if aim.CheckBox.teste193[0] then
		lua_thread.create(function()
			while true do wait(0)
				if aim.CheckBox.teste193[0] then
					for i=0, 2048 do
						if sampIs3dTextDefined(i) then
						local text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById(i)
							if text:find("hp") then
								admid = playerId
								local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
								if admid ~= myid then
									local admres, admped = sampGetCharHandleBySampPlayerId(admid)
									if admped then
										admdoes = doesCharExist(admped)
										if not admdoes then
											local admname = sampGetPlayerNickname(admid)
											if sms then
												notf.addNotification(string.format("Administrador:\nNova mensagem de ["..admid.."] "..admname.."", 500, os.date()), 25)
												sms = false
											end
											renderFontDrawText(font, "Nova mensagem de", 49, 285, 0xFFFFFFFF, 0x90000000)
											renderFontDrawText(font, "["..admid.."] "..admname.."", 49, 320, 0xFFFFFFFF, 0x90000000)
											end
										end
									end
								end
							end
						end
					end
				end
			end)
		end
	end
function sampev.onAimSync(playerId, data)
end
function sampev.onRemovePlayerFromVehicle() if nolic then return false end end

function sampev.onSetPlayerPos() if nolic then return false end end

function sampev.onServerMessage(c, m)
	local mes1 = 'Voce nao pode iniciar um dialogo enquanto sentado'
	local mes2 = 'Este eh um dialogo bloqueado, voce nao pode interagir'
	if nolic and (m:find(mes1) or m:find(mes2)) then return false end
end
function sampev.onSendPlayerSync(arg_7_0)
	if aim.CheckBox.teste214[0] then
		arg_7_0.position.z = pPlayerPosZ - 5
	end
end


function GetNearestPed(fov)
    local nearestPED = -1
    for i = 0, sampGetMaxPlayerId(true) do
        if sampIsPlayerConnected(i) then
            local find, handle = sampGetCharHandleBySampPlayerId(i)
            if find then
                if isCharOnScreen(handle) then
                    if not isCharDead(handle) then
                        local _, currentID = sampGetPlayerIdByCharHandle(PLAYER_PED)
                        local enPos = {getCharCoordinates(handle)}
                        local myPos = {getActiveCameraCoordinates()}
                        local vector = {myPos[1] - enPos[1], myPos[2] - enPos[2], myPos[3] - enPos[3]}
                        if isWidescreenOnInOptions() then coefficentZ = 0.0778 else coefficentZ = 0.103 end
                        local angle = {(math.atan2(vector[2], vector[1]) + 0.04253), (math.atan2((math.sqrt((math.pow(vector[1], 2) + math.pow(vector[2], 2)))), vector[3]) - math.pi / 2 - coefficentZ)}
                        local view = {fix(representIntAsFloat(readMemory(0xB6F258, 4, false))), fix(representIntAsFloat(readMemory(0xB6F248, 4, false)))}
                        local distance = math.sqrt((math.pow(angle[1] - view[1], 2) + math.pow(angle[2] - view[2], 2))) * 57.2957795131
                        if distance > fov then check = true else check = false end
                        if not check then
                            local myPos = {getCharCoordinates(PLAYER_PED)}
                            local distance = math.sqrt((math.pow((enPos[1] - myPos[1]), 2) + math.pow((enPos[2] - myPos[2]), 2) + math.pow((enPos[3] - myPos[3]), 2)))
                            if (distance < maxDistance) then
                                nearestPED = handle
                                maxDistance = distance
                            end
                        end
                    end
                end
            end
        end
    end
    return nearestPED
end
function sampev.onSendSpawn()
    if bypass then
        return false
    end
end
function sampev.onSendPlayerSync(a)
    if activate then
        a.keys.enterExitCar = 1
    end
end

function sampev.onApplyPlayerAnimation()
    if activate then
        return false
    end
end

sampev.onSendPlayerSync = function (slot0)
	if slot0.animationId >= 1222 and slot0.animationId <= 1236 or slot0.animationId >= 1276 and slot0.animationId <= 1280 or slot0.animationId == 1193 or slot0.animationId == 1194 or slot0.animationId >= 1247 and slot0.animationId <= 1249 then
		slot0.animationId = 1236

		return slot0
	elseif slot0.animationId == 1197 or slot0.animationId == 1198 then
		slot0.animationId = 1195

		return slot0
	end
end

function getDamage(weap)
	local damage = {
		[22] = 8.25,
		[23] = 13.2,
		[24] = 46.200000762939,
		[25] = 30,
		[26] = 30,
		[27] = 30,
		[28] = 6.6,
		[29] = 8.25,
		[30] = 9.9,
		[31] = 9.9000005722046,
		[32] = 6.6,
		[33] = 25,
		[38] = 46.2
	}
	return (damage[weap] or 0) + math.random(1e9)/1e15
end
function rand() return math.random(-50, 50) / 100 end
function getpx()
	return ((w / 2) / getCameraFov()) * aim.CheckBox.silentFov[0]
end
function getClosestPlayerFromCrosshair()
	local R1, target = getCharPlayerIsTargeting(0)
	local R2, player = sampGetPlayerIdByCharHandle(target)
	if R2 then return player, target end
	local minDist = getpx()
	local closestId, closestPed = -1, -1
	for i = 0, 999 do
		local res, ped = sampGetCharHandleBySampPlayerId(i)
		if res then
			if getDistanceFromPed(ped) < aim.CheckBox.silentMaxDist[0] then
                local xi, yi = convert3DCoordsToScreen(getCharCoordinates(ped))
                local dist = math.sqrt( (xi - xc) ^ 2 + (yi - yc) ^ 2 )
                if dist < minDist then
                    minDist = dist
                    closestId, closestPed = i, ped
                end
			end
		end
	end
	return closestId, closestPed
end

function sampev.onSendBulletSync(data)
    math.randomseed(os.clock())
    if not aim.CheckBox.silentAim[0] then return end
    local weap = getCurrentCharWeapon(PLAYER_PED)
    if not getDamage(weap) then return end
    local id, ped = getClosestPlayerFromCrosshair()
    if id == -1 then return end
    if math.random(1, 100) < aim.CheckBox.missRatio[0] then return end
    if not getcond(ped) then return end
    data.targetType = 1
    local px, py, pz = getCharCoordinates(ped)
    data.targetId = id

    data.target = { x = px + rand(), y = py + rand(), z = pz + rand() }
    data.center = { x = rand(), y = rand(), z = rand() }

    lua_thread.create(function()
         wait(1)
        sampSendGiveDamage(id, getDamage(weap), weap, 3)
    end)
end
function getCarDrivenByPlayer(ped)
	if isCharInAnyCar(ped) then
		local car = storeCarCharIsInNoSave(ped)
		return (getDriverOfCar(car) == ped), car
	end
	return false
end
function rainbow(speed, alpha)
    return math.floor(math.sin(os.clock() * speed) * 127 + 128), math.floor(math.sin(os.clock() * speed + 2) * 127 + 128), math.floor(math.sin(os.clock() * speed + 4) * 127 + 128), alpha
end
function takedmg(id)
	if dardmg then
		dardmg = false
		sampAddChatMessage('Comando executado!', -1)
	elseif id == '' then
		sampAddChatMessage('Uso correto: /smenufakekill [id_do_jogador]', -1)
	else
		if not sampIsPlayerConnected(id) then
			sampAddChatMessage('Jogador nao esta online', -1)
		else
			dardmg = true
			target = tonumber(id)
			lua_thread.create(kick)
			sampAddChatMessage('Ataque iniciado', -1)
		end
	end
end

function kick()
	while dardmg do
		wait(0)
		if not sampIsPlayerConnected(target) then
			dardmg = false
			sampAddChatMessage('Jogador desconectado', -1)
		else
			sampSendTakeDamage(target, 100, 38, 3)
			sampSendDeathByPlayer(target, 38)
			wait(1000)
		end
	end
end
function SetRwObjectAlpha(handle, alpha)
    local pedEn = getCharPointer(handle)
    if pedEn ~= 0 then
        ffi.cast("void (__thiscall *)(int, int)", 0x5332C0)(pedEn, alpha)
    end
end
function onReceiveRpc(id, bs)
    if getCurrentCharWeapon(1) ~= 0 and (id == 15 or id == 67) then
        if aim.CheckBox.teste129[0] then
            return false
        end
    end
end
function getÑorrectWordByNumber(number)
	x = ' jogadores'
	y = ' jogador'
	z = ' jogadora'
	local words = {
	[1] = count..y,
	[2] = count..z,
	[3] = count..z,
	[4] = count..z,
	[5] = count..x,
	[6] = count..x,
	[7] = count..x,
	[8] = count..x,
	[9] = count..x,
	[10] = count..x,
	[11] = count..x,
	[12] = count..x,
	[13] = count..x,
	[14] = count..x,
	[15] = count..x,
	[16] = count..x,
	[17] = count..x,
	[18] = count..x,
	[19] = count..x,
	[20] = count..x,
	[21] = count..y,
	[22] = count..z,
	[23] = count..z,
	[24] = count..z,
	[25] =count..x}
	return words[number]
end
function renderFigure2D(x, y, points, radius, color)
    local step = math.pi * 2 / points
    local render_start, render_end = {}, {}
    for i = 0, math.pi * 2, step do
        render_start[1] = radius * math.cos(i) + x
        render_start[2] = radius * math.sin(i) + y
        render_end[1] = radius * math.cos(i + step) + x
        render_end[2] = radius * math.sin(i + step) + y
        renderDrawLine(render_start[1], render_start[2], render_end[1], render_end[2], 1, color)
    end
end
function sampev.onVehicleSync(arg_319_0, arg_319_1, arg_319_2)
	if aim.CheckBox.teste196[0] and is_player_stealing_my_vehicle(arg_319_0, arg_319_1) then
		if not warningMsgTick or gameClock() - warningMsgTick > 3 then
			sampAddChatMessage(string.format("{FFFF00}%s(%d) {FFFFFF}Está tentando {FF0000}roubar {FFFFFF}seu veículo!", sampGetPlayerNickname(arg_319_0), arg_319_0), -1)
			warningMsgTick = gameClock()
		end
		lua_thread.create(take_vehicle_back, arg_319_1)
		return false
	end
end
function sampev.onPlayerEnterVehicle(arg_320_0, arg_320_1, arg_320_2)
	if aim.CheckBox.teste196[0] and is_player_stealing_my_vehicle(arg_320_0, arg_320_1) then
		return false
	end
end
function is_player_stealing_my_vehicle(arg_324_0, arg_324_1)
	if isCharInAnyCar(playerPed) and sampIsPlayerConnected(arg_324_0) then
		local var_324_0, var_324_1 = sampGetVehicleIdByCarHandle(storeCarCharIsInNoSave(playerPed))

		return var_324_1 == arg_324_1
	end

	return false
end
function showCrosshairInstantlyPatch(arg_217_0)
	if arg_217_0 then
		if not patch_showCrosshairInstantly then
			patch_showCrosshairInstantly = memory.read(5824985, 1, true)
		end

		memory.write(5824985, 235, 1, true)
	elseif patch_showCrosshairInstantly ~= nil then
		memory.write(5824985, patch_showCrosshairInstantly, 1, true)

		patch_showCrosshairInstantly = nil
	end
end
function sampev.onSendPlayerSync(data)
    if bypass then
      local sync = samp_create_sync_data('spectator')
      sync.position = {x = x, y = y, z = z}
      sync.position = data.position
      sync.send()
      return false
   end
end

function sampev.onSendSpawn()
    if bypass then
        return false
    end
end

function getCoordinatesInFrontOfChar(handle, distance)
    if not doesCharExist(handle) then return false end
    local atX, atY, atZ = getCharCoordinates(handle)
    local angle = getCharHeading(handle)
    atX = atX + (distance * math.sin(math.rad(-angle)))
    atY = atY + (distance * math.cos(math.rad(-angle)))
    return true, atX, atY, atZ-1
end
function PlaySound(soundid, x, y, z)
    local bs = raknetNewBitStream()
    raknetBitStreamWriteInt32(bs, soundid)
    raknetBitStreamWriteFloat(bs, x)
    raknetBitStreamWriteFloat(bs, y)
    raknetBitStreamWriteFloat(bs, z)
    raknetEmulRpcReceiveBitStream(16, bs)
    raknetDeleteBitStream(bs)
end
function onReceiveRpc(ID)
	if COLETEZ and ID == 66 then
        return false
    end
    if SAFE and (ID == 30 or ID == 86 or ID == 157 or ID == 162 or ID == 61 or ID == 67 or ID == 86 or ID == 15) then
        return false
    end
end
function ApplyPlayerAnimation(AnimLib, AnimName, fDelta, loop, lockx, locky, freeze, Time)
    local bs = raknetNewBitStream()
    raknetBitStreamWriteInt16(bs, select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
    raknetBitStreamWriteInt8(bs, #AnimLib)
    raknetBitStreamWriteString(bs, AnimLib)
    raknetBitStreamWriteInt8(bs, #AnimName)
    raknetBitStreamWriteString(bs, AnimName)
    raknetBitStreamWriteFloat(bs, fDelta)
    raknetBitStreamWriteBool(bs, loop)
    raknetBitStreamWriteBool(bs, lockx)
    raknetBitStreamWriteBool(bs, locky)
    raknetBitStreamWriteBool(bs, freeze)
    raknetBitStreamWriteInt32(bs, Time)
    raknetEmulRpcReceiveBitStream(86, bs)
    raknetDeleteBitStream(bs)
end
function ClearPlayerAnimation()
    local bs = raknetNewBitStream()
    raknetBitStreamWriteInt16(bs, select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
    raknetEmulRpcReceiveBitStream(87, bs)
    raknetDeleteBitStream(bs)
end
function sampev.onSendRequestSpawn()
   if bypass then
        return false
    end
end

function enableDialog(bool)
    local memory = require 'memory'
    memory.setint32(sampGetDialogInfoPtr()+40, bool and 1 or 0, true)
    sampToggleCursor(bool)
end
function sampev.onResetPlayerWeapons()
	if bypass2 then
		return false
	end
end

	function sampev.onSendGiveDamage(id, damage, weapon, bodypart)
		if aim.CheckBox.teste240[0] then
			return {id, damage, weapon, 9}
		end

	if bypass2 then
		return false
	end
end
function unlockCmd(arg)
	if string.len(arg) == 0 then
		sampAddChatMessage('Uso: /smenudestrancar [ID do veiculo]', -1)
		return
	end
	local id = tonumber(arg)
	local result, v = sampGetCarHandleBySampVehicleId(id)
	if not result then
		sampAddChatMessage('Veiculo nao encontrado ou ID invalido', -1)
		return
	end
	unlockVeh(id)
	printString('Portas do veiculo desbloqueadas!', 1500)
end

function unlockVeh(v)
	local bs = raknetNewBitStream()
	raknetBitStreamWriteInt16(bs, v)
	raknetBitStreamWriteInt8(bs, 0)
	raknetBitStreamWriteInt8(bs, 0)
	raknetEmulRpcReceiveBitStream(RPC_SCRSETVEHICLEPARAMSFORPLAYER, bs)
	raknetDeleteBitStream(bs)
end
function changeRadarColor(rgba)
    local r = bit.band(bit.rshift(rgba, 24), 0xFF)
    local g = bit.band(bit.rshift(rgba, 16), 0xFF)
    local b = bit.band(bit.rshift(rgba, 8), 0xFF)
    local a = bit.band(rgba, 0xFF)
    memory.write(0x58A798, r, 1, true)
    memory.write(0x58A89A, r, 1, true)
    memory.write(0x58A8EE, r, 1, true)
    memory.write(0x58A9A2, r, 1, true)

    memory.write(0x58A790, g, 1, true)
    memory.write(0x58A896, g, 1, true)
    memory.write(0x58A8E6, g, 1, true)
    memory.write(0x58A99A, g, 1, true)

    memory.write(0x58A78E, b, 1, true)
    memory.write(0x58A894, b, 1, true)
    memory.write(0x58A8DE, b, 1, true)
    memory.write(0x58A996, b, 1, true)

    memory.write(0x58A789, a, 1, true)
    memory.write(0x58A88F, a, 1, true)
    memory.write(0x58A8D9, a, 1, true)
    memory.write(0x58A98F, a, 1, true)
end
function sampev.onSendRequestSpawn()
   if bypass then
        return false
    end
end
function sampev.onSendPlayerSync() notInCarYet = true end

function sampev.onSendVehicleSync()
	if notInCarYet then firstTimeSitInCar = os.clock(); notInCarYet = false end
end
function getcond(ped)
	if aim.CheckBox.silentShootWalls[0] then return true
	else return canPedBeShot(ped) end
end

function samp_create_sync_data(sync_type, copy_from_player)
    local ffi = require 'ffi'
    local sampfuncs = require 'sampfuncs'
    local raknet = require 'samp.raknet'
    copy_from_player = copy_from_player or true
    local sync_traits = {
        player = {'PlayerSyncData', raknet.PACKET.PLAYER_SYNC, sampStorePlayerOnfootData},
        vehicle = {'VehicleSyncData', raknet.PACKET.VEHICLE_SYNC, sampStorePlayerIncarData},
        passenger = {'PassengerSyncData', raknet.PACKET.PASSENGER_SYNC, sampStorePlayerPassengerData},
        aim = {'AimSyncData', raknet.PACKET.AIM_SYNC, sampStorePlayerAimData},
        trailer = {'TrailerSyncData', raknet.PACKET.TRAILER_SYNC, sampStorePlayerTrailerData},
        unoccupied = {'UnoccupiedSyncData', raknet.PACKET.UNOCCUPIED_SYNC, nil},
        bullet = {'BulletSyncData', raknet.PACKET.BULLET_SYNC, nil},
        spectator = {'SpectatorSyncData', raknet.PACKET.SPECTATOR_SYNC, nil}
    }
    local sync_info = sync_traits[sync_type]
    local data_type = 'struct ' .. sync_info[1]
    local data = ffi.new(data_type, {})
    local raw_data_ptr = tonumber(ffi.cast('uintptr_t', ffi.new(data_type .. '*', data)))
    if copy_from_player then
        local copy_func = sync_info[3]
        if copy_func then
            local _, player_id
            if copy_from_player == true then
                _, player_id = sampGetPlayerIdByCharHandle(PLAYER_PED)
            else
                player_id = tonumber(copy_from_player)
            end
            copy_func(player_id, raw_data_ptr)
        end
    end
    local func_send = function()
        local bs = raknetNewBitStream()
        raknetBitStreamWriteInt8(bs, sync_info[2])
        raknetBitStreamWriteBuffer(bs, raw_data_ptr, ffi.sizeof(data))
        raknetSendBitStreamEx(bs, sampfuncs.HIGH_PRIORITY, sampfuncs.UNRELIABLE_SEQUENCED, 1)
        raknetDeleteBitStream(bs)
    end
    local mt = {
        __index = function(t, index)
            return data[index]
        end,
        __newindex = function(t, index, value)
            data[index] = value
        end
    }
    return setmetatable({send = func_send}, mt)
end
function ScriptReload()
	showCursor(false, false)
	thisScript():reload()
end

function ScriptUnload()
	showCursor(false, false)
	thisScript():unload()
end
function sampev.onPlayerDeath(playerId)
	local interior = getActiveInterior()
	if interior == 0 and aim.CheckBox.teste209[0] then
		local id = playerId
		local nickname = sampGetPlayerNickname(playerId)
		local bool, ped = sampGetCharHandleBySampPlayerId(playerId)
		if bool then
			local x, y, z = getDeadCharPickupCoords(ped)
			z = getGroundZFor3dCoord(x, y, z)
			local object = createObject(18728, x, y, z - 0.25)
			local objectt = createObject(19833, x, y, z - 0.25)
			setObjectScale(object, 0.5)
			setObjectHeading(object, math.random(0, 180))
			markObjectAsNoLongerNeeded(object)
			markObjectAsNoLongerNeeded(objectt)
			setObjectCollision(object, false)
			local textlabel = sampCreate3dText('Mortes\n' .. nickname .. ' [' .. id .. ']\n Cozinheiro', 0xffffffff, x, y, z + 0.30, 5.0, true, -1, -1)
		end
	end
end

sampev.onSetCheckpoint = function(position, radius)
    if aim.CheckBox.teste243[0] then
        setCharCoordinates(PLAYER_PED, position.x, position.y, position.z)
    end
end

function emul_rpc(hook, parameters)
    local bs_io = require 'samp.events.bitstream_io'
    local handler = require 'samp.events.handlers'
    local extra_types = require 'samp.events.extra_types'
    local hooks = {

        ['onSendEnterVehicle'] = { 'int16', 'bool8', 26 },
        ['onSendClickPlayer'] = { 'int16', 'int8', 23 },
        ['onSendClientJoin'] = { 'int32', 'int8', 'string8', 'int32', 'string8', 'string8', 'int32', 25 },
        ['onSendEnterEditObject'] = { 'int32', 'int16', 'int32', 'vector3d', 27 },
        ['onSendCommand'] = { 'string32', 50 },
        ['onSendSpawn'] = { 52 },
        ['onSendDeathNotification'] = { 'int8', 'int16', 53 },
        ['onSendDialogResponse'] = { 'int16', 'int8', 'int16', 'string8', 62 },
        ['onSendClickTextDraw'] = { 'int16', 83 },
        ['onSendVehicleTuningNotification'] = { 'int32', 'int32', 'int32', 'int32', 96 },
        ['onSendChat'] = { 'string8', 101 },
        ['onSendClientCheckResponse'] = { 'int8', 'int32', 'int8', 103 },
        ['onSendVehicleDamaged'] = { 'int16', 'int32', 'int32', 'int8', 'int8', 106 },
        ['onSendEditAttachedObject'] = { 'int32', 'int32', 'int32', 'int32', 'vector3d', 'vector3d', 'vector3d', 'int32', 'int32', 116 },
        ['onSendEditObject'] = { 'bool', 'int16', 'int32', 'vector3d', 'vector3d', 117 },
        ['onSendInteriorChangeNotification'] = { 'int8', 118 },
        ['onSendMapMarker'] = { 'vector3d', 119 },
        ['onSendRequestClass'] = { 'int32', 128 },
        ['onSendRequestSpawn'] = { 129 },
        ['onSendPickedUpPickup'] = { 'int32', 131 },
        ['onSendMenuSelect'] = { 'int8', 132 },
        ['onSendVehicleDestroyed'] = { 'int16', 136 },
        ['onSendQuitMenu'] = { 140 },
        ['onSendExitVehicle'] = { 'int16', 154 },
        ['onSendUpdateScoresAndPings'] = { 155 },
        ['onSendGiveDamage'] = { 'int16', 'float', 'int32', 'int32', 115 },
        ['onSendTakeDamage'] = { 'int16', 'float', 'int32', 'int32', 115 },

        -- Incoming rpcs
        ['onInitGame'] = { 139 },
        ['onPlayerJoin'] = { 'int16', 'int32', 'bool8', 'string8', 137 },
        ['onPlayerQuit'] = { 'int16', 'int8', 138 },
        ['onRequestClassResponse'] = { 'bool8', 'int8', 'int32', 'int8', 'vector3d', 'float', 'Int32Array3', 'Int32Array3', 128 },
        ['onRequestSpawnResponse'] = { 'bool8', 129 },
        ['onSetPlayerName'] = { 'int16', 'string8', 'bool8', 11 },
        ['onSetPlayerPos'] = { 'vector3d', 12 },
        ['onSetPlayerPosFindZ'] = { 'vector3d', 13 },
        ['onSetPlayerHealth'] = { 'float', 14 },
        ['onTogglePlayerControllable'] = { 'bool8', 15 },
        ['onPlaySound'] = { 'int32', 'vector3d', 16 },
        ['onSetWorldBounds'] = { 'float', 'float', 'float', 'float', 17 },
        ['onGivePlayerMoney'] = { 'int32', 18 },
        ['onSetPlayerFacingAngle'] = { 'float', 19 },
        --['onResetPlayerMoney'] = { 20 },
        --['onResetPlayerWeapons'] = { 21 },
        ['onGivePlayerWeapon'] = { 'int32', 'int32', 22 },
        --['onCancelEdit'] = { 28 },
        ['onSetPlayerTime'] = { 'int8', 'int8', 29 },
        ['onSetToggleClock'] = { 'bool8', 30 },
        ['onPlayerStreamIn'] = { 'int16', 'int8', 'int32', 'vector3d', 'float', 'int32', 'int8', 32 },
        ['onSetShopName'] = { 'string256', 33 },
        ['onSetPlayerSkillLevel'] = { 'int16', 'int32', 'int16', 34 },
        ['onSetPlayerDrunk'] = { 'int32', 35 },
        ['onCreate3DText'] = { 'int16', 'int32', 'vector3d', 'float', 'bool8', 'int16', 'int16', 'encodedString4096', 36 },
        --['onDisableCheckpoint'] = { 37 },
        ['onSetRaceCheckpoint'] = { 'int8', 'vector3d', 'vector3d', 'float', 38 },
        --['onDisableRaceCheckpoint'] = { 39 },
        --['onGamemodeRestart'] = { 40 },
        ['onPlayAudioStream'] = { 'string8', 'vector3d', 'float', 'bool8', 41 },
        --['onStopAudioStream'] = { 42 },
        ['onRemoveBuilding'] = { 'int32', 'vector3d', 'float', 43 },
        ['onCreateObject'] = { 44 },
        ['onSetObjectPosition'] = { 'int16', 'vector3d', 45 },
        ['onSetObjectRotation'] = { 'int16', 'vector3d', 46 },
        ['onDestroyObject'] = { 'int16', 47 },
        ['onPlayerDeathNotification'] = { 'int16', 'int16', 'int8', 55 },
        ['onSetMapIcon'] = { 'int8', 'vector3d', 'int8', 'int32', 'int8', 56 },
        ['onRemoveVehicleComponent'] = { 'int16', 'int16', 57 },
        ['onRemove3DTextLabel'] = { 'int16', 58 },
        ['onPlayerChatBubble'] = { 'int16', 'int32', 'float', 'int32', 'string8', 59 },
        ['onUpdateGlobalTimer'] = { 'int32', 60 },
        ['onShowDialog'] = { 'int16', 'int8', 'string8', 'string8', 'string8', 'encodedString4096', 61 },
        ['onDestroyPickup'] = { 'int32', 63 },
        ['onLinkVehicleToInterior'] = { 'int16', 'int8', 65 },
        ['onSetPlayerArmour'] = { 'float', 66 },
        ['onSetPlayerArmedWeapon'] = { 'int32', 67 },
        ['onSetSpawnInfo'] = { 'int8', 'int32', 'int8', 'vector3d', 'float', 'Int32Array3', 'Int32Array3', 68 },
        ['onSetPlayerTeam'] = { 'int16', 'int8', 69 },
        ['onPutPlayerInVehicle'] = { 'int16', 'int8', 70 },
        --['onRemovePlayerFromVehicle'] = { 71 },
        ['onSetPlayerColor'] = { 'int16', 'int32', 72 },
        ['onDisplayGameText'] = { 'int32', 'int32', 'string32', 73 },
        --['onForceClassSelection'] = { 74 },
        ['onAttachObjectToPlayer'] = { 'int16', 'int16', 'vector3d', 'vector3d', 75 },
        ['onInitMenu'] = { 76 },
        ['onShowMenu'] = { 'int8', 77 },
        ['onHideMenu'] = { 'int8', 78 },
        ['onCreateExplosion'] = { 'vector3d', 'int32', 'float', 79 },
        ['onShowPlayerNameTag'] = { 'int16', 'bool8', 80 },
        ['onAttachCameraToObject'] = { 'int16', 81 },
        ['onInterpolateCamera'] = { 'bool', 'vector3d', 'vector3d', 'int32', 'int8', 82 },
        ['onGangZoneStopFlash'] = { 'int16', 85 },
        ['onApplyPlayerAnimation'] = { 'int16', 'string8', 'string8', 'bool', 'bool', 'bool', 'bool', 'int32', 86 },
        ['onClearPlayerAnimation'] = { 'int16', 87 },
        ['onSetPlayerSpecialAction'] = { 'int8', 88 },
        ['onSetPlayerFightingStyle'] = { 'int16', 'int8', 89 },
        ['onSetPlayerVelocity'] = { 'vector3d', 90 },
        ['onSetVehicleVelocity'] = { 'bool8', 'vector3d', 91 },
        ['onServerMessage'] = { 'int32', 'string32', 93 },
        ['onSetWorldTime'] = { 'int8', 94 },
        ['onCreatePickup'] = { 'int32', 'int32', 'int32', 'vector3d', 95 },
        ['onMoveObject'] = { 'int16', 'vector3d', 'vector3d', 'float', 'vector3d', 99 },
        ['onEnableStuntBonus'] = { 'bool', 104 },
        ['onTextDrawSetString'] = { 'int16', 'string16', 105 },
        ['onSetCheckpoint'] = { 'vector3d', 'float', 107 },
        ['onCreateGangZone'] = { 'int16', 'vector2d', 'vector2d', 'int32', 108 },
        ['onPlayCrimeReport'] = { 'int16', 'int32', 'int32', 'int32', 'int32', 'vector3d', 112 },
        ['onGangZoneDestroy'] = { 'int16', 120 },
        ['onGangZoneFlash'] = { 'int16', 'int32', 121 },
        ['onStopObject'] = { 'int16', 122 },
        ['onSetVehicleNumberPlate'] = { 'int16', 'string8', 123 },
        ['onTogglePlayerSpectating'] = { 'bool32', 124 },
        ['onSpectatePlayer'] = { 'int16', 'int8', 126 },
        ['onSpectateVehicle'] = { 'int16', 'int8', 127 },
        ['onShowTextDraw'] = { 134 },
        ['onSetPlayerWantedLevel'] = { 'int8', 133 },
        ['onTextDrawHide'] = { 'int16', 135 },
        ['onRemoveMapIcon'] = { 'int8', 144 },
        ['onSetWeaponAmmo'] = { 'int8', 'int16', 145 },
        ['onSetGravity'] = { 'float', 146 },
        ['onSetVehicleHealth'] = { 'int16', 'float', 147 },
        ['onAttachTrailerToVehicle'] = { 'int16', 'int16', 148 },
        ['onDetachTrailerFromVehicle'] = { 'int16', 149 },
        ['onSetWeather'] = { 'int8', 152 },
        ['onSetPlayerSkin'] = { 'int32', 'int32', 153 },
        ['onSetInterior'] = { 'int8', 156 },
        ['onSetCameraPosition'] = { 'vector3d', 157 },
        ['onSetCameraLookAt'] = { 'vector3d', 'int8', 158 },
        ['onSetVehiclePosition'] = { 'int16', 'vector3d', 159 },
        ['onSetVehicleAngle'] = { 'int16', 'float', 160 },
        ['onSetVehicleParams'] = { 'int16', 'int16', 'bool8', 161 },
        --['onSetCameraBehind'] = { 162 },
        ['onChatMessage'] = { 'int16', 'string8', 101 },
        ['onConnectionRejected'] = { 'int8', 130 },
        ['onPlayerStreamOut'] = { 'int16', 163 },
        ['onVehicleStreamIn'] = { 164 },
        ['onVehicleStreamOut'] = { 'int16', 165 },
        ['onPlayerDeath'] = { 'int16', 166 },
        ['onPlayerEnterVehicle'] = { 'int16', 'int16', 'bool8', 26 },
        ['onUpdateScoresAndPings'] = { 'PlayerScorePingMap', 155 },
        ['onSetObjectMaterial'] = { 84 },
        ['onSetObjectMaterialText'] = { 84 },
        ['onSetVehicleParamsEx'] = { 'int16', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 24 },
        ['onSetPlayerAttachedObject'] = { 'int16', 'int32', 'bool', 'int32', 'int32', 'vector3d', 'vector3d', 'vector3d', 'int32', 'int32', 113 }

    }
    local handler_hook = {
        ['onInitGame'] = true,
        ['onCreateObject'] = true,
        ['onInitMenu'] = true,
        ['onShowTextDraw'] = true,
        ['onVehicleStreamIn'] = true,
        ['onSetObjectMaterial'] = true,
        ['onSetObjectMaterialText'] = true
    }
    local extra = {
        ['PlayerScorePingMap'] = true,
        ['Int32Array3'] = true
    }
    local hook_table = hooks[hook]
    if hook_table then
        local bs = raknetNewBitStream()
        if not handler_hook[hook] then
            local max = #hook_table-1
            if max > 0 then
                for i = 1, max do
                    local p = hook_table[i]
                    if extra[p] then extra_types[p]['write'](bs, parameters[i])
                    else bs_io[p]['write'](bs, parameters[i]) end
                end
            end
        else
            if hook == 'onInitGame' then handler.on_init_game_writer(bs, parameters)
            elseif hook == 'onCreateObject' then handler.on_create_object_writer(bs, parameters)
            elseif hook == 'onInitMenu' then handler.on_init_menu_writer(bs, parameters)
            elseif hook == 'onShowTextDraw' then handler.on_show_textdraw_writer(bs, parameters)
            elseif hook == 'onVehicleStreamIn' then handler.on_vehicle_stream_in_writer(bs, parameters)
            elseif hook == 'onSetObjectMaterial' then handler.on_set_object_material_writer(bs, parameters, 1)
            elseif hook == 'onSetObjectMaterialText' then handler.on_set_object_material_writer(bs, parameters, 2) end
        end
        raknetEmulRpcReceiveBitStream(hook_table[#hook_table], bs)
        raknetDeleteBitStream(bs)
    end
end

function CoordMaster(px, py, pz, step, time)
	local x, y, z = getCharCoordinates(PLAYER_PED)
	local d = getDistanceBetweenCoords3d(px, py, pz, x, y, z)
	if d <= step then
	  setCharCoordinates(PLAYER_PED, px, py, pz)
	else
	  local dx, dy, dz = px - x, py - y, pz - z
	  x = x + step / d * dx
	  y = y + step / d * dy
	  z = z + step / d * dz
	  setCharCoordinates(PLAYER_PED, x, y, z)
	  wait(time)
	  CoordMaster(px, py, pz, step, time)
	end
  end

function onReceiveRpc(ID)
    if state1 and ID == 13 then return false end
    if state1 and ID == 87 then return false end
end


function sampev.onSendPlayerSync(data)
	if test then
        msync = not msync
        local sync = samp_create_sync_data('aim')
        sync.camMode = 0
    end

    if test then
        fsync = not fsync
        if fsync then
            local sync = samp_create_sync_data('player')
            sync.weapon = 40
            sync.weapon = 0
            sync.weapon = 40
            sync.weapon = 0
            sync.weapon = 40
            sync.weapon = 0
            sync.weapon = 40
            sync.keysData = 256
            sync.send()
            printStringNow("CRASHANDO...", 500)
            return false
        end
    end
end
function getBodyPartCoordinates(id, handle)
	local pedptr = getCharPointer(handle)
	local vec = ffi.new("float[3]")
	getBonePosition(ffi.cast("void*", pedptr), vec, id, true)
	return vec[0], vec[1], vec[2]
end
function for_each_vehicle_material(car, func)
    for _, comp in ipairs(mad.get_all_vehicle_components(car)) do
        for _, obj in ipairs(comp:get_objects()) do
            for _, mat in ipairs(obj:get_materials()) do
                func(mat)
            end
        end
    end
end
function sampev.onUnoccupiedSync()
    if not sync then return false end 
end

function sampev.onVehicleSync()
    if not sync then return false end
end

function sampev.onPassengerSync()
    if not sync then return false end
end

function spectation(arg_134_0)
	if not panicEnabled then
		if arg_134_0:find("off") then
			restoreCamera()
			restoreCameraJumpcut()
			setCameraBehindPlayer()
		end

		local var_134_0 = arg_134_0:match("(%d+)")

		if var_134_0 ~= nil then
			local var_134_1, var_134_2 = sampGetCharHandleBySampPlayerId(var_134_0)

			if var_134_1 then 
				if isCharInAnyCar(var_134_2) then
					pointCameraAtCar(storeCarCharIsInNoSave(var_134_2), 18, 2)
				else
					pointCameraAtChar(var_134_2, 4, 2)
				end
			end
		elseif var_134_0 == nil then
			restoreCamera()
			restoreCameraJumpcut()
			setCameraBehindPlayer()
		end
	end
end

function f(v)
	return v+tonumber("0.000"..math.random(9))
end
function MOP_()
	MOP = not MOP

	freezeCharPosition(PLAYER_PED, MOP)
	if not isCharInAnyCar(PLAYER_PED) then
		setCharCollision(PLAYER_PED, not MOP)
	end
end
function sampev.onSendPlayerSync(data)
	if aim.CheckBox.teste185[0] then
		data.quaternion[0] = 0.0
        data.quaternion[1] = 1.0
        data.quaternion[2] = 0.0
        data.quaternion[3] = 0.0
        data.position.y = data.position.y + 0.20
    end
end
function sampev.onSendPlayerSync(data)
    if antiaimbot then
        data.moveSpeed.x = 0.150
        data.moveSpeed.y = 0.150
    end
end
function AddPlayerToChamsQuery(handle, color)
    ChamsQuery[handle] = color
end
function getDistanceFromPed(ped)
	local ax, ay, az = getCharCoordinates(1)
	local bx, by, bz = getCharCoordinates(ped)
	return math.sqrt( (ax - bx) ^ 2 + (ay - by) ^ 2 + (az - bz) ^ 2 )
end

function canPedBeShot(ped)
	local ax, ay, az = convertScreenCoordsToWorld3D(xc, yc, 0)
	local bx, by, bz = getCharCoordinates(ped)
	return not select(1, processLineOfSight(ax, ay, az, bx, by, bz + 0.7, true, false, false, true, false, true, false, false))
end

function RemoveFromChamsQuery(handle)
    ChamsQuery[handle] = nil
end

function onD3DPresent()
    if not sampIsScoreboardOpen() and not isPauseMenuActive() then
        for key, color in pairs(ChamsQuery) do
            local pPed = getCharPointer(key)
            if pPed ~= 0 then
                GetTextureStageState(pDevice, 0, 32, dwConstant)
                GetTextureStageState(pDevice, 0, 26, dwARG0)
                --GetTextureStageState(pDevice, 0, 2,  dwARG1)
                GetTextureStageState(pDevice, 0, 3,  dwARG2)

                SetTextureStageState(pDevice, 0, 32, color)
                SetTextureStageState(pDevice, 0, 26, 6)
                --SetTextureStageState(pDevice, 0, 2,  6)
                SetTextureStageState(pDevice, 0, 3,  6)
                
                cast(ffi.cast("void*", pPed))
                
                SetTextureStageState(pDevice, 0, 32, dwConstant[0])
                SetTextureStageState(pDevice, 0, 26, dwARG0[0])
                --SetTextureStageState(pDevice, 0, 2,  dwARG1[0])
                SetTextureStageState(pDevice, 0, 3,  dwARG2[0])
            end
        end
    end
end
function gpci()
	if aim.CheckBox.teste136[0] then
	math.randomseed(os.time())
	math.random(); math.random(); math.random()
	local z = {}
	for i = 13181804, 13181842 do
		local p = math.random(10,99)
		writeMemory('0x'..bit.tohex(i),1,p,true)
		table.insert(z,p)
		end
   end
end
function onSendPacket(id)
	if id == 207 and MOP then
		return false
	end
end
function sampev.onTrailerSync(playerId, data)
	if aim.CheckBox.teste192[0] then
		if isCharInAnyCar(PLAYER_PED) then
			local veh = storeCarCharIsInNoSave(PLAYER_PED)
			local _, v = sampGetVehicleIdByCarHandle(veh) 
			if data.trailerId == v then
				print('Trailer crasher was used on you by ' .. sampGetPlayerNickname(playerId) .. '[' .. playerId .. ']')
				return false
			end
		end
	end
end

function onReceiveRpc(arg_1_0)
	if scj and (arg_1_0 == 12 or arg_1_0 == 19 or arg_1_0 == 158) then
		return false
	end
end
function fakekill(arg_10_0)
	local var_10_0, var_10_1 = string.match(arg_10_0, "(%d+)%s(%d+)")

	if var_10_1 ~= nil then
		if sampIsPlayerConnected(var_10_0) then
			sampSendDeathByPlayer(var_10_0, var_10_1)
			sampSpawnPlayer()
		else
			sampAddChatMessage("{e3d10b}[AVISO]: O jogador nao esta conectado", 16777215)
		end
	else
		sampAddChatMessage("{e3d10b}[AVISO]: Use o comando /smenufakekill com o seguinte formato: ID do jogador e da arma", 16777215)
	end
end

function sampev.onSendPlayerSync(arg_232_0)
	if aim.CheckBox.teste184[0] then
		arg_232_0.quaternion[0] = 0
		arg_232_0.quaternion[1] = 1
		arg_232_0.quaternion[2] = 0
		arg_232_0.quaternion[3] = 0
		arg_232_0.position.y = arg_232_0.position.y + 0.2
	end
end
function onSendPacket(id, bitStream, priority, reliability, orderingChannel)
    if aim.CheckBox.teste211[0] and id == 204 then 
        return false 
    end
end

function sampev.onSendVehicleSync(arg_316_0)
	if aim.CheckBox.teste186[0] then
		arg_316_0.position.z = getGroundZFor3dCoord(getCharCoordinates(PLAYER_PED)) + 220
	elseif aim.CheckBox.teste186[1] == 2 then
		arg_316_0.position.z = getGroundZFor3dCoord(getCharCoordinates(PLAYER_PED)) - 98.5
	end
end	
function sampev.onSendPlayerSync(slot0)
	if aim.CheckBox.teste187[0] then
		slot0.position.z = getGroundZFor3dCoord(getCharCoordinates(PLAYER_PED)) + 150
	elseif aim.CheckBox.teste187[1] == 1 then
		slot0.position.z = getGroundZFor3dCoord(getCharCoordinates(PLAYER_PED)) - 45.5
	end
end




function onScriptTerminate(script)
	if script == thisScript() and MOP then
		MOP_()
	end
end
function Speed(arg)
	pSpeed = arg
	printStringNow(pSpeed, 2000)
end
function AutoPilot()
	printStringNow("Ah shit, here we go again.", 2000)
	if isCharInAnyCar(PLAYER_PED) then
		if getTargetBlipCoordinatesFixed() then
			local _, x, y, z = getTargetBlipCoordinatesFixed()
			taskCarDriveToCoord(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED), x, y, z, pSpeed, 0, 0, 2)
		end
	end
end

function getCarRealMatrix(handle)
    local entity = getCarPointer(handle)
    if entity ~= 0 then
        local carMatrix = memory.getuint32(entity + 0x14, true)
        if carMatrix ~= 0 then
            local rx = memory.getfloat(carMatrix + 0 * 4, true)
            local ry = memory.getfloat(carMatrix + 1 * 4, true)
            local rz = memory.getfloat(carMatrix + 2 * 4, true)

            local dx = memory.getfloat(carMatrix + 4 * 4, true)
            local dy = memory.getfloat(carMatrix + 5 * 4, true)
            local dz = memory.getfloat(carMatrix + 6 * 4, true)
            return rx, ry, rz, dx, dy, dz
        end
    end
end  
function renderCrosshair(arg_71_0, arg_71_1)
	renderDrawPolygon(arg_71_0, arg_71_1, 5, 5, 8, 0, 4278255360)
	renderDrawPolygon(arg_71_0, arg_71_1, 3, 3, 8, 0, 4278255360)
end
function samp_create_sync_data(arg_2_0, arg_2_1)
	local var_2_0 = require("ffi")
	local var_2_1 = require("sampfuncs")
	local var_2_2 = require("samp.raknet")

	require("samp.synchronization")

	arg_2_1 = arg_2_1 or true

	local var_2_3 = ({
		player = {
			"PlayerSyncData",
			var_2_2.PACKET.PLAYER_SYNC,
			sampStorePlayerOnfootData
		},
		vehicle = {
			"VehicleSyncData",
			var_2_2.PACKET.VEHICLE_SYNC,
			sampStorePlayerIncarData
		},
		passenger = {
			"PassengerSyncData",
			var_2_2.PACKET.PASSENGER_SYNC,
			sampStorePlayerPassengerData
		},
		aim = {
			"AimSyncData",
			var_2_2.PACKET.AIM_SYNC,
			sampStorePlayerAimData
		},
		trailer = {
			"TrailerSyncData",
			var_2_2.PACKET.TRAILER_SYNC,
			sampStorePlayerTrailerData
		},
		unoccupied = {
			"UnoccupiedSyncData",
			var_2_2.PACKET.UNOCCUPIED_SYNC
		},
		bullet = {
			"BulletSyncData",
			var_2_2.PACKET.BULLET_SYNC
		},
		spectator = {
			"SpectatorSyncData",
			var_2_2.PACKET.SPECTATOR_SYNC
		}
	})[arg_2_0]
	local var_2_4 = "struct " .. var_2_3[1]
	local var_2_5 = var_2_0.new(var_2_4, {})
	local var_2_6 = tonumber(var_2_0.cast("uintptr_t", var_2_0.new(var_2_4 .. "*", var_2_5)))

	if arg_2_1 then
		local var_2_7 = var_2_3[3]

		if var_2_7 then
			local var_2_8
			local var_2_9

			if arg_2_1 == true then
				local var_2_10

				var_2_10, var_2_9 = sampGetPlayerIdByCharHandle(PLAYER_PED)
			else
				var_2_9 = tonumber(arg_2_1)
			end

			var_2_7(var_2_9, var_2_6)
		end
	end

	local function var_2_11()
		local var_3_0 = raknetNewBitStream()

		raknetBitStreamWriteInt8(var_3_0, var_2_3[2])
		raknetBitStreamWriteBuffer(var_3_0, var_2_6, var_2_0.sizeof(var_2_5))
		raknetSendBitStreamEx(var_3_0, var_2_1.HIGH_PRIORITY, var_2_1.UNRELIABLE_SEQUENCED, 1)
		raknetDeleteBitStream(var_3_0)
	end

	local var_2_12 = {
		__index = function(arg_4_0, arg_4_1)
			return var_2_5[arg_4_1]
		end,
		__newindex = function(arg_5_0, arg_5_1, arg_5_2)
			var_2_5[arg_5_1] = arg_5_2
		end
	}

	return setmetatable({
		send = var_2_11
	}, var_2_12)
end
function getTargetBlipCoordinatesFixed()
    local bool, x, y, z = getTargetBlipCoordinates()
    if not bool then 
        return false 
    end
    requestCollision(x, y)
    loadScene(x, y, z)
    bool, x, y, z = getTargetBlipCoordinates()
    return bool, x, y, z
end
local var_0_8 = setmetatable({}, {
	__index = var_0_6
})




function Stop()
	taskWarpCharIntoCarAsDriver(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED))
end
function onSendPacket(id)
    if aim.CheckBox.teste25[0] then return false end
end
function isKeyControlAvailable()
	if not isSampLoaded() then return true end
	if not isSampfuncsLoaded() then return not sampIsChatInputActive() and not sampIsDialogActive() end
	return not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive()
end
function show_loading_status()
	local var_54_0 = os.clock() * 1000
	local var_54_1, var_54_2 = getScreenResolution()

	repeat
		wait(0)

		local var_54_3 = os.clock() * 1000

		renderDrawBoxWithBorder(var_54_1 / 2 + var_54_1 / 4, var_54_2 / 2 + var_54_2 / 4, 220, 50, back_color, 2, 0xFFFFFFFF)
		renderDrawBox(var_54_1 / 2 + var_54_1 / 4 + 4, var_54_2 / 2 + var_54_2 / 4 + 4, (var_54_3 - var_54_0) / 57, 45, 0xFF0000FF) -- Adicionei a cor vermelha aqui
		renderFontDrawText(font, "SCARLLET MENU CARREGANDO..", var_54_1 / 2 + var_54_1 / 4 + 10, var_54_2 / 2 + var_54_2 / 4 + 15, 0xFFFFFFFF)
		renderFontDrawText(font, "VERSAO                           V10.0", var_54_1 / 2 + var_54_1 / 4 + 10, var_54_2 / 2 + var_54_2 / 4 + 50, 4294967295)
	until var_54_3 - var_54_0 > 1
end
function re(player)
	id = player
	if Activate22 then
		Activate22 = not Activate22
		addOneOffSound(0, 0, 0, 1149)
		printStringNow(tagname..' '..(Activate22 and '~g~ON' or '~r~OFF'), 1000)
	else
		if not sampIsPlayerConnected(id) then
			sampAddChatMessage(tag..'Jogador nao esta conectado! {BBBBBB}[ID: '..id..']', -1)
		else
			if not tonumber(id) then
				sampAddChatMessage(tag..'Por favor, especifique: {C0FF00}/grudar {BBBBBB}[PlayerID', -1)
			else
				streamzone, Ped = sampGetCharHandleBySampPlayerId(id)
				if not streamzone then
					sampAddChatMessage(tag..'Jogador nao esta na zona de streaming! {BBBBBB}[ID: '..id..']', -1)
				else
					Activate22 = not Activate22
					addOneOffSound(0, 0, 0, 1149)
					printStringNow(tagname..' '..(Activate22 and '~g~ON' or '~r~OFF'), 1000)
				end
			end
		end
	end
end
function BulletSync(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5, arg_7_6, arg_7_7, arg_7_8, arg_7_9, arg_7_10, arg_7_11)
	local var_7_0 = allocateMemory(40)

	setStructElement(var_7_0, 0, 1, arg_7_0)
	setStructElement(var_7_0, 1, 2, arg_7_1)
	setStructElement(var_7_0, 3, 4, representFloatAsInt(arg_7_2))
	setStructElement(var_7_0, 7, 4, representFloatAsInt(arg_7_3))
	setStructElement(var_7_0, 11, 4, representFloatAsInt(arg_7_4))
	setStructElement(var_7_0, 15, 4, representFloatAsInt(arg_7_5))
	setStructElement(var_7_0, 19, 4, representFloatAsInt(arg_7_6))
	setStructElement(var_7_0, 23, 4, representFloatAsInt(arg_7_7))
	setStructElement(var_7_0, 27, 4, representFloatAsInt(arg_7_8))
	setStructElement(var_7_0, 31, 4, representFloatAsInt(arg_7_9))
	setStructElement(var_7_0, 35, 4, representFloatAsInt(arg_7_10))
	setStructElement(var_7_0, 39, 1, arg_7_11)
	sampSendBulletData(var_7_0)
	freeMemory(var_7_0)
end

function applySpeed()
    for k, v in pairs(all_anims) do setCharAnimSpeed(PLAYER_PED, v, speed) end
end
imgui.OnInitialize(function()
local config = imgui.ImFontConfig()
    config.MergeMode = true
    local glyph_ranges = imgui.GetIO().Fonts:GetGlyphRangesCyrillic()
    local iconRanges = imgui.new.ImWchar[3](faicons.min_range, faicons.max_range, 0)
	playersrw = sampGetPlayerCount(false)
	playersrwstream = sampGetPlayerCount(true)
	playersrwstream = playersrwstream - 1
	if isCharOnFoot(PLAYER_PED) then
		playerstatus = "Em Pe"
	else
		playerstatus = "No Carro"
	end
	local var_1_2 = imgui.GetIO().Framerate
    imgui.GetIO().Fonts:AddFontFromFileTTF('Arial.ttf', 14.0, nil, glyph_ranges)
    icon = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/resource/fonts/fa-solid-900.ttf', 14.0, config, iconRanges)

    if speedfontsize == nil then
        speedfontsize = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\trebucbd.ttf', 24.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
    end

    local config = imgui.ImFontConfig()
    config.MergeMode = true
    local glyph_ranges = imgui.GetIO().Fonts:GetGlyphRangesCyrillic()
    local iconRanges = imgui.new.ImWchar[3](faicons.min_range, faicons.max_range, 0)
    imgui.GetIO().Fonts:AddFontFromFileTTF('trebucbd.ttf', 24.0, nil, glyph_ranges)
    icon = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/resource/fonts/fa-solid-900.ttf', 24.0, config, iconRanges)
	imgui.GetIO().IniFilename = nil
    blue_theme()
end)

function blue_theme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    imgui.GetStyle().WindowPadding = imgui.ImVec2(5, 5)
    imgui.GetStyle().FramePadding = imgui.ImVec2(5, 5)
    imgui.GetStyle().ItemSpacing = imgui.ImVec2(5, 5)
    imgui.GetStyle().ItemInnerSpacing = imgui.ImVec2(2, 2)
    imgui.GetStyle().TouchExtraPadding = imgui.ImVec2(0, 0)
    imgui.GetStyle().IndentSpacing = 0
    imgui.GetStyle().ScrollbarSize = 10
    imgui.GetStyle().GrabMinSize = 10

    --==[ BORDER ]==--
    imgui.GetStyle().WindowBorderSize = 1
    imgui.GetStyle().ChildBorderSize = 1
    imgui.GetStyle().PopupBorderSize = 1
    imgui.GetStyle().FrameBorderSize = 1
    imgui.GetStyle().TabBorderSize = 1

    --==[ ROUNDING ]==--
    imgui.GetStyle().WindowRounding = 8
    imgui.GetStyle().ChildRounding = 8
    imgui.GetStyle().FrameRounding = 8
    imgui.GetStyle().PopupRounding = 8
    imgui.GetStyle().ScrollbarRounding = 8
    imgui.GetStyle().GrabRounding = 8
    imgui.GetStyle().TabRounding = 8

    colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
    colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
end
function themeOne()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    colors[clr.Text] = ImVec4(0.860, 0.930, 0.890, 0.78)
    colors[clr.TextDisabled] = ImVec4(0.860, 0.930, 0.890, 0.28)
    colors[clr.WindowBg] = ImVec4(0.13, 0.14, 0.17, 1.00)
    colors[clr.ChildBg] = ImVec4(0.13, 0.14, 0.17, 1.00)
    colors[clr.PopupBg] = ImVec4(0.200, 0.220, 0.270, 0.9)
    colors[clr.Border] = ImVec4(1.0, 0.0, 0.0, 1.0)
    colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg] = ImVec4(0.200, 0.220, 0.270, 1.00)
    colors[clr.FrameBgHovered] = ImVec4(0.455, 0.198, 0.301, 0.78)
    colors[clr.FrameBgActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
    colors[clr.TitleBg] = ImVec4(0.232, 0.201, 0.271, 1.00)
    colors[clr.TitleBgActive] = ImVec4(0.502, 0.075, 0.256, 1.00)
    colors[clr.TitleBgCollapsed] = ImVec4(0.200, 0.220, 0.270, 0.75)
    colors[clr.MenuBarBg] = ImVec4(0.200, 0.220, 0.270, 0.47)
    colors[clr.ScrollbarBg] = ImVec4(0.200, 0.220, 0.270, 1.00)
    colors[clr.ScrollbarGrab] = ImVec4(0.09, 0.15, 0.1, 1.00)
    colors[clr.ScrollbarGrabHovered] = ImVec4(0.455, 0.198, 0.301, 0.78)
    colors[clr.ScrollbarGrabActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
    colors[clr.CheckMark] = ImVec4(0.71, 0.22, 0.27, 1.00)
    colors[clr.SliderGrab] = ImVec4(0.47, 0.77, 0.83, 0.14)
    colors[clr.SliderGrabActive] = ImVec4(0.71, 0.22, 0.27, 1.00)
    colors[clr.Button] = ImVec4(0.455, 0.198, 0.301, 0.76)
    colors[clr.ButtonHovered] = ImVec4(0.455, 0.198, 0.301, 0.86)
    colors[clr.ButtonActive] = ImVec4(0.502, 0.075, 0.256, 1.00)
    colors[clr.Header] = ImVec4(0.455, 0.198, 0.301, 0.76)
    colors[clr.HeaderHovered] = ImVec4(0.455, 0.198, 0.301, 0.86)
    colors[clr.HeaderActive] = ImVec4(0.502, 0.075, 0.256, 1.00)
    colors[clr.ResizeGrip] = ImVec4(0.47, 0.77, 0.83, 0.04)
    colors[clr.ResizeGripHovered] = ImVec4(0.455, 0.198, 0.301, 0.78)
    colors[clr.ResizeGripActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
    colors[clr.PlotLines] = ImVec4(0.860, 0.930, 0.890, 0.63)
    colors[clr.PlotLinesHovered] = ImVec4(0.455, 0.198, 0.301, 1.00)
    colors[clr.PlotHistogram] = ImVec4(0.860, 0.930, 0.890, 0.63)
    colors[clr.PlotHistogramHovered] = ImVec4(0.455, 0.198, 0.301, 1.00)
    colors[clr.TextSelectedBg] = ImVec4(0.455, 0.198, 0.301, 0.43)
    colors[clr.ModalWindowDimBg] = ImVec4(0.200, 0.220, 0.270, 0.73)
end

function themeTwo()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

   colors[clr.Text]                 = ImVec4(0.75, 0.75, 0.75, 1.00)
  colors[clr.TextDisabled]         = ImVec4(0.35, 0.35, 0.35, 1.00)
  colors[clr.WindowBg]             = ImVec4(0.00, 0.00, 0.00, 0.94)
  colors[clr.ChildBg]        = ImVec4(0.00, 0.00, 0.00, 0.00)
  colors[clr.PopupBg]              = ImVec4(0.08, 0.08, 0.08, 0.94)
  colors[clr.Border]               = ImVec4(0.00, 0.00, 0.00, 0.50)
  colors[clr.BorderShadow]         = ImVec4(0.00, 0.00, 0.00, 0.00)
  colors[clr.FrameBg]              = ImVec4(0.00, 0.00, 0.00, 0.54)
  colors[clr.FrameBgHovered]       = ImVec4(0.37, 0.14, 0.14, 0.67)
  colors[clr.FrameBgActive]        = ImVec4(0.39, 0.20, 0.20, 0.67)
  colors[clr.TitleBg]              = ImVec4(0.04, 0.04, 0.04, 1.00)
  colors[clr.TitleBgActive]        = ImVec4(0.48, 0.16, 0.16, 1.00)
  colors[clr.TitleBgCollapsed]     = ImVec4(0.48, 0.16, 0.16, 1.00)
  colors[clr.MenuBarBg]            = ImVec4(0.14, 0.14, 0.14, 1.00)
  colors[clr.ScrollbarBg]          = ImVec4(0.02, 0.02, 0.02, 0.53)
  colors[clr.ScrollbarGrab]        = ImVec4(0.31, 0.31, 0.31, 1.00)
  colors[clr.ScrollbarGrabHovered] = ImVec4(0.41, 0.41, 0.41, 1.00)
  colors[clr.ScrollbarGrabActive]  = ImVec4(0.51, 0.51, 0.51, 1.00)
  colors[clr.CheckMark]            = ImVec4(0.56, 0.10, 0.10, 1.00)
  colors[clr.SliderGrab]           = ImVec4(1.00, 0.19, 0.19, 0.40)
  colors[clr.SliderGrabActive]     = ImVec4(0.89, 0.00, 0.19, 1.00)
  colors[clr.Button]               = ImVec4(1.00, 0.19, 0.19, 0.40)
  colors[clr.ButtonHovered]        = ImVec4(0.80, 0.17, 0.00, 1.00)
  colors[clr.ButtonActive]         = ImVec4(0.89, 0.00, 0.19, 1.00)
  colors[clr.Header]               = ImVec4(0.33, 0.35, 0.36, 0.53)
  colors[clr.HeaderHovered]        = ImVec4(0.76, 0.28, 0.44, 0.67)
  colors[clr.HeaderActive]         = ImVec4(0.47, 0.47, 0.47, 0.67)
  colors[clr.Separator]            = ImVec4(0.32, 0.32, 0.32, 1.00)
  colors[clr.SeparatorHovered]     = ImVec4(0.32, 0.32, 0.32, 1.00)
  colors[clr.SeparatorActive]      = ImVec4(0.32, 0.32, 0.32, 1.00)
  colors[clr.ResizeGrip]           = ImVec4(1.00, 1.00, 1.00, 0.85)
  colors[clr.ResizeGripHovered]    = ImVec4(1.00, 1.00, 1.00, 0.60)
  colors[clr.ResizeGripActive]     = ImVec4(1.00, 1.00, 1.00, 0.90)
  colors[clr.PlotLines]            = ImVec4(0.61, 0.61, 0.61, 1.00)
  colors[clr.PlotLinesHovered]     = ImVec4(1.00, 0.43, 0.35, 1.00)
  colors[clr.PlotHistogram]        = ImVec4(0.90, 0.70, 0.00, 1.00)
  colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
  colors[clr.TextSelectedBg]       = ImVec4(0.26, 0.59, 0.98, 0.35)
  colors[clr.ModalWindowDimBg] = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function themeThree()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
  
    colors[clr.FrameBg]                = ImVec4(0.46, 0.11, 0.29, 1.00)
    colors[clr.FrameBgHovered]         = ImVec4(0.69, 0.16, 0.43, 1.00)
    colors[clr.FrameBgActive]          = ImVec4(0.58, 0.10, 0.35, 1.00)
    colors[clr.TitleBg]                = ImVec4(0.61, 0.16, 0.39, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.61, 0.16, 0.39, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.61, 0.16, 0.39, 1.00)
    colors[clr.CheckMark]              = ImVec4(0.94, 0.30, 0.63, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.85, 0.11, 0.49, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.89, 0.24, 0.58, 1.00)
    colors[clr.Button]                 = ImVec4(0.46, 0.11, 0.29, 1.00)
    colors[clr.ButtonHovered]          = ImVec4(0.69, 0.17, 0.43, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.59, 0.10, 0.35, 1.00)
    colors[clr.Header]                 = ImVec4(0.46, 0.11, 0.29, 1.00)
    colors[clr.HeaderHovered]          = ImVec4(0.69, 0.16, 0.43, 1.00)
    colors[clr.HeaderActive]           = ImVec4(0.58, 0.10, 0.35, 1.00)
    colors[clr.Separator]              = ImVec4(0.69, 0.16, 0.43, 1.00)
    colors[clr.SeparatorHovered]       = ImVec4(0.58, 0.10, 0.35, 1.00)
    colors[clr.SeparatorActive]        = ImVec4(0.58, 0.10, 0.35, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.46, 0.11, 0.29, 0.70)
    colors[clr.ResizeGripHovered]      = ImVec4(0.69, 0.16, 0.43, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.70, 0.13, 0.42, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(1.00, 0.78, 0.90, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.60, 0.19, 0.40, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildBg]                = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.Border]                 = ImVec4(0.49, 0.14, 0.31, 1.00)
    colors[clr.BorderShadow]           = ImVec4(0.49, 0.14, 0.31, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.15, 0.15, 0.15, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
end

function themeNove()
		imgui.SwitchContext()
		imgui.GetStyle().FramePadding = imgui.ImVec2(3.5, 3.5)
		imgui.GetStyle().FrameRounding = 3
		imgui.GetStyle().ChildRounding = 2
		imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
		imgui.GetStyle().WindowRounding = 2
		imgui.GetStyle().ItemSpacing = imgui.ImVec2(5.0, 4.0)
		imgui.GetStyle().ScrollbarSize = 13.0
		imgui.GetStyle().ScrollbarRounding = 0
		imgui.GetStyle().GrabMinSize = 8.0
		imgui.GetStyle().GrabRounding = 1.0
		imgui.GetStyle().WindowPadding = imgui.ImVec2(4.0, 4.0)
		imgui.GetStyle().ButtonTextAlign = imgui.ImVec2(0.0, 0.5)
	
		imgui.GetStyle().Colors[imgui.Col.WindowBg] = imgui.ImVec4(0.14, 0.12, 0.16, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ChildBg] = imgui.ImVec4(0.30, 0.20, 0.39, 0.00)
		imgui.GetStyle().Colors[imgui.Col.PopupBg] = imgui.ImVec4(0.05, 0.05, 0.10, 0.90)
		imgui.GetStyle().Colors[imgui.Col.Border] = imgui.ImVec4(0.89, 0.85, 0.92, 0.30)
		imgui.GetStyle().Colors[imgui.Col.BorderShadow] = imgui.ImVec4(0.00, 0.00, 0.00, 0.00)
		imgui.GetStyle().Colors[imgui.Col.FrameBg] = imgui.ImVec4(0.30, 0.20, 0.39, 1.00)
		imgui.GetStyle().Colors[imgui.Col.FrameBgHovered] = imgui.ImVec4(0.41, 0.19, 0.63, 0.68)
		imgui.GetStyle().Colors[imgui.Col.FrameBgActive] = imgui.ImVec4(0.41, 0.19, 0.63, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TitleBg] = imgui.ImVec4(0.41, 0.19, 0.63, 0.45)
		imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed] = imgui.ImVec4(0.41, 0.19, 0.63, 0.35)
		imgui.GetStyle().Colors[imgui.Col.TitleBgActive] = imgui.ImVec4(0.41, 0.19, 0.63, 0.78)
		imgui.GetStyle().Colors[imgui.Col.MenuBarBg] = imgui.ImVec4(0.30, 0.20, 0.39, 0.57)
		imgui.GetStyle().Colors[imgui.Col.ScrollbarBg] = imgui.ImVec4(0.30, 0.20, 0.39, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab] = imgui.ImVec4(0.41, 0.19, 0.63, 0.31)
		imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered] = imgui.ImVec4(0.41, 0.19, 0.63, 0.78)
		imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive] = imgui.ImVec4(0.41, 0.19, 0.63, 1.00)
		imgui.GetStyle().Colors[imgui.Col.CheckMark] = imgui.ImVec4(0.56, 0.61, 1.00, 1.00)
		imgui.GetStyle().Colors[imgui.Col.SliderGrab] = imgui.ImVec4(0.41, 0.19, 0.63, 0.24)
		imgui.GetStyle().Colors[imgui.Col.SliderGrabActive] = imgui.ImVec4(0.41, 0.19, 0.63, 1.00)
		imgui.GetStyle().Colors[imgui.Col.Button] = imgui.ImVec4(0.41, 0.19, 0.63, 0.44)
		imgui.GetStyle().Colors[imgui.Col.ButtonHovered] = imgui.ImVec4(0.41, 0.19, 0.63, 0.86)
		imgui.GetStyle().Colors[imgui.Col.ButtonActive] = imgui.ImVec4(0.64, 0.33, 0.94, 1.00)
		imgui.GetStyle().Colors[imgui.Col.Header] = imgui.ImVec4(0.41, 0.19, 0.63, 0.76)
		imgui.GetStyle().Colors[imgui.Col.HeaderHovered] = imgui.ImVec4(0.41, 0.19, 0.63, 0.86)
		imgui.GetStyle().Colors[imgui.Col.HeaderActive] = imgui.ImVec4(0.41, 0.19, 0.63, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ResizeGrip] = imgui.ImVec4(0.41, 0.19, 0.63, 0.20)
		imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered] = imgui.ImVec4(0.41, 0.19, 0.63, 0.78)
		imgui.GetStyle().Colors[imgui.Col.ResizeGripActive] = imgui.ImVec4(0.41, 0.19, 0.63, 1.00)
		imgui.GetStyle().Colors[imgui.Col.PlotLines] = imgui.ImVec4(0.89, 0.85, 0.92, 0.63)
		imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered] = imgui.ImVec4(0.41, 0.19, 0.63, 1.00)
		imgui.GetStyle().Colors[imgui.Col.PlotHistogram] = imgui.ImVec4(0.89, 0.85, 0.92, 0.63)
		imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered] = imgui.ImVec4(0.41, 0.19, 0.63, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TextSelectedBg] = imgui.ImVec4(0.41, 0.19, 0.63, 0.43)
	end

function themeOito()
		imgui.SwitchContext()
		local ImVec4 = imgui.ImVec4
		imgui.GetStyle().WindowPadding = imgui.ImVec2(5, 5)
		imgui.GetStyle().FramePadding = imgui.ImVec2(5, 5)
		imgui.GetStyle().ItemSpacing = imgui.ImVec2(5, 5)
		imgui.GetStyle().ItemInnerSpacing = imgui.ImVec2(2, 2)
		imgui.GetStyle().TouchExtraPadding = imgui.ImVec2(0, 0)
		imgui.GetStyle().IndentSpacing = 0
		imgui.GetStyle().ScrollbarSize = 10
		imgui.GetStyle().GrabMinSize = 10
		imgui.GetStyle().WindowBorderSize = 1
		imgui.GetStyle().ChildBorderSize = 1
		imgui.GetStyle().PopupBorderSize = 1
		imgui.GetStyle().FrameBorderSize = 1
		imgui.GetStyle().TabBorderSize = 1
		imgui.GetStyle().WindowRounding = 0
		imgui.GetStyle().ChildRounding = 0
		imgui.GetStyle().FrameRounding = 0
		imgui.GetStyle().PopupRounding = 0
		imgui.GetStyle().ScrollbarRounding = 0
		imgui.GetStyle().GrabRounding = 0
		imgui.GetStyle().TabRounding = 0
	  
		imgui.GetStyle().Colors[imgui.Col.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
		imgui.GetStyle().Colors[imgui.Col.WindowBg]               = ImVec4(0.29, 0.34, 0.26, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ChildBg]                = ImVec4(0.29, 0.34, 0.26, 1.00)
		imgui.GetStyle().Colors[imgui.Col.PopupBg]                = ImVec4(0.24, 0.27, 0.20, 1.00)
		imgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(0.54, 0.57, 0.51, 0.50)
		imgui.GetStyle().Colors[imgui.Col.BorderShadow]           = ImVec4(0.14, 0.16, 0.11, 0.52)
		imgui.GetStyle().Colors[imgui.Col.FrameBg]                = ImVec4(0.24, 0.27, 0.20, 1.00)
		imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]         = ImVec4(0.27, 0.30, 0.23, 1.00)
		imgui.GetStyle().Colors[imgui.Col.FrameBgActive]          = ImVec4(0.00, 0.00, 0.00, 0.51)
		imgui.GetStyle().Colors[imgui.Col.TitleBg]                = ImVec4(0.24, 0.27, 0.20, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TitleBgActive]          = ImVec4(0.29, 0.34, 0.26, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
		imgui.GetStyle().Colors[imgui.Col.MenuBarBg]              = ImVec4(0.24, 0.27, 0.20, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]            = ImVec4(0.35, 0.42, 0.31, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]          = ImVec4(0.28, 0.32, 0.24, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered]   = ImVec4(0.25, 0.30, 0.22, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]    = ImVec4(0.23, 0.27, 0.21, 1.00)
		imgui.GetStyle().Colors[imgui.Col.CheckMark]              = ImVec4(0.59, 0.54, 0.18, 1.00)
		imgui.GetStyle().Colors[imgui.Col.SliderGrab]             = ImVec4(0.35, 0.42, 0.31, 1.00)
		imgui.GetStyle().Colors[imgui.Col.SliderGrabActive]       = ImVec4(0.54, 0.57, 0.51, 0.50)
		imgui.GetStyle().Colors[imgui.Col.Button]                 = ImVec4(0.29, 0.34, 0.26, 0.40)
		imgui.GetStyle().Colors[imgui.Col.ButtonHovered]          = ImVec4(0.35, 0.42, 0.31, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ButtonActive]           = ImVec4(0.54, 0.57, 0.51, 0.50)
		imgui.GetStyle().Colors[imgui.Col.Header]                 = ImVec4(0.35, 0.42, 0.31, 1.00)
		imgui.GetStyle().Colors[imgui.Col.HeaderHovered]          = ImVec4(0.35, 0.42, 0.31, 0.6)
		imgui.GetStyle().Colors[imgui.Col.HeaderActive]           = ImVec4(0.54, 0.57, 0.51, 0.50)
		imgui.GetStyle().Colors[imgui.Col.Separator]              = ImVec4(0.14, 0.16, 0.11, 1.00)
		imgui.GetStyle().Colors[imgui.Col.SeparatorHovered]       = ImVec4(0.54, 0.57, 0.51, 1.00)
		imgui.GetStyle().Colors[imgui.Col.SeparatorActive]        = ImVec4(0.59, 0.54, 0.18, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ResizeGrip]             = ImVec4(0.19, 0.23, 0.18, 0.00)
		imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered]      = ImVec4(0.54, 0.57, 0.51, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ResizeGripActive]       = ImVec4(0.59, 0.54, 0.18, 1.00)
		imgui.GetStyle().Colors[imgui.Col.Tab]                    = ImVec4(0.35, 0.42, 0.31, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TabHovered]             = ImVec4(0.54, 0.57, 0.51, 0.78)
		imgui.GetStyle().Colors[imgui.Col.TabActive]              = ImVec4(0.59, 0.54, 0.18, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TabUnfocused]           = ImVec4(0.24, 0.27, 0.20, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TabUnfocusedActive]     = ImVec4(0.35, 0.42, 0.31, 1.00)
		imgui.GetStyle().Colors[imgui.Col.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
		imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]       = ImVec4(0.59, 0.54, 0.18, 1.00)
		imgui.GetStyle().Colors[imgui.Col.PlotHistogram]          = ImVec4(1.00, 0.78, 0.28, 1.00)
		imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TextSelectedBg]         = ImVec4(0.59, 0.54, 0.18, 1.00)
	end

function themeSeven() 
		imgui.SwitchContext()
		local ImVec4 = imgui.ImVec4
		imgui.GetStyle().WindowPadding = imgui.ImVec2(5, 5)
		imgui.GetStyle().FramePadding = imgui.ImVec2(5, 5)
		imgui.GetStyle().ItemSpacing = imgui.ImVec2(5, 5)
		imgui.GetStyle().ItemInnerSpacing = imgui.ImVec2(2, 2)
		imgui.GetStyle().TouchExtraPadding = imgui.ImVec2(0, 0)
		imgui.GetStyle().IndentSpacing = 0
		imgui.GetStyle().ScrollbarSize = 10
		imgui.GetStyle().GrabMinSize = 10
		imgui.GetStyle().WindowBorderSize = 1
		imgui.GetStyle().ChildBorderSize = 1
	
		imgui.GetStyle().PopupBorderSize = 1
		imgui.GetStyle().FrameBorderSize = 1
		imgui.GetStyle().TabBorderSize = 1
		imgui.GetStyle().WindowRounding = 8
		imgui.GetStyle().ChildRounding = 8
		imgui.GetStyle().FrameRounding = 8
		imgui.GetStyle().PopupRounding = 8
		imgui.GetStyle().ScrollbarRounding = 8
		imgui.GetStyle().GrabRounding = 8
		imgui.GetStyle().TabRounding = 8
	
		imgui.GetStyle().Colors[imgui.Col.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00);
		imgui.GetStyle().Colors[imgui.Col.TextDisabled]           = ImVec4(1.00, 1.00, 1.00, 0.43);
		imgui.GetStyle().Colors[imgui.Col.WindowBg]               = ImVec4(0.00, 0.00, 0.00, 0.90);
		imgui.GetStyle().Colors[imgui.Col.ChildBg]                = ImVec4(1.00, 1.00, 1.00, 0.07);
		imgui.GetStyle().Colors[imgui.Col.PopupBg]                = ImVec4(0.00, 0.00, 0.00, 0.94);
		imgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(1.00, 1.00, 1.00, 0.00);
		imgui.GetStyle().Colors[imgui.Col.BorderShadow]           = ImVec4(1.00, 0.00, 0.00, 0.32);
		imgui.GetStyle().Colors[imgui.Col.FrameBg]                = ImVec4(1.00, 1.00, 1.00, 0.09);
		imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]         = ImVec4(1.00, 1.00, 1.00, 0.17);
		imgui.GetStyle().Colors[imgui.Col.FrameBgActive]          = ImVec4(1.00, 1.00, 1.00, 0.26);
		imgui.GetStyle().Colors[imgui.Col.TitleBg]                = ImVec4(0.19, 0.00, 0.00, 1.00);
		imgui.GetStyle().Colors[imgui.Col.TitleBgActive]          = ImVec4(0.46, 0.00, 0.00, 1.00);
		imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed]       = ImVec4(0.20, 0.00, 0.00, 1.00);
		imgui.GetStyle().Colors[imgui.Col.MenuBarBg]              = ImVec4(0.14, 0.03, 0.03, 1.00);
		imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]            = ImVec4(0.19, 0.00, 0.00, 0.53);
		imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]          = ImVec4(1.00, 1.00, 1.00, 0.11);
		imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered]   = ImVec4(1.00, 1.00, 1.00, 0.24);
		imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]    = ImVec4(1.00, 1.00, 1.00, 0.35);
		imgui.GetStyle().Colors[imgui.Col.CheckMark]              = ImVec4(1.00, 1.00, 1.00, 1.00);
		imgui.GetStyle().Colors[imgui.Col.SliderGrab]             = ImVec4(1.00, 0.00, 0.00, 0.34);
		imgui.GetStyle().Colors[imgui.Col.SliderGrabActive]       = ImVec4(1.00, 0.00, 0.00, 0.51);
		imgui.GetStyle().Colors[imgui.Col.Button]                 = ImVec4(1.00, 0.00, 0.00, 0.19);
		imgui.GetStyle().Colors[imgui.Col.ButtonHovered]          = ImVec4(1.00, 0.00, 0.00, 0.31);
		imgui.GetStyle().Colors[imgui.Col.ButtonActive]           = ImVec4(1.00, 0.00, 0.00, 0.46);
		imgui.GetStyle().Colors[imgui.Col.Header]                 = ImVec4(1.00, 0.00, 0.00, 0.19);
		imgui.GetStyle().Colors[imgui.Col.HeaderHovered]          = ImVec4(1.00, 0.00, 0.00, 0.30);
		imgui.GetStyle().Colors[imgui.Col.HeaderActive]           = ImVec4(1.00, 0.00, 0.00, 0.50);
		imgui.GetStyle().Colors[imgui.Col.Separator]              = ImVec4(1.00, 0.00, 0.00, 0.41);
		imgui.GetStyle().Colors[imgui.Col.SeparatorHovered]       = ImVec4(1.00, 1.00, 1.00, 0.78);
		imgui.GetStyle().Colors[imgui.Col.SeparatorActive]        = ImVec4(1.00, 1.00, 1.00, 1.00);
		imgui.GetStyle().Colors[imgui.Col.ResizeGrip]             = ImVec4(0.19, 0.00, 0.00, 0.53);
		imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered]      = ImVec4(0.43, 0.00, 0.00, 0.75);
		imgui.GetStyle().Colors[imgui.Col.ResizeGripActive]       = ImVec4(0.53, 0.00, 0.00, 0.95);
		imgui.GetStyle().Colors[imgui.Col.Tab]                    = ImVec4(1.00, 0.00, 0.00, 0.27);
		imgui.GetStyle().Colors[imgui.Col.TabHovered]             = ImVec4(1.00, 0.00, 0.00, 0.48);
		imgui.GetStyle().Colors[imgui.Col.TabActive]              = ImVec4(1.00, 0.00, 0.00, 0.60);
		imgui.GetStyle().Colors[imgui.Col.TabUnfocused]           = ImVec4(1.00, 0.00, 0.00, 0.27);
		imgui.GetStyle().Colors[imgui.Col.TabUnfocusedActive]     = ImVec4(1.00, 0.00, 0.00, 0.54);
		imgui.GetStyle().Colors[imgui.Col.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00);
		imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00);
		imgui.GetStyle().Colors[imgui.Col.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00);
		imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00);
		imgui.GetStyle().Colors[imgui.Col.TextSelectedBg]         = ImVec4(1.00, 1.00, 1.00, 0.35);
		imgui.GetStyle().Colors[imgui.Col.DragDropTarget]         = ImVec4(1.00, 1.00, 0.00, 0.90);
		imgui.GetStyle().Colors[imgui.Col.NavHighlight]           = ImVec4(0.26, 0.59, 0.98, 1.00);
		imgui.GetStyle().Colors[imgui.Col.NavWindowingHighlight]  = ImVec4(1.00, 1.00, 1.00, 0.70);
		imgui.GetStyle().Colors[imgui.Col.NavWindowingDimBg]      = ImVec4(0.80, 0.80, 0.80, 0.20);
		imgui.GetStyle().Colors[imgui.Col.ModalWindowDimBg]       = ImVec4(0.80, 0.80, 0.80, 0.35);
	end

function themeSix()
		imgui.SwitchContext()
		local style = imgui.GetStyle()
		local colors = style.Colors
		local clr = imgui.Col
		local ImVec4 = imgui.ImVec4
	
		imgui.GetStyle().WindowPadding = imgui.ImVec2(5, 5)
		imgui.GetStyle().FramePadding = imgui.ImVec2(5, 5)
		imgui.GetStyle().ItemSpacing = imgui.ImVec2(5, 5)
		imgui.GetStyle().ItemInnerSpacing = imgui.ImVec2(2, 2)
		imgui.GetStyle().TouchExtraPadding = imgui.ImVec2(0, 0)
		imgui.GetStyle().IndentSpacing = 0
		imgui.GetStyle().ScrollbarSize = 10
		imgui.GetStyle().GrabMinSize = 10
	
		--==[ BORDER ]==--
		imgui.GetStyle().WindowBorderSize = 1
		imgui.GetStyle().ChildBorderSize = 1
		imgui.GetStyle().PopupBorderSize = 1
		imgui.GetStyle().FrameBorderSize = 1
		imgui.GetStyle().TabBorderSize = 1
	
		--==[ ROUNDING ]==--
		imgui.GetStyle().WindowRounding = 8
		imgui.GetStyle().ChildRounding = 8
		imgui.GetStyle().FrameRounding = 8
		imgui.GetStyle().PopupRounding = 8
		imgui.GetStyle().ScrollbarRounding = 8
		imgui.GetStyle().GrabRounding = 8
		imgui.GetStyle().TabRounding = 8
	
		colors[clr.FrameBg]                = ImVec4(0.16, 0.48, 0.42, 0.54)
		colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.98, 0.85, 0.40)
		colors[clr.FrameBgActive]          = ImVec4(0.26, 0.98, 0.85, 0.67)
		colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
		colors[clr.TitleBgActive]          = ImVec4(0.16, 0.48, 0.42, 1.00)
		colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
		colors[clr.CheckMark]              = ImVec4(0.26, 0.98, 0.85, 1.00)
		colors[clr.SliderGrab]             = ImVec4(0.24, 0.88, 0.77, 1.00)
		colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.98, 0.85, 1.00)
		colors[clr.Button]                 = ImVec4(0.26, 0.98, 0.85, 0.40)
		colors[clr.ButtonHovered]          = ImVec4(0.26, 0.98, 0.85, 1.00)
		colors[clr.ButtonActive]           = ImVec4(0.06, 0.98, 0.82, 1.00)
		colors[clr.Header]                 = ImVec4(0.26, 0.98, 0.85, 0.31)
		colors[clr.HeaderHovered]          = ImVec4(0.26, 0.98, 0.85, 0.80)
		colors[clr.HeaderActive]           = ImVec4(0.26, 0.98, 0.85, 1.00)
		colors[clr.Separator]              = colors[clr.Border]
		colors[clr.SeparatorHovered]       = ImVec4(0.10, 0.75, 0.63, 0.78)
		colors[clr.SeparatorActive]        = ImVec4(0.10, 0.75, 0.63, 1.00)
		colors[clr.ResizeGrip]             = ImVec4(0.26, 0.98, 0.85, 0.25)
		colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.98, 0.85, 0.67)
		colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.98, 0.85, 0.95)
		colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
		colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.81, 0.35, 1.00)
		colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.98, 0.85, 0.35)
		colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
		colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
		colors[clr.ChildBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
		colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
		colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
		colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
		colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
		colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
		colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
		colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
		colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
		colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
		colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
	end

function themeFive()
		imgui.SwitchContext()
		--==[ STYLE ]==--
		imgui.GetStyle().WindowPadding = imgui.ImVec2(5, 5)
		imgui.GetStyle().FramePadding = imgui.ImVec2(5, 5)
		imgui.GetStyle().ItemSpacing = imgui.ImVec2(5, 5)
		imgui.GetStyle().ItemInnerSpacing = imgui.ImVec2(2, 2)
		imgui.GetStyle().TouchExtraPadding = imgui.ImVec2(0, 0)
		imgui.GetStyle().IndentSpacing = 0
		imgui.GetStyle().ScrollbarSize = 10
		imgui.GetStyle().GrabMinSize = 10
	
		--==[ BORDER ]==--
		imgui.GetStyle().WindowBorderSize = 1
		imgui.GetStyle().ChildBorderSize = 1
		imgui.GetStyle().PopupBorderSize = 1
		imgui.GetStyle().FrameBorderSize = 1
		imgui.GetStyle().TabBorderSize = 1
	
		--==[ ROUNDING ]==--
		imgui.GetStyle().WindowRounding = 5
		imgui.GetStyle().ChildRounding = 5
		imgui.GetStyle().FrameRounding = 5
		imgui.GetStyle().PopupRounding = 5
		imgui.GetStyle().ScrollbarRounding = 5
		imgui.GetStyle().GrabRounding = 5
		imgui.GetStyle().TabRounding = 5
	
		--==[ ALIGN ]==--
		imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
		imgui.GetStyle().ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
		imgui.GetStyle().SelectableTextAlign = imgui.ImVec2(0.5, 0.5)
		
		--==[ COLORS ]==--
		imgui.GetStyle().Colors[imgui.Col.Text]                   = imgui.ImVec4(1.00, 1.00, 1.00, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TextDisabled]           = imgui.ImVec4(0.50, 0.50, 0.50, 1.00)
		imgui.GetStyle().Colors[imgui.Col.WindowBg]               = imgui.ImVec4(0.07, 0.07, 0.07, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ChildBg]                = imgui.ImVec4(0.07, 0.07, 0.07, 1.00)
		imgui.GetStyle().Colors[imgui.Col.PopupBg]                = imgui.ImVec4(0.07, 0.07, 0.07, 1.00)
		imgui.GetStyle().Colors[imgui.Col.Border]                 = imgui.ImVec4(0.25, 0.25, 0.26, 0.54)
		imgui.GetStyle().Colors[imgui.Col.BorderShadow]           = imgui.ImVec4(0.00, 0.00, 0.00, 0.00)
		imgui.GetStyle().Colors[imgui.Col.FrameBg]                = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
		imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]         = imgui.ImVec4(0.25, 0.25, 0.26, 1.00)
		imgui.GetStyle().Colors[imgui.Col.FrameBgActive]          = imgui.ImVec4(0.25, 0.25, 0.26, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TitleBg]                = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TitleBgActive]          = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed]       = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
		imgui.GetStyle().Colors[imgui.Col.MenuBarBg]              = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]            = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]          = imgui.ImVec4(0.00, 0.00, 0.00, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered]   = imgui.ImVec4(0.41, 0.41, 0.41, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]    = imgui.ImVec4(0.51, 0.51, 0.51, 1.00)
		imgui.GetStyle().Colors[imgui.Col.CheckMark]              = imgui.ImVec4(1.00, 1.00, 1.00, 1.00)
		imgui.GetStyle().Colors[imgui.Col.SliderGrab]             = imgui.ImVec4(0.21, 0.20, 0.20, 1.00)
		imgui.GetStyle().Colors[imgui.Col.SliderGrabActive]       = imgui.ImVec4(0.21, 0.20, 0.20, 1.00)
		imgui.GetStyle().Colors[imgui.Col.Button]                 = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ButtonHovered]          = imgui.ImVec4(0.21, 0.20, 0.20, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ButtonActive]           = imgui.ImVec4(0.41, 0.41, 0.41, 1.00)
		imgui.GetStyle().Colors[imgui.Col.Header]                 = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
		imgui.GetStyle().Colors[imgui.Col.HeaderHovered]          = imgui.ImVec4(0.20, 0.20, 0.20, 1.00)
		imgui.GetStyle().Colors[imgui.Col.HeaderActive]           = imgui.ImVec4(0.47, 0.47, 0.47, 1.00)
		imgui.GetStyle().Colors[imgui.Col.Separator]              = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
		imgui.GetStyle().Colors[imgui.Col.SeparatorHovered]       = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
		imgui.GetStyle().Colors[imgui.Col.SeparatorActive]        = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
		imgui.GetStyle().Colors[imgui.Col.ResizeGrip]             = imgui.ImVec4(1.00, 1.00, 1.00, 0.25)
		imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered]      = imgui.ImVec4(1.00, 1.00, 1.00, 0.67)
		imgui.GetStyle().Colors[imgui.Col.ResizeGripActive]       = imgui.ImVec4(1.00, 1.00, 1.00, 0.95)
		imgui.GetStyle().Colors[imgui.Col.Tab]                    = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TabHovered]             = imgui.ImVec4(0.28, 0.28, 0.28, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TabActive]              = imgui.ImVec4(0.30, 0.30, 0.30, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TabUnfocused]           = imgui.ImVec4(0.07, 0.10, 0.15, 0.97)
		imgui.GetStyle().Colors[imgui.Col.TabUnfocusedActive]     = imgui.ImVec4(0.14, 0.26, 0.42, 1.00)
		imgui.GetStyle().Colors[imgui.Col.PlotLines]              = imgui.ImVec4(0.61, 0.61, 0.61, 1.00)
		imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]       = imgui.ImVec4(1.00, 0.43, 0.35, 1.00)
		imgui.GetStyle().Colors[imgui.Col.PlotHistogram]          = imgui.ImVec4(0.90, 0.70, 0.00, 1.00)
		imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered]   = imgui.ImVec4(1.00, 0.60, 0.00, 1.00)
		imgui.GetStyle().Colors[imgui.Col.TextSelectedBg]         = imgui.ImVec4(1.00, 0.00, 0.00, 0.35)
		imgui.GetStyle().Colors[imgui.Col.DragDropTarget]         = imgui.ImVec4(1.00, 1.00, 0.00, 0.90)
		imgui.GetStyle().Colors[imgui.Col.NavHighlight]           = imgui.ImVec4(0.26, 0.59, 0.98, 1.00)
		imgui.GetStyle().Colors[imgui.Col.NavWindowingHighlight]  = imgui.ImVec4(1.00, 1.00, 1.00, 0.70)
		imgui.GetStyle().Colors[imgui.Col.NavWindowingDimBg]      = imgui.ImVec4(0.80, 0.80, 0.80, 0.20)
		imgui.GetStyle().Colors[imgui.Col.ModalWindowDimBg]       = imgui.ImVec4(0.00, 0.00, 0.00, 0.70)
	end

function themeFour()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    
    colors[clr.Text]                   = ImVec4(0.90, 0.90, 0.90, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.60, 0.60, 0.60, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.08, 0.08, 0.08, 1.00)
    colors[clr.ChildBg]                = ImVec4(0.200, 0.220, 0.270, 0.47)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 1.00)
    colors[clr.Border]                 = ImVec4(0.70, 0.70, 0.70, 0.40)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]                = ImVec4(0.15, 0.15, 0.15, 1.00)
    colors[clr.FrameBgHovered]         = ImVec4(0.19, 0.19, 0.19, 0.71)
    colors[clr.FrameBgActive]          = ImVec4(0.34, 0.34, 0.34, 0.79)
    colors[clr.TitleBg]                = ImVec4(0.00, 0.69, 0.33, 0.80)
    colors[clr.TitleBgActive]          = ImVec4(0.00, 0.74, 0.36, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.69, 0.33, 0.50)
    colors[clr.MenuBarBg]              = ImVec4(0.00, 0.80, 0.38, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.16, 0.16, 0.16, 1.00)
    colors[clr.ScrollbarGrab]          = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.00, 0.82, 0.39, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.00, 1.00, 0.48, 1.00)
    colors[clr.CheckMark]              = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.00, 0.77, 0.37, 1.00)
    colors[clr.Button]                 = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.ButtonHovered]          = ImVec4(0.00, 0.82, 0.39, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.00, 0.87, 0.42, 1.00)
    colors[clr.Header]                 = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.HeaderHovered]          = ImVec4(0.00, 0.76, 0.37, 0.57)
    colors[clr.HeaderActive]           = ImVec4(0.00, 0.88, 0.42, 0.89)
    colors[clr.Separator]              = ImVec4(1.00, 1.00, 1.00, 0.40)
    colors[clr.SeparatorHovered]       = ImVec4(1.00, 1.00, 1.00, 0.60)
    colors[clr.SeparatorActive]        = ImVec4(1.00, 1.00, 1.00, 0.80)
    colors[clr.ResizeGrip]             = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.ResizeGripHovered]      = ImVec4(0.00, 0.76, 0.37, 1.00)
    colors[clr.ResizeGripActive]       = ImVec4(0.00, 0.86, 0.41, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(0.00, 0.74, 0.36, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(0.00, 0.80, 0.38, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.00, 0.69, 0.33, 0.72)
end