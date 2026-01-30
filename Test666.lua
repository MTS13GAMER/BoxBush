-- Script de Lista de Remotes
-- Autor: Script Assistente
-- Data: 2024

-- Instância principal da interface
local RemoteViewer = Instance.new("ScreenGui")
RemoteViewer.Name = "RemoteViewer"
RemoteViewer.ResetOnSpawn = false
RemoteViewer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Frame principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 450, 0, 500)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -250)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = RemoteViewer

-- Arredondar bordas
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Barra de título
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 8)
UICorner2.Parent = TitleBar

-- Título
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -80, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "📡 Remote Viewer"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

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

-- Contador de remotes
local RemoteCount = Instance.new("TextLabel")
RemoteCount.Name = "RemoteCount"
RemoteCount.Size = UDim2.new(1, -20, 0, 30)
RemoteCount.Position = UDim2.new(0, 10, 0, 50)
RemoteCount.BackgroundTransparency = 1
RemoteCount.Text = "Carregando remotes..."
RemoteCount.TextColor3 = Color3.fromRGB(200, 200, 220)
RemoteCount.TextSize = 14
RemoteCount.Font = Enum.Font.Gotham
RemoteCount.TextXAlignment = Enum.TextXAlignment.Left
RemoteCount.Parent = MainFrame

-- Barra de pesquisa
local SearchBox = Instance.new("TextBox")
SearchBox.Name = "SearchBox"
SearchBox.Size = UDim2.new(1, -20, 0, 35)
SearchBox.Position = UDim2.new(0, 10, 0, 85)
SearchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
SearchBox.BorderSizePixel = 0
SearchBox.PlaceholderText = "🔍 Pesquisar remotes..."
SearchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 170)
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.TextSize = 14
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
SearchBox.ClearTextOnFocus = false
SearchBox.Parent = MainFrame

local UICorner4 = Instance.new("UICorner")
UICorner4.CornerRadius = UDim.new(0, 6)
UICorner4.Parent = SearchBox

local Padding = Instance.new("UIPadding")
Padding.PaddingLeft = UDim.new(0, 10)
Padding.Parent = SearchBox

-- Container da lista de remotes
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Size = UDim2.new(1, -20, 1, -150)
ScrollFrame.Position = UDim2.new(0, 10, 0, 130)
ScrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 100)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollFrame.Parent = MainFrame

local UICorner5 = Instance.new("UICorner")
UICorner5.CornerRadius = UDim.new(0, 6)
UICorner5.Parent = ScrollFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 5)
ListLayout.Parent = ScrollFrame

local Padding2 = Instance.new("UIPadding")
Padding2.PaddingTop = UDim.new(0, 5)
Padding2.PaddingBottom = UDim.new(0, 5)
Padding2.PaddingLeft = UDim.new(0, 5)
Padding2.PaddingRight = UDim.new(0, 5)
Padding2.Parent = ScrollFrame

-- Variáveis para funcionalidade de arrastar
local dragToggle, dragInput, dragStart, startPos, dragging

-- Função para obter todos os remotes do servidor
local function getAllRemotes()
    local remotes = {}
    
    -- Função recursiva para buscar em todas as instâncias
    local function searchInInstance(instance, path)
        for _, child in ipairs(instance:GetChildren()) do
            local newPath = path .. "." .. child.Name
            
            -- Verificar se é um RemoteEvent ou RemoteFunction
            if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") or child:IsA("BindableEvent") or child:IsA("BindableFunction") then
                local remoteType = child.ClassName
                local fullPath = newPath
                
                table.insert(remotes, {
                    Instance = child,
                    Path = fullPath,
                    Type = remoteType,
                    Name = child.Name
                })
            end
            
            -- Continuar buscando recursivamente
            searchInInstance(child, newPath)
        end
    end
    
    -- Começar a busca a partir do game
    searchInInstance(game, "game")
    
    -- Ordenar por nome
    table.sort(remotes, function(a, b)
        return a.Name:lower() < b.Name:lower()
    end)
    
    return remotes
end

