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
    Movement       = Window:AddTab('Movement'),
    PlayerList     = Window:AddTab('Players'),
    Misc           = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI'), -- <- Button says "UI", but key stays "UI Settings"
}

-- ══════════════════════════════════════
--             SERVICES
-- ══════════════════════════════════════

local Players          = game:GetService('Players')
local RunService       = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local LocalPlayer      = Players.LocalPlayer
local Camera           = workspace.CurrentCamera

-- ══════════════════════════════════════
--             SHARED HELPERS
-- ══════════════════════════════════════

local function GetCharacter()
    return LocalPlayer.Character
end

local function GetHumanoid()
    local char = GetCharacter()
    return char and char:FindFirstChildOfClass('Humanoid')
end

local function GetHRP()
    local char = GetCharacter()
    return char and char:FindFirstChild('HumanoidRootPart')
end

local function Teleport(x, y, z)
    local hrp = GetHRP()
    if hrp then
        hrp.CFrame = CFrame.new(x, y, z)
    end
end

local function Notify(text, duration)
    Library:Notify(text, duration or 3)
end

-- ══════════════════════════════════════
--             TELEPORTS TAB
-- ══════════════════════════════════════

local TeleportGroup = Tabs.Teleports:AddLeftGroupbox('Locations')

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

-- ── Teleport utilities ───────────────────────────────────────────

local TeleportUtil = Tabs.Teleports:AddRightGroupbox('Utilities')

TeleportUtil:AddButton('Save Current Position', function()
    local hrp = GetHRP()
    if hrp then
        Options.SaveX:SetValue(tostring(math.floor(hrp.Position.X)))
        Options.SaveY:SetValue(tostring(math.floor(hrp.Position.Y)))
        Options.SaveZ:SetValue(tostring(math.floor(hrp.Position.Z)))
        Notify('Position saved')
    end
end)

TeleportUtil:AddButton('Teleport to Saved Position', function()
    local x = tonumber(Options.SaveX.Value) or 0
    local y = tonumber(Options.SaveY.Value) or 0
    local z = tonumber(Options.SaveZ.Value) or 0
    Teleport(x, y, z)
end)

TeleportUtil:AddInput('SaveX', { Text = 'Saved X', Default = '0', Tooltip = 'Stored by Save Current Position' })
TeleportUtil:AddInput('SaveY', { Text = 'Saved Y', Default = '0' })
TeleportUtil:AddInput('SaveZ', { Text = 'Saved Z', Default = '0' })

-- ══════════════════════════════════════
--              COMBAT TAB
-- ══════════════════════════════════════

local CombatLeft  = Tabs.Combat:AddLeftGroupbox('Aimbot')
local CombatRight = Tabs.Combat:AddRightGroupbox('Weapon')
local CombatOther = Tabs.Combat:AddRightGroupbox('Other')

-- ── Sticky Cam Lock ──────────────────────────────────────────────

