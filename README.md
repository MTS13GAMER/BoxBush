local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "BoxBuh",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "📦|BoxBuh",
    LoadingSubtitle = "➡By MTS13GAMER⬅",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = false,
       FolderName = "BUH", -- Create a custom folder for your hub/game
       FileName = "BoxBuh"
    },
 
    Discord = {
       Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "BZwtCDS4Vz", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "System",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
     Key = {"Update11","1013","fa","gg"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22") -->
    }
 })

 local Tab = Window:CreateTab("Inicio", 4483362458) -- Title, Image

 local Section = Tab:CreateSection("Inicio")

  local Tab5 = Window:CreateTab("Contrua Um Barco", 4483362458) -- Title, Image

 local Section = Tab5:CreateSection("Build A Boat")

 local Tab2 = Window:CreateTab("Universal", 4483362458) -- Title, Image

 local Section = Tab2:CreateSection("Universal")

 local Tab3 = Window:CreateTab("Squid X", 4483362458) -- Title, Image

 local Section = Tab3:CreateSection("Squid X")

 local Tab4 = Window:CreateTab("Omni X", 4483362458) -- Title, Image

 local Section = Tab4:CreateSection("Omni X")

 local Tab6 = Window:CreateTab("Blue Lock", 4483362458) -- Title, Image

 local Section = Tab6:CreateSection("Blue Lock")

 local Tab7 = Window:CreateTab("Universal Guis", 4483362458) -- Title, Image

 local Section = Tab7:CreateSection("UG")

