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
       Key = {"admin","free"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local Tab = Window:CreateTab("Inicio", 4483362458) -- Title, Image

 local Section = Tab:CreateSection("Inicio")
 
 local Button = Tab:CreateButton({
    Name = "Destroir Gui",
    Callback = function()
      Rayfield:Destroy()
    end,
 })
 
 local Input = Tab:CreateInput({
   Name = "Input Example",
   CurrentValue = "",
   PlaceholderText = "Input Placeholder",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
      -- A função que ocorre quando a entrada é alterada
      -- A variável (Text) é uma string para o valor na caixa de texto
      
      -- Verifica se o texto é um número e está dentro do intervalo permitido
      local velocidade = tonumber(Text)
      if velocidade and velocidade >= 0 and velocidade <= 900 then
         print("Velocidade válida: " .. velocidade)
         ConfigurarVelocidade(velocidade)
      else
         print("Por favor, insira um valor de velocidade entre 0 e 900.")
      end
   end,
})

local Input = Tab:CreateInput({
   Name = "Input Example",
   CurrentValue = "",
   PlaceholderText = "Input Placeholder",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
      -- A função que ocorre quando a entrada é alterada
      -- A variável (Text) é uma string para o valor na caixa de texto
      
      -- Verifica se o texto é um número e está dentro do intervalo permitido
      local velocidade = tonumber(Text)
      if velocidade and velocidade >= 0 and velocidade <= 900 then
         print("Velocidade válida: " .. velocidade)
         ConfigurarVelocidade(velocidade)
      else
         print("Por favor, insira um valor de velocidade entre 0 e 900.")
      end
   end,
})

-- Função para configurar a velocidade do player
function ConfigurarVelocidade(valor)
   -- Obtém o player local
   local player = game.Players.LocalPlayer
   if player and player.Character and player.Character:FindFirstChild("Humanoid") then
      player.Character.Humanoid.WalkSpeed = valor
      print("A velocidade do player foi configurada para: " .. valor)
   else
      print("Não foi possível encontrar o jogador ou o Humanoid.")
   end
end

 Rayfield:LoadConfiguration()