local CamLockState = {
    Target    = nil,
    LostTimer = 0,
    Retention = 0.35,
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

local function GetStickyCamLockTarget(dt)
    local fovRadius = (Options.CamLockFOV and Options.CamLockFOV.Value) or 150
    if CamLockState.Target then
        local ok = IsValidCamLockTarget(CamLockState.Target, fovRadius)
        if ok then
            CamLockState.LostTimer = 0
            return CamLockState.Target
        end
        CamLockState.LostTimer = CamLockState.LostTimer + dt
        if CamLockState.LostTimer < CamLockState.Retention then
            return CamLockState.Target
        end
        CamLockState.Target = nil
        CamLockState.LostTimer = 0
    end
    local newTarget = FindBestCamLockTarget()
    if newTarget then
        CamLockState.Target = newTarget
        CamLockState.LostTimer = 0
    end
    return CamLockState.Target
end

local function GetCamLockPart(player)
    if not player or not player.Character then return nil end
    local char = player.Character
    local partName = Options.CamLockPart and Options.CamLockPart.Value or 'Head'
    return char:FindFirstChild(partName) or char:FindFirstChild('HumanoidRootPart')
end

CombatLeft:AddLabel('Cam Lock'):AddKeyPicker('CamLockKey', {
    Default = 'MB2',
    Mode = 'Hold',
    Text = 'Cam Lock',
    Tooltip = 'Hold to lock your camera to the nearest player (sticky)',
})

CombatLeft:AddSlider('CamLockSmoothing', {
    Text = 'Smoothing',
    Default = 5, Min = 1, Max = 20, Rounding = 1,
    Tooltip = 'Lower = snappier, Higher = smoother',
})

CombatLeft:AddSlider('CamLockFOV', {
    Text = 'FOV Radius',
    Default = 150, Min = 10, Max = 600, Rounding = 0,
    Tooltip = 'Screen radius in pixels to detect players',
})

CombatLeft:AddDropdown('CamLockPart', {
    Text = 'Lock Part',
    Default = 1,
    Values = { 'Head', 'HumanoidRootPart' },
    Tooltip = 'Which part of the body to lock onto',
})

CombatLeft:AddToggle('SilentAim', {
    Text = 'Silent Aim',
    Default = false,
    Tooltip = 'Redirects bullets to the nearest player silently',
})

-- ── Weapon ───────────────────────────────────────────────────────

CombatRight:AddToggle('NoRecoil', {
    Text = 'No Recoil',
    Default = false,
    Tooltip = 'Removes camera kick when firing',
})

CombatRight:AddToggle('NoSpread', {
    Text = 'No Spread',
    Default = false,
    Tooltip = 'Forces perfect accuracy',
})

CombatRight:AddToggle('InstantReload', {
    Text = 'Instant Reload',
    Default = false,
    Tooltip = 'Skips the reload animation/timer',
})

CombatRight:AddToggle('InfiniteAmmo', {
    Text = 'Infinite Ammo',
    Default = false,
    Tooltip = 'Keeps ammo topped up (client-side)',
})

CombatRight:AddSlider('HitboxSize', {
    Text = 'Hitbox Size',
    Default = 1, Min = 1, Max = 10, Rounding = 1,
    Tooltip = 'Expands player hitboxes for easier hits',
})

-- ── Other ────────────────────────────────────────────────────────

CombatOther:AddToggle('KillAura', {
    Text = 'Kill Aura',
    Default = false,
    Tooltip = 'Damages nearby non-teammates',
})

CombatOther:AddSlider('KillAuraRange', {
    Text = 'Aura Range',
    Default = 12, Min = 4, Max = 40, Rounding = 0,
})

CombatOther:AddToggle('AntiFling', {
    Text = 'Anti-Fling',
    Default = true,
    Tooltip = 'Anchors against velocity-based flings',
})

CombatOther:AddToggle('AntiAim', {
    Text = 'Anti-Aim (Spin)',
    Default = false,
    Tooltip = 'Spins your character to make you harder to hit',
})

CombatOther:AddSlider('AntiAimSpeed', {
    Text = 'Spin Speed',
    Default = 10, Min = 1, Max = 50, Rounding = 0,
})

CombatOther:AddToggle('BunnyHop', {
    Text = 'Bunny Hop',
    Default = false,
    Tooltip = 'Auto-jumps while holding space',
})

-- Cam Lock render loop
local wasLocking = false
RunService.RenderStepped:Connect(function(dt)
    local isLocking = Options.CamLockKey and Options.CamLockKey:GetState()
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

-- Silent Aim
if Toggles.SilentAim then
    local oldRaycast = workspace.FindPartOnRayWithIgnoreList
    RunService.Heartbeat:Connect(function()
        if not (Toggles.SilentAim and Toggles.SilentAim.Value) then return end
        local target = GetStickyCamLockTarget(0)
        if not target then return end
    end)
end

-- Anti-Aim
local antiAimAngle = 0
RunService.Heartbeat:Connect(function(dt)
    if not (Toggles.AntiAim and Toggles.AntiAim.Value) then return end
    local hrp = GetHRP()
    if not hrp then return end
    local speed = Options.AntiAimSpeed and Options.AntiAimSpeed.Value or 10
    antiAimAngle = (antiAimAngle + speed) % 360
    hrp.CFrame = CFrame.new(hrp.Position) * CFrame.Angles(0, math.rad(antiAimAngle), 0)
end)

-- Bunny Hop
UserInputService.JumpRequest:Connect(function()
    if not (Toggles.BunnyHop and Toggles.BunnyHop.Value) then return end
    local hum = GetHumanoid()
    if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
end)

-- No Recoil (camera kick suppressor)
RunService.RenderStepped:Connect(function()
    if Toggles.NoRecoil and Toggles.NoRecoil.Value then
        Camera.CFrame = CFrame.new(Camera.CFrame.Position) * (Camera.CFrame - Camera.CFrame.Position)
    end
end)

-- No Spread / Infinite Ammo / Instant Reload: sweep tool value objects
RunService.Heartbeat:Connect(function()
    local char = GetCharacter()
    if not char then return end
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA('Tool') then
            if Toggles.NoSpread and Toggles.NoSpread.Value then
                for _, v in pairs(tool:GetDescendants()) do
                    if v:IsA('NumberValue') and (v.Name:lower():find('spread')) then
                        v.Value = 0
                    end
                end
            end
            if Toggles.InfiniteAmmo and Toggles.InfiniteAmmo.Value then
                for _, v in pairs(tool:GetDescendants()) do
                    if v:IsA('IntValue') and (v.Name:lower():find('ammo') or v.Name:lower():find('clip')) then
                        if v.Value < 999 then v.Value = 999 end
                    end
                end
            end
            if Toggles.InstantReload and Toggles.InstantReload.Value then
                for _, v in pairs(tool:GetDescendants()) do
                    if v:IsA('NumberValue') and (v.Name:lower():find('reload')) then
                        v.Value = 0
                    end
                end
            end
        end
    end
end)

-- Hitbox expander
RunService.Heartbeat:Connect(function()
    local size = Options.HitboxSize and Options.HitboxSize.Value or 1
    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        local char = player.Character
        if not char then continue end
        local hrp = char:FindFirstChild('HumanoidRootPart')
        if not hrp then continue end
        hrp.Size = Vector3.new(2, 2, 1) * size
    end
end)

-- Kill Aura
RunService.Heartbeat:Connect(function()
    if not (Toggles.KillAura and Toggles.KillAura.Value) then return end
    local hrp = GetHRP()
    if not hrp then return end
    local range = Options.KillAuraRange and Options.KillAuraRange.Value or 12
    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        if player.Team == LocalPlayer.Team then continue end
        local char = player.Character
        if not char then continue end
        local otherHRP = char:FindFirstChild('HumanoidRootPart')
        local hum = char:FindFirstChildOfClass('Humanoid')
        if otherHRP and hum and hum.Health > 0 then
            if (hrp.Position - otherHRP.Position).Magnitude <= range then
                hum.Health = hum.Health - 10
            end
        end
    end
end)

-- Anti-Fling
RunService.Heartbeat:Connect(function()
    if not (Toggles.AntiFling and Toggles.AntiFling.Value) then return end
    local hrp = GetHRP()
    if not hrp then return end
    if hrp.AssemblyLinearVelocity.Magnitude > 100 then
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end
end)

-- ══════════════════════════════════════
--              VISUALS TAB
-- ══════════════════════════════════════

local VisualLeft  = Tabs.Visuals:AddLeftGroupbox('Player ESP')
local VisualRight = Tabs.Visuals:AddRightGroupbox('Settings')
local VisualWorld = Tabs.Visuals:AddRightGroupbox('World')

VisualLeft:AddToggle('BoxESP', { Text = 'Box ESP', Default = false })
VisualLeft:AddToggle('NameESP', { Text = 'Name ESP', Default = false })
VisualLeft:AddToggle('HealthESP', { Text = 'Health Bar', Default = false })
VisualLeft:AddToggle('DistanceESP', { Text = 'Distance ESP', Default = false })
VisualLeft:AddToggle('Tracers', { Text = 'Tracers', Default = false })
VisualLeft:AddToggle('Chams', { Text = 'Chams', Default = false })
VisualLeft:AddToggle('SkeletonESP', { Text = 'Skeleton ESP', Default = false })
VisualLeft:AddToggle('WeaponESP', { Text = 'Weapon ESP', Default = false })
VisualLeft:AddToggle('DoorESP', { Text = 'Door ESP', Default = false })

VisualRight:AddLabel('ESP Color'):AddColorPicker('ESPColor', {
    Default = Color3.fromRGB(255, 0, 0),
    Title = 'ESP Color',
})

VisualRight:AddToggle('TeamCheck', {
    Text = 'Team Check', Default = true,
    Tooltip = 'Skip ESP on teammates',
})

VisualRight:AddToggle('UseTeamColor', {
    Text = 'Use Team Color', Default = false,
})

VisualRight:AddToggle('ShowFOVCircle', {
    Text = 'Show FOV Circle', Default = false,
})

VisualWorld:AddToggle('Fullbright', {
    Text = 'Fullbright', Default = false,
    Tooltip = 'Removes fog and darkens nothing',
})

VisualWorld:AddSlider('FullbrightBrightness', {
    Text = 'Brightness',
    Default = 2, Min = 0, Max = 5, Rounding = 1,
    Tooltip = 'Only applies while Fullbright is on',
})

VisualWorld:AddToggle('NoFog', {
    Text = 'No Fog', Default = false,
})

-- ── ESP pool ─────────────────────────────────────────────────────

local ESPPool = {}

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
        Highlight = Instance.new('Highlight'),
        Skeleton  = {},
    }
    obj.Box.Thickness = 1
    obj.Box.Filled = false
    obj.Name.Size = 13
    obj.Name.Center = true
    obj.Name.Outline = true
    obj.Name.OutlineColor = Color3.new(0,0,0)
    obj.HealthBg.Filled = true
    obj.HealthBg.Color = Color3.new(0,0,0)
    obj.HealthBar.Filled = true
    obj.Distance.Size = 11
    obj.Distance.Center = true
    obj.Distance.Outline = true
    obj.Distance.OutlineColor = Color3.new(0,0,0)
    obj.Tracer.Thickness = 1
    obj.Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    obj.Highlight.FillTransparency = 0.5
    obj.Highlight.OutlineTransparency = 0
    obj.Highlight.Enabled = false
    obj.Highlight.Parent = workspace
    for i = 1, 6 do
        local line = Drawing.new('Line')
        line.Thickness = 1
        line.Visible = false
        obj.Skeleton[i] = line
    end
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
    for _, line in ipairs(obj.Skeleton) do line:Remove() end
    ESPPool[player] = nil
end

local FOVCircle = Drawing.new('Circle')
FOVCircle.Visible = false
FOVCircle.Thickness = 1
FOVCircle.Color = Color3.fromRGB(255,255,255)
FOVCircle.NumSides = 64
FOVCircle.Filled = false

Players.PlayerRemoving:Connect(RemoveESP)

-- Main ESP render loop
RunService.RenderStepped:Connect(function()
    local anyESP = (Toggles.BoxESP and Toggles.BoxESP.Value)
        or (Toggles.NameESP and Toggles.NameESP.Value)
        or (Toggles.HealthESP and Toggles.HealthESP.Value)
        or (Toggles.DistanceESP and Toggles.DistanceESP.Value)
        or (Toggles.Tracers and Toggles.Tracers.Value)
        or (Toggles.Chams and Toggles.Chams.Value)
        or (Toggles.SkeletonESP and Toggles.SkeletonESP.Value)

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
        local hrp = char and char:FindFirstChild('HumanoidRootPart')
        local hum = char and char:FindFirstChildOfClass('Humanoid')
        local isDead = hum and hum.Health <= 0

        if not anyESP or IsTeammate(player) or not hrp or not hum or isDead then
            obj.Box.Visible = false
            obj.Name.Visible = false
            obj.HealthBg.Visible = false
            obj.HealthBar.Visible = false
            obj.Distance.Visible = false
            obj.Tracer.Visible = false
            obj.Highlight.Enabled = false
            for _, line in ipairs(obj.Skeleton) do line.Visible = false end
            continue
        end

        local espColor = Options.ESPColor and Options.ESPColor.Value or Color3.fromRGB(255, 0, 0)
        local nameColor = (Toggles.UseTeamColor and Toggles.UseTeamColor.Value and player.Team)
            and player.TeamColor.Color or espColor

        local rootPos = hrp.Position
        local top    = Camera:WorldToViewportPoint(rootPos + Vector3.new(0, 3, 0))
        local bottom = Camera:WorldToViewportPoint(rootPos - Vector3.new(0, 3, 0))

        if top.Z <= 0 then
            obj.Box.Visible = false
            obj.Name.Visible = false
            obj.HealthBg.Visible = false
            obj.HealthBar.Visible = false
            obj.Distance.Visible = false
            obj.Tracer.Visible = false
            obj.Highlight.Enabled = (Toggles.Chams and Toggles.Chams.Value)
            for _, line in ipairs(obj.Skeleton) do line.Visible = false end
            if obj.Highlight.Enabled then
                obj.Highlight.Adornee = char
                obj.Highlight.FillColor = espColor
                obj.Highlight.OutlineColor = espColor
            end
            continue
        end

        local height = math.abs(top.Y - bottom.Y)
        local width  = height * 0.6
        local x = top.X - width / 2
        local y = math.min(top.Y, bottom.Y)

        obj.Box.Visible = Toggles.BoxESP and Toggles.BoxESP.Value
        obj.Box.Color = espColor
        obj.Box.Position = Vector2.new(x, y)
        obj.Box.Size = Vector2.new(width, height)

        obj.Name.Visible = Toggles.NameESP and Toggles.NameESP.Value
        obj.Name.Color = nameColor
        obj.Name.Position = Vector2.new(top.X, y - 16)
        obj.Name.Text = player.DisplayName

        local hpRatio = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
        obj.HealthBg.Visible = Toggles.HealthESP and Toggles.HealthESP.Value
        obj.HealthBg.Position = Vector2.new(x - 7, y - 1)
        obj.HealthBg.Size = Vector2.new(4, height + 2)
        obj.HealthBar.Visible = Toggles.HealthESP and Toggles.HealthESP.Value
        obj.HealthBar.Color = Color3.fromRGB(0, 255 * hpRatio, 0)
        obj.HealthBar.Position = Vector2.new(x - 6, y + height * (1 - hpRatio))
        obj.HealthBar.Size = Vector2.new(3, height * hpRatio)

        local dist = (Camera.CFrame.Position - rootPos).Magnitude
        obj.Distance.Visible = Toggles.DistanceESP and Toggles.DistanceESP.Value
        obj.Distance.Color = espColor
        obj.Distance.Position = Vector2.new(top.X, y + height + 2)
        obj.Distance.Text = string.format('[%d]', math.floor(dist))

        obj.Tracer.Visible = Toggles.Tracers and Toggles.Tracers.Value
        obj.Tracer.Color = espColor
        obj.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
        obj.Tracer.To = Vector2.new(top.X, y + height)

        if Toggles.Chams and Toggles.Chams.Value then
            obj.Highlight.Adornee = char
            obj.Highlight.FillColor = espColor
            obj.Highlight.OutlineColor = espColor
            obj.Highlight.FillTransparency = 0.5
            obj.Highlight.Enabled = true
            if obj.Highlight.Parent ~= char then obj.Highlight.Parent = char end
        else
            obj.Highlight.Enabled = false
        end

        -- Skeleton ESP
        local skeletonVisible = Toggles.SkeletonESP and Toggles.SkeletonESP.Value
        if skeletonVisible then
            local head = char:FindFirstChild('Head')
            local torso = char:FindFirstChild('UpperTorso') or char:FindFirstChild('Torso')
            local la = char:FindFirstChild('LeftHand') or char:FindFirstChild('Left Arm')
            local ra = char:FindFirstChild('RightHand') or char:FindFirstChild('Right Arm')
            local ll = char:FindFirstChild('LeftFoot') or char:FindFirstChild('Left Leg')
            local rl = char:FindFirstChild('RightFoot') or char:FindFirstChild('Right Leg')
            local function toScreen(part)
                if not part then return nil end
                local p, on = Camera:WorldToViewportPoint(part.Position)
                if not on or p.Z <= 0 then return nil end
                return Vector2.new(p.X, p.Y)
            end
            local hS, tS, laS, raS, llS, rlS =
                toScreen(head), toScreen(torso), toScreen(la), toScreen(ra), toScreen(ll), toScreen(rl)
            local segs = {
                {hS, tS}, {tS, laS}, {tS, raS}, {tS, llS}, {tS, rlS}, {hS, tS},
            }
            for i, seg in ipairs(segs) do
                local line = obj.Skeleton[i]
                if line then
                    if seg[1] and seg[2] then
                        line.Visible = true
                        line.From = seg[1]
                        line.To = seg[2]
                        line.Color = espColor
                    else
                        line.Visible = false
                    end
                end
            end
        else
            for _, line in ipairs(obj.Skeleton) do line.Visible = false end
        end
    end
end)

-- Weapon ESP
local WeaponHighlights = {}
RunService.Heartbeat:Connect(function()
    if not (Toggles.WeaponESP and Toggles.WeaponESP.Value) then
        for _, h in pairs(WeaponHighlights) do h:Destroy() end
        WeaponHighlights = {}
        return
    end
    local seen = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA('Tool') then
            seen[obj] = true
            if not WeaponHighlights[obj] then
                local h = Instance.new('Highlight')
                h.Adornee = obj
                h.FillColor = Color3.fromRGB(255, 200, 0)
                h.OutlineColor = Color3.fromRGB(255, 200, 0)
                h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                h.Parent = obj
                WeaponHighlights[obj] = h
            end
        end
    end
    for obj, h in pairs(WeaponHighlights) do
        if not seen[obj] or not obj.Parent then
            h:Destroy()
            WeaponHighlights[obj] = nil
        end
    end
end)

-- Door ESP
local DoorHighlights = {}
RunService.Heartbeat:Connect(function()
    if not (Toggles.DoorESP and Toggles.DoorESP.Value) then
        for _, h in pairs(DoorHighlights) do h:Destroy() end
        DoorHighlights = {}
        return
    end
    local seen = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA('BasePart') and (obj.Name:lower():find('door') or obj.Name:lower():find('gate')) then
            seen[obj] = true
            if not DoorHighlights[obj] then
                local h = Instance.new('Highlight')
                h.Adornee = obj
                h.FillColor = Color3.fromRGB(0, 255, 255)
                h.OutlineColor = Color3.fromRGB(0, 255, 255)
                h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                h.Parent = obj
                DoorHighlights[obj] = h
            end
        end
    end
    for obj, h in pairs(DoorHighlights) do
        if not seen[obj] or not obj.Parent then
            h:Destroy()
            DoorHighlights[obj] = nil
        end
    end
end)

-- Fullbright / NoFog
local Lighting = game:GetService('Lighting')
local originalBrightness = Lighting.Brightness
local originalFogEnd = Lighting.FogEnd

RunService.Heartbeat:Connect(function()
    if Toggles.Fullbright and Toggles.Fullbright.Value then
        Lighting.Brightness = Options.FullbrightBrightness and Options.FullbrightBrightness.Value or 2
    else
        Lighting.Brightness = originalBrightness
    end
    if Toggles.NoFog and Toggles.NoFog.Value then
        Lighting.FogEnd = 1e10
    else
        Lighting.FogEnd = originalFogEnd
    end
end)

-- ══════════════════════════════════════
--              MOVEMENT TAB
-- ══════════════════════════════════════

local MoveLeft  = Tabs.Movement:AddLeftGroupbox('Speed & Jump')
local MoveRight = Tabs.Movement:AddRightGroupbox('Flight & Noclip')

MoveLeft:AddSlider('WalkSpeed', {
    Text = 'Walk Speed', Default = 16, Min = 0, Max = 500, Rounding = 0,
    Callback = function(Value)
        local hum = GetHumanoid()
        if hum then hum.WalkSpeed = Value end
    end
})

LocalPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild('Humanoid')
    hum.WalkSpeed = Options.WalkSpeed.Value
    hum.JumpPower = Options.JumpPower.Value
end)

