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
    discord_title = "ミ★ BoxBush ★ 彡",
    discord_desc = "Participe da nossa comunidade no Discord!",
    info_section = "informações...",
    executor = "Executor",
    not_identified = "Executor não identificado",
    select_alien = "Selecionar Alien",
    select_option = "Selecione",
    tp_raid1 = "Raid 1",
    tp_omnitrix = "Omnitrix"
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
    discord_title = "ミ★ BoxBush ★ 彡",
    discord_desc = "Join our Discord community!",
    info_section = "info...",
    executor = "Executor",
    not_identified = "Executor not identified",
    select_alien = "Select Alien",
    select_option = "Select",
    tp_raid1 = "Raid 1",
    tp_omnitrix = "Omnitrix"
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
    T("main_tab"),
    T("home_tab"),
    "rbxassetid://17775975336"
})

local AliensTab = Window:MakeTab({
    T("aliens_tab"),
    T("aliens_tab"),
    "rbxassetid://10723407389"
})

local TeleportsTab = Window:MakeTab({
    T("teleports_tab"),
    T("teleports_tab"),
    "rbxassetid://7733674079"
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

local function TeleportTo(position)
    local character = player.Character
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.PlatformStand = true
    end
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVelocity.Parent = humanoidRootPart
    
    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        local distance = (position - humanoidRootPart.Position).Magnitude
        
        if distance < 5 then
            bodyVelocity:Destroy()
            if humanoid then
                humanoid.PlatformStand = false
            end
            connection:Disconnect()
        else
            local direction = (position - humanoidRootPart.Position).Unit
            bodyVelocity.Velocity = direction * 90
        end
    end)
end

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