local Button = Tab6:CreateButton({
    Name = "Ego Jinpachi (Toque Pra Pegar)",
    Callback = function()
        local player = game.Players.LocalPlayer

        local function cleanup()
            for _, buttonName in ipairs({"FakeHeelFlickButton", "JinpachiTurnButton", "MetavisionButton", "SatoruShotButton"}) do
                local button = player.PlayerGui.InGameUI.Bottom.Abilities:FindFirstChild(buttonName)
                if button then
                    button:Destroy()
                end
            end
            if player.PlayerGui:FindFirstChild("AbilityTextGui") then
                player.PlayerGui.AbilityTextGui:Destroy()
            end
        end

        local function initializeAbility()
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            local animation1 = Instance.new("Animation")
            animation1.AnimationId = "rbxassetid://99916870664377"
            local animationTrack1 = humanoid:LoadAnimation(animation1)

            local animation2 = Instance.new("Animation")
            animation2.AnimationId = "rbxassetid://74760828875758"
            local animationTrack2 = humanoid:LoadAnimation(animation2)

            local animation3 = Instance.new("Animation")
            animation3.AnimationId = "rbxassetid://84377108321213"
            local animationTrack3 = humanoid:LoadAnimation(animation3)

            local sound1 = Instance.new("Sound")
            sound1.SoundId = "rbxassetid://17704386866"
            sound1.Parent = humanoidRootPart

            local sound2 = Instance.new("Sound")
            sound2.SoundId = "rbxassetid://5835032207"
            sound2.Parent = humanoidRootPart

            local sound3 = Instance.new("Sound")
            sound3.SoundId = "rbxassetid://8789851536"
            sound3.Parent = humanoidRootPart

            local sound4 = Instance.new("Sound")
            sound4.SoundId = "rbxassetid://112558145937517"
            sound4.Parent = humanoidRootPart

            local visualEffect = Instance.new("ParticleEmitter")
            visualEffect.Texture = "rbxassetid://107877955127835"
            visualEffect.Color = ColorSequence.new(Color3.new(1, 0, 0))
            visualEffect.Lifetime = NumberRange.new(0.5, 1)
            visualEffect.Rate = 100
            visualEffect.Speed = NumberRange.new(20, 30)
            visualEffect.Size = NumberSequence.new(2, 3)
            visualEffect.Transparency = NumberSequence.new(0, 0.5)
            visualEffect.Enabled = false
            visualEffect.Parent = humanoidRootPart

            local coolEffect = Instance.new("ParticleEmitter")
            coolEffect.Texture = "rbxassetid://107877955127835"
            coolEffect.Color = ColorSequence.new(Color3.new(0, 1, 1))
            coolEffect.Lifetime = NumberRange.new(0.5, 1.5)
            coolEffect.Rate = 50
            coolEffect.Speed = NumberRange.new(15, 25)
            coolEffect.Size = NumberSequence.new(3, 4)
            coolEffect.Transparency = NumberSequence.new(0, 0.7)
            coolEffect.Enabled = false
            coolEffect.Parent = humanoidRootPart

            local foggyAura = Instance.new("ParticleEmitter")
            foggyAura.Texture = "rbxassetid://243660364"
            foggyAura.Color = ColorSequence.new(Color3.new(0, 0, 0))
            foggyAura.Lifetime = NumberRange.new(1, 2)
            foggyAura.Rate = 200
            foggyAura.Speed = NumberRange.new(5, 10)
            foggyAura.Size = NumberSequence.new(5, 10)
            foggyAura.Transparency = NumberSequence.new(0.5, 0.8)
            foggyAura.Enabled = false
            foggyAura.Parent = humanoidRootPart

            local TweenService = game:GetService("TweenService")

            local function createRedEffect()
                for _, part in pairs(character:GetChildren()) do
                    if part:IsA("BasePart") then
                        local originalColor = part.Color
                        part.Color = Color3.fromRGB(255, 0, 0)
                        delay(0.5, function()
                            part.Color = originalColor
                        end)
                    end
                end
            end

            local function displayAbilityText(text, duration)
                local screenGui = Instance.new("ScreenGui")
                screenGui.Name = "AbilityTextGui"
                screenGui.Parent = player.PlayerGui

                local textLabel = Instance.new("TextLabel")
                textLabel.Name = "AbilityTextLabel"
                textLabel.Text = text
                textLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
                textLabel.Position = UDim2.new(0.25, 0, 0, 0)
                textLabel.TextScaled = true
                textLabel.BackgroundTransparency = 1
                textLabel.TextColor3 = Color3.new(1, 1, 1)
                textLabel.Font = Enum.Font.SourceSansBold
                textLabel.Parent = screenGui

                game:GetService("Debris"):AddItem(screenGui, duration)
            end

            local function setScreenColor(color)
                local lighting = game:GetService("Lighting")
                lighting.Ambient = color
                lighting.OutdoorAmbient = color
            end

            local function triggerAbility1()
                sound1:Play()
                animationTrack1:Play()
                animationTrack1:AdjustSpeed(1.5)

                local zigzagDuration = 0.25
                local zigzagDistance = 10
                local forwardForce = 48

                local function createZigzagTween(direction, index)
                    local forwardVector = humanoidRootPart.CFrame.LookVector
                    local rightVector = humanoidRootPart.CFrame.RightVector
                    local targetPosition = humanoidRootPart.Position + (forwardVector * (zigzagDistance * index) + direction * rightVector * zigzagDistance)
                    local targetCFrame = CFrame.new(targetPosition, targetPosition + forwardVector)
                    local tweenInfo = TweenInfo.new(zigzagDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
                    local tween = TweenService:Create(humanoidRootPart, tweenInfo, {CFrame = targetCFrame})
                    return tween
                end

                visualEffect.Enabled = true
                coolEffect.Enabled = true
                foggyAura.Enabled = true

                local zigzagTweens = {}
                for i = 1, 10 do
                    local direction = (i % 2 == 1) and 1 or -1
                    local tween = createZigzagTween(direction, i)
                    table.insert(zigzagTweens, tween)
                end

                local function playZigzagTweens(index)
                    if index > #zigzagTweens then
                        visualEffect.Enabled = false
                        coolEffect.Enabled = false
                        foggyAura.Enabled = false
                        return
                    end
                    local currentTween = zigzagTweens[index]
                    currentTween:Play()
                    currentTween.Completed:Connect(function()
                        playZigzagTweens(index + 1)
                    end)
                end

                playZigzagTweens(1)
            end

            local function triggerAbility2()
                local bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.Velocity = humanoidRootPart.CFrame.LookVector * 62
                bodyVelocity.MaxForce = Vector3.new(1000000, 0, 1000000)
                bodyVelocity.Parent = humanoidRootPart

                game.Debris:AddItem(bodyVelocity, 0.5)

                sound2:Play()
                animationTrack2:Play()
                animationTrack2:AdjustSpeed(0.9)

                createRedEffect()
            end

            local function triggerAbility3()
                sound4:Play()

                displayAbilityText("Get On Your Knees, Blue Lock.", 5)

                setScreenColor(Color3.new(0, 0, 1))

                delay(5, function()
                    displayAbilityText("METAVISION ACTIVATED", 5)
                end)

                delay(10, function()
                    setScreenColor(Color3.new(0.5, 0.5, 0.5))
                end)
            end

            local function triggerAbility4()
                sound3:Play()
                animationTrack3:Play()
                animationTrack3:AdjustSpeed(7)

                animationTrack3.Stopped:Connect(function()
                    local args = {
                        [1] = 132,
                    }
                    game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Shoot:FireServer(unpack(args))
                end)
            end

            local Clone1 = player.PlayerGui.InGameUI.Bottom.Abilities["1"]:Clone()
            Clone1.Name = "FakeHeelFlickButton"
            Clone1.Parent = player.PlayerGui.InGameUI.Bottom.Abilities
            Clone1.LayoutOrder = -4
            Clone1.Keybind.Text = "Y"
            Clone1.Timer.Text = "Egoistic Style"
            Clone1.ActualTimer.Text = ""
            Clone1.Cooldown:Destroy()

            local Clone2 = player.PlayerGui.InGameUI.Bottom.Abilities["1"]:Clone()
            Clone2.Name = "JinpachiTurnButton"
            Clone2.Parent = player.PlayerGui.InGameUI.Bottom.Abilities
            Clone2.LayoutOrder = -2
            Clone2.Keybind.Text = "N"
            Clone2.Timer.Text = "Jinpachi Turn"
            Clone2.ActualTimer.Text = ""
            Clone2.Cooldown:Destroy()

            local Clone3 = player.PlayerGui.InGameUI.Bottom.Abilities["1"]:Clone()
            Clone3.Name = "MetavisionButton"
            Clone3.Parent = player.PlayerGui.InGameUI.Bottom.Abilities
            Clone3.LayoutOrder = -3
            Clone3.Keybind.Text = "V"
            Clone3.Timer.Text = "Metavision"
            Clone3.ActualTimer.Text = ""
            Clone3.Cooldown:Destroy()

            local Clone4 = player.PlayerGui.InGameUI.Bottom.Abilities["1"]:Clone()
            Clone4.Name = "SatoruShotButton"
            Clone4.Parent = player.PlayerGui.InGameUI.Bottom.Abilities
            Clone4.LayoutOrder = -1
            Clone4.Keybind.Text = "T"
            Clone4.Timer.Text = "Ego Bang"
            Clone4.ActualTimer.Text = ""
            Clone4.Cooldown:Destroy()

            Clone1.Activated:Connect(function()
                triggerAbility1()
            end)

            Clone2.Activated:Connect(function()
                triggerAbility2()
            end)

            Clone3.Activated:Connect(function()
                triggerAbility3()
            end)

            Clone4.Activated:Connect(function()
                triggerAbility4()
            end)

            game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end

                if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Y then
                    triggerAbility1()
                end

                if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.N then
                    triggerAbility2()
                end

                if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.V then
                    triggerAbility3()
                end

                if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.T then
                    triggerAbility4()
                end
            end)
        end

        player.CharacterAdded:Connect(function()
            cleanup()
            initializeAbility()
        end)

        cleanup()
        if player.Character then
            initializeAbility()
        end
    end
})

