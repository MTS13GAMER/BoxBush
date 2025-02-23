local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "BoxBuh",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "BoxBuh",
    LoadingSubtitle = "By MTS13GAMER",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = false,
       FolderName = BUH, -- Create a custom folder for your hub/game
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
         Key = {"Freetoused","Universal Up","Squid","Omni"})
    }
 })

 local Tab = Window:CreateTab("Inicio", 4483362458) -- Title, Image

 local Section = Tab:CreateSection("Inicio")

 local Tab2 = Window:CreateTab("Universal", 4483362458) -- Title, Image

 local Section = Tab2:CreateSection("Universal")

 local Tab3 = Window:CreateTab("Squid X", 4483362458) -- Title, Image

 local Section = Tab3:CreateSection("Squid X")

 local Tab4 = Window:CreateTab("Omni X", 4483362458) -- Title, Image

 local Section = Tab4:CreateSection("Omni X")

local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")

local ativo = false

local Toggle = Tab4:CreateToggle({
   Name = "Auto Level",
   CurrentValue = false,
   Flag = "autolevel",
   Callback = function(Value)
       ativo = Value
   end,
})

RunService.RenderStepped:Connect(function()
    if ativo then
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.T, false, nil)
        wait(0.1) -- Ajuste o tempo para mudar a velocidade de repetição
    end
