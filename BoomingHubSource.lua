local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Boominghub V1 | Beta',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Teleports      = Window:AddTab('Teleports'),
    Combat         = Window:AddTab('Combat'),
    Visuals        = Window:AddTab('Visuals'),
    Misc           = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

-- ══════════════════════════════════════
--             SERVICES
-- ══════════════════════════════════════

local Players      = game:GetService('Players')
local RunService   = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local LocalPlayer  = Players.LocalPlayer
local Camera       = workspace.CurrentCamera

-- ══════════════════════════════════════
--             TELEPORTS TAB
-- ══════════════════════════════════════

local TeleportGroup = Tabs.Teleports:AddLeftGroupbox('Locations')

local function Teleport(x, y, z)
    local character = LocalPlayer.Character
    if character and character:FindFirstChild('HumanoidRootPart') then
        character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
    end
end

TeleportGroup:AddToggle('TeleportLocation1', {
    Text = 'Teleport to M4',
    Default = false,
    Tooltip = 'X: 847.499, Y: 97.85, Z: 2229.396',
    Callback = function(Value)
        if Value then
            Teleport(847.499, 97.85, 2229.396)
            Toggles.TeleportLocation1:SetValue(false)
        end
    end
})

TeleportGroup:AddToggle('TeleportLocation2', {
    Text = 'Teleport to Sniper',
    Default = false,
    Tooltip = 'X: 835.799, Y: 97.85, Z: 2229.396',
    Callback = function(Value)
        if Value then
            Teleport(835.799, 97.85, 2229.396)
            Toggles.TeleportLocation2:SetValue(false)
        end
    end
})

TeleportGroup:AddToggle('TeleportLocation3', {
    Text = 'Teleport to Shotgun',
    Default = false,
    Tooltip = 'X: 820.299, Y: 97.85, Z: 2229.396',
    Callback = function(Value)
        if Value then
            Teleport(820.299, 97.85, 2229.396)
            Toggles.TeleportLocation3:SetValue(false)
        end
    end
})

TeleportGroup:AddToggle('TeleportLocation4', {
    Text = 'Teleport to MP5',
    Default = false,
    Tooltip = 'X: 813.699, Y: 97.85, Z: 2229.396',
    Callback = function(Value)
        if Value then
            Teleport(813.699, 97.85, 2229.396)
            Toggles.TeleportLocation4:SetValue(false)
        end
    end
})

local TeleportGroup2 = Tabs.Teleports:AddRightGroupbox('Car')

TeleportGroup2:AddToggle('TeleportLocation5', {
    Text = 'Teleport to Car Spawner',
    Default = false,
    Tooltip = 'X: 624.044, Y: 100.0, Z: 2494.648',
    Callback = function(Value)
        if Value then
            Teleport(624.044, 100.0, 2494.648)
            Toggles.TeleportLocation5:SetValue(false)
        end
    end
})

local TeleportGroup3 = Tabs.Teleports:AddLeftGroupbox('Criminals')

TeleportGroup3:AddToggle('TeleportLocation6', {
    Text = 'Teleport to Criminal Car',
    Default = false,
    Tooltip = 'X: -909.812, Y: 100, Z: 2164.272',
    Callback = function(Value)
        if Value then
            Teleport(-909.812, 100, 2164.272)
            Toggles.TeleportLocation6:SetValue(false)
        end
    end
})

TeleportGroup3:AddToggle('TeleportLocation7', {
    Text = 'Teleport to Criminal Base',
    Default = false,
    Tooltip = 'X: -975.096, Y: 105.224, Z: 2057.905',
    Callback = function(Value)
        if Value then
            Teleport(-975.096, 105.224, 2057.905)
            Toggles.TeleportLocation7:SetValue(false)
        end
    end
})

TeleportGroup3:AddToggle('TeleportLocation8', {
    Text = 'Teleport to AK47',
    Default = false,
    Tooltip = 'X: -931.793, Y: 91.278, Z: 2039.255',
    Callback = function(Value)
        if Value then
            Teleport(-931.793, 91.278, 2039.255)
            Toggles.TeleportLocation8:SetValue(false)
        end
    end
})

TeleportGroup3:AddToggle('TeleportLocation9', {
    Text = 'Teleport to Shotgun',
    Default = false,
    Tooltip = 'X: -938.993, Y: 91.278, Z: 2039.255',
    Callback = function(Value)
        if Value then
            Teleport(-938.993, 91.278, 2039.255)
            Toggles.TeleportLocation9:SetValue(false)
        end
    end
})

