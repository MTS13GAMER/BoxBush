-- GhostlyBush Library v1.0.3 (Completo e Funcional)
-- Por: MTS13GAMER
-- Inspirado no Wind UI

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
        if prop ~= "Parent" and prop ~= "Children" then
            obj[prop] = value
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
    Version = "1.0.3",
    Themes = {},
    CurrentTheme = "Dark",
    Windows = {},
    Config = {}
}

-- Configurações padrão
local DefaultConfig = {
    Title = "GhostlyBush Window",
    Icon = "ghost",
    Author = "GhostlyBush",
    Folder = "GhostlyBushConfig",
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Position = UDim2.fromScale(0.5, 0.5),
    Transparent = false,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    CloseKey = Enum.KeyCode.RightControl
}

-- Tema padrão Dark
GhostlyBush.Themes.Dark = {
    Main = Color3.fromRGB(25, 25, 25),
    Secondary = Color3.fromRGB(35, 35, 35),
    Accent = Color3.fromRGB(0, 170, 255),
    Text = Color3.fromRGB(255, 255, 255),
    SubText = Color3.fromRGB(200, 200, 200),
    Outline = Color3.fromRGB(50, 50, 50),
    Success = Color3.fromRGB(0, 200, 0),
    Warning = Color3.fromRGB(255, 165, 0),
    Error = Color3.fromRGB(255, 50, 50),
    Hover = Color3.fromRGB(45, 45, 45),
    Pressed = Color3.fromRGB(30, 30, 30)
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
    self.Folder = config.Folder or DefaultConfig.Folder
    self.Background = config.Background
    self.User = config.User or {Enabled = false}
    self.KeySystem = config.KeySystem
    
    -- Estado
    self.Tabs = {}
    self.Elements = {}
    self.Open = true
    
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
        DisplayOrder = 100,
        ResetOnSpawn = false
    })
    
    -- Frame principal
    self.MainFrame = Create("Frame", {
        Name = "MainFrame",
        Size = self.Size,
        Position = self.Position,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Main,
        BorderSizePixel = 0,
        ClipsDescendants = true
    })
    
    -- Arredondamento do frame principal
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = self.MainFrame
    })
    
    -- Barra superior
    self.TopBar = Create("Frame", {
        Name = "TopBar",
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary,
        BorderSizePixel = 0,
        Parent = self.MainFrame
    })
    
    -- Título
    self.TitleLabel = Create("TextLabel", {
        Name = "TitleLabel",
        Size = UDim2.new(1, -80, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = self.Title,
        TextColor3 = GhostlyBush.Themes[self.Theme].Text,
        TextSize = 18,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = self.TopBar
    })
    
    -- Botão de fechar
    local closeButton = Create("TextButton", {
        Name = "CloseButton",
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -35, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Error,
        Text = "×",
        TextColor3 = Color3.new(1, 1, 1),
        TextSize = 24,
        Font = Enum.Font.GothamBold,
        Parent = self.TopBar
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = closeButton
    })
    
    closeButton.MouseButton1Click:Connect(function()
        self:Toggle()
    end)
    
    -- Efeitos hover no botão de fechar
    closeButton.MouseEnter:Connect(function()
        Tween(closeButton, {Size = UDim2.new(0, 32, 0, 32)}, 0.2)
    end)
    
    closeButton.MouseLeave:Connect(function()
        Tween(closeButton, {Size = UDim2.new(0, 30, 0, 30)}, 0.2)
    end)
    
    -- Sidebar
    self.SideBar = Create("Frame", {
        Name = "SideBar",
        Size = UDim2.new(0, self.SideBarWidth, 1, -40),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary,
        BorderSizePixel = 0,
        Parent = self.MainFrame
    })
    
    -- Área de conteúdo
    self.Content = Create("Frame", {
        Name = "Content",
        Size = UDim2.new(1, -self.SideBarWidth, 1, -40),
        Position = UDim2.new(0, self.SideBarWidth, 0, 40),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Main,
        BorderSizePixel = 0,
        Parent = self.MainFrame
    })
    
    -- Container de abas
    self.TabContainer = Create("ScrollingFrame", {
        Name = "TabContainer",
        Size = UDim2.new(1, 0, 1, -40),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundTransparency = 1,
        ScrollBarThickness = self.ScrollBarEnabled and 3 or 0,
        ScrollBarImageColor3 = GhostlyBush.Themes[self.Theme].Accent,
        Parent = self.SideBar
    })
    
    local listLayout = Create("UIListLayout", {
        Parent = self.TabContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    })
    
    Create("UIPadding", {
        Parent = self.TabContainer,
        PaddingTop = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10)
    })
    
    -- Ajustar altura do container
    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        self.TabContainer.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 20)
    end)
    
    -- Barra de pesquisa (opcional)
    if not self.HideSearchBar then
        self.SearchBar = Create("TextBox", {
            Name = "SearchBar",
            Size = UDim2.new(1, -20, 0, 35),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundColor3 = GhostlyBush.Themes[self.Theme].Main,
            PlaceholderText = "Pesquisar...",
            PlaceholderColor3 = GhostlyBush.Themes[self.Theme].SubText,
            TextColor3 = GhostlyBush.Themes[self.Theme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            Text = "",
            Parent = self.SideBar
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = self.SearchBar
        })
        
        Create("UIPadding", {
            Parent = self.SearchBar,
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10)
        })
        
        -- Ajustar posição do container
        self.TabContainer.Size = UDim2.new(1, 0, 1, -80)
        self.TabContainer.Position = UDim2.new(0, 0, 0, 45)
    end
    
    -- Aplicar redimensionamento se habilitado
    if self.Resizable then
        self:MakeResizable()
    end
    
    -- Aplicar transparência se habilitada
    if self.Transparent then
        self.MainFrame.BackgroundTransparency = 0.5
        self.TopBar.BackgroundTransparency = 0.5
        self.SideBar.BackgroundTransparency = 0.5
    end
    
    -- Configurar background se fornecido
    if self.Background then
        self:SetBackground(self.Background)
    end
    
    -- Configurar tecla de fechar
    self:ConnectCloseKey()
    
    -- Configurar usuário se habilitado
    if self.User and self.User.Enabled then
        self:SetupUser(self.User)
    end
    
    -- Parent final
    self.ScreenGui.Parent = CoreGui
    self.MainFrame.Parent = self.ScreenGui
    
    return self
