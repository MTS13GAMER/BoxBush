local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "BoxBuh",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Carregando",
    LoadingSubtitle = "By MTS13GAMER",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "BoxBuh"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "BZwtCDS4Vz", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "System",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"mts","freebox","gamer"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local Tab = Window:CreateTab("Inicio", 4483362458) -- Title, Image

 local Section = Tab:CreateSection("Inicio")
 
 local Tab2 = Window:CreateTab("Mad City", 4483362458) -- Title, Image

 local Section = Tab2:CreateSection("Mad City")

 local Input = Tab:CreateInput({
   Name = "Altere A Sua Velocidade",
   CurrentValue = "",
   PlaceholderText = "Aqui",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
      local velocidade = tonumber(Text)
      if velocidade and velocidade >= 0 and velocidade <= 900 then
         print("Velocidade válida: " .. velocidade)
         ConfigurarVelocidade(velocidade)
      else
         print("Por favor, insira um valor de velocidade entre 0 e 900.")
      end
   end,
})

function ConfigurarVelocidade(valor)
   local player = game.Players.LocalPlayer
   if player and player.Character and player.Character:FindFirstChild("Humanoid") then
      player.Character.Humanoid.WalkSpeed = valor
      print("A velocidade do player foi configurada para: " .. valor)
   else
      print("Não foi possível encontrar o jogador ou o Humanoid.")
   end
end

local Dropdown = Tab:CreateDropdown({
    Name = "Dropdown Example",
    Options = {"Option 1","Option 2"},
    CurrentOption = {"Option 1"},
    MultipleOptions = false,
    Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Options)
    -- The function that takes place when the selected option is changed
    -- The variable (Options) is a table of strings for the current selected options
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Toggle Example",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    -- The function that takes place when the toggle is pressed
    -- The variable (Value) is a boolean on whether the toggle is true or false
    end,
 })

local Button = Tab:CreateButton({
   Name = "Destroir Gui",
   Callback = function()
     Rayfield:Destroy()
   end,
})

 Rayfield:LoadConfiguration()