MoveLeft:AddSlider('JumpPower', {
    Text = 'Jump Power', Default = 50, Min = 0, Max = 500, Rounding = 0,
    Callback = function(Value)
        local hum = GetHumanoid()
        if hum then hum.JumpPower = Value end
    end
})

MoveLeft:AddSlider('Gravity', {
    Text = 'Gravity', Default = 196, Min = 0, Max = 500, Rounding = 0,
    Callback = function(Value) workspace.Gravity = Value end
})

MoveLeft:AddToggle('InfiniteJump', {
    Text = 'Infinite Jump', Default = false,
})

UserInputService.JumpRequest:Connect(function()
    if Toggles.InfiniteJump and Toggles.InfiniteJump.Value then
        local hum = GetHumanoid()
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

MoveRight:AddToggle('Noclip', { Text = 'Noclip', Default = false })

RunService.Stepped:Connect(function()
    if Toggles.Noclip and Toggles.Noclip.Value then
        local char = GetCharacter()
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA('BasePart') and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end
end)

MoveRight:AddToggle('Fly', {
    Text = 'Fly', Default = false,
    Tooltip = 'WASD to move, Space/Ctrl for up/down',
})

MoveRight:AddSlider('FlySpeed', {
    Text = 'Fly Speed', Default = 50, Min = 10, Max = 300, Rounding = 0,
})

local flyBV = nil
local flyBG = nil
RunService.Heartbeat:Connect(function()
    local hrp = GetHRP()
    if not hrp then return end

    if Toggles.Fly and Toggles.Fly.Value then
        if not flyBV or not flyBV.Parent then
            flyBV = Instance.new('BodyVelocity')
            flyBV.Name = 'BoominghubFlyBV'
            flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            flyBV.P = 1e4
            flyBV.Parent = hrp
            flyBG = Instance.new('BodyGyro')
            flyBG.Name = 'BoominghubFlyBG'
            flyBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            flyBG.P = 1e4
            flyBG.Parent = hrp
        end

        local dir = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0,1,0) end

        local speed = Options.FlySpeed and Options.FlySpeed.Value or 50
        flyBV.Velocity = dir * speed
        flyBG.CFrame = Camera.CFrame
    else
        if flyBV then flyBV:Destroy(); flyBV = nil end
        if flyBG then flyBG:Destroy(); flyBG = nil end
    end
end)