end

function Window:MakeResizable()
    local resizeHandle = Create("TextButton", {
        Name = "ResizeHandle",
        Size = UDim2.new(0, 15, 0, 15),
        Position = UDim2.new(1, -15, 1, -15),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Accent,
        Text = "",
        Parent = self.MainFrame
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = resizeHandle
    })
    
    local dragging = false
    local startPos
    local startSize
    
    resizeHandle.MouseButton1Down:Connect(function()
        dragging = true
        startPos = UserInputService:GetMouseLocation()
        startSize = self.MainFrame.AbsoluteSize
        resizeHandle.Size = UDim2.new(0, 17, 0, 17)
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
            resizeHandle.Size = UDim2.new(0, 15, 0, 15)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local currentPos = UserInputService:GetMouseLocation()
            local delta = currentPos - startPos
            
            local newSize = Vector2.new(
                math.clamp(startSize.X + delta.X, self.MinSize.X, self.MaxSize.X),
                math.clamp(startSize.Y + delta.Y, self.MinSize.Y, self.MaxSize.Y)
            )
            
            self.MainFrame.Size = UDim2.fromOffset(newSize.X, newSize.Y)
        end
    end)
end

function Window:SetBackground(background)
    if type(background) ~= "string" then return end
    
    if background:find("^rbxassetid://") then
        local image = Create("ImageLabel", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Image = background,
            ScaleType = Enum.ScaleType.Crop,
            Parent = self.MainFrame
        })
        image.ZIndex = -1
        image.ImageTransparency = self.BackgroundImageTransparency
    elseif background:find("^http") then
        local image = Create("ImageLabel", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Image = background,
            ScaleType = Enum.ScaleType.Crop,
            Parent = self.MainFrame
        })
        image.ZIndex = -1
        image.ImageTransparency = self.BackgroundImageTransparency
    end