TeleportGroup3:AddToggle('TeleportLocation10', {
    Text = 'Teleport to Sniper',
    Default = false,
    Tooltip = 'X: -920.052, Y: 91.979, Z: 2036.426',
    Callback = function(Value)
        if Value then
            Teleport(-920.052, 91.979, 2036.426)
            Toggles.TeleportLocation10:SetValue(false)
        end
    end
})

TeleportGroup3:AddToggle('TeleportLocation11', {
    Text = 'Teleport to Full Auto',
    Default = false,
    Tooltip = 'X: -902.701, Y: 91.259, Z: 2047.553',
    Callback = function(Value)
        if Value then
            Teleport(-902.701, 91.259, 2047.553)
            Toggles.TeleportLocation11:SetValue(false)
        end
    end
})

-- ══════════════════════════════════════
--              COMBAT TAB
-- ══════════════════════════════════════

local CombatLeft  = Tabs.Combat:AddLeftGroupbox('Aimbot')
local CombatRight = Tabs.Combat:AddRightGroupbox('Other')

-- ── Sticky Cam Lock ──────────────────────────────────────────────
-- Holds a single target once acquired. Only re-acquires when:
--   * the target dies / despawns / leaves FOV / goes off-screen
--   * the key is released (state resets)
--   * the current target has been invalid for longer than the
--     retention window (avoids 1-frame dropouts mid-fight)
local CamLockState = {
    Target    = nil,   -- [Player] currently locked
    LostTimer = 0,     -- seconds target has been invalid
    Retention = 0.35,  -- how long we keep a target through brief invalidity
}

local function IsValidCamLockTarget(player, fovRadius)
    if not player or player == LocalPlayer then return false end
    local char = player.Character
    if not char then return false end
    local humanoid = char:FindFirstChildOfClass('Humanoid')
    if not humanoid or humanoid.Health <= 0 then return false end

    local partName = Options.CamLockPart and Options.CamLockPart.Value or 'Head'
    local part = char:FindFirstChild(partName) or char:FindFirstChild('HumanoidRootPart')
    if not part then return false end

    local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
    if not onScreen or screenPos.Z <= 0 then return false end

    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local dist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
    return dist <= fovRadius, dist
end

-- Find the nearest *valid* target, honoring the current FOV radius
local function FindBestCamLockTarget()
    local fovRadius = (Options.CamLockFOV and Options.CamLockFOV.Value) or 150
    local best, bestDist = nil, math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        local ok, dist = IsValidCamLockTarget(player, fovRadius)
        if ok and dist < bestDist then
            best, bestDist = player, dist
        end
    end
    return best
end

-- Resolve the sticky target for this frame
local function GetStickyCamLockTarget(dt)
    local fovRadius = (Options.CamLockFOV and Options.CamLockFOV.Value) or 150

    -- If we already have a target and it's still valid, keep it.
    if CamLockState.Target then
        local ok = IsValidCamLockTarget(CamLockState.Target, fovRadius)
        if ok then
            CamLockState.LostTimer = 0
            return CamLockState.Target
        end

        -- Target invalid this frame — hold briefly before dropping,
        -- so a fast strafe / one-frame occlusion doesn't cause a switch.
        CamLockState.LostTimer = CamLockState.LostTimer + dt
        if CamLockState.LostTimer < CamLockState.Retention then
            return CamLockState.Target
        end

        -- Retention expired — give up on this target.
        CamLockState.Target = nil
        CamLockState.LostTimer = 0
    end

    -- No (valid) target — acquire a fresh one.
    local newTarget = FindBestCamLockTarget()
    if newTarget then
        CamLockState.Target = newTarget
        CamLockState.LostTimer = 0
    end
    return CamLockState.Target
end

-- Helper: get the target part for a locked player
local function GetCamLockPart(player)
    if not player or not player.Character then return nil end
    local char = player.Character
    local partName = Options.CamLockPart and Options.CamLockPart.Value or 'Head'
    return char:FindFirstChild(partName) or char:FindFirstChild('HumanoidRootPart')
end