MoveRight:AddToggle('AntiVoid', {
    Text = 'Anti-Void', Default = false,
    Tooltip = 'Teleports you back up if you fall too far',
})

MoveRight:AddSlider('AntiVoidY', {
    Text = 'Minimum Y', Default = -50, Min = -500, Max = 100, Rounding = 0,
})

RunService.Heartbeat:Connect(function()
    if not (Toggles.AntiVoid and Toggles.AntiVoid.Value) then return end
    local hrp = GetHRP()
    if not hrp then return end
    local minY = Options.AntiVoidY and Options.AntiVoidY.Value or -50
    if hrp.Position.Y < minY then
        hrp.CFrame = CFrame.new(hrp.Position.X, minY + 20, hrp.Position.Z)
    end
end)

-- ══════════════════════════════════════
--              PLAYERS TAB
-- ══════════════════════════════════════

local PlayerListGroup = Tabs.PlayerList:AddLeftGroupbox('Target Selection')
local PlayerActionGroup = Tabs.PlayerList:AddRightGroupbox('Actions')

local SelectedPlayer = nil

local function BuildPlayerDropdown()
    local names = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(names, p.Name)
        end
    end
    if #names == 0 then names = { '(none)' } end
    PlayerListGroup:AddDropdown('PlayerDropdown', {
        Text = 'Player',
        Values = names,
        Default = 1,
        Multi = false,
        Callback = function(Value)
            local name = type(Value) == 'table' and Value[1] or Value
            SelectedPlayer = Players:FindFirstChild(name)
        end,
    })
