-- GhostlyBush Library v2.0 (Interface Aprimorada)
-- Por: MTS13GAMER
-- Interface moderna com arraste, minimizar e fechar

-- Serviços do Roblox
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

-- Função utilitária para criar instâncias
local function Create(class, properties)
    local obj = Instance.new(class)
    for prop, value in pairs(properties) do
        if prop ~= "Parent" then
            if type(value) == "table" and value.ClassName then
                obj[prop] = value
            else
                obj[prop] = value
            end
        end
    end
    if properties.Parent then
        obj.Parent = properties.Parent
    end
    return obj
end

-- Função para criar tweens
local function Tween(obj, properties, duration, easingStyle, easingDirection)
    local tweenInfo = TweenInfo.new(
        duration or 0.2,
        easingStyle or Enum.EasingStyle.Quad,
        easingDirection or Enum.EasingDirection.Out
    )
    local tween = TweenService:Create(obj, tweenInfo, properties)
    tween:Play()
    return tween
end

-- Biblioteca principal
local GhostlyBush = {
    Version = "2.0.0",
    Themes = {},
    CurrentTheme = "Dark",
    Windows = {}
}

-- Configurações padrão
local DefaultConfig = {
    Title = "GhostlyBush Window",
    Icon = "rbxassetid://6031094667", -- Ícone padrão do Roblox
    Author = "GhostlyBush",
    Size = UDim2.fromOffset(600, 450),
    MinSize = Vector2.new(500, 350),
    MaxSize = Vector2.new(800, 600),
    Position = UDim2.fromScale(0.5, 0.5),
    Transparent = false,
    Theme = "Dark",
    Draggable = true,
    Resizable = true,
    SideBarWidth = 220,
    BackgroundImageTransparency = 0.5,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    CloseKey = Enum.KeyCode.RightControl,
    AnimationSpeed = 0.2,
    BlurBackground = false
}

-- Tema Dark aprimorado
GhostlyBush.Themes.Dark = {
    Main = Color3.fromRGB(30, 30, 35),
    Secondary = Color3.fromRGB(40, 40, 45),
    Accent = Color3.fromRGB(0, 120, 215),
    Text = Color3.fromRGB(240, 240, 240),
    SubText = Color3.fromRGB(180, 180, 180),
    Outline = Color3.fromRGB(60, 60, 65),
    Success = Color3.fromRGB(45, 180, 45),
    Warning = Color3.fromRGB(255, 160, 0),
    Error = Color3.fromRGB(220, 60, 60),
    Hover = Color3.fromRGB(50, 50, 55),
    Pressed = Color3.fromRGB(35, 35, 40),
    Shadow = Color3.fromRGB(0, 0, 0),
    Tooltip = Color3.fromRGB(50, 50, 55)
}

-- Tema Light
GhostlyBush.Themes.Light = {
    Main = Color3.fromRGB(245, 245, 245),
    Secondary = Color3.fromRGB(230, 230, 230),
    Accent = Color3.fromRGB(0, 120, 215),
    Text = Color3.fromRGB(30, 30, 30),
    SubText = Color3.fromRGB(100, 100, 100),
    Outline = Color3.fromRGB(210, 210, 210),
    Success = Color3.fromRGB(45, 180, 45),
    Warning = Color3.fromRGB(255, 160, 0),
    Error = Color3.fromRGB(220, 60, 60),
    Hover = Color3.fromRGB(220, 220, 220),
    Pressed = Color3.fromRGB(200, 200, 200),
    Shadow = Color3.fromRGB(0, 0, 0, 0.3),
    Tooltip = Color3.fromRGB(250, 250, 250)
}

-- Classe Window
local Window = {}
Window.__index = Window

