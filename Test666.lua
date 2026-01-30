-- Script de Lista de Remotes com Animações
-- Autor: Script Assistente
-- Data: 2024

-- Configurações
local IS_MINIMIZED = false
local ANIMATION_SPEED = 0.2

-- Instância principal da interface
local RemoteViewer = Instance.new("ScreenGui")
RemoteViewer.Name = "RemoteViewer"
RemoteViewer.ResetOnSpawn = false
RemoteViewer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Frame principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 200) -- Tamanho inicial menor
MainFrame.Position = UDim2.new(0.5, -200, 0, -250) -- Começa acima da tela
MainFrame.AnchorPoint = Vector2.new(0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = RemoteViewer

-- Arredondar bordas
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Barra de título (maior para facilitar arrastar)
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 8)
UICorner2.Parent = TitleBar

-- Título
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -120, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "📡 Remote Viewer"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

-- Botão de minimizar
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -80, 0.5, -15)
MinimizeButton.AnchorPoint = Vector2.new(0, 0.5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(80, 130, 200)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 20
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Parent = TitleBar

local UICornerMinimize = Instance.new("UICorner")
UICornerMinimize.CornerRadius = UDim.new(0, 6)
UICornerMinimize.Parent = MinimizeButton

-- Botão de fechar
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -40, 0.5, -15)
CloseButton.AnchorPoint = Vector2.new(0, 0.5)
CloseButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = TitleBar

local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(0, 6)
UICorner3.Parent = CloseButton

-- Contêiner do conteúdo (pode ser escondido)
local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, 0, 1, -45)
ContentContainer.Position = UDim2.new(0, 0, 0, 45)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame

-- Contador de remotes
local RemoteCount = Instance.new("TextLabel")
RemoteCount.Name = "RemoteCount"
RemoteCount.Size = UDim2.new(1, -20, 0, 25)
RemoteCount.Position = UDim2.new(0, 10, 0, 10)
RemoteCount.BackgroundTransparency = 1
RemoteCount.Text = "Carregando remotes..."
RemoteCount.TextColor3 = Color3.fromRGB(200, 200, 220)
RemoteCount.TextSize = 13
RemoteCount.Font = Enum.Font.Gotham
RemoteCount.TextXAlignment = Enum.TextXAlignment.Left
RemoteCount.Parent = ContentContainer

-- Barra de pesquisa
local SearchBox = Instance.new("TextBox")
SearchBox.Name = "SearchBox"
SearchBox.Size = UDim2.new(1, -20, 0, 32)
SearchBox.Position = UDim2.new(0, 10, 0, 40)
SearchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
SearchBox.BorderSizePixel = 0
SearchBox.PlaceholderText = "🔍 Pesquisar remotes..."
SearchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 170)
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.TextSize = 13
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
SearchBox.ClearTextOnFocus = false
SearchBox.Parent = ContentContainer

local UICorner4 = Instance.new("UICorner")
UICorner4.CornerRadius = UDim.new(0, 6)
UICorner4.Parent = SearchBox

local Padding = Instance.new("UIPadding")
Padding.PaddingLeft = UDim.new(0, 10)
Padding.Parent = SearchBox

-- Container da lista de remotes
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Size = UDim2.new(1, -20, 1, -90)
ScrollFrame.Position = UDim2.new(0, 10, 0, 80)
ScrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 5
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 100)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollFrame.Parent = ContentContainer

local UICorner5 = Instance.new("UICorner")
UICorner5.CornerRadius = UDim.new(0, 6)
UICorner5.Parent = ScrollFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 4)
ListLayout.Parent = ScrollFrame

local Padding2 = Instance.new("UIPadding")
Padding2.PaddingTop = UDim.new(0, 5)
Padding2.PaddingBottom = UDim.new(0, 5)
Padding2.PaddingLeft = UDim.new(0, 5)
Padding2.PaddingRight = UDim.new(0, 5)
Padding2.Parent = ScrollFrame