-- Cam Lock keybind (hold to activate)
CombatLeft:AddLabel('Cam Lock'):AddKeyPicker('CamLockKey', {
    Default = 'MB2',
    Mode = 'Hold',
    Text = 'Cam Lock',
    Tooltip = 'Hold this key to lock your camera to the nearest player (sticky)',
})

-- Lock sensitivity
CombatLeft:AddSlider('CamLockSmoothing', {
    Text = 'Smoothing',
    Default = 5,
    Min = 1,
    Max = 20,
    Rounding = 1,
    Tooltip = 'Lower = snappier, Higher = smoother',
})

-- FOV radius
CombatLeft:AddSlider('CamLockFOV', {
    Text = 'FOV Radius',
    Default = 150,
    Min = 10,
    Max = 600,
    Rounding = 0,
    Tooltip = 'Screen radius in pixels to detect players',
})

-- Lock part
CombatLeft:AddDropdown('CamLockPart', {
    Text = 'Lock Part',
    Default = 1,
    Values = { 'Head', 'HumanoidRootPart' },
    Tooltip = 'Which part of the body to lock onto',
})

-- Silent Aim
CombatLeft:AddToggle('SilentAim', {
    Text = 'Silent Aim',
    Default = false,
    Tooltip = 'Redirects bullets to the nearest player silently',
})

-- Anti-Aim
CombatRight:AddToggle('AntiAim', {
    Text = 'Anti-Aim (Spin)',
    Default = false,
    Tooltip = 'Spins your character to make you harder to hit',
})

CombatRight:AddSlider('AntiAimSpeed', {
    Text = 'Spin Speed',
    Default = 10,
    Min = 1,
    Max = 50,
    Rounding = 0,
    Tooltip = 'How fast your character spins',
})

-- Auto Jump (panic button style)
CombatRight:AddToggle('BunnyHop', {
    Text = 'Bunny Hop',
    Default = false,
    Tooltip = 'Auto-jumps while holding space',
})

-- Cam Lock logic (sticky)
local wasLocking = false
RunService.RenderStepped:Connect(function(dt)
    local isLocking = Options.CamLockKey and Options.CamLockKey:GetState()

    -- Reset the lock on key release so the next press is a fresh acquire.
    if wasLocking and not isLocking then
        CamLockState.Target = nil
        CamLockState.LostTimer = 0
    end
    wasLocking = isLocking

    if not isLocking then return end

    local target = GetStickyCamLockTarget(dt)
    if not target then return end

    local part = GetCamLockPart(target)
    if not part then return end

    local smoothing = Options.CamLockSmoothing and Options.CamLockSmoothing.Value or 5
    Camera.CFrame = Camera.CFrame:Lerp(
        CFrame.new(Camera.CFrame.Position, part.Position),
        dt * smoothing
    )
end)

-- Silent Aim logic (hooks FindPartOnRayWithIgnoreList)
if Toggles.SilentAim then
    local oldRaycast = workspace.FindPartOnRayWithIgnoreList
    RunService.Heartbeat:Connect(function()
        if not (Toggles.SilentAim and Toggles.SilentAim.Value) then return end
        local target = GetStickyCamLockTarget(0)
        if not target then return end
        -- game-specific hook would go here
    end)
end

-- Anti-Aim spin logic
local antiAimAngle = 0
RunService.Heartbeat:Connect(function(dt)
    if not (Toggles.AntiAim and Toggles.AntiAim.Value) then return end
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild('HumanoidRootPart')
    if not hrp then return end
    local speed = Options.AntiAimSpeed and Options.AntiAimSpeed.Value or 10
    antiAimAngle = (antiAimAngle + speed) % 360
    hrp.CFrame = CFrame.new(hrp.Position) * CFrame.Angles(0, math.rad(antiAimAngle), 0)
end)