local Button = Tab6:CreateButton({
    Name = "Ego Jinpachi Visual (Toque Pra Pegar )",
    Callback = function()
	local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local st = player.PlayerGui:WaitForChild("Style").BG.StyleTxt
local Slot = player.PlayerGui.Style.BG.Slots.ScrollingFrame.Slot1.Text
local des = player.PlayerGui.Style.BG.Desc

-- Function to create a red tail effect attached to the torso
local function createRedTail()
    local trail = Instance.new("Trail")
    trail.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)),   -- Pink
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 192, 203))    -- Pink
    })
    trail.LightEmission = 1
    trail.Transparency = NumberSequence.new(0.1, 0.5)
    trail.Lifetime = 1.5
    trail.MinLength = 5
    trail.MaxLength = 10
    trail.WidthScale = NumberSequence.new(5)

    local attachment0 = Instance.new("Attachment", character.HumanoidRootPart)
    attachment0.Position = Vector3.new(0, 0, -3)
    
    local attachment1 = Instance.new("Attachment", character.HumanoidRootPart)
    attachment1.Position = Vector3.new(0, 0, 3)
    
    trail.Attachment0 = attachment0
    trail.Attachment1 = attachment1
    trail.Parent = character.HumanoidRootPart
end

createRedTail()

-- GUI Notification
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local outlineFrame = Instance.new("Frame")
outlineFrame.Size = UDim2.new(1, 10, 1, 10)
outlineFrame.Position = UDim2.new(0, -5, 0, -5)
outlineFrame.BackgroundTransparency = 1
outlineFrame.BorderSizePixel = 3
local notificationFrame = Instance.new("Frame")
notificationFrame.Size = UDim2.new(0.5, 0, 0.1, 0)
notificationFrame.Position = UDim2.new(0.25, 0, 0.4, 0)
notificationFrame.BackgroundTransparency = 1
notificationFrame.Parent = screenGui