-- Função para obter todos os remotes do servidor
local function getAllRemotes()
    local remotes = {}
    
    local function searchInInstance(instance, path)
        for _, child in ipairs(instance:GetChildren()) do
            local newPath = path .. "." .. child.Name
            
            if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") or 
               child:IsA("BindableEvent") or child:IsA("BindableFunction") then
                local remoteType = child.ClassName
                
                table.insert(remotes, {
                    Instance = child,
                    Path = newPath,
                    Type = remoteType,
                    Name = child.Name
                })
            end
            
            searchInInstance(child, newPath)
        end
    end
    
    searchInInstance(game, "game")
    
    table.sort(remotes, function(a, b)
        return a.Name:lower() < b.Name:lower()
    end)
    
    return remotes
end

-- Função para criar um item da lista
local function createRemoteItem(remoteData)
    local RemoteItem = Instance.new("Frame")
    RemoteItem.Name = "RemoteItem"
    RemoteItem.Size = UDim2.new(1, -10, 0, 55)
    RemoteItem.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
    RemoteItem.BorderSizePixel = 0
    
    local UICorner6 = Instance.new("UICorner")
    UICorner6.CornerRadius = UDim.new(0, 6)
    UICorner6.Parent = RemoteItem
    
    -- Nome do remote
    local RemoteName = Instance.new("TextLabel")
    RemoteName.Name = "RemoteName"
    RemoteName.Size = UDim2.new(1, -120, 0, 20)
    RemoteName.Position = UDim2.new(0, 10, 0, 8)
    RemoteName.BackgroundTransparency = 1
    RemoteName.Text = remoteData.Name
    RemoteName.TextColor3 = Color3.fromRGB(255, 255, 255)
    RemoteName.TextSize = 14
    RemoteName.Font = Enum.Font.GothamBold
    RemoteName.TextXAlignment = Enum.TextXAlignment.Left
    RemoteName.TextTruncate = Enum.TextTruncate.AtEnd
    RemoteName.Parent = RemoteItem
    
    -- Tipo do remote
    local RemoteType = Instance.new("TextLabel")
    RemoteType.Name = "RemoteType"
    RemoteType.Size = UDim2.new(0.4, 0, 0, 18)
    RemoteType.Position = UDim2.new(0, 10, 0, 30)
    RemoteType.BackgroundColor3 = Color3.fromRGB(70, 100, 150)
    RemoteType.BorderSizePixel = 0
    RemoteType.Text = remoteData.Type
    RemoteType.TextColor3 = Color3.fromRGB(255, 255, 255)
    RemoteType.TextSize = 11
    RemoteType.Font = Enum.Font.Gotham
    RemoteType.Parent = RemoteItem
    
    local UICorner7 = Instance.new("UICorner")
    UICorner7.CornerRadius = UDim.new(0, 4)
    UICorner7.Parent = RemoteType
    
    -- Botão de copiar
    local CopyButton = Instance.new("TextButton")
    CopyButton.Name = "CopyButton"
    CopyButton.Size = UDim2.new(0, 90, 0, 28)
    CopyButton.Position = UDim2.new(1, -100, 0.5, -14)
    CopyButton.AnchorPoint = Vector2.new(0, 0.5)
    CopyButton.BackgroundColor3 = Color3.fromRGB(60, 150, 80)
    CopyButton.BorderSizePixel = 0
    CopyButton.Text = "📋 Copiar"
    CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CopyButton.TextSize = 11
    CopyButton.Font = Enum.Font.Gotham
    CopyButton.Parent = RemoteItem
    
    local UICorner8 = Instance.new("UICorner")
    UICorner8.CornerRadius = UDim.new(0, 6)
    UICorner8.Parent = CopyButton
    
    -- Tooltip
    local Tooltip = Instance.new("TextLabel")
    Tooltip.Name = "Tooltip"
    Tooltip.Size = UDim2.new(1, -20, 0, 0)
    Tooltip.Position = UDim2.new(0, 10, 1, -18)
    Tooltip.BackgroundTransparency = 1
    Tooltip.Text = remoteData.Path
    Tooltip.TextColor3 = Color3.fromRGB(180, 180, 200)
    Tooltip.TextSize = 10
    Tooltip.Font = Enum.Font.Gotham
    Tooltip.TextXAlignment = Enum.TextXAlignment.Left
    Tooltip.TextTruncate = Enum.TextTruncate.AtEnd
    Tooltip.Visible = false
    Tooltip.Parent = RemoteItem
    
    -- Funções dos botões
    CopyButton.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(remoteData.Path)
            CopyButton.Text = "✓ Copiado!"
            CopyButton.BackgroundColor3 = Color3.fromRGB(80, 180, 100)
            
            task.wait(1)
            CopyButton.Text = "📋 Copiar"
            CopyButton.BackgroundColor3 = Color3.fromRGB(60, 150, 80)
        else
            CopyButton.Text = "Sem acesso"
            CopyButton.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
            
            task.wait(1)
            CopyButton.Text = "📋 Copiar"
            CopyButton.BackgroundColor3 = Color3.fromRGB(60, 150, 80)
        end
    end)
    
    RemoteItem.MouseEnter:Connect(function()
        Tooltip.Visible = true
    end)
    
    RemoteItem.MouseLeave:Connect(function()
        Tooltip.Visible = false
    end)
    
    return RemoteItem