-- Bunny Hop logic
UserInputService.JumpRequest:Connect(function()
    if not (Toggles.BunnyHop and Toggles.BunnyHop.Value) then return end
    local char = LocalPlayer.Character
    if char and char:FindFirstChild('Humanoid') then
        char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- ══════════════════════════════════════
--              VISUALS TAB
-- ══════════════════════════════════════

local VisualLeft  = Tabs.Visuals:AddLeftGroupbox('ESP')
local VisualRight = Tabs.Visuals:AddRightGroupbox('Settings')

VisualLeft:AddToggle('BoxESP', {
    Text = 'Box ESP',
    Default = false,
    Tooltip = 'Draws a box around all players',
})

VisualLeft:AddToggle('NameESP', {
    Text = 'Name ESP',
    Default = false,
    Tooltip = 'Shows player names above their heads',
})

VisualLeft:AddToggle('HealthESP', {
    Text = 'Health Bar',
    Default = false,
    Tooltip = 'Shows a health bar next to each player',
})

VisualLeft:AddToggle('DistanceESP', {
    Text = 'Distance ESP',
    Default = false,
    Tooltip = 'Shows how far away each player is',
})

VisualLeft:AddToggle('Tracers', {
    Text = 'Tracers',
    Default = false,
    Tooltip = 'Draws a line from the bottom of the screen to each player',
})

VisualLeft:AddToggle('Chams', {
    Text = 'Chams',
    Default = false,
    Tooltip = 'Highlights players through walls',
})

-- ESP color picker
VisualRight:AddLabel('ESP Color'):AddColorPicker('ESPColor', {
    Default = Color3.fromRGB(255, 0, 0),
    Title = 'ESP Color',
    Callback = function(Value)
        -- color updates handled per-frame below
    end
})

-- Team check toggle
VisualRight:AddToggle('TeamCheck', {
    Text = 'Team Check',
    Default = true,
    Tooltip = 'Skip ESP on teammates',
})

-- Team color toggle
VisualRight:AddToggle('UseTeamColor', {
    Text = 'Use Team Color',
    Default = false,
    Tooltip = 'Colors each player\'s ESP using their Roblox team color',
})

-- FOV circle
VisualRight:AddToggle('ShowFOVCircle', {
    Text = 'Show FOV Circle',
    Default = false,
    Tooltip = 'Draws the cam lock FOV circle on screen',
})

-- ── Drawing objects pool ──────────────────────────────────────────

local ESPPool = {}

local function GetESPColor(player)
    if Toggles.UseTeamColor and Toggles.UseTeamColor.Value then
        if player and player.Team then
            return player.TeamColor.Color
        end
    end
    return Options.ESPColor and Options.ESPColor.Value or Color3.fromRGB(255, 0, 0)
end

local function IsTeammate(player)
    if not (Toggles.TeamCheck and Toggles.TeamCheck.Value) then return false end
    return player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team
end

local function GetOrCreateESP(player)
    if ESPPool[player] then return ESPPool[player] end
    local obj = {
        Box       = Drawing.new('Square'),
        Name      = Drawing.new('Text'),
        HealthBg  = Drawing.new('Square'),
        HealthBar = Drawing.new('Square'),
        Distance  = Drawing.new('Text'),
        Tracer    = Drawing.new('Line'),
        Highlight = Instance.new('Highlight'), -- proper through-wall chams
    }
    obj.Box.Thickness         = 1
    obj.Box.Filled            = false
    obj.Name.Size             = 13
    obj.Name.Center           = true
    obj.Name.Outline          = true
    obj.Name.OutlineColor     = Color3.new(0,0,0)
    obj.HealthBg.Filled       = true
    obj.HealthBg.Color        = Color3.new(0,0,0)
    obj.HealthBar.Filled      = true
    obj.Distance.Size         = 11
    obj.Distance.Center       = true
    obj.Distance.Outline      = true
    obj.Distance.OutlineColor = Color3.new(0,0,0)
    obj.Tracer.Thickness      = 1
    -- Highlight defaults
    obj.Highlight.DepthMode          = Enum.HighlightDepthMode.AlwaysOnTop
    obj.Highlight.FillTransparency   = 0.5
    obj.Highlight.OutlineTransparency = 0
    obj.Highlight.Enabled            = false
    obj.Highlight.Parent             = workspace -- parented to workspace until char is ready
    ESPPool[player] = obj
    return obj
end

local function RemoveESP(player)
    if not ESPPool[player] then return end
    local obj = ESPPool[player]
    obj.Box:Remove()
    obj.Name:Remove()
    obj.HealthBg:Remove()
    obj.HealthBar:Remove()
    obj.Distance:Remove()
    obj.Tracer:Remove()
    obj.Highlight:Destroy()
    ESPPool[player] = nil
end

-- FOV circle drawing
local FOVCircle = Drawing.new('Circle')
FOVCircle.Visible   = false
FOVCircle.Thickness = 1
FOVCircle.Color     = Color3.fromRGB(255,255,255)
FOVCircle.NumSides  = 64
FOVCircle.Filled    = false

Players.PlayerRemoving:Connect(RemoveESP)

-- Main ESP render loop
RunService.RenderStepped:Connect(function()
    -- espColor is resolved per-player below
    local anyESP = (Toggles.BoxESP and Toggles.BoxESP.Value)
        or (Toggles.NameESP and Toggles.NameESP.Value)
        or (Toggles.HealthESP and Toggles.HealthESP.Value)
        or (Toggles.DistanceESP and Toggles.DistanceESP.Value)
        or (Toggles.Tracers and Toggles.Tracers.Value)
        or (Toggles.Chams and Toggles.Chams.Value)

    -- FOV circle
    if Toggles.ShowFOVCircle and Toggles.ShowFOVCircle.Value then
        FOVCircle.Visible = true
        FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        FOVCircle.Radius = Options.CamLockFOV and Options.CamLockFOV.Value or 150
    else
        FOVCircle.Visible = false
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        local obj = GetOrCreateESP(player)

        local char = player.Character
        local hrp  = char and char:FindFirstChild('HumanoidRootPart')
        local hum  = char and char:FindFirstChild('Humanoid')

        -- Hide if: no ESP enabled, teammate, dead, or no character
        local isDead = hum and hum.Health <= 0
        if not anyESP or IsTeammate(player) or not hrp or not hum or isDead then
            obj.Box.Visible      = false
            obj.Name.Visible     = false
            obj.HealthBg.Visible = false
            obj.HealthBar.Visible = false
            obj.Distance.Visible = false
            obj.Tracer.Visible   = false
            obj.Highlight.Enabled = false
            continue
        end

        -- Global ESP color (used for box, health, tracers, distance)
        local espColor = Options.ESPColor and Options.ESPColor.Value or Color3.fromRGB(255, 0, 0)
        -- Name-only team color
        local nameColor = (Toggles.UseTeamColor and Toggles.UseTeamColor.Value and player.Team)
            and player.TeamColor.Color
            or espColor

        -- Project top and bottom of the character
        local rootPos   = hrp.Position
        local topPos    = rootPos + Vector3.new(0, 3, 0)
        local bottomPos = rootPos - Vector3.new(0, 3, 0)

        local top    = Camera:WorldToViewportPoint(topPos)
        local bottom = Camera:WorldToViewportPoint(bottomPos)

        -- Z > 0 means the point is in front of the camera; negative Z flips coords
        if top.Z <= 0 then
            obj.Box.Visible       = false
            obj.Name.Visible      = false
            obj.HealthBg.Visible  = false
            obj.HealthBar.Visible = false
            obj.Distance.Visible  = false
            obj.Tracer.Visible    = false
            obj.Highlight.Enabled = (Toggles.Chams and Toggles.Chams.Value) -- chams still show through walls
            if obj.Highlight.Enabled then
                obj.Highlight.Adornee      = char
                obj.Highlight.FillColor    = espColor
                obj.Highlight.OutlineColor = espColor
            end
            continue
        end

        local height = math.abs(top.Y - bottom.Y)
        local width  = height * 0.6
        local x      = top.X - width / 2
        local y      = math.min(top.Y, bottom.Y)

        -- Box ESP
        obj.Box.Visible  = Toggles.BoxESP and Toggles.BoxESP.Value
        obj.Box.Color    = espColor
        obj.Box.Position = Vector2.new(x, y)
        obj.Box.Size     = Vector2.new(width, height)

        -- Name ESP (uses team color if enabled, everything else uses global color)
        obj.Name.Visible   = Toggles.NameESP and Toggles.NameESP.Value
        obj.Name.Color     = nameColor
        obj.Name.Position  = Vector2.new(top.X, y - 16)
        obj.Name.Text      = player.DisplayName

        -- Health Bar
        local hpRatio = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
        local barX    = x - 6
        obj.HealthBg.Visible  = Toggles.HealthESP and Toggles.HealthESP.Value
        obj.HealthBg.Position = Vector2.new(barX - 1, y - 1)
        obj.HealthBg.Size     = Vector2.new(4, height + 2)

        obj.HealthBar.Visible  = Toggles.HealthESP and Toggles.HealthESP.Value
        obj.HealthBar.Color    = Color3.fromRGB(0, 255 * hpRatio, 0)
        obj.HealthBar.Position = Vector2.new(barX, y + height * (1 - hpRatio))
        obj.HealthBar.Size     = Vector2.new(3, height * hpRatio)

        -- Distance ESP
        local dist = (Camera.CFrame.Position - rootPos).Magnitude
        obj.Distance.Visible  = Toggles.DistanceESP and Toggles.DistanceESP.Value
        obj.Distance.Color    = espColor
        obj.Distance.Position = Vector2.new(top.X, y + height + 2)
        obj.Distance.Text     = string.format('[%d]', math.floor(dist))

        -- Tracers
        obj.Tracer.Visible = Toggles.Tracers and Toggles.Tracers.Value
        obj.Tracer.Color   = espColor
        obj.Tracer.From    = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
        obj.Tracer.To      = Vector2.new(top.X, y + height)

        -- Chams (Highlight instance — renders through walls properly)
        if Toggles.Chams and Toggles.Chams.Value then
            obj.Highlight.Adornee          = char
            obj.Highlight.FillColor        = espColor
            obj.Highlight.OutlineColor     = espColor
            obj.Highlight.FillTransparency = 0.5
            obj.Highlight.Enabled          = true
            if obj.Highlight.Parent ~= char then
                obj.Highlight.Parent = char
            end
        else
            obj.Highlight.Enabled = false
        end
    end
end)

-- ══════════════════════════════════════
--               MISC TAB
-- ══════════════════════════════════════

local MiscLeft  = Tabs.Misc:AddLeftGroupbox('Movement')
local MiscRight = Tabs.Misc:AddRightGroupbox('Character')
local MiscDelete = Tabs.Misc:AddRightGroupbox('Part Deletion')

MiscLeft:AddSlider('WalkSpeed', {
    Text = 'Walk Speed',
    Default = 16,
    Min = 0,
    Max = 500,
    Rounding = 0,
    Tooltip = 'Default is 16',
    Callback = function(Value)
        local char = LocalPlayer.Character
        if char and char:FindFirstChild('Humanoid') then
            char.Humanoid.WalkSpeed = Value
        end
    end
})

LocalPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild('Humanoid').WalkSpeed = Options.WalkSpeed.Value
    char:WaitForChild('Humanoid').JumpPower = Options.JumpPower.Value
end)