outlineFrame.Parent = notificationFrame

local outlineCorner = Instance.new("UICorner")
outlineCorner.CornerRadius = UDim.new(0, 12)
outlineCorner.Parent = outlineFrame

local function getRainbowColor(frequency)
    local time = tick() * frequency
    local red = math.sin(time) * 0.5 + 0.5
    local green = math.sin(time + 2 * math.pi / 3) * 0.5 + 0.5
    local blue = math.sin(time + 4 * math.pi / 3) * 0.5 + 0.5
    return Color3.new(red, green, blue)
end

local function updateOutlineColor()
    while true do
        outlineFrame.BorderColor3 = getRainbowColor(1)
        wait(0.1)
    end
end

spawn(updateOutlineColor)

-- Atualiza nome, cor e descrição do estilo
while wait() do
    st.Text = "Ego Jinpachi"
    st.TextColor3 = Color3.fromRGB(255, 192, 203)
    Slot.Text = "Ego Jinpachi"
    Slot.TextColor3 = Color3.fromRGB(255, 192, 203)
    des.Text = "HAHAHAHHAHA E+G+O"
end
    end
})


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

local noclipEnabled = false

local Toggle = Tab2:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Flag = "Noclip",
   Callback = function(Value)
       noclipEnabled = Value

       -- Ativa/desativa o noclip
       if noclipEnabled then
           game:GetService("RunService").Stepped:Connect(function()
               if noclipEnabled and game.Players.LocalPlayer.Character then
                   for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                       if part:IsA("BasePart") and part.CanCollide then
                           part.CanCollide = false
                       end
                   end
               end
           end)
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

local Button = Tab6:CreateButton({
   Name = "Controlar A Bola (Isso Era Temporario Não Tem Mais)",
   Callback = function()
   end,
})

local Button = Tab6:CreateButton({
   Name = "Script De Estilo ",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/PresidentZuyi/S/refs/heads/main/OfficialZuyi.txt"))()
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
    Name = "Entrar No Jogo",
    Callback = function()
    
local player = game.Players.LocalPlayer

local destination = Vector3.new(246, 13, -468) 

player.Character:SetPrimaryPartCFrame(CFrame.new(destination))
    end,
 })


