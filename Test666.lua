local GameId = 131073412590872
local player = game.Players.LocalPlayer

if game.PlaceId ~= GameId then
    player:Kick("pls join Omini-X Definitive")
    return
end

local Config = {
    Language = "pt",
    Languages = {}
}

local function AddLanguage(id, data)
    Config.Languages[id] = data
end

local function T(key)
    local lang = Config.Languages[Config.Language]
    if lang and lang[key] then
        return lang[key]
    end
    return key
end

AddLanguage("pt", {
    title = "Box Omini : Omini-X Definitive",
    subtitle = "Por MTS13GAMER",
    warning_title = "Aviso",
    warning_content = "Script em Beta",
    main_tab = "Main",
    home_tab = "Início",
    aliens_tab = "Aliens",
    teleports_tab = "Teleportes",
    config_tab = "Configurações",
    discord_title = "ミ★ BoxBush ★ 彡",
    discord_desc = "Participe da nossa comunidade no Discord!",
    info_section = "Informações",
    aliens_section = "Transformações",
    teleports_section = "Locais",
    config_section = "Idioma",
    executor = "Executor",
    not_identified = "Executor não identificado",
    select_alien = "Selecionar Alien",
    select_option = "Selecione",
    select_language = "Selecionar Idioma",
    tp_raid1 = "Raid 1",
    tp_omnitrix = "Omnitrix",
    portuguese = "Português",
    english = "English"
})

AddLanguage("en", {
    title = "Box Omini : Omini-X Definitive",
    subtitle = "By MTS13GAMER",
    warning_title = "Warning",
    warning_content = "Beta Script",
    main_tab = "Main",
    home_tab = "Home",
    aliens_tab = "Aliens",
    teleports_tab = "Teleports",
    config_tab = "Settings",
    discord_title = "ミ★ BoxBush ★ 彡",
    discord_desc = "Join our Discord community!",
    info_section = "Information",
    aliens_section = "Transformations",
    teleports_section = "Locations",
    config_section = "Language",
    executor = "Executor",
    not_identified = "Executor not identified",
    select_alien = "Select Alien",
    select_option = "Select",
    select_language = "Select Language",
    tp_raid1 = "Raid 1",
    tp_omnitrix = "Omnitrix",
    portuguese = "Português",
    english = "English"
})

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau"))()

local Window = Library:MakeWindow({
    Title = T("title"),
    SubTitle = T("subtitle"),
    ScriptFolder = "OmniBox"
})

local Minimizer = Window:NewMinimizer({
    KeyCode = Enum.KeyCode.LeftControl
})

local MobileButton = Minimizer:CreateMobileMinimizer({
    Image = "rbxassetid://17775975336",
    BackgroundColor3 = Color3.fromRGB(242, 243, 243),
    BackgroundTransparency = 1
})

Window:Notify({
    Title = T("warning_title"),
    Content = T("warning_content"),
    Image = "rbxassetid://17775975336",
    Duration = 6
})

local MainTab = Window:MakeTab({
    Title = T("main_tab"),
    Icon = "Home"
})

local AliensTab = Window:MakeTab({
    Title = T("aliens_tab"),
    Icon = "Flame"
})

local TeleportsTab = Window:MakeTab({
    Title = T("teleports_tab"),
    Icon = "MapPin"
})

local ConfigTab = Window:MakeTab({
    Title = T("config_tab"),
    Icon = "Settings"
})

local executor = T("not_identified")
pcall(function()
    if identifyexecutor then
        executor = identifyexecutor()
    elseif getexecutorname then
        executor = getexecutorname()
    end
end)

MainTab:AddDiscordInvite({
    Title = T("discord_title"),
    Description = T("discord_desc"),
    Banner = Color3.fromRGB(233, 37, 69),
    Logo = "rbxassetid://140487255563212",
    Invite = "https://discord.gg/kdeBBmWeGt"
})

MainTab:AddSection(T("info_section"))

MainTab:AddParagraph(T("executor"), executor)

AliensTab:AddSection(T("aliens_section"))

AliensTab:AddDropdown({
    Name = T("select_alien"),
    MultiSelect = false,
    Options = {
        T("select_option"),
        "HeatBlast",
        "Wildmutt",
        "Diamond",
        "XLR8",
        "Upgrade",
        "FourArms",
        "GreyMatter",
        "Ripjaws",
        "Stinkfly",
        "Ghostfreak"
    },
    Default = T("select_option"),
    Callback = function(Value)
        if Value == T("select_option") then
            return
        end
        
        local alien = string.lower(Value)
        game:GetService("ReplicatedStorage")
            :WaitForChild("RemoteFunctions")
            :WaitForChild("Character")
            :WaitForChild("Morph")
            :WaitForChild("AlienMorph")
            :InvokeServer(alien, 0.3)
    end
})

local noclipConnection

local function EnableNoclip()
    if noclipConnection then return end
    
    noclipConnection = game:GetService("RunService").Stepped:Connect(function()
        local character = player.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end

local function DisableNoclip()
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    
    local character = player.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.CanCollide = true
            end
        end
    end
end

local function TeleportTo(position)
    local character = player.Character
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.PlatformStand = true
    end
    
    EnableNoclip()
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVelocity.Parent = humanoidRootPart
    
    local targetPosition = position + Vector3.new(0, 10, 0)
    
    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        local distance = (targetPosition - humanoidRootPart.Position).Magnitude
        
        if distance < 5 then
            bodyVelocity:Destroy()
            if humanoid then
                humanoid.PlatformStand = false
            end
            DisableNoclip()
            connection:Disconnect()
        else
            local direction = (targetPosition - humanoidRootPart.Position).Unit
            bodyVelocity.Velocity = direction * 135
        end
    end)
end

TeleportsTab:AddSection(T("teleports_section"))

TeleportsTab:AddButton({
    Name = T("tp_raid1"),
    Callback = function()
        TeleportTo(Vector3.new(-650.8, 7.1, -3318.2))
    end
})

TeleportsTab:AddButton({
    Name = T("tp_omnitrix"),
    Callback = function()
        TeleportTo(Vector3.new(-360.3, -46.4, -4329.0))
    end
})

ConfigTab:AddSection(T("config_section"))

ConfigTab:AddDropdown({
    Name = T("select_language"),
    MultiSelect = false,
    Options = {T("portuguese"), T("english")},
    Default = T("portuguese"),
    Callback = function(Value)
        if Value == "Português" or Value == T("portuguese") then
            Config.Language = "pt"
        elseif Value == "English" or Value == T("english") then
            Config.Language = "en"
        end
        
        Window:Notify({
            Title = T("warning_title"),
            Content = "Recarregue o script para aplicar o idioma",
            Duration = 5
        })
    end
})