-- Função para criar um item da lista
local function createRemoteItem(remoteData)
    local RemoteItem = Instance.new("Frame")
    RemoteItem.Name = "RemoteItem"
    RemoteItem.Size = UDim2.new(1, -10, 0, 60)
    RemoteItem.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
    RemoteItem.BorderSizePixel = 0
    
    local UICorner6 = Instance.new("UICorner")
    UICorner6.CornerRadius = UDim.new(0, 6)
    UICorner6.Parent = RemoteItem
    
    -- Nome do remote
    local RemoteName = Instance.new("TextLabel")
    RemoteName.Name = "RemoteName"
    RemoteName.Size = UDim2.new(1, -10, 0, 20)
    RemoteName.Position = UDim2.new(0, 10, 0, 8)
    RemoteName.BackgroundTransparency = 1
    RemoteName.Text = remoteData.Name
    RemoteName.TextColor3 = Color3.fromRGB(255, 255, 255)
    RemoteName.TextSize = 16
    RemoteName.Font = Enum.Font.GothamBold
    RemoteName.TextXAlignment = Enum.TextXAlignment.Left
    RemoteName.TextTruncate = Enum.TextTruncate.AtEnd
    RemoteName.Parent = RemoteItem
    
    -- Tipo do remote
    local RemoteType = Instance.new("TextLabel")
    RemoteType.Name = "RemoteType"
    RemoteType.Size = UDim2.new(0.3, 0, 0, 18)
    RemoteType.Position = UDim2.new(0, 10, 0, 30)
    RemoteType.BackgroundColor3 = Color3.fromRGB(70, 100, 150)
    RemoteType.BorderSizePixel = 0
    RemoteType.Text = remoteData.Type
    RemoteType.TextColor3 = Color3.fromRGB(255, 255, 255)
    RemoteType.TextSize = 12
    RemoteType.Font = Enum.Font.Gotham
    RemoteType.Parent = RemoteItem
    
    local UICorner7 = Instance.new("UICorner")
    UICorner7.CornerRadius = UDim.new(0, 4)
    UICorner7.Parent = RemoteType
    
    -- Botão de copiar
    local CopyButton = Instance.new("TextButton")
    CopyButton.Name = "CopyButton"
    CopyButton.Size = UDim2.new(0, 100, 0, 30)
    CopyButton.Position = UDim2.new(1, -110, 0, 15)
    CopyButton.BackgroundColor3 = Color3.fromRGB(60, 150, 80)
    CopyButton.BorderSizePixel = 0
    CopyButton.Text = "📋 Copiar Caminho"
    CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CopyButton.TextSize = 12
    CopyButton.Font = Enum.Font.Gotham
    CopyButton.Parent = RemoteItem
    
    local UICorner8 = Instance.new("UICorner")
    UICorner8.CornerRadius = UDim.new(0, 6)
    UICorner8.Parent = CopyButton
    
    -- Tooltip para mostrar o caminho completo
    local Tooltip = Instance.new("TextLabel")
    Tooltip.Name = "Tooltip"
    Tooltip.Size = UDim2.new(1, -20, 0, 0)
    Tooltip.Position = UDim2.new(0, 10, 1, -20)
    Tooltip.BackgroundTransparency = 1
    Tooltip.Text = remoteData.Path
    Tooltip.TextColor3 = Color3.fromRGB(180, 180, 200)
    Tooltip.TextSize = 11
    Tooltip.Font = Enum.Font.Gotham
    Tooltip.TextXAlignment = Enum.TextXAlignment.Left
    Tooltip.TextTruncate = Enum.TextTruncate.AtEnd
    Tooltip.Visible = false
    Tooltip.Parent = RemoteItem
    
    -- Funções dos botões
    CopyButton.MouseButton1Click:Connect(function()
        -- Copiar para o clipboard
        if setclipboard then
            setclipboard(remoteData.Path)
            CopyButton.Text = "✓ Copiado!"
            CopyButton.BackgroundColor3 = Color3.fromRGB(80, 180, 100)
            
            task.wait(1)
            CopyButton.Text = "📋 Copiar Caminho"
            CopyButton.BackgroundColor3 = Color3.fromRGB(60, 150, 80)
        else
            CopyButton.Text = "Erro: setclipboard"
            CopyButton.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
            
            task.wait(1)
            CopyButton.Text = "📋 Copiar Caminho"
            CopyButton.BackgroundColor3 = Color3.fromRGB(60, 150, 80)
        end
    end)
    
    -- Mostrar tooltip ao passar o mouse
    RemoteItem.MouseEnter:Connect(function()
        Tooltip.Visible = true
    end)
    
    RemoteItem.MouseLeave:Connect(function()
        Tooltip.Visible = false
    end)
    
    return RemoteItem