MiscLeft:AddSlider('JumpPower', {
    Text = 'Jump Power',
    Default = 50,
    Min = 0,
    Max = 500,
    Rounding = 0,
    Tooltip = 'Default is 50',
    Callback = function(Value)
        local char = LocalPlayer.Character
        if char and char:FindFirstChild('Humanoid') then
            char.Humanoid.JumpPower = Value
        end
    end
})

MiscLeft:AddSlider('Gravity', {
    Text = 'Gravity',
    Default = 196,
    Min = 0,
    Max = 500,
    Rounding = 0,
    Tooltip = 'Default is 196',
    Callback = function(Value)
        workspace.Gravity = Value
    end
})

MiscRight:AddToggle('InfiniteJump', {
    Text = 'Infinite Jump',
    Default = false,
    Tooltip = 'Jump as many times as you want',
})

UserInputService.JumpRequest:Connect(function()
    if Toggles.InfiniteJump and Toggles.InfiniteJump.Value then
        local char = LocalPlayer.Character
        if char and char:FindFirstChild('Humanoid') then
            char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

MiscRight:AddToggle('Noclip', {
    Text = 'Noclip',
    Default = false,
    Tooltip = 'Walk through walls',
})

RunService.Stepped:Connect(function()
    if Toggles.Noclip and Toggles.Noclip.Value then
        local char = LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA('BasePart') and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end
end)

MiscRight:AddSlider('FOV', {
    Text = 'Field of View',
    Default = 70,
    Min = 1,
    Max = 120,
    Rounding = 0,
    Tooltip = 'Default is 70',
    Callback = function(Value)
        Camera.FieldOfView = Value
    end
})

MiscRight:AddToggle('ThirdPerson', {
    Text = '3rd Person Mouselock',
    Default = false,
    Tooltip = 'Orbit camera around your character with mouse lock',
})

MiscRight:AddSlider('ThirdPersonDist', {
    Text = 'Camera Distance',
    Default = 10,
    Min = 3,
    Max = 30,
    Rounding = 0,
    Tooltip = 'How far the camera sits behind you',
})

-- 3rd Person logic
local tpYaw, tpPitch = 0, 20

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
    if not (Toggles.ThirdPerson and Toggles.ThirdPerson.Value) then return end
    tpYaw   = tpYaw   - input.Delta.X * 0.4
    tpPitch = math.clamp(tpPitch - input.Delta.Y * 0.4, -75, 75)
end)