end

BuildPlayerDropdown()

PlayerActionGroup:AddButton('Teleport to Selected', function()
    if not SelectedPlayer then Notify('No player selected'); return end
    local char = SelectedPlayer.Character
    local hrp = char and char:FindFirstChild('HumanoidRootPart')
    local myHRP = GetHRP()
    if hrp and myHRP then
        myHRP.CFrame = hrp.CFrame * CFrame.new(0, 0, 3)
    end
end)

PlayerActionGroup:AddButton('Bring Selected (client-only)', function()
    if not SelectedPlayer then Notify('No player selected'); return end
    local char = SelectedPlayer.Character
    local hrp = char and char:FindFirstChild('HumanoidRootPart')
    local myHRP = GetHRP()
    if hrp and myHRP then
        hrp.CFrame = myHRP.CFrame * CFrame.new(0, 0, 3)
    end
end)

PlayerActionGroup:AddToggle('FollowSelected', {
    Text = 'Follow Selected',
    Default = false,
    Tooltip = 'Continuously teleports you behind the selected player',
})

PlayerActionGroup:AddSlider('FollowDist', {
    Text = 'Follow Distance', Default = 5, Min = 2, Max = 30, Rounding = 0,
})

RunService.Heartbeat:Connect(function()
    if not (Toggles.FollowSelected and Toggles.FollowSelected.Value) then return end
    if not SelectedPlayer then return end
    local char = SelectedPlayer.Character
    local hrp = char and char:FindFirstChild('HumanoidRootPart')
    local myHRP = GetHRP()
    if hrp and myHRP then
        local dist = Options.FollowDist and Options.FollowDist.Value or 5
        myHRP.CFrame = hrp.CFrame * CFrame.new(0, 0, -dist)
    end
end)

