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

Tab2:AddButton({
	Name = "Menu De Volocidade",
	Callback = function()
      		-- Script para criar uma interface com um botão que permite ao jogador definir a velocidade do personagem

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Função para definir a velocidade
local function setSpeed(speed)
    humanoid.WalkSpeed = speed
    print("Velocidade ajustada para " .. speed)
end

-- Cria uma interface de tela
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Cria um frame para conter os elementos móveis
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 140)
frame.Position = UDim2.new(0.5, -100, 0.5, -70) -- Centraliza o frame na tela
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.BackgroundTransparency = 0.5
frame.BorderSizePixel = 0
frame.Parent = ScreenGui

-- Cria um título para o menu
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Menu de Velocidade"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Parent = frame

-- Adiciona o texto "By MTS13GAMER" abaixo do título
local credit = Instance.new("TextLabel")
credit.Size = UDim2.new(1, 0, 0, 20)
credit.Position = UDim2.new(0, 0, 0, 40)
credit.Text = "By MTS13GAMER"
credit.Font = Enum.Font.SourceSansBold
credit.TextSize = 12
credit.TextColor3 = Color3.new(1, 1, 1)
credit.BackgroundTransparency = 1
credit.Parent = frame

-- Cria um botão para fechar o menu
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, 5)
closeButton.Text = "X"
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 14
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.new(0.8, 0, 0) -- Cor vermelha para o botão de fechar
closeButton.BorderSizePixel = 0
closeButton.Parent = frame

-- Cria um campo de texto
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.8, 0, 0, 30)
textBox.Position = UDim2.new(0.1, 0, 0.4, 0)
textBox.PlaceholderText = "Insira a velocidade"
textBox.Font = Enum.Font.SourceSans
textBox.TextSize = 18
textBox.TextColor3 = Color3.new(0, 0, 0) -- Cor preta para o texto
textBox.BackgroundColor3 = Color3.new(1, 1, 1) -- Cor branca para o campo de texto
textBox.BorderSizePixel = 0
textBox.Parent = frame

-- Cria um botão
local button = Instance.new("TextButton")
button.Size = UDim2.new(0.8, 0, 0, 30)
button.Position = UDim2.new(0.1, 0, 0.75, 0)
button.Text = "Definir Velocidade"
button.Font = Enum.Font.SourceSansBold
button.TextSize = 18
button.TextColor3 = Color3.new(1, 1, 1) -- Cor branca para o texto
button.BackgroundColor3 = Color3.new(0.2, 0.7, 0.2) -- Cor verde para o botão
button.BorderSizePixel = 0
button.Parent = frame

-- Função para arrastar e mover a interface
local function makeDraggable(guiObject)
    local dragging = false
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        guiObject.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = guiObject.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    guiObject.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            update(input)
        end
    end)
end

-- Aplica a função de arrastar ao frame
makeDraggable(frame)

-- Conecta a função ao botão
button.MouseButton1Click:Connect(function()
    local speed = tonumber(textBox.Text)
    if speed then
        setSpeed(speed)
    else
        print("Por favor, insira um número válido.")
    end
end)

-- Função para fechar o menu
closeButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)



  	end    
})

Tab:AddLabel("Esse Script Foi Feito Por MTS13GAMER")

Tab:AddLabel("O Script Está No Início E Não Tem Muitas Funçãos")

Tab:AddLabel("Não Utilize O Script Pro Mal")

OrionLib:Init()
