local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "BoxBuh", HidePremium = false, SaveConfig = false, ConfigFolder = "Buhbox"})

local Tab = Window:MakeTab({
	Name = "Inicio",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Funçãos",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddLabel("Esse Script Foi Feito Por MTS13GAMER")

Tab:AddLabel("O Script Está No Início E Não Tem Muitas Funçãos")

Tab:AddLabel("Não Utilize O Script Pro Mal")

Tab2:AddButton({
	Name = "Admin Commands",
	Callback = function()
      		local player = game.Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local AuthorLabel = Instance.new("TextLabel")
local CommandsLabel = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")

ScreenGui.Parent = player:WaitForChild("PlayerGui")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0.5, -75, 0.1, 0)
Frame.Size = UDim2.new(0, 150, 0, 275)
Frame.BackgroundTransparency = 0.5
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

TitleLabel.Parent = Frame
TitleLabel.Size = UDim2.new(1, 0, 0.2, 0)
TitleLabel.Text = "Commands"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextScaled = true

AuthorLabel.Parent = Frame
AuthorLabel.Size = UDim2.new(1, 0, 0.2, 0)
AuthorLabel.Position = UDim2.new(0, 0, 0.2, 0)
AuthorLabel.Text = "by MTS13GAMER"
AuthorLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
AuthorLabel.BackgroundTransparency = 1
AuthorLabel.TextScaled = true

CommandsLabel.Parent = Frame
CommandsLabel.Size = UDim2.new(1, 0, 0.6, 0)
CommandsLabel.Position = UDim2.new(0, 0, 0.4, 0)
CommandsLabel.Text = "!fly [player]\n!kill [player]\n!heal [player]\n!damage [amount] [player]\n!tp [target] [destination]\n!speed [value] [player]\n!jump [value] [player]\n!noclip [on/off] [player]\n!sit [player]"
CommandsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CommandsLabel.BackgroundTransparency = 1
CommandsLabel.TextScaled = true

CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0.15, 0, 0.15, 0)
CloseButton.Position = UDim2.new(0.85, 0, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
CloseButton.TextScaled = true

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local admins = {player.Name}  -- Lista de administradores

local function onChat(message)
    if table.find(admins, player.Name) then
        local args = string.split(message, " ")
        local command = args[1]
        
        if command == "!fly" then
            local target = args[2] and game.Players:FindFirstChild(args[2]) or player
            if target and target.Character then
                local bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.Velocity = Vector3.new(0, 50, 0)
                bodyVelocity.Parent = target.Character.HumanoidRootPart
                game.Debris:AddItem(bodyVelocity, 5)
            end

        elseif command == "!kill" then
            local target = args[2] and game.Players:FindFirstChild(args[2])
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.Health = 0
            end

        elseif command == "!heal" then
            local target = args[2] and game.Players:FindFirstChild(args[2]) or player
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.Health = target.Character.Humanoid.MaxHealth
            end

        elseif command == "!damage" then
            local amount = tonumber(args[2])
            local target = args[3] and game.Players:FindFirstChild(args[3]) or player
            if amount and target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.Health = target.Character.Humanoid.Health - amount
            end

        elseif command == "!tp" then
            local target = args[2] and game.Players:FindFirstChild(args[2])
            local destination = args[3] and game.Players:FindFirstChild(args[3])
            if target and destination and target.Character and destination.Character then
                target.Character:SetPrimaryPartCFrame(destination.Character.PrimaryPart.CFrame)
            end

        elseif command == "!speed" then
            local speed = tonumber(args[2])
            local target = args[3] and game.Players:FindFirstChild(args[3]) or player
            if speed and target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.WalkSpeed = speed
            end
            
        elseif command == "!jump" then
            local jumpPower = tonumber(args[2])
            local target = args[3] and game.Players:FindFirstChild(args[3]) or player
            if jumpPower and target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.JumpPower = jumpPower
            end

        elseif command == "!noclip" then
            local toggle = args[2]
            local target = args[3] and game.Players:FindFirstChild(args[3]) or player
            if toggle and target and target.Character then
                if toggle == "on" then
                    for _, part in pairs(target.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                elseif toggle == "off" then
                    for _, part in pairs(target.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                        end
                    end
                end
            end

        elseif command == "!sit" then
            local target = args[2] and game.Players:FindFirstChild(args[2]) or player
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                
		target.Character.Humanoid.Sit = true
            end
        end
    end
end

player.Chatted:Connect(onChat)


  	end    
})

Tab3:AddButton({
	Name = "Auto Job(Não e Possível Desativar So Saindo Do Jogo.)",
	Callback = function()
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
 
OrionLib:Init()