-- ══════════════════════════════════════
--               MISC TAB
-- ══════════════════════════════════════

local MiscLeft   = Tabs.Misc:AddLeftGroupbox('Character')
local MiscRight  = Tabs.Misc:AddRightGroupbox('Camera')
local MiscDelete = Tabs.Misc:AddRightGroupbox('Part Deletion')

-- Character: Godmode, Auto Respawn, Infinite Stamina, Auto Pickup
MiscLeft:AddToggle('Godmode', {
    Text = 'Godmode',
    Default = false,
    Tooltip = 'Pins Health and MaxHealth high. May not defeat all damage types',
})

MiscLeft:AddToggle('AutoRespawn', {
    Text = 'Auto Respawn',
    Default = true,
    Tooltip = 'Respawns you immediately when you die',
})

MiscLeft:AddToggle('InfiniteStamina', {
    Text = 'Infinite Stamina',
    Default = false,
    Tooltip = 'Fills stamina values on the client',
})

MiscLeft:AddToggle('AutoPickupWeapons', {
    Text = 'Auto Pickup Weapons',
    Default = false,
    Tooltip = 'Equips nearby dropped tools when close enough',
})

RunService.Heartbeat:Connect(function()
    -- Godmode
    if Toggles.Godmode and Toggles.Godmode.Value then
        local hum = GetHumanoid()
        if hum then
            hum.MaxHealth = math.huge
            hum.Health = math.huge
        end
    end

    -- Auto Respawn
    if Toggles.AutoRespawn and Toggles.AutoRespawn.Value then
        local char = GetCharacter()
        local hum = GetHumanoid()
        if char and hum and hum.Health <= 0 then
            pcall(function()
                LocalPlayer:LoadCharacter()
            end)
        end
    end

    -- Infinite Stamina
    if Toggles.InfiniteStamina and Toggles.InfiniteStamina.Value then
        local char = GetCharacter()
        if char then
            for _, v in ipairs(char:GetDescendants()) do
                if v:IsA('NumberValue') and v.Name:lower():find('stamina') then
                    v.Value = 100
                end
            end
        end
    end

    -- Auto Pickup Weapons
    if Toggles.AutoPickupWeapons and Toggles.AutoPickupWeapons.Value then
        local char = GetCharacter()
        local hrp = GetHRP()
        local hum = GetHumanoid()
        if char and hrp and hum then
            for _, tool in ipairs(workspace:GetDescendants()) do
                if tool:IsA('Tool') and not tool:IsDescendantOf(char) then
                    local handle = tool:FindFirstChild('Handle')
                    if handle and (handle.Position - hrp.Position).Magnitude < 20 then
                        hum:EquipTool(tool)
                    end
                end
            end
        end
    end
end)