RunService.RenderStepped:Connect(function()
    if Toggles.ThirdPerson and Toggles.ThirdPerson.Value then
        local char = LocalPlayer.Character
        local hrp  = char and char:FindFirstChild('HumanoidRootPart')
        if not hrp then return end
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
        Camera.CameraType = Enum.CameraType.Scriptable
        local dist = Options.ThirdPersonDist and Options.ThirdPersonDist.Value or 10
        local origin = hrp.Position + Vector3.new(0, 1.5, 0)
        Camera.CFrame = CFrame.new(origin)
            * CFrame.Angles(0, math.rad(tpYaw), 0)
            * CFrame.Angles(math.rad(tpPitch), 0, 0)
            * CFrame.new(0, 0, dist)
    else
        if Camera.CameraType == Enum.CameraType.Scriptable then
            Camera.CameraType = Enum.CameraType.Custom
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        end
    end
end)

-- ── Part Deletion (Ctrl + MB1) + Restore ─────────────────────────

MiscDelete:AddToggle('DeletePartEnabled', {
    Text = 'Delete Part on Ctrl + MB1',
    Default = false,
    Tooltip = 'Hold Ctrl and left-click a part to delete it',
})

MiscDelete:AddToggle('RestorePartsEnabled', {
    Text = 'Restore Deleted Parts',
    Default = false,
    Tooltip = 'Re-parents all deleted parts back to their original parent',
})

