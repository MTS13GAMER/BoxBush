-- GhostlyBush Library v1.0.1 (Corrigido)
-- Por: MTS13GAMER
-- Inspirado no Wind UI

-- Serviços
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- Funções utilitárias
local function Create(class, props)
    local obj = Instance.new(class)
    for prop, value in pairs(props) do
        if prop ~= "Parent" and prop ~= "Children" then
            obj[prop] = value
        end
    end
    if props.Parent then
        obj.Parent = props.Parent
    end
    if props.Children then
        for _, child in ipairs(props.Children) do
            child.Parent = obj
        end
    end
    return obj
end

local function Tween(obj, props, duration, style, direction)
    local tweenInfo = TweenInfo.new(duration or 0.2, style or Enum.EasingStyle.Quad, direction or Enum.EasingDirection.Out)
    local tween = TweenService:Create(obj, tweenInfo, props)
    tween:Play()
    return tween
end

-- Biblioteca principal
local GhostlyBush = {
    Version = "1.0.1",
    Themes = {},
    CurrentTheme = "Dark",
    Windows = {},
    Elements = {},
    Config = {}
}

-- Configurações padrão
local DefaultConfig = {
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = false,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    CloseKey = Enum.KeyCode.RightControl,
    Position = UDim2.fromScale(0.5, 0.5)
}

-- Tema padrão (Black)
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

-- Sistema de Key
local KeySystem = {}
KeySystem.__index = KeySystem

function KeySystem.new(config)
    local self = setmetatable({}, KeySystem)
    
    self.Key = config.Key or {}
    self.Note = config.Note or ""
    self.Thumbnail = config.Thumbnail or {}
    self.URL = config.URL or ""
    self.SaveKey = config.SaveKey or false
    self.OnSuccess = config.Callback or function() end
    self.OnFail = config.OnFail or function() end
    
    if self.SaveKey then
        pcall(function()
            if isfile and isfile("GhostlyBush_Key.txt") then
                local savedKey = readfile("GhostlyBush_Key.txt")
                self:Validate(savedKey)
            end
        end)
    end
    
    return self
end

function KeySystem:Validate(input)
    for _, key in ipairs(self.Key) do
        if input == key then
            if self.SaveKey then
                pcall(function()
                    writefile("GhostlyBush_Key.txt", key)
                end)
            end
            self.OnSuccess()
            return true
        end
    end
    self.OnFail()
    return false
end

-- Janela Principal
local Window = {}
Window.__index = Window

function Window.new(config)
    local self = setmetatable({}, Window)
    
    -- Mesclar configurações
    for key, value in pairs(DefaultConfig) do
        self[key] = config[key] or value
    end
    
    -- Configurações específicas
    self.Title = config.Title or "GhostlyBush Window"
    self.Icon = config.Icon or "ghost"
    self.Author = config.Author or "GhostlyBush"
    self.Folder = config.Folder or "GhostlyBushConfig"
    self.Background = config.Background
    
    -- Elementos
    self.Tabs = {}
    self.Elements = {}
    self.Open = true
    
    -- Sistema de Key
    if config.KeySystem then
        self.KeySystem = KeySystem.new(config.KeySystem)
        if not self.KeySystem.Key or #self.KeySystem.Key == 0 then
            self.KeySystem = nil
        end
    end
    
    -- Criar interface
    self:CreateUI()
    
    -- Sistema de Usuário
    if config.User and config.User.Enabled then
        self:SetupUser(config.User)
    end
    
    table.insert(GhostlyBush.Windows, self)
    
    return self
end

