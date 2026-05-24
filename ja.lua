script_name("MENU SUPREMO UNIFICADO")
script_author("Gemini")

local imgui = require 'mimgui'
local ffi = require 'ffi'
local sampfuncs = require 'sampfuncs'
local sampev = require 'samp.events'
local ev = require 'lib.samp.events'
local encoding = require 'encoding'
encoding.default = 'CP1252'
u8 = encoding.UTF8

-- ==========================================
-- VARIÁVEIS GLOBAIS E ESTADOS
-- ==========================================
local DPI = 1.0 -- Escala de resolução
local start_time = os.clock()
local animation_duration = 8

local menu = {
    aberto = imgui.new.bool(false),
    aba_atual = imgui.new.int(1),
    clickedButton = 1
}

-- Estados das Funções[span_7](start_span)[span_7](end_span)[span_8](start_span)[span_8](end_span)
local cfg = {
    -- Player
    godmode = imgui.new.bool(false),
    airbreak = ffi.new("bool[1]", false),
    anti_freeze = imgui.new.bool(false),
    fast_spawn = imgui.new.bool(false),
    fake_afk = imgui.new.bool(false),
    
    -- Veículo
    godcar = imgui.new.bool(false),
    drift_mode = imgui.new.bool(false),
    fly_car = imgui.new.bool(false),
    anti_explode = imgui.new.bool(false),
    
    -- Armas
    fast_reload = imgui.new.bool(false),
    anti_stun = imgui.new.bool(false),
    no_reload = imgui.new.bool(false),
    
    -- Troll / Multiplayer
    rvanka = imgui.new.bool(false),
    auto_kill = imgui.new.bool(false),
    crash_players = imgui.new.bool(false),
    
    -- ESP
    esp_lines = imgui.new.bool(false),
    esp_box = imgui.new.bool(false),
    esp_skeleton = imgui.new.bool(false)
}

local ped_airbrake_enabled = false
local speed = 0.5
local fake_afk_pos = {x = 0, y = 0, z = 0}

-- ==========================================
-- ESTILIZAÇÃO E ANIMAÇÕES (Design Premium)
-- ==========================================
imgui.OnInitialize(function()
    local config = imgui.ImFontConfig()
    config.MergeMode = true
    config.PixelSnapH = true
    
    local style = imgui.GetStyle()
    style.WindowRounding = 11 * DPI
    style.FrameRounding = 8 * DPI
    style.FramePadding = imgui.ImVec2(8 * DPI, 8 * DPI)
    style.ItemSpacing = imgui.ImVec2(10 * DPI, 8 * DPI)
    style.WindowBorderSize = 0

    -- Cores base (Tema Dark/Ciano)[span_9](start_span)[span_9](end_span)
    local colors = style.Colors
    colors[imgui.Col.WindowBg] = imgui.ImVec4(0.02, 0.05, 0.08, 0.98)
    colors[imgui.Col.Button] = imgui.ImVec4(0.0, 0.4, 0.6, 1.0)
    colors[imgui.Col.ButtonHovered] = imgui.ImVec4(0.0, 0.6, 0.8, 1.0)
    colors[imgui.Col.ButtonActive] = imgui.ImVec4(0.0, 0.8, 1.0, 1.0)
    colors[imgui.Col.FrameBg] = imgui.ImVec4(0.05, 0.1, 0.15, 1.0)
    colors[imgui.Col.Text] = imgui.ImVec4(0.9, 0.95, 1.0, 1.0)
end)

-- Borda Animada (Efeitovzik)[span_10](start_span)[span_10](end_span)
local function renderAnimatedBorders()
    local drawList = imgui.GetWindowDrawList()
    local winPos = imgui.GetWindowPos()
    local winSize = imgui.GetWindowSize()
    
    local elapsed_time = os.clock() - start_time
    local cycle_time = (elapsed_time % animation_duration) / animation_duration
    local progress = math.abs(2 * cycle_time - 1)
    
    local horizontal_offset = (winSize.x / 2) * progress
    local cyanColor = imgui.ColorConvertFloat4ToU32(imgui.ImVec4(0.0, 0.8, 1.0, 1.0))
    local darkCyanColor = imgui.ColorConvertFloat4ToU32(imgui.ImVec4(0.0, 0.4, 0.6, 1.0))

    -- Borda estática base
    drawList:AddRect(winPos, imgui.ImVec2(winPos.x + winSize.x, winPos.y + winSize.y), darkCyanColor, 11 * DPI, nil, 2 * DPI)
    
    -- Linhas animadas superior e inferior
    drawList:AddRect(
        imgui.ImVec2(winPos.x + winSize.x / 2 - horizontal_offset, winPos.y),
        imgui.ImVec2(winPos.x + winSize.x / 2 + horizontal_offset, winPos.y + 2 * DPI),
        cyanColor, 11 * DPI, nil, 3 * DPI
    )
    drawList:AddRect(
        imgui.ImVec2(winPos.x + winSize.x / 2 - horizontal_offset, winPos.y + winSize.y - 2 * DPI),
        imgui.ImVec2(winPos.x + winSize.x / 2 + horizontal_offset, winPos.y + winSize.y),
        cyanColor, 11 * DPI, nil, 3 * DPI
    )