end

-- Função para atualizar a lista
local function updateRemoteList(searchText)
    local remotes = getAllRemotes()
    local filteredRemotes = {}
    local searchLower = searchText and searchText:lower() or ""
    
    for _, remote in ipairs(remotes) do
        if searchText == "" or 
           remote.Name:lower():find(searchLower) or 
           remote.Path:lower():find(searchLower) or
           remote.Type:lower():find(searchLower) then
            table.insert(filteredRemotes, remote)
        end
    end
    
    for _, child in ipairs(ScrollFrame:GetChildren()) do
        if child:IsA("Frame") and child.Name == "RemoteItem" then
            child:Destroy()
        end
    end
    
    for _, remote in ipairs(filteredRemotes) do
        local item = createRemoteItem(remote)
        item.Parent = ScrollFrame
    end
    
    RemoteCount.Text = string.format("📊 %d Remote(s) | Filtrado: %d", #remotes, #filteredRemotes)
end

-- Configurar funcionalidade de arrastar
local function setupDragging()
    local UserInputService = game:GetService("UserInputService")
    local dragging = false
    local dragStart, startPos
    
    local function updateInput(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateInput(input)
        end
    end)
end

-- Função de animação
local function tween(obj, props, duration)
    local tweenInfo = TweenInfo.new(duration or ANIMATION_SPEED, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = game:GetService("TweenService"):Create(obj, tweenInfo, props)
    tween:Play()
    return tween
end

-- Função para minimizar/maximizar
local function toggleMinimize()
    IS_MINIMIZED = not IS_MINIMIZED
    
    if IS_MINIMIZED then
        -- Minimizar: só mostra a barra de título
        tween(MainFrame, {Size = UDim2.new(0, 400, 0, 45)})
        tween(ContentContainer, {Size = UDim2.new(1, 0, 0, 0)})
        ContentContainer.Visible = false
        MinimizeButton.Text = "□"
        MinimizeButton.BackgroundColor3 = Color3.fromRGB(100, 160, 220)
    else
        -- Maximizar: mostra conteúdo completo
        ContentContainer.Visible = true
        tween(MainFrame, {Size = UDim2.new(0, 400, 0, 200)})
        tween(ContentContainer, {Size = UDim2.new(1, 0, 1, -45)})
        MinimizeButton.Text = "_"
        MinimizeButton.BackgroundColor3 = Color3.fromRGB(80, 130, 200)
    end
end

-- Função de entrada animada
local function animateEntry()
    -- Primeiro move para fora da tela
    MainFrame.Position = UDim2.new(0.5, -200, 0, -250)
    
    -- Anima para o centro da tela
    tween(MainFrame, {
        Position = UDim2.new(0.5, -200, 0.5, -100)
    }, 0.5)
end

-- Configurar eventos
CloseButton.MouseButton1Click:Connect(function()
    tween(MainFrame, {
        Position = UDim2.new(0.5, -200, 0, -250),
        Size = UDim2.new(0, 400, 0, 0)
    }, 0.3)
    
    task.wait(0.3)
    RemoteViewer:Destroy()
end)

MinimizeButton.MouseButton1Click:Connect(toggleMinimize)

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    updateRemoteList(SearchBox.Text)
end)

-- Configurar tecla C para minimizar
local UserInputService = game:GetService("UserInputService")
local lastCTime = 0

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.C then
        local currentTime = tick()
        
        -- Prevenir múltiplos toques rápidos
        if currentTime - lastCTime > 0.2 then
            lastCTime = currentTime
            toggleMinimize()
        end
    end
end)