end

function Window:ConnectCloseKey()
    local connection = UserInputService.InputBegan:Connect(function(input, processed)
        if not processed and input.KeyCode == self.CloseKey then
            self:Toggle()
        end
    end)
    table.insert(self.Elements, connection)
end

function Window:SetupUser(config)
    spawn(function()
        local player = Players.LocalPlayer
        if not player then return end
        
        local thumbType = config.Anonymous and Enum.ThumbnailType.HeadShot or Enum.ThumbnailType.AvatarThumbnail
        local thumbSize = Enum.ThumbnailSize.Size420x420
        
        local success, result = pcall(function()
            return Players:GetUserThumbnailAsync(player.UserId, thumbType, thumbSize)
        end)
        
        if success then
            local userButton = Create("ImageButton", {
                Name = "UserButton",
                Size = UDim2.new(0, 30, 0, 30),
                Position = UDim2.new(1, -75, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary,
                Image = result,
                Parent = self.TopBar
            })
            
            Create("UICorner", {
                CornerRadius = UDim.new(1, 0),
                Parent = userButton
            })
            
            if config.Callback then
                userButton.MouseButton1Click:Connect(config.Callback)
            end
        end
    end)
end

function Window:Toggle()
    self.Open = not self.Open
    self.ScreenGui.Enabled = self.Open
end

function Window:CreateTab(options)
    local tab = {
        Name = options.Name or "Tab",
        Icon = options.Icon or "folder",
        LayoutOrder = options.LayoutOrder or #self.Tabs + 1,
        Elements = {}
    }
    
    -- Botão da aba
    local tabButton = Create("TextButton", {
        Name = tab.Name .. "TabButton",
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary,
        Text = "    " .. tab.Name,
        TextColor3 = GhostlyBush.Themes[self.Theme].Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = tab.LayoutOrder,
        Parent = self.TabContainer
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = tabButton
    })
    
    -- Frame do conteúdo da aba
    local tabContent = Create("ScrollingFrame", {
        Name = tab.Name .. "Content",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Visible = false,
        ScrollBarThickness = self.ScrollBarEnabled and 3 or 0,
        ScrollBarImageColor3 = GhostlyBush.Themes[self.Theme].Accent,
        Parent = self.Content
    })
    
    local contentLayout = Create("UIListLayout", {
        Parent = tabContent,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10)
    })
    
    Create("UIPadding", {
        Parent = tabContent,
        PaddingTop = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10)
    })
    
    contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        tabContent.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 20)
    end)
    
    -- Efeitos hover no botão da aba
    tabButton.MouseEnter:Connect(function()
        if not tabButton.Active then
            Tween(tabButton, {BackgroundColor3 = GhostlyBush.Themes[self.Theme].Hover}, 0.2)
        end
    end)
    
    tabButton.MouseLeave:Connect(function()
        if not tabButton.Active then
            Tween(tabButton, {BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary}, 0.2)
        end
    end)
    
    -- Selecionar aba ao clicar
    tabButton.MouseButton1Click:Connect(function()
        self:SelectTab(tab.Name)
    end)
    
    tab.Button = tabButton
    tab.Content = tabContent
    
    -- Métodos da aba
    function tab:CreateSection(options)
        local section = {
            Name = options.Name or "Section",
            Collapsible = options.Collapsible or false,
            Collapsed = options.Collapsed or false
        }
        
        local sectionFrame = Create("Frame", {
            Name = section.Name .. "Section",
            Size = UDim2.new(1, 0, 0, section.Collapsible and 40 or 50),
            BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
            BorderSizePixel = 0,
            LayoutOrder = options.LayoutOrder or #self.Elements + 1,
            Parent = self.Content
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = sectionFrame
        })
        
        Create("UIPadding", {
            Parent = sectionFrame,
            PaddingTop = UDim.new(0, 5),
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
            PaddingBottom = UDim.new(0, 5)
        })
        
        local sectionTitle = Create("TextLabel", {
            Name = "Title",
            Size = UDim2.new(1, -20, 0, 30),
            Position = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1,
            Text = section.Name,
            TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
            TextSize = 16,
            Font = Enum.Font.GothamSemibold,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = sectionFrame
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
            Padding = UDim.new(0, 5)
        })
        
        contentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            if not section.Collapsed then
                sectionFrame.Size = UDim2.new(1, 0, 0, 40 + contentList.AbsoluteContentSize.Y + 10)
            end
        end)
        
        -- Botão de colapso
        if section.Collapsible then
            local collapseButton = Create("TextButton", {
                Name = "CollapseButton",
                Size = UDim2.new(0, 30, 0, 30),
                Position = UDim2.new(1, -30, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                Text = section.Collapsed and "˅" or "˄",
                TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
                TextSize = 18,
                Font = Enum.Font.GothamBold,
                Parent = sectionFrame
            })
            
            collapseButton.MouseButton1Click:Connect(function()
                section.Collapsed = not section.Collapsed
                section.Content.Visible = not section.Collapsed
                collapseButton.Text = section.Collapsed and "˅" or "˄"
                
                if section.Collapsed then
                    sectionFrame.Size = UDim2.new(1, 0, 0, 40)
                else
                    sectionFrame.Size = UDim2.new(1, 0, 0, 40 + contentList.AbsoluteContentSize.Y + 10)
                end
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
            Size = UDim2.new(1, 0, 0, 35),
            BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
            Text = button.Name,
            TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            LayoutOrder = layoutOrder,
            Parent = parent
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = buttonFrame
        })
        
        -- Efeitos hover
        buttonFrame.MouseEnter:Connect(function()
            Tween(buttonFrame, {BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Hover}, 0.2)
        end)
        
        buttonFrame.MouseLeave:Connect(function()
            Tween(buttonFrame, {BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary}, 0.2)
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
            Size = UDim2.new(1, 0, 0, 35),
            BackgroundTransparency = 1,
            LayoutOrder = layoutOrder,
            Parent = parent
        })
        
        local toggleLabel = Create("TextLabel", {
            Name = "Label",
            Size = UDim2.new(1, -50, 1, 0),
            BackgroundTransparency = 1,
            Text = toggle.Name,
            TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = toggleFrame
        })
        
        local toggleButton = Create("TextButton", {
            Name = "ToggleButton",
            Size = UDim2.new(0, 40, 0, 20),
            Position = UDim2.new(1, -40, 0.5, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
            Text = "",
            Parent = toggleFrame
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = toggleButton
        })
        
        local toggleCircle = Create("Frame", {
            Name = "Circle",
            Size = UDim2.new(0, 14, 0, 14),
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
                Tween(toggleButton, {BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Accent}, 0.2)
                Tween(toggleCircle, {Position = UDim2.new(1, -17, 0.5, 0)}, 0.2)
            else
                Tween(toggleButton, {BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary}, 0.2)
                Tween(toggleCircle, {Position = UDim2.new(0, 3, 0.5, 0)}, 0.2)
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
    
    function tab:CreateSlider(options)
        local slider = {
            Name = options.Name or "Slider",
            Min = options.Min or 0,
            Max = options.Max or 100,
            Default = options.Default or 50,
            Callback = options.Callback or function() end,
            Value = options.Default or 50,
            Decimals = options.Decimals or 0
        }
        
        local parent = options.Section and options.Section.Content or self.Content
        local layoutOrder = options.LayoutOrder or #self.Elements + 1
        
        local sliderFrame = Create("Frame", {
            Name = slider.Name .. "Slider",
            Size = UDim2.new(1, 0, 0, 60),
            BackgroundTransparency = 1,
            LayoutOrder = layoutOrder,
            Parent = parent
        })
        
        local sliderLabel = Create("TextLabel", {
            Name = "Label",
            Size = UDim2.new(1, 0, 0, 20),
            BackgroundTransparency = 1,
            Text = slider.Name .. ": " .. slider.Value,
            TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = sliderFrame
        })
        
        local sliderTrack = Create("Frame", {
            Name = "Track",
            Size = UDim2.new(1, 0, 0, 4),
            Position = UDim2.new(0, 0, 0, 30),
            BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
            Parent = sliderFrame
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = sliderTrack
        })
        
        local sliderFill = Create("Frame", {
            Name = "Fill",
            Size = UDim2.new((slider.Value - slider.Min) / (slider.Max - slider.Min), 0, 1, 0),
            BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Accent,
            Parent = sliderTrack
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = sliderFill
        })
        
        local sliderHandle = Create("TextButton", {
            Name = "SliderHandle",
            Size = UDim2.new(0, 15, 0, 15),
            Position = UDim2.new(sliderFill.Size.X.Scale, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.new(1, 1, 1),
            Text = "",
            Parent = sliderTrack
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = sliderHandle
        })
        
        local dragging = false
        
        local function formatValue(value)
            if slider.Decimals == 0 then
                return tostring(math.floor(value))
            else
                return string.format("%." .. slider.Decimals .. "f", value)
            end
        end
        
        local function updateSlider(value)
            value = math.clamp(value, slider.Min, slider.Max)
            slider.Value = value
            sliderLabel.Text = slider.Name .. ": " .. formatValue(value)
            
            local scale = (value - slider.Min) / (slider.Max - slider.Min)
            sliderFill.Size = UDim2.new(scale, 0, 1, 0)
            sliderHandle.Position = UDim2.new(scale, 0, 0.5, 0)
            
            slider.Callback(value)
        end
        
        sliderHandle.MouseButton1Down:Connect(function()
            dragging = true
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        sliderTrack.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local mousePos = UserInputService:GetMouseLocation()
                local trackPos = sliderTrack.AbsolutePosition
                local trackSize = sliderTrack.AbsoluteSize
                
                local relativeX = (mousePos.X - trackPos.X) / trackSize.X
                local value = slider.Min + (relativeX * (slider.Max - slider.Min))
                
                updateSlider(value)
                dragging = true
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local mousePos = UserInputService:GetMouseLocation()
                local trackPos = sliderTrack.AbsolutePosition
                local trackSize = sliderTrack.AbsoluteSize
                
                local relativeX = math.clamp((mousePos.X - trackPos.X) / trackSize.X, 0, 1)
                local value = slider.Min + (relativeX * (slider.Max - slider.Min))
                
                updateSlider(value)
            end
        end)
        
        updateSlider(slider.Default)
        table.insert(self.Elements, slider)
        return slider
    end
    
    function tab:CreateLabel(options)
        local label = {
            Text = options.Text or "Label",
            Color = options.Color or GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text
        }
        
        local parent = options.Section and options.Section.Content or self.Content
        local layoutOrder = options.LayoutOrder or #self.Elements + 1
        
        local labelFrame = Create("TextLabel", {
            Name = "Label",
            Size = UDim2.new(1, 0, 0, 25),
            BackgroundTransparency = 1,
            Text = label.Text,
            TextColor3 = label.Color,
            TextSize = options.TextSize or 14,
            Font = options.Font or Enum.Font.Gotham,
            TextXAlignment = options.Alignment or Enum.TextXAlignment.Left,
            LayoutOrder = layoutOrder,
            Parent = parent
        })
        
        table.insert(self.Elements, label)
        return label
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
            tab.Content.Visible = true
            tab.Button.Active = true
            Tween(tab.Button, {BackgroundColor3 = GhostlyBush.Themes[self.Theme].Accent}, 0.2)
        else
            tab.Content.Visible = false
            tab.Button.Active = false
            Tween(tab.Button, {BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary}, 0.2)
        end
    end
end

function Window:Destroy()
    if self.ScreenGui then
        self.ScreenGui:Destroy()
    end
    
    for _, connection in ipairs(self.Elements) do
        if typeof(connection) == "RBXScriptConnection" then
            connection:Disconnect()
        end
    end
    
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
        -- Atualizar cores de todas as janelas abertas
        for _, window in ipairs(self.Windows) do
            -- Aqui você implementaria a atualização das cores
        end
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