end

-- Botão Lateral Dinâmico[span_11](start_span)[span_11](end_span)
local function drawSidebarButton(label, index)
    if menu.clickedButton == index then
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.0, 0.8, 1.0, 1.0))
        imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.0, 0.0, 0.0, 1.0))
    else
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.0, 0.2, 0.3, 1.0))
        imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.8, 0.8, 0.8, 1.0))
    end

    if imgui.Button(label, imgui.ImVec2(160 * DPI, 45 * DPI)) then
        menu.clickedButton = index
        menu.aba_atual[0] = index
    end
    imgui.PopStyleColor(2)
end

-- Custom Checkbox Animada[span_12](start_span)[span_12](end_span)[span_13](start_span)[span_13](end_span)
function imgui.CustomCheckbox(label, bool_val)
    local p = imgui.GetCursorScreenPos()
    local drawList = imgui.GetWindowDrawList()
    local h = imgui.GetTextLineHeightWithSpacing()
    
    imgui.InvisibleButton(label, imgui.ImVec2(h * 2, h))
    local clicked = imgui.IsItemClicked()
    if clicked then bool_val[0] = not bool_val[0] end
    
    local bg_color = bool_val[0] and imgui.ColorConvertFloat4ToU32(imgui.ImVec4(0.0, 0.8, 1.0, 1.0)) or imgui.ColorConvertFloat4ToU32(imgui.ImVec4(0.2, 0.2, 0.2, 1.0))
    local circle_color = imgui.ColorConvertFloat4ToU32(imgui.ImVec4(1.0, 1.0, 1.0, 1.0))
    
    drawList:AddRectFilled(p, imgui.ImVec2(p.x + h * 2, p.y + h), bg_color, h / 2)
    local circle_x = bool_val[0] and (p.x + h * 1.5) or (p.x + h * 0.5)
    drawList:AddCircleFilled(imgui.ImVec2(circle_x, p.y + h / 2), h / 2.5, circle_color)
    
    imgui.SameLine()
    imgui.SetCursorPosY(imgui.GetCursorPosY() + 2)
    imgui.Text(label)
    return clicked
end