end

-- Função para atualizar a lista de remotes
local function updateRemoteList(searchText)
    local remotes = getAllRemotes()
    local filteredRemotes = {}
    local searchLower = searchText and searchText:lower() or ""
    
    -- Filtrar remotes se houver texto de pesquisa
    for _, remote in ipairs(remotes) do
        if searchText == "" or 
           remote.Name:lower():find(searchLower) or 
           remote.Path:lower():find(searchLower) or
           remote.Type:lower():find(searchLower) then
            table.insert(filteredRemotes, remote)
        end
    end
    
    -- Limpar lista atual
    for _, child in ipairs(ScrollFrame:GetChildren()) do
        if child:IsA("Frame") and child.Name == "RemoteItem" then
            child:Destroy()
        end
    end
    
    -- Adicionar remotes filtrados
    for _, remote in ipairs(filteredRemotes) do
        local item = createRemoteItem(remote)
        item.Parent = ScrollFrame
    end
    
    -- Atualizar contador
    RemoteCount.Text = string.format("📊 %d Remote(s) encontrado(s) | Filtrado: %d", #remotes, #filteredRemotes)
    
    if #filteredRemotes == 0 and searchText ~= "" then
        RemoteCount.Text = RemoteCount.Text .. " | Nenhum resultado para: '" .. searchText .. "'"
    end
end

-- Configurar funcionalidade de arrastar
local function setupDragging()
    local UserInputService = game:GetService("UserInputService")
    
    local function updateInput(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
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
        if input == dragInput and dragging then
            updateInput(input)
        end
    end)
end

-- Configurar eventos dos botões
CloseButton.MouseButton1Click:Connect(function()
    RemoteViewer:Destroy()
end)

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    updateRemoteList(SearchBox.Text)
end)

-- Inicializar
setupDragging()
RemoteViewer.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Carregar remotes inicialmente
task.spawn(function()
    updateRemoteList("")
    
    -- Atualizar automaticamente a cada 10 segundos
    while RemoteViewer.Parent do
        task.wait(10)
        if RemoteViewer.Parent then
            updateRemoteList(SearchBox.Text)
        end
    end
end)

-- Botão de refresh
local RefreshButton = Instance.new("TextButton")
RefreshButton.Name = "RefreshButton"
RefreshButton.Size = UDim2.new(0, 30, 0, 30)
RefreshButton.Position = UDim2.new(1, -80, 0.5, -15)
RefreshButton.AnchorPoint = Vector2.new(0, 0.5)
RefreshButton.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
RefreshButton.BorderSizePixel = 0
RefreshButton.Text = "🔄"
RefreshButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RefreshButton.TextSize = 18
RefreshButton.Font = Enum.Font.GothamBold
RefreshButton.Parent = TitleBar

local UICorner9 = Instance.new("UICorner")
UICorner9.CornerRadius = UDim.new(0, 6)
UICorner9.Parent = RefreshButton

RefreshButton.MouseButton1Click:Connect(function()
    RefreshButton.Text = "⏳"
    RefreshButton.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
    
    updateRemoteList(SearchBox.Text)
    
    task.wait(0.5)
    RefreshButton.Text = "🔄"
    RefreshButton.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
end)

-- Mensagem de ajuda
local HelpLabel = Instance.new("TextLabel")
HelpLabel.Name = "HelpLabel"
HelpLabel.Size = UDim2.new(1, -20, 0, 20)
HelpLabel.Position = UDim2.new(0, 10, 1, -25)
HelpLabel.BackgroundTransparency = 1
HelpLabel.Text = "Dica: Passe o mouse sobre um remote para ver o caminho completo"
HelpLabel.TextColor3 = Color3.fromRGB(150, 150, 170)
HelpLabel.TextSize = 11
HelpLabel.Font = Enum.Font.Gotham
HelpLabel.TextXAlignment = Enum.TextXAlignment.Left
HelpLabel.Parent = MainFrame

return RemoteViewer