-- Every deletion records the instance plus its original parent so we can
-- put it back later. Parts are kept alive by holding the reference here
-- (Destroy() removes them from the tree, but the Lua object still exists
-- as long as we keep it, so we can re-parent it).
local DeletedParts = {}

local function IsDeletablePart(inst)
    if not inst or not inst:IsA('BasePart') then return false end
    -- Don't let the user nuke their own character or the camera
    if LocalPlayer.Character and inst:IsDescendantOf(LocalPlayer.Character) then return false end
    return true
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    -- gameProcessed is true when the click is being used by the UI / typing in chat.
    -- We still want deletion to work over the game world, so ignore UI-processed only.
    if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
    if not (Toggles.DeletePartEnabled and Toggles.DeletePartEnabled.Value) then return end
    if not UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
        and not UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
        return
    end
    if gameProcessed then return end

    -- Raycast from the camera through the mouse to find what was clicked
    local mousePos = UserInputService:GetMouseLocation()
    local viewportPoint = Vector2.new(mousePos.X, mousePos.Y)
    local ray = Camera:ViewportPointToRay(viewportPoint.X, viewportPoint.Y)

    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = { LocalPlayer.Character or Instance.new('Folder') }
    raycastParams.IgnoreWater = true

    local result = workspace:Raycast(ray.Origin, ray.Direction * 5000, raycastParams)
    if not result then return end

    local hit = result.Instance
    if IsDeletablePart(hit) then
        -- Save the instance + where it lived before we remove it
        table.insert(DeletedParts, {
            Instance = hit,
            Parent   = hit.Parent,
        })
        hit.Parent = nil          -- detach from the world
    end
end)

-- Restore: re-parent everything we've hidden back to its old parent
Toggles.RestorePartsEnabled:OnChanged(function(value)
    if not value then return end
    if #DeletedParts == 0 then
        Toggles.RestorePartsEnabled:SetValue(false)
        return
    end

    for _, record in ipairs(DeletedParts) do
        local inst, parent = record.Instance, record.Parent
        -- Only restore if the original parent still exists in the DataModel
        if inst and parent and parent.Parent ~= nil then
            inst.Parent = parent
        end
    end
    DeletedParts = {}
    Toggles.RestorePartsEnabled:SetValue(false)
end)

-- ══════════════════════════════════════
--             UI SETTINGS TAB
-- ══════════════════════════════════════

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', {
    Default = 'Z',
    NoUI = true,
    Text = 'Menu keybind'
})

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('Boominghub')
SaveManager:SetFolder('Boominghub/game')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