function Window.new(config)
    local self = setmetatable({}, Window)
    
    -- Mesclar configurações com padrões
    for key, value in pairs(DefaultConfig) do
        self[key] = config[key] or value
    end
    
    -- Configurações específicas
    self.Title = config.Title or DefaultConfig.Title
    self.Icon = config.Icon or DefaultConfig.Icon
    self.Author = config.Author or DefaultConfig.Author
    self.Folder = config.Folder or "GhostlyBushConfig"
    self.Background = config.Background
    self.User = config.User or {Enabled = false}
    self.KeySystem = config.KeySystem
    
    -- Estado
    self.Tabs = {}
    self.Elements = {}
    self.Connections = {}
    self.Open = true
    self.Minimized = false
    self.Dragging = false
    self.DragStart = nil
    self.DragStartPosition = nil
    
    -- Criar UI
    self:CreateUI()
    
    -- Adicionar à lista de janelas
    table.insert(GhostlyBush.Windows, self)
    
    return self
end

function Window:CreateUI()
    -- ScreenGui principal
    self.ScreenGui = Create("ScreenGui", {
        Name = "GhostlyBush_" .. HttpService:GenerateGUID(false):sub(1, 8),
        DisplayOrder = 999,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    })
    
    -- Frame principal
    self.MainFrame = Create("Frame", {
        Name = "MainFrame",
        Size = self.Size,
        Position = self.Position,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Main,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Active = true,
        Selectable = true
    })
    
    -- Sombreamento elegante
    local shadow = Create("ImageLabel", {
        Name = "Shadow",
        Size = UDim2.new(1, 20, 1, 20),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://1316045217",
        ImageColor3 = GhostlyBush.Themes[self.Theme].Shadow,
        ImageTransparency = 0.8,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(10, 10, 118, 118),
        ZIndex = -1
    })
    
    -- Arredondamento do frame principal
    local corner = Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = self.MainFrame
    })
    
    -- Barra superior aprimorada
    self.TopBar = Create("Frame", {
        Name = "TopBar",
        Size = UDim2.new(1, 0, 0, 45),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary,
        BorderSizePixel = 0,
        Parent = self.MainFrame
    })
    
    -- Arredondar apenas os cantos superiores
    local topBarCorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = self.TopBar
    })
    
    -- Ajustar o corner para arredondar apenas o topo
    local topBarMask = Create("Frame", {
        Size = UDim2.new(1, 0, 1, 12),
        Position = UDim2.new(0, 0, 1, -12),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary,
        BorderSizePixel = 0,
        Parent = self.TopBar
    })
    
    -- Ícone do título
    local icon = Create("ImageLabel", {
        Name = "Icon",
        Size = UDim2.new(0, 24, 0, 24),
        Position = UDim2.new(0, 15, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Image = self.Icon,
        ImageColor3 = GhostlyBush.Themes[self.Theme].Accent,
        Parent = self.TopBar
    })
    
    -- Título
    self.TitleLabel = Create("TextLabel", {
        Name = "TitleLabel",
        Size = UDim2.new(1, -150, 1, 0),
        Position = UDim2.new(0, 50, 0, 0),
        BackgroundTransparency = 1,
        Text = self.Title,
        TextColor3 = GhostlyBush.Themes[self.Theme].Text,
        TextSize = 16,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = self.TopBar
    })
    
    -- Controles da janela
    local controlsFrame = Create("Frame", {
        Name = "Controls",
        Size = UDim2.new(0, 105, 1, 0),
        Position = UDim2.new(1, -110, 0, 0),
        BackgroundTransparency = 1,
        Parent = self.TopBar
    })
    
    -- Botão minimizar
    self.MinimizeButton = Create("TextButton", {
        Name = "MinimizeButton",
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(0, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary,
        Text = "_",
        TextColor3 = GhostlyBush.Themes[self.Theme].Text,
        TextSize = 20,
        Font = Enum.Font.GothamBold,
        AutoButtonColor = false,
        Parent = controlsFrame
    })
    
    local minimizeCorner = Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = self.MinimizeButton
    })
    
    -- Botão fechar (X)
    self.CloseButton = Create("TextButton", {
        Name = "CloseButton",
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -35, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Error,
        Text = "×",
        TextColor3 = Color3.new(1, 1, 1),
        TextSize = 24,
        Font = Enum.Font.GothamBold,
        AutoButtonColor = false,
        Parent = controlsFrame
    })
    
    local closeCorner = Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = self.CloseButton
    })
    
    -- Sidebar elegante
    self.SideBar = Create("Frame", {
        Name = "SideBar",
        Size = UDim2.new(0, self.SideBarWidth, 1, -45),
        Position = UDim2.new(0, 0, 0, 45),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary,
        BorderSizePixel = 0,
        Parent = self.MainFrame
    })
    
    -- Separador
    local separator = Create("Frame", {
        Name = "Separator",
        Size = UDim2.new(0, 1, 1, 0),
        Position = UDim2.new(1, 0, 0, 0),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Outline,
        BorderSizePixel = 0,
        Parent = self.SideBar
    })
    
    -- Área de conteúdo
    self.Content = Create("Frame", {
        Name = "Content",
        Size = UDim2.new(1, -self.SideBarWidth, 1, -45),
        Position = UDim2.new(0, self.SideBarWidth, 0, 45),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Main,
        BorderSizePixel = 0,
        Parent = self.MainFrame
    })
    
    -- Container de abas
    self.TabContainer = Create("ScrollingFrame", {
        Name = "TabContainer",
        Size = UDim2.new(1, 0, 1, -20),
        Position = UDim2.new(0, 0, 0, 20),
        BackgroundTransparency = 1,
        ScrollBarThickness = self.ScrollBarEnabled and 5 or 0,
        ScrollBarImageColor3 = GhostlyBush.Themes[self.Theme].Accent,
        ScrollBarImageTransparency = 0.5,
        Parent = self.SideBar
    })
    
    local listLayout = Create("UIListLayout", {
        Parent = self.TabContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 8)
    })
    
    Create("UIPadding", {
        Parent = self.TabContainer,
        PaddingTop = UDim.new(0, 5),
        PaddingLeft = UDim.new(0, 15),
        PaddingRight = UDim.new(0, 15)
    })
    
    -- Configurar arraste da janela
    if self.Draggable then
        self:SetupDragging()
    end
    
    -- Configurar efeitos hover nos botões
    self:SetupButtonEffects()
    
    -- Configurar eventos dos botões
    self:SetupButtonEvents()
    
    -- Configurar parentes
    shadow.Parent = self.MainFrame
    self.MainFrame.Parent = self.ScreenGui
    self.ScreenGui.Parent = CoreGui
    
    return self