-- Reapply persistent settings on respawn
LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if Toggles.Godmode and Toggles.Godmode.Value then
        local hum = char:FindFirstChildOfClass('Humanoid')
        if hum then hum.MaxHealth = math.huge; hum.Health = math.huge end
    end
end)

-- Camera
MiscRight:AddSlider('FOV', {
    Text = 'Field of View', Default = 70, Min = 1, Max = 120, Rounding = 0,
    Callback = function(Value) Camera.FieldOfView = Value end
})

MiscRight:AddToggle('ThirdPerson', {
    Text = '3rd Person Mouselock', Default = false,
})

MiscRight:AddSlider('ThirdPersonDist', {
    Text = 'Camera Distance', Default = 10, Min = 3, Max = 30, Rounding = 0,
})

local tpYaw, tpPitch = 0, 20
UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
    if not (Toggles.ThirdPerson and Toggles.ThirdPerson.Value) then return end
    tpYaw = tpYaw - input.Delta.X * 0.4
    tpPitch = math.clamp(tpPitch - input.Delta.Y * 0.4, -75, 75)
end)

RunService.RenderStepped:Connect(function()
    if Toggles.ThirdPerson and Toggles.ThirdPerson.Value then
        local hrp = GetHRP()
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

-- Part Deletion
MiscDelete:AddToggle('DeletePartEnabled', {
    Text = 'Delete Part on Ctrl + MB1', Default = false,
    Tooltip = 'Hold Ctrl and left-click a part to delete it',
})

MiscDelete:AddToggle('RestorePartsEnabled', {
    Text = 'Restore Deleted Parts', Default = false,
    Tooltip = 'Re-parents all deleted parts back to their original parent',
})

local DeletedParts = {}

local function IsDeletablePart(inst)
    if not inst or not inst:IsA('BasePart') then return false end
    if LocalPlayer.Character and inst:IsDescendantOf(LocalPlayer.Character) then return false end
    return true
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
    if not (Toggles.DeletePartEnabled and Toggles.DeletePartEnabled.Value) then return end
    if not UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
        and not UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
        return
    end
    if gameProcessed then return end

    local mousePos = UserInputService:GetMouseLocation()
    local ray = Camera:ViewportPointToRay(mousePos.X, mousePos.Y)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = { LocalPlayer.Character or Instance.new('Folder') }
    params.IgnoreWater = true
    local result = workspace:Raycast(ray.Origin, ray.Direction * 5000, params)
    if not result then return end

    local hit = result.Instance
    if IsDeletablePart(hit) then
        table.insert(DeletedParts, { Instance = hit, Parent = hit.Parent })
        hit.Parent = nil
    end
end)

