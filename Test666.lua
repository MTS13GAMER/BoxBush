local GameId = 131073412590872
local player = game.Players.LocalPlayer

-- Verificação do jogo
if game.PlaceId ~= GameId then
    player:Kick("pls join Omini-X Definitive")
    return
end

-- Configuração de idiomas
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

-- Idioma Português
AddLanguage("pt", {
    title = "Box Omini : Omini-X Definitive",
    subtitle = "Por MTS13GAMER",
    warning_title = "Aviso",
    warning_content = "Script em Beta",
    main_tab = "Main",
    home_tab = "Início",
    aliens_tab = "Aliens",
    discord_title = "ミ★ BoxBush ★ 彡",
    discord_desc = "Participe da nossa comunidade no Discord!",
    info_section = "informações...",
    executor = "Executor",
    not_identified = "Executor não identificado",
    select_alien = "Selecionar Alien",
    select_option = "Selecione"
})

-- Idioma Inglês
AddLanguage("en", {
    title = "Box Omini : Omini-X Definitive",
    subtitle = "By MTS13GAMER",
    warning_title = "Warning",
    warning_content = "Beta Script",
    main_tab = "Main",
    home_tab = "Home",
    aliens_tab = "Aliens",
    discord_title = "ミ★ BoxBush ★ 彡",
    discord_desc = "Join our Discord community!",
    info_section = "info...",
    executor = "Executor",
    not_identified = "Executor not identified",
    select_alien = "Select Alien",
    select_option = "Select"
})

-- Carregar biblioteca
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau"))()

-- Criar janela
local Window = Library:MakeWindow({
    Title = T("title"),
    SubTitle = T("subtitle"),
    ScriptFolder = "OmniBox"
})

-- Minimizador
Window:NewMinimizer({
    KeyCode = Enum.KeyCode.RightControl
})

-- Notificação inicial
Window:Notify({
    Title = T("warning_title"),
    Content = T("warning_content"),
    Image = "rbxassetid://17775975336",
    Duration = 6
})

-- Criar aba principal (Main)
local MainTab = Window:MakeTab({
    T("main_tab"),
    T("home_tab")
})

-- Criar aba de Aliens
local AliensTab = Window:MakeTab({
    T("aliens_tab"),
    T("aliens_tab")
})

-- Identificar executor
local executor = T("not_identified")
pcall(function()
    if identifyexecutor then
        executor = identifyexecutor()
    elseif getexecutorname then
        executor = getexecutorname()
    end
end)

-- Convite Discord (Main Tab)
MainTab:AddDiscordInvite({
    Title = T("discord_title"),
    Description = T("discord_desc"),
    Banner = Color3.fromRGB(233, 37, 69),
    Logo = "rbxassetid://140487255563212",
    Invite = "https://discord.gg/kdeBBmWeGt"
})

-- Seção de informações (Main Tab)
MainTab:AddSection(T("info_section"))
MainTab:AddParagraph(T("executor"), executor)

-- Dropdown de seleção de alien (Aliens Tab)
AliensTab:AddDropdown({
    Name = T("select_alien"),
    MultiSelect = false,
    Options = {T("select_option"), "HeatBlast", "Wildmutt", "Diamond"},
    Default = T("select_option"),
    Callback = function(Value)
        -- Não faz nada se for a opção "Selecione/Select"
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