end)


 local Input = Tab2:CreateInput({
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

local Button = Tab4:CreateButton({
   Name = "Tp Omnitrix",
   Callback = function()
     local player = game.Players.LocalPlayer
if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
    player.Character.HumanoidRootPart.CFrame = CFrame.new(7834.2, -141.9, -150.1)
end
   end,
})

local Button = Tab:CreateButton({
   Name = "Destroir Gui",
   Callback = function()
     Rayfield:Destroy()
   end,
})

local Button = Tab4:CreateButton({
   Name = "Kill Me",
   Callback = function()
  local player = game.Players.LocalPlayer

if player.Character and player.Character:FindFirstChild("Humanoid") then
    player.Character.Humanoid.Health = 0
end
   end,
})


local Button = Tab3:CreateButton({
    Name = "Tp Pen",
    Callback = function()
    
local player = game.Players.LocalPlayer

local destination = Vector3.new(704, 8, 470) 

player.Character:SetPrimaryPartCFrame(CFrame.new(destination))
    end,
 })

local Button = Tab3:CreateButton({
    Name = "Ganhar Primeiro Jogo",
    Callback = function()
    
local player = game.Players.LocalPlayer

local destination = Vector3.new(2257, 447, -19) 

player.Character:SetPrimaryPartCFrame(CFrame.new(destination))
    end,
 })

local Button = Tab3:CreateButton({
   Name = "Click Para Se Salvar Durante A Noite",
   Callback = function()
     -- Referência ao jogador
local player = game.Players.LocalPlayer

-- Defina as coordenadas do ponto de destino (no mundo)
local destination = Vector3.new(341, 40, 129)  -- Substitua com as coordenadas desejadas

-- Função de teleporte
player.Character:SetPrimaryPartCFrame(CFrame.new(destination))
   end,
})

local Button = Tab2:CreateButton({
   Name = "Click Tp",
   Callback = function()
       local player = game.Players.LocalPlayer
       local mouse = player:GetMouse()

       -- Criação da ferramenta "TP Click"
       local tool = Instance.new("Tool")
       tool.Name = "TP Click"
       tool.RequiresHandle = true
       tool.Parent = player.Backpack

       -- Criação de uma parte invisível para o "handle" da ferramenta
       local handle = Instance.new("Part")
       handle.Name = "Handle"
       handle.Size = Vector3.new(1, 1, 1)
       handle.Transparency = 1
       handle.Anchored = false
       handle.CanCollide = false
       handle.Parent = tool

       -- Função para teletransportar o jogador
       local function teleportToClick()
           local targetPosition = mouse.Hit.p
           player.Character:MoveTo(targetPosition)
       end

       -- Ativar a ferramenta ao clicar
       tool.Activated:Connect(function()
           teleportToClick()
       end)

       -- Para dispositivos móveis
       mouse.TouchTap:Connect(function()
           if tool.Parent == player.Character then
               teleportToClick()
           end
       end)

       -- Esperar um pouco antes de mostrar a notificação (para garantir que a ação foi realizada)
       wait(0.5)
       
       -- Exibir a notificação de sucesso
       Rayfield:Notify({
           Title = "Sucesso",
           Content = "Você recebeu com sucesso o TP Click!",
           Duration = 6.5,
           Image = 4483362458,
       })
   end,
})



local Button = Tab:CreateButton({
   Name = "Rejoin",
   Callback = function()
       -- Obter o TeleportService
       local teleportService = game:GetService("TeleportService")
       local player = game.Players.LocalPlayer
       local placeId = game.PlaceId -- ID do lugar atual (do jogo)

       -- Teleporta o jogador de volta para o mesmo jogo (rejoin)
       teleportService:Teleport(placeId, player) 
   end,
})



local Button = Tab2:CreateButton({
    Name = "Fly Gui V3",
    Callback = function()
        local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)

up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "UP"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "DOWN"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "fly"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Fly GUI V3"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true

closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position =  UDim2.new(0, 0, -1, 27)

mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "-"
mini.TextSize = 40
mini.Position = UDim2.new(0, 44, -1, 27)

mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 40
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false

speeds = 1

local speaker = game:GetService("Players").LocalPlayer

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

nowe = false

game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "Fly GUI V3";
	Text = "By me_ozone and Quandale The Dinglish XII#3550";
	Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5;

Frame.Active = true -- main = gui
Frame.Draggable = true

onof.MouseButton1Down:connect(function()

	if nowe == true then
		nowe = false

		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else 
		nowe = true



		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end




	if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



		local plr = game.Players.LocalPlayer
		local torso = plr.Character.Torso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			game:GetService("RunService").RenderStepped:Wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end
			--	game.Players.LocalPlayer.Character.Animate.Disabled = true
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false




	else
		local plr = game.Players.LocalPlayer
		local UpperTorso = plr.Character.UpperTorso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", UpperTorso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = UpperTorso.CFrame
		local bv = Instance.new("BodyVelocity", UpperTorso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end

			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false



	end





end)

local tis

up.MouseButton1Down:connect(function()
	tis = up.MouseEnter:connect(function()
		while tis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
		end
	end)
end)

up.MouseLeave:connect(function()
	if tis then
		tis:Disconnect()
		tis = nil
	end
end)

local dis

down.MouseButton1Down:connect(function()
	dis = down.MouseEnter:connect(function()
		while dis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
		end
	end)
end)

down.MouseLeave:connect(function()
	if dis then
		dis:Disconnect()
		dis = nil
	end
end)


game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
	wait(0.7)
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	game.Players.LocalPlayer.Character.Animate.Disabled = false

end)


plus.MouseButton1Down:connect(function()
	speeds = speeds + 1
	speed.Text = speeds
	if nowe == true then


		tpwalking = false
		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
	end
end)
mine.MouseButton1Down:connect(function()
	if speeds == 1 then
		speed.Text = 'cannot be less than 1'
		wait(1)
		speed.Text = speeds
	else
		speeds = speeds - 1
		speed.Text = speeds
		if nowe == true then
			tpwalking = false
			for i = 1, speeds do
				spawn(function()

					local hb = game:GetService("RunService").Heartbeat	


					tpwalking = true
					local chr = game.Players.LocalPlayer.Character
					local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
					while tpwalking and hb:Wait() and chr and hum and hum.Parent do
						if hum.MoveDirection.Magnitude > 0 then
							chr:TranslateBy(hum.MoveDirection)
						end
					end

				end)
			end
		end
	end
end)

closebutton.MouseButton1Click:Connect(function()
	main:Destroy()
end)

mini.MouseButton1Click:Connect(function()
	up.Visible = false
	down.Visible = false
	onof.Visible = false
	plus.Visible = false
	speed.Visible = false
	mine.Visible = false
	mini.Visible = false
	mini2.Visible = true
	main.Frame.BackgroundTransparency = 1
	closebutton.Position =  UDim2.new(0, 0, -1, 57)
end)

mini2.MouseButton1Click:Connect(function()
	up.Visible = true
	down.Visible = true
	onof.Visible = true
	plus.Visible = true
	speed.Visible = true
	mine.Visible = true
	mini.Visible = true
	mini2.Visible = false
	main.Frame.BackgroundTransparency = 0 
	closebutton.Position =  UDim2.new(0, 0, -1, 27)
end)
    end,
 })

local Button = Tab2:CreateButton({
    Name = "Reverse (Mobile)",
    Callback = function()
        local flashbacklength = 60 -- duração do flashback em segundos
        local flashbackspeed = 1 -- quantos frames pular durante o flashback (0 para desativar)
         
        local name = game:GetService("RbxAnalyticsService"):GetSessionId() -- ID único
        local frames, LP, RS, UIS = {}, game:GetService("Players").LocalPlayer, game:GetService("RunService"), game:GetService("UserInputService")
         
        pcall(RS.UnbindFromRenderStep, RS, name) -- Desvincula a função se já estiver vinculada
        
        local function getchar()
            return LP.Character or LP.CharacterAdded:Wait()
        end
        
        function gethrp(c)
            return c:FindFirstChild("HumanoidRootPart") or c.RootPart or c.PrimaryPart or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso") or c:FindFirstChildWhichIsA("BasePart")
        end
        
        local flashback = {lastinput=false, canrevert=true, isReverting=false}
        
        function flashback:Advance(char, hrp, hum, allowinput)
            if #frames > flashbacklength * 60 then
                table.remove(frames, 1)
            end
            if allowinput and not self.canrevert then
                self.canrevert = true
            end
            if self.lastinput then
                hum.PlatformStand = false
                self.lastinput = false
            end
            table.insert(frames, {
                hrp.CFrame,
                hrp.Velocity,
                hum:GetState(),
                hum.PlatformStand,
                char:FindFirstChildOfClass("Tool")
            })
        end
        
        function flashback:Revert(char, hrp, hum)
            local num = #frames
            if num == 0 or not self.canrevert then
                self.canrevert = false
                self:Advance(char, hrp, hum)
                return
            end
            for i = 1, flashbackspeed do
                table.remove(frames, num)
                num = num - 1
            end
            self.lastinput = true
            local lastframe = frames[num]
            table.remove(frames, num)
            hrp.CFrame = lastframe[1]
            hrp.Velocity = -lastframe[2]
            hum:ChangeState(lastframe[3])
            hum.PlatformStand = lastframe[4]
            local currenttool = char:FindFirstChildOfClass("Tool")
            if lastframe[5] then
                if not currenttool then
                    hum:EquipTool(lastframe[5])
                end
            else
                hum:UnequipTools()
            end
        end
        
        -- Criar botão para mobile e PC
        local screenGui = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
        local reverseButton = Instance.new("TextButton", screenGui)
        reverseButton.Size = UDim2.new(0.1, 0, 0.05, 0) -- Tamanho menor
        reverseButton.Position = UDim2.new(0.8, 0, 0.85, 0)
        reverseButton.Text = "Reverse"
        reverseButton.BackgroundColor3 = Color3.new(1, 0, 0)
        reverseButton.TextScaled = true
        reverseButton.Draggable = true -- Tornar o botão movível
        reverseButton.Active = true
        reverseButton.Selectable = true
        
        local function step()
            local char = getchar()
            local hrp = gethrp(char)
            local hum = char:FindFirstChildWhichIsA("Humanoid")
            if flashback.isReverting then
                flashback:Revert(char, hrp, hum)
            else
                flashback:Advance(char, hrp, hum, true)
            end
        end
        
        reverseButton.MouseButton1Click:Connect(function()
            flashback.isReverting = not flashback.isReverting -- Alternar entre ativar/desativar o flashback
            reverseButton.BackgroundColor3 = flashback.isReverting and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
        end)
        
        RS:BindToRenderStep(name, 1, step)
        
    end,
 })

local Button = Tab2:CreateButton({
    Name = "Reverse (PC)",
    Callback = function()
        local key = "E" --key to intiate the flashback. see https://create.roblox.com/docs/reference/engine/enums/KeyCode for an exhaustive list
        local flashbacklength = 60 --how long the flashback should be stored in approx seconds
        local flashbackspeed = 1 --how many frames to skip during flashback (set to 0 to disable)
         
        local name = game:GetService("RbxAnalyticsService"):GetSessionId() --unique id that games cannot access but does not change on subsequent executions (used for the name of the binded function)
        local frames,uis,LP,RS = {},game:GetService("UserInputService"),game:GetService("Players").LocalPlayer,game:GetService("RunService") --set some vars
         
        pcall(RS.UnbindFromRenderStep,RS,name) --unbind the function if previously binded
         
        local function getchar()
           return LP.Character or LP.CharacterAdded:Wait()
        end
         
        function gethrp(c) --gethrp ripped from my env script and stripped of arguments
        return c:FindFirstChild("HumanoidRootPart") or c.RootPart or c.PrimaryPart or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso") or c:FindFirstChildWhichIsA("BasePart")
        end
         
        local flashback = {lastinput=false,canrevert=true}
         
        function flashback:Advance(char,hrp,hum,allowinput)
         
           if #frames>flashbacklength*60 then --make sure we don't have too much history
               table.remove(frames,1)
           end
         
           if allowinput and not self.canrevert then
               self.canrevert = true
           end
         
           if self.lastinput then --make sure platformstand goes back to normal
               hum.PlatformStand = false
               self.lastinput = false
           end
         
           table.insert(frames,{
               hrp.CFrame,
               hrp.Velocity,
               hum:GetState(),
               hum.PlatformStand,
               char:FindFirstChildOfClass("Tool")
           })
        end
         
        function flashback:Revert(char,hrp,hum)
           local num = #frames
           if num==0 or not self.canrevert then --add to history and return if no history is present
               self.canrevert = false
               self:Advance(char,hrp,hum)
               return
           end
           for i=1,flashbackspeed do --skip frames (if enabled)
               table.remove(frames,num)
               num=num-1
           end
           self.lastinput = true
           local lastframe = frames[num]
           table.remove(frames,num)
           hrp.CFrame = lastframe[1]
           hrp.Velocity = -lastframe[2]
           hum:ChangeState(lastframe[3])
           hum.PlatformStand = lastframe[4] --platformstand to make flying look normal again
           local currenttool = char:FindFirstChildOfClass("Tool")
           if lastframe[5] then --equip/unequip tools
               if not currenttool then
                   hum:EquipTool(lastframe[5])
               end
           else
               hum:UnequipTools()
           end
        end
         
        local function step() --function that runs every frame
           local char = getchar()
           local hrp = gethrp(char)
           local hum = char:FindFirstChildWhichIsA("Humanoid")
           if uis:IsKeyDown(Enum.KeyCode[key]) then --begin flashback
               flashback:Revert(char,hrp,hum)
           else
               flashback:Advance(char,hrp,hum,true)
           end
        end
        RS:BindToRenderStep(name,1,step) --finally, bind our function
    end,
 })

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local speed = 10 -- Velocidade do movimento
local autoMove = false -- Estado inicial do Toggle

local function moveCharacter()
    while autoMove do
        humanoid:Move(Vector3.new(0, 0, -speed), true) -- Move para frente
        wait(1) -- Espera um pouco
        humanoid:Move(Vector3.new(0, 0, speed), true) -- Move para trás
        wait(1) -- Espera um pouco
    end
end

local Toggle = Tab2:CreateToggle({
   Name = "Auto AFK",
   CurrentValue = false,
   Flag = "AutoMove",
   Callback = function(Value)
       autoMove = Value
       if autoMove then
           moveCharacter()
       end
   end,
})

 Rayfield:LoadConfiguration()