-- ==========================================
-- RENDERIZAÇÃO DA INTERFACE
-- ==========================================
imgui.OnFrame(function() return menu.aberto[0] end, function()
    imgui.SetNextWindowPos(imgui.ImVec2(400, 250), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(750, 500), imgui.Cond.Always)
    
    if imgui.Begin("##Supremo", menu.aberto, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoTitleBar) then
        renderAnimatedBorders()[span_14](start_span)[span_14](end_span)

        -- Header
        imgui.SetCursorPos(imgui.ImVec2(20, 15))
        imgui.TextColored(imgui.ImVec4(0.0, 1.0, 1.0, 1.0), "FAST X SULISTA - SUPREME MENU")
        
        imgui.SetCursorPos(imgui.ImVec2(710, 10))
        if imgui.Button("X", imgui.ImVec2(30, 30)) then menu.aberto[0] = false end

        imgui.SetCursorPos(imgui.ImVec2(15, 60))
        imgui.BeginGroup()
        drawSidebarButton("PLAYER", 1)[span_15](start_span)[span_15](end_span)
        drawSidebarButton("VEÍCULOS", 2)
        drawSidebarButton("ARMAS & COMBAT", 3)
        drawSidebarButton("TROLL / SERVER", 4)
        drawSidebarButton("VISUAL & ESP", 5)
        imgui.EndGroup()

        imgui.SetCursorPos(imgui.ImVec2(190, 60))
        imgui.BeginChild("##content", imgui.ImVec2(540, 420), true)
        
        -- ABA 1: PLAYER
        if menu.aba_atual[0] == 1 then
            imgui.Text("MODIFICAÇÕES DE JOGADOR")
            imgui.Separator()
            if imgui.Button("Suicídio Rápido", imgui.ImVec2(150, 30)) then setCharHealth(PLAYER_PED, 0) end
            imgui.SameLine()
            if imgui.Button("Desbugar Animação", imgui.ImVec2(150, 30)) then clearCharTasksImmediately(PLAYER_PED) end
            
            imgui.Spacing()
            imgui.CustomCheckbox("God Mode Total", cfg.godmode)[span_16](start_span)[span_16](end_span)
            if imgui.CustomCheckbox("AirBreak (Voo Livre)", cfg.airbreak) then
                ped_airbrake_enabled = cfg.airbreak[0]
                if not ped_airbrake_enabled then freezeCharPosition(PLAYER_PED, false) setCharCollision(PLAYER_PED, true) end
            end
            imgui.CustomCheckbox("Anti-Congelamento (Admins)", cfg.anti_freeze)[span_17](start_span)[span_17](end_span)
            if imgui.CustomCheckbox("Fake AFK (Travar Posição)", cfg.fake_afk) then
                if cfg.fake_afk[0] then fake_afk_pos.x, fake_afk_pos.y, fake_afk_pos.z = getCharCoordinates(PLAYER_PED) end
            end[span_18](start_span)[span_18](end_span)

        -- ABA 2: VEÍCULOS
        elseif menu.aba_atual[0] == 2 then
            imgui.Text("MODIFICAÇÕES DE VEÍCULOS")
            imgui.Separator()
            imgui.CustomCheckbox("God Mode Veículo", cfg.godcar)
            imgui.CustomCheckbox("Modo Drift (Pressione Shift)", cfg.drift_mode)[span_19](start_span)[span_19](end_span)
            imgui.CustomCheckbox("Carro Voador (Pressione C)", cfg.fly_car)[span_20](start_span)[span_20](end_span)
            imgui.CustomCheckbox("Anti-Explosão (Sobreviva ao fogo)", cfg.anti_explode)[span_21](start_span)[span_21](end_span)

        -- ABA 3: ARMAS
        elseif menu.aba_atual[0] == 3 then
            imgui.Text("COMBATE E ARMAS")
            imgui.Separator()
            imgui.CustomCheckbox("Fast Reload (Sem Animação)", cfg.fast_reload)[span_22](start_span)[span_22](end_span)
            imgui.CustomCheckbox("No Reload (Munição Direta)", cfg.no_reload)[span_23](start_span)[span_23](end_span)
            imgui.CustomCheckbox("Anti-Stun (Não toma hit stun)", cfg.anti_stun)[span_24](start_span)[span_24](end_span)

        -- ABA 4: TROLL E MULTIPLAYER
        elseif menu.aba_atual[0] == 4 then
            imgui.Text("FUNÇÕES MULTIPLAYER (CUIDADO)")
            imgui.Separator()
            imgui.CustomCheckbox("Rvanka (Destruir Carros Próximos)", cfg.rvanka)[span_25](start_span)[span_25](end_span)[span_26](start_span)[span_26](end_span)
            imgui.CustomCheckbox("Auto-Kill (Matar área 100m)", cfg.auto_kill)[span_27](start_span)[span_27](end_span)
            imgui.CustomCheckbox("Crashar Jogadores (Bypass)", cfg.crash_players)[span_28](start_span)[span_28](end_span)

        -- ABA 5: ESP
        elseif menu.aba_atual[0] == 5 then
            imgui.Text("WALLHACK E VISUAL")
            imgui.Separator()
            imgui.CustomCheckbox("ESP Linhas (Tracer)", cfg.esp_lines)[span_29](start_span)[span_29](end_span)
            imgui.CustomCheckbox("ESP Caixa (3D Box)", cfg.esp_box)[span_30](start_span)[span_30](end_span)
            imgui.CustomCheckbox("ESP Esqueleto", cfg.esp_skeleton)[span_31](start_span)[span_31](end_span)
        end

        imgui.EndChild()
        imgui.End()
    end
end)

