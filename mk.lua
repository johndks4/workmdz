script_name("CarFuncs GUI - Dark Purple")
script_author("Gemini")
script_version("1.2")

require "lib.moonloader"
local imgui = require 'mimgui'
local ffi = require 'ffi'

local renderWindow = imgui.new.bool(false)

local selectedVehId = -1
local selectedVehName = "Selecione um veiculo proximo..."

local selectedPlayerId = -1
local selectedPlayerName = "Selecione um jogador proximo..."

local function getVehicleModelName(modelId)
    return tostring(ffi.string(getGxtText(getNameOfVehicleModel(modelId))))
end

-- ==========================================
-- 🎨 APLICAÇÃO DO TEMA ROXO DARK
-- ==========================================
imgui.OnInitialize(function()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col

    -- Arredondamento para um visual mais suave e moderno
    style.WindowRounding = 8.0
    style.FrameRounding = 6.0
    style.PopupRounding = 6.0
    style.ScrollbarRounding = 6.0
    style.WindowBorderSize = 1.0

    -- Paleta de Cores Roxo Escuro (Valores RGBA)
    colors[clr.Text]                   = imgui.ImVec4(0.95, 0.95, 0.95, 1.00)
    colors[clr.WindowBg]               = imgui.ImVec4(0.08, 0.07, 0.09, 0.98)
    colors[clr.PopupBg]                = imgui.ImVec4(0.12, 0.10, 0.14, 0.98)
    colors[clr.Border]                 = imgui.ImVec4(0.35, 0.20, 0.50, 0.50)
    colors[clr.FrameBg]                = imgui.ImVec4(0.16, 0.12, 0.20, 1.00)
    colors[clr.FrameBgHovered]         = imgui.ImVec4(0.24, 0.18, 0.30, 1.00)
    colors[clr.FrameBgActive]          = imgui.ImVec4(0.32, 0.24, 0.40, 1.00)
    colors[clr.TitleBg]                = imgui.ImVec4(0.18, 0.12, 0.25, 1.00)
    colors[clr.TitleBgActive]          = imgui.ImVec4(0.28, 0.15, 0.45, 1.00)
    colors[clr.Button]                 = imgui.ImVec4(0.35, 0.15, 0.60, 1.00)
    colors[clr.ButtonHovered]          = imgui.ImVec4(0.45, 0.25, 0.75, 1.00)
    colors[clr.ButtonActive]           = imgui.ImVec4(0.25, 0.10, 0.45, 1.00)
    colors[clr.Header]                 = imgui.ImVec4(0.35, 0.15, 0.60, 0.80)
    colors[clr.HeaderHovered]          = imgui.ImVec4(0.45, 0.25, 0.75, 0.80)
    colors[clr.HeaderActive]           = imgui.ImVec4(0.25, 0.10, 0.45, 1.00)
    colors[clr.Separator]              = imgui.ImVec4(0.35, 0.20, 0.50, 0.50)
    colors[clr.ScrollbarBg]            = imgui.ImVec4(0.08, 0.07, 0.09, 1.00)
    colors[clr.ScrollbarGrab]          = imgui.ImVec4(0.35, 0.15, 0.60, 1.00)
    colors[clr.ScrollbarGrabHovered]   = imgui.ImVec4(0.45, 0.25, 0.75, 1.00)
    colors[clr.ScrollbarGrabActive]    = imgui.ImVec4(0.25, 0.10, 0.45, 1.00)
end)

-- ==========================================
-- 🖥️ RENDERIZAÇÃO DA INTERFACE
-- ==========================================
imgui.OnFrame(function() return renderWindow[0] end, function(player)
    local resX, resY = getScreenResolution()
    imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(400, 230), imgui.Cond.FirstUseEver)
    
    imgui.Begin("CarFuncs GUI - Area de Stream", renderWindow, imgui.WindowFlags.NoCollapse)
    
    -- 1. DROPDOWN DE VEÍCULOS (Somente na Stream)
    imgui.Text("1. Veiculo (Na sua tela):")
    imgui.SetNextItemWidth(-1)
    if imgui.BeginCombo("##vehcombo", selectedVehName) then
        for i = 1, 2000 do
            local isStreamed, vehHandle = sampGetCarHandleBySampVehicleId(i)
            if isStreamed then
                local model = sampGetVehicleModelIdBySampVehicleId(i)
                local carName = getVehicleModelName(model)
                local label = string.format("ID: %d - %s", i, carName)
                local is_selected = (selectedVehId == i)
                
                if imgui.Selectable(label, is_selected) then
                    selectedVehId = i
                    selectedVehName = label
                end
                if is_selected then imgui.SetItemDefaultFocus() end
            end
        end
        imgui.EndCombo()
    end
    
    imgui.Spacing()
    imgui.Separator()
    imgui.Spacing()

    -- 2. DROPDOWN DE JOGADORES (Somente na Stream)
    imgui.Text("2. Jogador Alvo (Na sua tela):")
    imgui.SetNextItemWidth(-1)
    if imgui.BeginCombo("##playercombo", selectedPlayerName) then
        local maxPlayers = sampGetMaxPlayerId(true)
        local _, myId = sampGetPlayerIdByCharHandle(PLAYER_PED)
        
        for i = 0, maxPlayers do
            if sampIsPlayerConnected(i) then
                local isStreamed, pedHandle = sampGetCharHandleBySampPlayerId(i)
                if isStreamed or i == myId then
                    local name = sampGetPlayerNickname(i)
                    local label = string.format("[%d] %s", i, name)
                    local is_selected = (selectedPlayerId == i)
                    
                    if imgui.Selectable(label, is_selected) then
                        selectedPlayerId = i
                        selectedPlayerName = label
                    end
                    if is_selected then imgui.SetItemDefaultFocus() end
                end
            end
        end
        imgui.EndCombo()
    end
    
    imgui.Spacing()
    imgui.Spacing()
    
    -- BOTÃO DE AÇÃO
    if imgui.Button("Executar /bc (Via CLEO)", imgui.ImVec2(-1, 40)) then
        if selectedVehId == -1 then
            sampAddChatMessage("{FF0000}[CarFuncs GUI] {FFFFFF}Selecione um veiculo proximo primeiro.", -1)
        elseif selectedPlayerId == -1 then
            sampAddChatMessage("{FF0000}[CarFuncs GUI] {FFFFFF}Selecione um jogador proximo primeiro.", -1)
        else
            local cmd = string.format("/bc %d %d", selectedVehId, selectedPlayerId)
            sampProcessChatInput(cmd)
            sampAddChatMessage(string.format("{00FF00}[CarFuncs GUI] {FFFFFF}Comando enviado para o CLEO: %s", cmd), -1)
        end
    end

    imgui.End()
end)

-- ==========================================
-- ⚙️ LOOP PRINCIPAL DO SCRIPT
-- ==========================================
function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end

    sampRegisterChatCommand("vmenu", function()
        renderWindow[0] = not renderWindow[0]
    end)

    sampAddChatMessage("{9932CC}[CarFuncs GUI Dark] {FFFFFF}Carregado! Digite {9932CC}/vmenu", -1)

    while true do
        wait(0)
        imgui.Process = renderWindow[0]
    end
end
