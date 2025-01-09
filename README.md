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

local Keybind = Tab2:CreateKeybind({
   Name = "Auto Job",
   CurrentKeybind = "Q",
   HoldToInteract = false,
   Flag = "Keybind1", -- Um identificador único para a configuração, garantindo que não haja sobreposições
   Callback = function(Keybind)
      -- A função que ocorre quando o Keybind é pressionado
      -- A variável (Keybind) é um booleano que indica se o Keybind está sendo segurado ou não (HoldToInteract precisa estar true)
      if Keybind then
         -- Seu código adicional ao pressionar a tecla G
         repeat wait() until game:IsLoaded()
         repeat wait() until game.Players.LocalPlayer.Character
         repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
         repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

         wait(2)

         if _G.AutoRob == true then warn("Auto Rob already loaded.") return nil end

         _G.AutoRob = true
         queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/NtReadVirtualMemory/Open-Source-Scripts/refs/heads/main/Mad%20City%20Chapter%201/Auto%20Rob.lua'))()")

         for i = 1,100 do
            print("Made by NtOpenProcess and deni210 (on dc)")
         end

         function shop()
             local a,b = pcall(function()

                 local servers = {}
                 local req = request({Url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true"})
                 local body = game:GetService("HttpService"):JSONDecode(req.Body)
             
                 if body and body.data then
                     for i, v in next, body.data do
                         if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                             table.insert(servers, 1, v.id)
                         end
                     end
                 end
             
                 print(#servers)
                 if #servers > 0 then
                     game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
                 else
                     if #game.Players:GetChildren() <= 1 then
                         Players.LocalPlayer:Kick("\nRejoining...")
                         wait()
                         game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
                     else
                         game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                     end
                 end
             
             end)
             
             print(a,b)

             if not a then
                 shop()
             end 

             task.spawn(function()
                 while wait(5) do
                     shop()
                 end
             end)
         end

         wait(1)

         game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Died:Connect(function()
             shop()
         end)

         if game.Players.LocalPlayer.PlayerGui.MainGUI:FindFirstChild("TeleportEffect") then
            game.Players.LocalPlayer.PlayerGui.MainGUI.TeleportEffect:Destroy()
         end
         local function tp(x,y,z)
             Game.Workspace.Pyramid.Tele.Core2.CanCollide = false
             Game.Workspace.Pyramid.Tele.Core2.Transparency = 1
             Game.Workspace.Pyramid.Tele.Core2.CFrame = Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
             task.wait()
             Game.Workspace.Pyramid.Tele.Core2.CFrame = CFrame.new(1231.14185, 51051.2344, 318.096191)
             Game.Workspace.Pyramid.Tele.Core2.Transparency = 0
             Game.Workspace.Pyramid.Tele.Core2.CanCollide = true
             task.wait()
             for i = 1, 45 do
                 Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y,z)
                 task.wait()
             end
         end

         local MiniRobberies = {
             "Cash",
             "CashRegister",
             "DiamondBox",
             "Laptop",
             "Phone",
             "Luggage",
             "ATM",
             "TV",
             "Safe"
         }
         local function getevent(v)
            for i, v in next, v:GetDescendants() do
                if not v:IsA("RemoteEvent") then continue end
                return v
            end
         end

         local function getrobbery()
             for i, v in next, workspace.ObjectSelection:GetChildren() do
                if not table.find(MiniRobberies, v.Name) then continue end
                if v:FindFirstChild("Nope") then continue end
                if not getevent(v) then continue end
                return v
             end
         end

         tp(-82, 86, 807)
         task.wait(0.5)
         for i,v in pairs(workspace.JewelryStore.JewelryBoxes:GetChildren()) do
             task.spawn(function()
                 for i = 1,5 do
                     workspace.JewelryStore.JewelryBoxes.JewelryManager.Event:FireServer(v)
                 end
             end)
         end
         task.wait(2)
         tp(2115, 26, 420)
         task.wait(1)
         repeat
             local robbery = getrobbery()
             if robbery then
                 for i = 1, 20 do
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(robbery:GetPivot().Position.x,robbery:GetPivot().Position.y + 5,robbery:GetPivot().Position.z)
                     getevent(robbery):FireServer()
                     task.wait()
                 end
             end
         until getrobbery() == nil

         task.wait(1)

         shop()
      end
   end,
})


local Button = Tab:CreateButton({
   Name = "Destroir Gui",
   Callback = function()
     Rayfield:Destroy()
   end,
})

 Rayfield:LoadConfiguration()