local Button = Tab3:CreateButton({
    Name = "Ganhar Primeiro Jogo (Use Na Luz Verde)",
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

Tab2:CreateButton({
    Name = "Ativar Anti-AFK",
    Callback = function()
        local VirtualUser = game:service("VirtualUser")
        game:service("Players").LocalPlayer.Idled:Connect(function()
            VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            print("[Anti-AFK] Movimento simulado para evitar desconexão.")
        end)
        Rayfield:Notify({
            Title = "Anti-AFK Ativado",
            Content = "Você não será mais desconectado por inatividade.",
            Duration = 6,
            Image = 4483362458,
        })
    end,
})

local player = game.Players.LocalPlayer
local autoFarming = false
local flySpeed = 400.90
local flyDuration = 21
local centerPosition = Vector3.new(0, 100, 0)
local chestPosition = Vector3.new(15, -5, 9495)
local totalCoins = 0
local noclipEnabled = false

local Toggle = Tab5:CreateToggle({
   Name = "Auto Farm Gold",
   CurrentValue = false,
   Flag = "autofarm",
   Callback = function(Value)
       autoFarming = Value
       if autoFarming then
           startAutoFarm()
       else
           stopFlying()
           teleportToTeamBase()
           disableNoclip()
       end
   end,
})

function startAutoFarm()
    spawn(function()
        while autoFarming do
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if hrp then
                enableNoclip(character)
                hrp.CFrame = CFrame.new(centerPosition)
                local bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
                bodyVelocity.Velocity = Vector3.new(0, 0, flySpeed)
                bodyVelocity.Parent = hrp
                wait(flyDuration)
                bodyVelocity:Destroy()
                hrp.CFrame = CFrame.new(chestPosition)
                character:BreakJoints()
                totalCoins = totalCoins + 100
                wait(9)
            end
        end
    end)
end

function stopFlying()
    if bodyVelocity then
        bodyVelocity:Destroy()
    end
end

function teleportToTeamBase()
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        local teamBasePosition = Vector3.new(0, 10, 0)
        hrp.CFrame = CFrame.new(teamBasePosition)
    end
end

function enableNoclip(character)
    noclipEnabled = true
    spawn(function()
        while noclipEnabled do
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
            wait()
        end
    end)
end

function disableNoclip()
    noclipEnabled = false
end

local GotoPlayerName = ""
local fastTp = false

-- Input do nome
local Input = Tab2:CreateInput({ 
   Name = "Goto", 
   CurrentValue = "",
   PlaceholderText = "Nome do jogador",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
      GotoPlayerName = Text
   end,
})

-- Função que ativa/desativa o fast teleport
local function ToggleFastTeleport()
	fastTp = not fastTp
	if fastTp then
		print("Fast Teleport Ativado")
		task.spawn(function()
			while fastTp do
				task.wait()
				local localChar = game.Players.LocalPlayer.Character
				local targetPlr = game.Players:FindFirstChild(GotoPlayerName)

				if targetPlr and targetPlr.Character and targetPlr.Character:FindFirstChild("HumanoidRootPart") then
					localChar.HumanoidRootPart.CFrame = targetPlr.Character.HumanoidRootPart.CFrame
				end
			end
		end)
	else
		print("Fast Teleport Desativado")
	end
end

-- Botão de teleporte único
Tab2:CreateButton({
   Name = "Teleportar",
   Callback = function()
      local localChar = game.Players.LocalPlayer.Character
      local targetPlr = game.Players:FindFirstChild(GotoPlayerName)

      if targetPlr and targetPlr.Character and targetPlr.Character:FindFirstChild("HumanoidRootPart") then
         localChar.HumanoidRootPart.CFrame = targetPlr.Character.HumanoidRootPart.CFrame
      else
         warn("Jogador não encontrado ou personagem inválido")
      end
   end,
})

-- Botão de Fast Teleport (Teleporte Loop)
Tab2:CreateButton({
   Name = "Teleporte Loop",
   Callback = function()
      ToggleFastTeleport() -- Simula a tecla F chamando a função diretamente
   end,
})

local Button = Tab7:CreateButton({
    Name = "Fe Emote Gui",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-all-emotes-6849"))()
    end,
 })

 local Button = Tab7:CreateButton({
    Name = "Troll Gui (🔞)",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Troll-GUI-30896"))()
    end,
 })

 local Button = Tab7:CreateButton({
    Name = "BoxBuh Brookhaven",
    Callback = function()
        loadstring(game:HttpGet("https://github.com/MTS13GAMER/Hhfhggtfdtuu/blob/main/README.md"))()
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Link Do Nosso Server Do Discord :D",
    Callback = function()
        setclipboard("https://discord.com/invite/BZwtCDS4Vz")
        Rayfield:Notify({
            Title = "Link do Discord Copiado!",
            Content = "Cole No Seu Navegador Pra Entrar Se Quiser.",
            Duration = 5,
        })
    end,
})

 Rayfield:LoadConfiguration()