end

function Window:SetupDragging()
    local topBar = self.TopBar
    
    local dragStart, startPos
    
    local function updateDrag(input)
        local delta = input.Position - dragStart
        local newPosition = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
        
        -- Limitar à tela
        local viewportSize = workspace.CurrentCamera.ViewportSize
        local frameSize = self.MainFrame.AbsoluteSize
        
        local minX = -frameSize.X * (1 - self.MainFrame.AnchorPoint.X)
        local maxX = viewportSize.X - frameSize.X * self.MainFrame.AnchorPoint.X
        local minY = -frameSize.Y * (1 - self.MainFrame.AnchorPoint.Y)
        local maxY = viewportSize.Y - frameSize.Y * self.MainFrame.AnchorPoint.Y
        
        local x = math.clamp(newPosition.X.Offset, minX, maxX)
        local y = math.clamp(newPosition.Y.Offset, minY, maxY)
        
        self.MainFrame.Position = UDim2.new(newPosition.X.Scale, x, newPosition.Y.Scale, y)
    end
    
    -- Mouse/Desktop
    local connection1 = topBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragStart = input.Position
            startPos = self.MainFrame.Position
            self.Dragging = true
            
            local connection
            connection = UserInputService.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement and self.Dragging then
                    updateDrag(input)
                end
            end)
            
            table.insert(self.Connections, connection)
        end
    end)
    
    local connection2 = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            self.Dragging = false
        end
    end)
    
    -- Toque/Mobile
    local connection3 = topBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragStart = input.Position
            startPos = self.MainFrame.Position
            self.Dragging = true
        end
    end)
    
    local connection4 = UserInputService.TouchEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            self.Dragging = false
        end
    end)
    
    table.insert(self.Connections, connection1)
    table.insert(self.Connections, connection2)
    table.insert(self.Connections, connection3)
    table.insert(self.Connections, connection4)
end