-- Botão de refresh
local RefreshButton = Instance.new("TextButton")
RefreshButton.Name = "RefreshButton"
RefreshButton.Size = UDim2.new(0, 30, 0, 30)
RefreshButton.Position = UDim2.new(1, -120, 0.5, -15)
RefreshButton.AnchorPoint = Vector2.new(0, 0.5)
RefreshButton.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
RefreshButton.BorderSizePixel = 0
RefreshButton.Text = "🔄"
RefreshButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RefreshButton.TextSize = 16
RefreshButton.Font = Enum.Font.GothamBold
RefreshButton.Parent = TitleBar

local UICornerRefresh = Instance.new("UICorner")
UICornerRefresh.CornerRadius = UDim.new(0, 6)
UICornerRefresh.Parent = RefreshButton

RefreshButton.MouseButton1Click:Connect(function()
    RefreshButton.Text = "⏳"
    RefreshButton.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
    
    updateRemoteList(SearchBox.Text)
    
    task.wait(0.5)
    RefreshButton.Text = "🔄"
    RefreshButton.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
end)

-- Inicializar
setupDragging()
RemoteViewer.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Animar entrada
animateEntry()

-- Carregar remotes inicialmente
task.spawn(function()
    task.wait(0.5) -- Esperar animação terminar
    updateRemoteList("")
    
    -- Atualizar automaticamente
    while RemoteViewer.Parent do
        task.wait(15)
        if RemoteViewer.Parent and not IS_MINIMIZED then
            updateRemoteList(SearchBox.Text)
        end
    end
end)

-- Indicador de tecla C
local KeyHint = Instance.new("TextLabel")
KeyHint.Name = "KeyHint"
KeyHint.Size = UDim2.new(0, 80, 0, 20)
KeyHint.Position = UDim2.new(0.5, -40, 1, 5)
KeyHint.AnchorPoint = Vector2.new(0.5, 0)
KeyHint.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
KeyHint.BorderSizePixel = 0
KeyHint.Text = "Pressione C para minimizar"
KeyHint.TextColor3 = Color3.fromRGB(180, 180, 200)
KeyHint.TextSize = 10
KeyHint.Font = Enum.Font.Gotham
KeyHint.Parent = MainFrame

local UICornerHint = Instance.new("UICorner")
UICornerHint.CornerRadius = UDim.new(0, 4)
UICornerHint.Parent = KeyHint

-- Esconder hint após alguns segundos
task.spawn(function()
    task.wait(5)
    tween(KeyHint, {BackgroundTransparency = 1, TextTransparency = 1}, 0.5)
    
    task.wait(0.5)
    KeyHint.Visible = false
end)

return RemoteViewer