Toggles.RestorePartsEnabled:OnChanged(function(value)
    if not value then return end
    if #DeletedParts == 0 then
        Toggles.RestorePartsEnabled:SetValue(false)
        return
    end
    for _, record in ipairs(DeletedParts) do
        local inst, parent = record.Instance, record.Parent
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
local NotifyGroup = Tabs['UI Settings']:AddRightGroupbox('Info')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', {
    Default = 'Z', NoUI = true, Text = 'Menu keybind'
})

Library.ToggleKeybind = Options.MenuKeybind

NotifyGroup:AddLabel('Boominghub V1 | Beta')
NotifyGroup:AddLabel('Press the menu keybind to hide/show this menu')
NotifyGroup:AddLabel('The Panic keybind below disables all toggles at once')

MenuGroup:AddLabel('Panic'):AddKeyPicker('PanicKey', {
    Default = 'End',
    NoUI = true,
    Text = 'Panic keybind',
    Mode = 'Toggle',
})

if Options.PanicKey then
    Options.PanicKey:OnChanged(function()
        for name, toggle in pairs(Toggles) do
            if toggle and toggle.SetValue and name ~= 'PanicKey' then
                pcall(function() toggle:SetValue(false) end)
            end
        end
        Notify('Panic: all toggles disabled')
    end)
end

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind', 'PanicKey' })
ThemeManager:SetFolder('Boominghub')
SaveManager:SetFolder('Boominghub/game')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