function Window:SetupButtonEffects()
    -- Efeitos do botão minimizar
    self.MinimizeButton.MouseEnter:Connect(function()
        Tween(self.MinimizeButton, {
            BackgroundColor3 = GhostlyBush.Themes[self.Theme].Hover,
            Size = UDim2.new(0, 32, 0, 32)
        }, 0.15)
    end)
    
    self.MinimizeButton.MouseLeave:Connect(function()
        Tween(self.MinimizeButton, {
            BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary,
            Size = UDim2.new(0, 30, 0, 30)
        }, 0.15)
    end)
    
    self.MinimizeButton.MouseButton1Down:Connect(function()
        Tween(self.MinimizeButton, {
            BackgroundColor3 = GhostlyBush.Themes[self.Theme].Pressed,
            Size = UDim2.new(0, 28, 0, 28)
        }, 0.1)
    end)
    
    self.MinimizeButton.MouseButton1Up:Connect(function()
        Tween(self.MinimizeButton, {
            BackgroundColor3 = GhostlyBush.Themes[self.Theme].Hover,
            Size = UDim2.new(0, 32, 0, 32)
        }, 0.1)
    end)
    
    -- Efeitos do botão fechar
    self.CloseButton.MouseEnter:Connect(function()
        Tween(self.CloseButton, {
            BackgroundColor3 = Color3.fromRGB(255, 80, 80),
            Size = UDim2.new(0, 32, 0, 32)
        }, 0.15)
    end)
    
    self.CloseButton.MouseLeave:Connect(function()
        Tween(self.CloseButton, {
            BackgroundColor3 = GhostlyBush.Themes[self.Theme].Error,
            Size = UDim2.new(0, 30, 0, 30)
        }, 0.15)
    end)
    
    self.CloseButton.MouseButton1Down:Connect(function()
        Tween(self.CloseButton, {
            BackgroundColor3 = Color3.fromRGB(255, 40, 40),
            Size = UDim2.new(0, 28, 0, 28)
        }, 0.1)
    end)
    
    self.CloseButton.MouseButton1Up:Connect(function()
        Tween(self.CloseButton, {
            BackgroundColor3 = Color3.fromRGB(255, 80, 80),
            Size = UDim2.new(0, 32, 0, 32)
        }, 0.1)
    end)
end

function Window:SetupButtonEvents()
    -- Botão minimizar
    self.MinimizeButton.MouseButton1Click:Connect(function()
        self:Minimize()
    end)
    
    -- Botão fechar
    self.CloseButton.MouseButton1Click:Connect(function()
        self:Destroy()
    end)
    
    -- Tecla de fechar
    local closeConnection = UserInputService.InputBegan:Connect(function(input, processed)
        if not processed and input.KeyCode == self.CloseKey then
            self:Destroy()
        end
    end)
    table.insert(self.Connections, closeConnection)
end