function Window:CreateUI()
    -- ScreenGui principal
    self.ScreenGui = Create("ScreenGui", {
        Name = "GhostlyBush_" .. self.Title:gsub("%s+", "_"),
        DisplayOrder = 100,
        ResetOnSpawn = false
    })
    
    -- Main Frame com arredondamento
    self.MainFrame = Create("Frame", {
        Name = "MainFrame",
        Size = self.Size,
        Position = self.Position,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Main,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = self.ScreenGui
    })
    
    -- Corner para arredondamento
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = self.MainFrame
    })
    
    -- Shadow
    Create("ImageLabel", {
        Name = "Shadow",
        Size = UDim2.new(1, 12, 1, 12),
        Position = UDim2.new(0.5, -6, 0.5, -6),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://1316045217",
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = 0.8,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(10, 10, 118, 118),
        Parent = self.MainFrame
    })
    
    -- Top Bar
    self.TopBar = Create("Frame", {
        Name = "TopBar",
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary,
        BorderSizePixel = 0,
        Parent = self.MainFrame
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Corner = Enum.Corner.TopLeft + Enum.Corner.TopRight,
        Parent = self.TopBar
    })
    
    -- Título
    self.TitleLabel = Create("TextLabel", {
        Name = "TitleLabel",
        Size = UDim2.new(1, -80, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = self.Title,
        TextColor3 = GhostlyBush.Themes[self.Theme].Text,
        TextSize = 18,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = self.TopBar
    })
    
    -- Botões de controle
    local closeBtn = Create("TextButton", {
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
        Parent = closeBtn
    })
    
    closeBtn.MouseButton1Click:Connect(function()
        self:Toggle()
    end)
    
    -- Efeitos hover no botão de fechar
    closeBtn.MouseEnter:Connect(function()
        Tween(closeBtn, {Size = UDim2.new(0, 32, 0, 32)}, 0.2)
    end)
    
    closeBtn.MouseLeave:Connect(function()
        Tween(closeBtn, {Size = UDim2.new(0, 30, 0, 30)}, 0.2)
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
    
    -- Conteúdo
    self.Content = Create("Frame", {
        Name = "Content",
        Size = UDim2.new(1, -self.SideBarWidth, 1, -40),
        Position = UDim2.new(0, self.SideBarWidth, 0, 40),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Main,
        BorderSizePixel = 0,
        Parent = self.MainFrame
    })
    
    -- Tab Buttons Container
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
    
    -- Barra de pesquisa (se não estiver escondida)
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
        
        -- Ajustar posição do container de tabs
        self.TabContainer.Size = UDim2.new(1, 0, 1, -80)
        self.TabContainer.Position = UDim2.new(0, 0, 0, 45)
    end
    
    -- Aplicar redimensionamento
    if self.Resizable then
        self:MakeResizable()
    end
    
    -- Aplicar transparência
    if self.Transparent then
        self.MainFrame.BackgroundTransparency = 0.5
        self.TopBar.BackgroundTransparency = 0.5
        self.SideBar.BackgroundTransparency = 0.5
    end
    
    -- Aplicar background
    if self.Background then
        self:SetBackground(self.Background)
    end
    
    -- Conectar tecla de fechar
    self:ConnectCloseKey()
    
    -- Parent no final
    self.ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
end

function Window:MakeResizable()
    local dragButton = Create("TextButton", {
        Name = "ResizeHandle",
        Size = UDim2.new(0, 15, 0, 15),
        Position = UDim2.new(1, -15, 1, -15),
        BackgroundColor3 = GhostlyBush.Themes[self.Theme].Accent,
        Text = "",
        Parent = self.MainFrame
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = dragButton
    })
    
    local dragging = false
    local startPos
    local startSize
    
    dragButton.MouseButton1Down:Connect(function()
        dragging = true
        startPos = UserInputService:GetMouseLocation()
        startSize = self.MainFrame.AbsoluteSize
        dragButton.Size = UDim2.new(0, 17, 0, 17)
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
            dragButton.Size = UDim2.new(0, 15, 0, 15)
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
            self.Size = self.MainFrame.Size
        end
    end)
end

function Window:SetBackground(background)
    if background:sub(1, 6) == "video:" then
        local videoId = background:sub(7)
        local video = Create("VideoFrame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Looped = true,
            Playing = true,
            Parent = self.MainFrame
        })
        
        video.ZIndex = -1
        
        pcall(function()
            video.Video = videoId:find("rbxassetid://") and videoId or "rbxassetid://" .. videoId
        end)
    elseif background:find("rbxassetid://") or background:find("http") then
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
    local connection
    connection = UserInputService.InputBegan:Connect(function(input, processed)
        if not processed and input.KeyCode == self.CloseKey then
            self:Toggle()
        end
    end)
    
    table.insert(self.Elements, connection)
end

function Window:SetupUser(config)
    spawn(function()
        local LocalPlayer = Players.LocalPlayer
        local userId = LocalPlayer.UserId
        local thumbType = config.Anonymous and Enum.ThumbnailType.HeadShot or Enum.ThumbnailType.AvatarThumbnail
        local thumbSize = Enum.ThumbnailSize.Size420x420
        
        local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
        
        local userBtn = Create("ImageButton", {
            Name = "UserButton",
            Size = UDim2.new(0, 30, 0, 30),
            Position = UDim2.new(1, -75, 0.5, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary,
            Image = content,
            Parent = self.TopBar
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = userBtn
        })
        
        userBtn.MouseButton1Click:Connect(function()
            if config.Callback then
                config.Callback()
            end
        end)
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
        LayoutOrder = options.LayoutOrder or #self.Tabs + 1
    }
    
    -- Botão da tab
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
    
    -- Frame do conteúdo da tab
    local tabFrame = Create("ScrollingFrame", {
        Name = tab.Name .. "Content",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Visible = false,
        ScrollBarThickness = self.ScrollBarEnabled and 3 or 0,
        ScrollBarImageColor3 = GhostlyBush.Themes[self.Theme].Accent,
        Parent = self.Content
    })
    
    local layout = Create("UIListLayout", {
        Parent = tabFrame,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10)
    })
    
    local padding = Create("UIPadding", {
        Parent = tabFrame,
        PaddingTop = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10)
    })
    
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        tabFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
    end)
    
    -- Efeitos hover
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
    
    -- Conectar clique
    tabButton.MouseButton1Click:Connect(function()
        self:SelectTab(tab.Name)
    end)
    
    tab.Button = tabButton
    tab.Frame = tabFrame
    tab.Elements = {}
    
    -- Métodos da tab
    function tab:CreateSection(options)
        local section = {
            Name = options.Name or "Section",
            Collapsible = options.Collapsible or false,
            Collapsed = options.Collapsed or false
        }
        
        local sectionFrame = Create("Frame", {
            Name = section.Name .. "Section",
            Size = UDim2.new(1, 0, 0, options.Collapsible and 40 or 50),
            BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
            BorderSizePixel = 0,
            LayoutOrder = options.LayoutOrder or #self.Elements + 1,
            Parent = self.Frame
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
        
        section.Frame = sectionFrame
        section.Content = Create("Frame", {
            Name = "Content",
            Size = UDim2.new(1, 0, 1, -40),
            Position = UDim2.new(0, 0, 0, 40),
            BackgroundTransparency = 1,
            Visible = not section.Collapsed,
            Parent = sectionFrame
        })
        
        local contentLayout = Create("UIListLayout", {
            Parent = section.Content,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 5)
        })
        
        contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            if not section.Collapsed then
                sectionFrame.Size = UDim2.new(1, 0, 0, 40 + contentLayout.AbsoluteContentSize.Y + 10)
            end
        end)
        
        -- Botão de colapso
        if section.Collapsible then
            local collapseBtn = Create("TextButton", {
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
            
            collapseBtn.MouseButton1Click:Connect(function()
                section.Collapsed = not section.Collapsed
                section.Content.Visible = not section.Collapsed
                collapseBtn.Text = section.Collapsed and "˅" or "˄"
                
                if section.Collapsed then
                    sectionFrame.Size = UDim2.new(1, 0, 0, 40)
                else
                    sectionFrame.Size = UDim2.new(1, 0, 0, 40 + contentLayout.AbsoluteContentSize.Y + 10)
                end
            end)
        end
        
        table.insert(self.Elements, section)
        return section
    end
    
    function tab:CreateButton(options)
        local button = {
            Name = options.Name or "Button",
            Callback = options.Callback or function() end
        }
        
        local buttonFrame = Create("TextButton", {
            Name = button.Name .. "Button",
            Size = UDim2.new(1, 0, 0, 35),
            BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
            Text = button.Name,
            TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            LayoutOrder = options.LayoutOrder or #self.Elements + 1,
            Parent = options.Section and options.Section.Content or self.Frame
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
        
        local toggleFrame = Create("Frame", {
            Name = toggle.Name .. "Toggle",
            Size = UDim2.new(1, 0, 0, 35),
            BackgroundTransparency = 1,
            LayoutOrder = options.LayoutOrder or #self.Elements + 1,
            Parent = options.Section and options.Section.Content or self.Frame
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
        
        toggle.Toggle = toggleButton
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
        
        local sliderFrame = Create("Frame", {
            Name = slider.Name .. "Slider",
            Size = UDim2.new(1, 0, 0, 60),
            BackgroundTransparency = 1,
            LayoutOrder = options.LayoutOrder or #self.Elements + 1,
            Parent = options.Section and options.Section.Content or self.Frame
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
        
        local sliderButton = Create("TextButton", {
            Name = "SliderButton",
            Size = UDim2.new(0, 15, 0, 15),
            Position = UDim2.new(sliderFill.Size.X.Scale, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.new(1, 1, 1),
            Text = "",
            Parent = sliderTrack
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = sliderButton
        })
        
        local dragging = false
        
        local function formatNumber(num)
            if slider.Decimals == 0 then
                return tostring(math.floor(num))
            else
                return string.format("%." .. slider.Decimals .. "f", num)
            end
        end
        
        local function updateSlider(value)
            value = math.clamp(value, slider.Min, slider.Max)
            slider.Value = value
            sliderLabel.Text = slider.Name .. ": " .. formatNumber(value)
            
            local scale = (value - slider.Min) / (slider.Max - slider.Min)
            sliderFill.Size = UDim2.new(scale, 0, 1, 0)
            sliderButton.Position = UDim2.new(scale, 0, 0.5, 0)
            
            slider.Callback(value)
        end
        
        sliderButton.MouseButton1Down:Connect(function()
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
        
        slider.Slider = sliderButton
        table.insert(self.Elements, slider)
        return slider
    end
    
    function tab:CreateDropdown(options)
        local dropdown = {
            Name = options.Name or "Dropdown",
            Options = options.Options or {},
            Default = options.Default or options.Options[1],
            Callback = options.Callback or function() end,
            Value = options.Default or options.Options[1],
            Open = false
        }
        
        local dropdownFrame = Create("Frame", {
            Name = dropdown.Name .. "Dropdown",
            Size = UDim2.new(1, 0, 0, 35),
            BackgroundTransparency = 1,
            LayoutOrder = options.LayoutOrder or #self.Elements + 1,
            Parent = options.Section and options.Section.Content or self.Frame
        })
        
        local dropdownLabel = Create("TextLabel", {
            Name = "Label",
            Size = UDim2.new(1, -120, 1, 0),
            BackgroundTransparency = 1,
            Text = dropdown.Name,
            TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = dropdownFrame
        })
        
        local dropdownButton = Create("TextButton", {
            Name = "DropdownButton",
            Size = UDim2.new(0, 100, 0, 35),
            Position = UDim2.new(1, -100, 0, 0),
            BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
            Text = dropdown.Value,
            TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            Parent = dropdownFrame
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = dropdownButton
        })
        
        local dropdownList = Create("ScrollingFrame", {
            Name = "DropdownList",
            Size = UDim2.new(0, 100, 0, 0),
            Position = UDim2.new(1, -100, 1, 5),
            BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
            Visible = false,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Accent,
            Parent = dropdownFrame
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = dropdownList
        })
        
        local listLayout = Create("UIListLayout", {
            Parent = dropdownList,
            SortOrder = Enum.SortOrder.LayoutOrder
        })
        
        Create("UIPadding", {
            Parent = dropdownList,
            PaddingTop = UDim.new(0, 5),
            PaddingBottom = UDim.new(0, 5)
        })
        
        dropdownButton.MouseButton1Click:Connect(function()
            dropdown.Open = not dropdown.Open
            dropdownList.Visible = dropdown.Open
            
            if dropdown.Open then
                dropdownList.Size = UDim2.new(0, 100, 0, math.min(#dropdown.Options * 30, 150))
            else
                dropdownList.Size = UDim2.new(0, 100, 0, 0)
            end
        end)
        
        for _, option in ipairs(dropdown.Options) do
            local optionButton = Create("TextButton", {
                Size = UDim2.new(1, -10, 0, 30),
                Position = UDim2.new(0.5, 0, 0, 0),
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
                Text = option,
                TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
                TextSize = 14,
                Font = Enum.Font.Gotham,
                Parent = dropdownList
            })
            
            Create("UICorner", {
                CornerRadius = UDim.new(0, 4),
                Parent = optionButton
            })
            
            optionButton.MouseButton1Click:Connect(function()
                dropdown.Value = option
                dropdownButton.Text = option
                dropdown.Open = false
                dropdownList.Visible = false
                dropdownList.Size = UDim2.new(0, 100, 0, 0)
                dropdown.Callback(option)
            end)
            
            optionButton.MouseEnter:Connect(function()
                Tween(optionButton, {BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Hover}, 0.2)
            end)
            
            optionButton.MouseLeave:Connect(function()
                Tween(optionButton, {BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary}, 0.2)
            end)
        end
        
        dropdown.Button = dropdownButton
        table.insert(self.Elements, dropdown)
        return dropdown
    end
    
    function tab:CreateLabel(options)
        local label = {
            Text = options.Text or "Label",
            Color = options.Color or GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text
        }
        
        local labelFrame = Create("TextLabel", {
            Name = "Label",
            Size = UDim2.new(1, 0, 0, 25),
            BackgroundTransparency = 1,
            Text = label.Text,
            TextColor3 = label.Color,
            TextSize = options.TextSize or 14,
            Font = options.Font or Enum.Font.Gotham,
            TextXAlignment = options.Alignment or Enum.TextXAlignment.Left,
            LayoutOrder = options.LayoutOrder or #self.Elements + 1,
            Parent = options.Section and options.Section.Content or self.Frame
        })
        
        table.insert(self.Elements, label)
        return label
    end
    
    function tab:CreateTextBox(options)
        local textbox = {
            Name = options.Name or "TextBox",
            Placeholder = options.Placeholder or "Digite algo...",
            Callback = options.Callback or function() end,
            Text = options.Default or ""
        }
        
        local textboxFrame = Create("Frame", {
            Name = textbox.Name .. "TextBox",
            Size = UDim2.new(1, 0, 0, 35),
            BackgroundTransparency = 1,
            LayoutOrder = options.LayoutOrder or #self.Elements + 1,
            Parent = options.Section and options.Section.Content or self.Frame
        })
        
        local textboxLabel = Create("TextLabel", {
            Name = "Label",
            Size = UDim2.new(1, 0, 0, 15),
            BackgroundTransparency = 1,
            Text = textbox.Name,
            TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
            TextSize = 12,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = textboxFrame
        })
        
        local inputBox = Create("TextBox", {
            Name = "Input",
            Size = UDim2.new(1, 0, 0, 35),
            Position = UDim2.new(0, 0, 0, 15),
            BackgroundColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Secondary,
            PlaceholderText = textbox.Placeholder,
            PlaceholderColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].SubText,
            TextColor3 = GhostlyBush.Themes[GhostlyBush.CurrentTheme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            Text = textbox.Text,
            Parent = textboxFrame
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = inputBox
        })
        
        Create("UIPadding", {
            Parent = inputBox,
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10)
        })
        
        inputBox.FocusLost:Connect(function(enterPressed)
            textbox.Text = inputBox.Text
            textbox.Callback(inputBox.Text, enterPressed)
        end)
        
        textbox.Input = inputBox
        table.insert(self.Elements, textbox)
        return textbox
    end
    
    -- Selecionar primeira tab automaticamente
    if #self.Tabs == 0 then
        self:SelectTab(tab.Name)
    end
    
    table.insert(self.Tabs, tab)
    return tab
end

function Window:SelectTab(tabName)
    for _, tab in ipairs(self.Tabs) do
        if tab.Name == tabName then
            tab.Frame.Visible = true
            tab.Button.Active = true
            Tween(tab.Button, {BackgroundColor3 = GhostlyBush.Themes[self.Theme].Accent}, 0.2)
        else
            tab.Frame.Visible = false
            tab.Button.Active = false
            Tween(tab.Button, {BackgroundColor3 = GhostlyBush.Themes[self.Theme].Secondary}, 0.2)
        end
    end
end

function Window:Destroy()
    self.ScreenGui:Destroy()
    for _, conn in ipairs(self.Elements) do
        if typeof(conn) == "RBXScriptConnection" then
            conn:Disconnect()
        end
    end
    
    for i, win in ipairs(GhostlyBush.Windows) do
        if win == self then
            table.remove(GhostlyBush.Windows, i)
            break
        end
    end
end

-- Métodos principais da biblioteca
function GhostlyBush:CreateWindow(config)
    return Window.new(config)
end

function GhostlyBush:CreateTheme(name, colors)
    self.Themes[name] = colors
end

function GhostlyBush:SetTheme(name)
    if self.Themes[name] then
        self.CurrentTheme = name
        -- Aqui você implementaria a atualização das cores em todas as janelas
    end
end

function GhostlyBush:GetTheme()
    return self.Themes[self.CurrentTheme]
end

function GhostlyBush:DestroyAll()
    for _, window in ipairs(self.Windows) do
        window:Destroy()
    end
    self.Windows = {}
end

-- Exportar funções globais
_G.GhostlyBush = GhostlyBush

return GhostlyBush