-- ==========================================
-- LÓGICAS DO MENU EM LOOP
-- ==========================================
function main()
    while not isSampAvailable() do wait(0) end
    sampAddChatMessage("{00FFFF}[MENU SUPREMO] {FFFFFF}Iniciado. Digite {00FFFF}/ja {FFFFFF}para abrir.", -1)
    
    sampRegisterChatCommand("ja", function() menu.aberto[0] = not menu.aberto[0] end)

    while true do
        wait(0)
        
        -- Airbreak[span_32](start_span)[span_32](end_span)
        if ped_airbrake_enabled then processPedAirBrake() end
        
        -- Fake AFK[span_33](start_span)[span_33](end_span)
        if cfg.fake_afk[0] then
            local pX, pY, pZ = getCharCoordinates(PLAYER_PED)
            if getDistanceBetweenCoords3d(pX, pY, pZ, fake_afk_pos.x, fake_afk_pos.y, fake_afk_pos.z) > 1.0 then
                setCharCoordinates(PLAYER_PED, fake_afk_pos.x, fake_afk_pos.y, fake_afk_pos.z)
            end
        end

        -- GodMode SAMP[span_34](start_span)[span_34](end_span)[span_35](start_span)[span_35](end_span)
        sampev.onSetPlayerHealth = function() if cfg.godmode[0] then return false end end
        sampev.onBulletSync = function() if cfg.godmode[0] then return false end end

        -- Anti Freeze[span_36](start_span)[span_36](end_span)
        sampev.onTogglePlayerControllable = function() if cfg.anti_freeze[0] then return false end end

        -- Veículo: GodCar e Drift[span_37](start_span)[span_37](end_span)
        if isCharInAnyCar(PLAYER_PED) then
            local veh = storeCarCharIsInNoSave(PLAYER_PED)
            if cfg.godcar[0] then
                setCarProofs(veh, true, true, true, true, true)
                setCarHealth(veh, 1000)
            end
            if cfg.drift_mode[0] and isKeyDown(0xA0) then -- LSHIFT
                setCarCollision(veh, false)
                addToCarRotationVelocity(veh, 0, 0, isKeyDown(0x41) and 0.05 or (isKeyDown(0x44) and -0.05 or 0))
            else
                setCarCollision(veh, true)
            end
            if cfg.fly_car[0] and isKeyDown(0x43) then -- Tecla C
                setCarCollision(veh, false)
            end
        end

        -- Armas: No Reload / Fast Reload[span_38](start_span)[span_38](end_span)
        if cfg.no_reload[0] then
            local weap = getCurrentCharWeapon(PLAYER_PED)
            local nbs = raknetNewBitStream()
            raknetBitStreamWriteInt32(nbs, weap)
            raknetBitStreamWriteInt32(nbs, 0)
            raknetEmulRpcReceiveBitStream(22, nbs)
            raknetDeleteBitStream(nbs)
        end
        if cfg.fast_reload[0] then setPlayerFastReload(PLAYER_HANDLE, true) else setPlayerFastReload(PLAYER_HANDLE, false) end

        -- Troll: Rvanka (Carros Voando)[span_39](start_span)[span_39](end_span)
        if cfg.rvanka[0] then
            for _, veh in pairs(getAllVehicles()) do
                if doesVehicleExist(veh) and veh ~= storeCarCharIsInNoSave(PLAYER_PED) then
                    setCarRotationVelocity(veh, 4, 4, 4)
                    applyForceToCar(veh, 0.2, 0.2, 0.2, 0, 0, 0)
                end
            end
        end

        -- Troll: Auto Kill Perto[span_40](start_span)[span_40](end_span)
        if cfg.auto_kill[0] then
            local closest = -1
            local dist = 100.0
            local mx, my, mz = getCharCoordinates(PLAYER_PED)
            for i = 0, sampGetMaxPlayerId(true) do
                if sampIsPlayerConnected(i) then
                    local res, ped = sampGetCharHandleBySampPlayerId(i)
                    if res and not sampIsPlayerPaused(i) then
                        local px, py, pz = getCharCoordinates(ped)
                        local d = getDistanceBetweenCoords3d(mx, my, mz, px, py, pz)
                        if d < dist then dist = d; closest = i end
                    end
                end
            end
            if closest ~= -1 then
                sampSendGiveDamage(closest, 50, 31, 3)
                wait(500)
            end
        end

        -- ESP Rendering[span_41](start_span)[span_41](end_span)[span_42](start_span)[span_42](end_span)
        if cfg.esp_lines[0] then
            local mx, my, mz = getCharCoordinates(PLAYER_PED)
            for i = 0, 999 do
                local res, handle = sampGetCharHandleBySampPlayerId(i)
                if res and doesCharExist(handle) and isCharOnScreen(handle) then
                    local tx, ty, tz = getCharCoordinates(handle)
                    local sx1, sy1 = convert3DCoordsToScreen(mx, my, mz)
                    local sx2, sy2 = convert3DCoordsToScreen(tx, ty, tz)
                    renderDrawLine(sx1, sy1, sx2, sy2, 1.5, 0xFF00FFFF)
                end
            end
        end
    end
end

-- ==========================================
-- FUNÇÕES AUXILIARES
-- ==========================================
function processPedAirBrake() --[span_43](start_span)[span_43](end_span)[span_44](start_span)[span_44](end_span)
    if not isCharInAnyCar(PLAYER_PED) then
        local x1, y1, z1 = getActiveCameraCoordinates()
        local x, y, z = getActiveCameraPointAt()
        local angle = -math.rad(getHeadingFromVector2d(x - x1, y - y1))
        local cx, cy, cz = getCharCoordinates(PLAYER_PED)
        
        if isKeyDown(0x57) then cx = cx - math.sin(angle)*speed; cy = cy - math.cos(angle)*speed end
        if isKeyDown(0x53) then cx = cx + math.sin(angle)*speed; cy = cy + math.cos(angle)*speed end
        if isKeyDown(0x20) then cz = cz + speed end -- Espaço
        if isKeyDown(0x10) then cz = cz - speed end -- Shift
        
        setCharCoordinatesNoOffset(PLAYER_PED, cx, cy, cz)
        setCharHeading(PLAYER_PED, math.deg(-angle))
    end
end