function Window:CreateTab(options)
    local tab = {
        Name = options.Name or "Tab",
        Icon = options.Icon or "rbxassetid://6031094678",
        LayoutOrder = options.LayoutOrder or #self.Tabs + 1,
        Elements = {}
    }
    
    -- Botão da aba
    local tabButton = Create("TextButton", {
        Name = tab.Name .. "TabButton",
        Size = UDim2.new(1, 0, 0, 45),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary,
        Text = "",
        AutoButtonColor = false,
        LayoutOrder = tab.LayoutOrder,
        Parent = self.TabContainer
    })
    
    -- Ícone da aba
    local tabIcon = Create("ImageLabel", {
        Name = "Icon",
        Size = UDim2.new(0, 22, 0, 22),
        Position = UDim2.new(0, 15, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Image = tab.Icon,
        ImageColor3 = GhostlyBush.Themes[self.Theme].SubText,
        Parent = tabButton
    })
    
    -- Título da aba
    local tabLabel = Create("TextLabel", {
        Name = "Label",
        Size = UDim2.new(1, -50, 1, 0),
        Position = UDim2.new(0, 45, 0, 0),
        BackgroundTransparency = 1,
        Text = tab.Name,
        TextColor3 = GhostlyBush.Themes[self.Theme].SubText,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = tabButton
    })
    
    -- Indicador de aba ativa
    local activeIndicator = Create("Frame", {
        Name = "ActiveIndicator",
        Size = UDim2.new(0, 3, 0.6, 0),
        Position = UDim2.new(0, 0, 0.2, 0),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Accent,
        BorderSizePixel = 0,
        Visible = false,
        Parent = tabButton
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = activeIndicator
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = tabButton
    })
    
    -- Efeitos hover do botão
    tabButton.MouseEnter:Connect(function()
        if not tabButton.Active then
            Tween(tabButton, {BackgroundColor3 = GhostlyBush.Themes[self.Theme].Hover}, 0.15)
            Tween(tabLabel, {TextColor3 = GhostlyBush.Themes[self.Theme].Text}, 0.15)
            Tween(tabIcon, {ImageColor3 = GhostlyBush.Themes[self.Theme].Text}, 0.15)
        end
    end)
    
    tabButton.MouseLeave:Connect(function()
        if not tabButton.Active then
            Tween(tabButton, {BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary}, 0.15)
            Tween(tabLabel, {TextColor3 = GhostlyBush.Themes[self.Theme].SubText}, 0.15)
            Tween(tabIcon, {ImageColor3 = GhostlyBush.Themes[self.Theme].SubText}, 0.15)
        end
    end)
    
    -- Frame do conteúdo da aba
    local tabContent = Create("ScrollingFrame", {
        Name = tab.Name .. "Content",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Visible = false,
        ScrollBarThickness = self.ScrollBarEnabled and 5 or 0,
        ScrollBarImageColor3 = GhostlyBush.Themes[self.Theme].Accent,
        ScrollBarImageTransparency = 0.5,
        Parent = self.Content
    })
    
    local contentLayout = Create("UIListLayout", {
        Parent = tabContent,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 12)
    })
    
    Create("UIPadding", {
        Parent = tabContent,
        PaddingTop = UDim.new(0, 15),
        PaddingLeft = UDim.new(0, 15),
        PaddingRight = UDim.new(0, 15),
        PaddingBottom = UDim.new(0, 15)
    })
    
    contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        tabContent.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 30)
    end)
    
    -- Selecionar aba ao clicar
    tabButton.MouseButton1Click:Connect(function()
        self:SelectTab(tab.Name)
    end)
    
    tab.Button = tabButton
    tab.Content = tabContent
    tab.ActiveIndicator = activeIndicator
    
    -- Métodos da aba
    function tab:CreateSection(options)
        local section = {
            Name = options.Name or "Section",
            Collapsible = options.Collapsible or false,
            Collapsed = options.Collapsed or false
        }
        
        local sectionFrame = Create("Frame", {
            Name = section.Name .. "Section",
            Size = UDim2.new(1, 0, 0, section.Collapsible and 50 or 60),
            BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
            BorderSizePixel = 0,
            LayoutOrder = options.LayoutOrder or #self.Elements + 1,
            Parent = self.Content
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 8),
            Parent = sectionFrame
        })
        
        Create("UIPadding", {
            Parent = sectionFrame,
            PaddingTop = UDim.new(0, 8),
            PaddingLeft = UDim.new(0, 12),
            PaddingRight = UDim.new(0, 12),
            PaddingBottom = UDim.new(0, 8)
        })
        
        local sectionHeader = Create("Frame", {
            Name = "Header",
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundTransparency = 1,
            Parent = sectionFrame
        })
        
        local sectionTitle = Create("TextLabel", {
            Name = "Title",
            Size = UDim2.new(1, -40, 1, 0),
            BackgroundTransparency = 1,
            Text = "    " .. section.Name,
            TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
            TextSize = 15,
            Font = Enum.Font.GothamSemibold,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = sectionHeader
        })
        
        section.Content = Create("Frame", {
            Name = "Content",
            Size = UDim2.new(1, 0, 1, -40),
            Position = UDim2.new(0, 0, 0, 40),
            BackgroundTransparency = 1,
            Visible = not section.Collapsed,
            Parent = sectionFrame
        })
        
        local contentList = Create("UIListLayout", {
            Parent = section.Content,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        })
        
        contentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            if not section.Collapsed then
                sectionFrame.Size = UDim2.new(1, 0, 0, 40 + contentList.AbsoluteContentSize.Y + 16)
            end
        end)
        
        -- Botão de colapso
        if section.Collapsible then
            local collapseButton = Create("TextButton", {
                Name = "CollapseButton",
                Size = UDim2.new(0, 32, 0, 32),
                Position = UDim2.new(1, -36, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
                Text = section.Collapsed and "▶" or "▼",
                TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
                TextSize = 16,
                Font = Enum.Font.GothamBold,
                AutoButtonColor = false,
                Parent = sectionHeader
            })
            
            Create("UICorner", {
                CornerRadius = UDim.new(1, 0),
                Parent = collapseButton
            })
            
            collapseButton.MouseButton1Click:Connect(function()
                section.Collapsed = not section.Collapsed
                section.Content.Visible = not section.Collapsed
                collapseButton.Text = section.Collapsed and "▶" or "▼"
                
                if section.Collapsed then
                    sectionFrame.Size = UDim2.new(1, 0, 0, 50)
                else
                    sectionFrame.Size = UDim2.new(1, 0, 0, 40 + contentList.AbsoluteContentSize.Y + 16)
                end
            end)
            
            -- Efeitos do botão de colapso
            collapseButton.MouseEnter:Connect(function()
                Tween(collapseButton, {
                    BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Hover,
                    Size = UDim2.new(0, 34, 0, 34)
                }, 0.15)
            end)
            
            collapseButton.MouseLeave:Connect(function()
                Tween(collapseButton, {
                    BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
                    Size = UDim2.new(0, 32, 0, 32)
                }, 0.15)
            end)
        end
        
        section.Frame = sectionFrame
        table.insert(self.Elements, section)
        return section
    end
    
    function tab:CreateButton(options)
        local button = {
            Name = options.Name or "Button",
            Callback = options.Callback or function() end
        }
        
        local parent = options.Section and options.Section.Content or self.Content
        local layoutOrder = options.LayoutOrder or #self.Elements + 1
        
        local buttonFrame = Create("TextButton", {
            Name = button.Name .. "Button",
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
            Text = "    " .. button.Name,
            TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            AutoButtonColor = false,
            LayoutOrder = layoutOrder,
            Parent = parent
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 8),
            Parent = buttonFrame
        })
        
        -- Efeitos hover
        buttonFrame.MouseEnter:Connect(function()
            Tween(buttonFrame, {
                BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Hover,
                Size = UDim2.new(1, 0, 0, 42)
            }, 0.15)
        end)
        
        buttonFrame.MouseLeave:Connect(function()
            Tween(buttonFrame, {
                BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
                Size = UDim2.new(1, 0, 0, 40)
            }, 0.15)
        end)
        
        buttonFrame.MouseButton1Click:Connect(function()
            button.Callback()
        end)
        
        button.Frame = buttonFrame
        table.insert(self.Elements, button)
        return button
    end
    
    function tab:CreateToggle(options)
        local toggle = {
            Name = options.Name or "Toggle",
            Default = options.Default or false,
            Callback = options.Callback or function() end,
            Value = options.Default or false
        }
        
        local parent = options.Section and options.Section.Content or self.Content
        local layoutOrder = options.LayoutOrder or #self.Elements + 1
        
        local toggleFrame = Create("Frame", {
            Name = toggle.Name .. "Toggle",
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundTransparency = 1,
            LayoutOrder = layoutOrder,
            Parent = parent
        })
        
        local toggleLabel = Create("TextLabel", {
            Name = "Label",
            Size = UDim2.new(1, -60, 1, 0),
            BackgroundTransparency = 1,
            Text = "    " .. toggle.Name,
            TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = toggleFrame
        })
        
        local toggleButton = Create("TextButton", {
            Name = "ToggleButton",
            Size = UDim2.new(0, 50, 0, 25),
            Position = UDim2.new(1, -55, 0.5, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
            Text = "",
            AutoButtonColor = false,
            Parent = toggleFrame
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = toggleButton
        })
        
        local toggleCircle = Create("Frame", {
            Name = "Circle",
            Size = UDim2.new(0, 19, 0, 19),
            Position = UDim2.new(0, 3, 0.5, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.new(1, 1, 1),
            Parent = toggleButton
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = toggleCircle
        })
        
        local function updateToggle()
            if toggle.Value then
                Tween(toggleButton, {
                    BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Accent
                }, 0.2)
                Tween(toggleCircle, {
                    Position = UDim2.new(1, -22, 0.5, 0)
                }, 0.2)
            else
                Tween(toggleButton, {
                    BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary
                }, 0.2)
                Tween(toggleCircle, {
                    Position = UDim2.new(0, 3, 0.5, 0)
                }, 0.2)
            end
            toggle.Callback(toggle.Value)
        end
        
        toggleButton.MouseButton1Click:Connect(function()
            toggle.Value = not toggle.Value
            updateToggle()
        end)
        
        updateToggle()
        table.insert(self.Elements, toggle)
        return toggle
    end
    
    -- Selecionar primeira aba automaticamente
    if #self.Tabs == 0 then
        self:SelectTab(tab.Name)
    end
    
    table.insert(self.Tabs, tab)
    return tab
end

function Window:SelectTab(tabName)
    for _, tab in ipairs(self.Tabs) do
        if tab.Name == tabName then
            -- Ativar esta aba
            tab.Content.Visible = true
            tab.Button.Active = true
            tab.ActiveIndicator.Visible = true
            
            Tween(tab.Button, {
                BackgroundColor3 = GhostlyBush.Themes[self.Theme].Hover
            }, 0.15)
            
            Tween(tab.Button.Label, {
                TextColor3 = GhostlyBush.Themes[self.Theme].Text
            }, 0.15)
            
            Tween(tab.Button.Icon, {
                ImageColor3 = GhostlyBush.Themes[self.Theme].Text
            }, 0.15)
        else
            -- Desativar outras abas
            tab.Content.Visible = false
            tab.Button.Active = false
            tab.ActiveIndicator.Visible = false
            
            Tween(tab.Button, {
                BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary
            }, 0.15)
            
            Tween(tab.Button.Label, {
                TextColor3 = GhostlyBush.Themes[self.Theme].SubText
            }, 0.15)
            
            Tween(tab.Button.Icon, {
                ImageColor3 = GhostlyBush.Themes[self.Theme].SubText
            }, 0.15)
        end
    end
end

function Window:Minimize()
    self.Minimized = not self.Minimized
    
    if self.Minimized then
        -- Salvar tamanho original
        self.OriginalSize = self.MainFrame.Size
        
        -- Minimizar: mostrar apenas a barra superior
        Tween(self.MainFrame, {
            Size = UDim2.new(self.MainFrame.Size.X.Scale, self.MainFrame.Size.X.Offset, 0, 45)
        }, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        
        self.MinimizeButton.Text = "+"
    else
        -- Restaurar tamanho original
        Tween(self.MainFrame, {
            Size = self.OriginalSize or self.Size
        }, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        
        self.MinimizeButton.Text = "_"
    end
end

function Window:Destroy()
    -- Fechar todas as conexões
    for _, connection in ipairs(self.Connections) do
        if typeof(connection) == "RBXScriptConnection" then
            connection:Disconnect()
        end
    end
    
    -- Destruir a GUI
    if self.ScreenGui then
        self.ScreenGui:Destroy()
    end
    
    -- Remover da lista de janelas
    for i, window in ipairs(GhostlyBush.Windows) do
        if window == self then
            table.remove(GhostlyBush.Windows, i)
            break
        end
    end
end

-- Métodos da biblioteca
function GhostlyBush:CreateWindow(config)
    return Window.new(config)
end

function GhostlyBush:CreateTheme(name, colors)
    self.Themes[name] = colors
end

function GhostlyBush:SetTheme(name)
    if self.Themes[name] then
        self.CurrentTheme = name
    end
end

function GhostlyBush:GetTheme(name)
    return self.Themes[name or self.CurrentTheme]
end

function GhostlyBush:DestroyAll()
    for _, window in ipairs(self.Windows) do
        window:Destroy()
    end
    self.Windows = {}
end

-- Exportar globalmente
_G.GhostlyBush = GhostlyBush

return GhostlyBush
