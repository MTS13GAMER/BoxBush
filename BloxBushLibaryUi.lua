se (game:GetService("CoreGui")):FindFirstChild("RTaO") e (game:GetService("CoreGui")):FindFirstChild("ScreenGui") então
	(game:GetService("CoreGui")).RTaO:Destroy();
	(game:GetService("CoreGui")).ScreenGui:Destroy();
fim;
_G.Primary = Color3.fromRGB(100, 100, 100);
_G.Dark = Color3.fromRGB(22, 22, 26);
_G.Third = Color3.fromRGB(255, 0, 0);
função CriarArredondado(Pai, ​​Tamanho)
	local Rounded = Instance.new("UICorner");
	Rounded.Name = "Arredondado";
	Arredondado.Pai = Pai;
	Rounded.CornerRadius = UDim.new(0, Size);
fim;
local UserInputService = game:GetService("UserInputService");
local TweenService = game:GetService("TweenService");
função MakeDraggable(topbarobject, object)
	local Arrastar = nulo;
	local DragInput = nulo;
	local DragStart = nulo;
	local StartPosition = nulo;
	função local Atualizar(entrada)
		local Delta = input.Position - DragStart;
		posição local = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y);
		local Tween = TweenService:Create(object, TweenInfo.new(0.15), {
			Posição = pos
		});
		Interpolação: Reproduzir();
	fim;
	topbarobject.InputBegan:Connect(function(input)
		Se input.UserInputType == Enum.UserInputType.MouseButton1 ou input.UserInputType == Enum.UserInputType.Touch então
			Arrastar = verdadeiro;
			DragStart = input.Position;
			PosiçãoInicial = objeto.Posição;
			input.Changed:Connect(function()
				se input.UserInputState == Enum.UserInputState.End então
					Arrastar = falso;
				fim;
			fim);
		fim;
	fim);
	topbarobject.InputChanged:Connect(function(input)
		Se input.UserInputType == Enum.UserInputType.MouseMovement ou input.UserInputType == Enum.UserInputType.Touch então
			DragInput = entrada;
		fim;
	fim);
	UserInputService.InputChanged:Connect(function(input)
		Se input == DragInput e Draging então
			Atualizar(entrada);
		fim;
	fim);
fim;
local ScreenGui = Instance.new("ScreenGui");
ScreenGui.Parent = game.CoreGui;
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
local OutlineButton = Instance.new("Frame");
OutlineButton.Name = "OutlineButton";
OutlineButton.Parent = ScreenGui;
OutlineButton.ClipsDescendants = true;
OutlineButton.BackgroundColor3 = _G.Dark;
OutlineButton.BackgroundTransparency = 0;
OutlineButton.Position = UDim2.new(0, 10, 0, 15);
OutlineButton.Size = UDim2.new(0, 50, 0, 50);
CriarArredondado(BotãoContorno, 12);
local ImageButton = Instance.new("ImageButton");
ImageButton.Parent = OutlineButton;
ImageButton.Position = UDim2.new(0.5, 0, 0.5, 0);
ImageButton.Size = UDim2.new(0, 40, 0, 40);
ImageButton.AnchorPoint = Vector2.new(0.5, 0.5);
ImageButton.BackgroundColor3 = _G.Dark;
ImageButton.ImageColor3 = Color3.fromRGB(250, 250, 250);
ImageButton.ImageTransparency = 0;
ImageButton.BackgroundTransparency = 0;
ImageButton.Image = "rbxassetid://13940080072";
ImageButton.AutoButtonColor = false;
TornarArrastável(BotãoImagem, BotãoContorno);
CriarArredondado(ImagemBotão, 10);
ImageButton.MouseButton1Click:connect(function()
	(game.CoreGui:FindFirstChild("RTaO")).Enabled = not (game.CoreGui:FindFirstChild("RTaO")).Enabled;
fim);
local NotificationFrame = Instance.new("ScreenGui");
NotificationFrame.Name = "NotificationFrame";
NotificationFrame.Parent = game.CoreGui;
NotificationFrame.ZIndexBehavior = Enum.ZIndexBehavior.Global;
local NotificationList = {};
função local RemoveOldestNotification()
	se #NotificationList > 0 então
		local removido = tabela.remove(NotificationList, 1);
		removido[1]:TweenPosition(UDim2.new(0.5, 0, -0.2, 0), "Out", "Quad", 0.4, true, function()
			removido[1]:Destruir();
		fim);
	fim;
fim;
spawn(função()
	enquanto espera() faça
		se #NotificationList > 0 então
			aguarde(2);
			RemoverNotificaçãoMaisAntiga();
		fim;
	fim;
fim);
local Update = {};
função Atualizar:Notificar(desc)
	local Frame = Instance.new("Frame");
	local Image = Instance.new("ImageLabel");
	local Title = Instance.new("TextLabel");
	local Desc = Instance.new("TextLabel");
	local OutlineFrame = Instance.new("Frame");
	OutlineFrame.Name = "OutlineFrame";
	OutlineFrame.Parent = NotificationFrame;
	OutlineFrame.ClipsDescendants = true;
	OutlineFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
	OutlineFrame.AnchorPoint = Vector2.new(0.5, 1);
	OutlineFrame.BackgroundTransparency = 0.4;
	OutlineFrame.Position = UDim2.new(0.5, 0, -0.2, 0);
	OutlineFrame.Size = UDim2.new(0, 412, 0, 72);
	Frame.Name = "Frame";
	Frame.Parent = OutlineFrame;
	Frame.ClipsDescendants = true;
	Frame.AnchorPoint = Vector2.new(0.5, 0.5);
	Frame.BackgroundColor3 = _G.Dark;
	Frame.BackgroundTransparency = 0.1;
	Frame.Position = UDim2.new(0.5, 0, 0.5, 0);
	Frame.Size = UDim2.new(0, 400, 0, 60);
	Image.Name = "Ícone";
	Imagem.Pai = Quadro;
	Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Image.BackgroundTransparency = 1;
	Image.Position = UDim2.new(0, 8, 0, 8);
	Image.Size = UDim2.new(0, 45, 0, 45);
	Image.Image = "rbxassetid://13940080072";
	Título.Pai = Quadro;
	Título.CorDeFundo3 = _G.Primária;
	Título.TransparênciaDeFundo = 1;
	Título.Posição = UDim2.new(0, 55, 0, 14);
	Título.Tamanho = UDim2.new(0, 10, 0, 20);
	Título.Fonte = Enum.Fonte.GothamBold;
	Título.Texto = "RTaO";
	Title.TextColor3 = Color3.fromRGB(255, 255, 255);
	Título.TamanhoDoTexto = 16;
	Título.TextXAlignment = Enum.TextXAlignment.Left;
	Desc.Parent = Frame;
	Desc.BackgroundColor3 = _G.Primary;
	Desc.BackgroundTransparency = 1;
	Desc.Position = UDim2.new(0, 55, 0, 33);
	Desc.Size = UDim2.new(0, 10, 0, 10);
	Desc.Font = Enum.Font.GothamSemibold;
	Desc.TextTransparency = 0.3;
	Desc.Text = desc;
	Desc.TextColor3 = Color3.fromRGB(200, 200, 200);
	Desc.TextSize = 12;
	Desc.TextXAlignment = Enum.TextXAlignment.Left;
	CriarArredondado(Quadro, 10);
	CriarArredondado(MolduraDeContorno, 12);
	OutlineFrame:TweenPosition(UDim2.new(0.5, 0, 0.1 + (#NotificationList) * 0.1, 0), "Out", "Quad", 0.4, true);
	tabela.inserir(ListaDeNotificações, {
		Quadro de contorno,
		título
	});
fim;
função Atualizar:IniciarCarregamento()
	local Loader = Instance.new("ScreenGui");
	Loader.Parent = game.CoreGui;
	Loader.ZIndexBehavior = Enum.ZIndexBehavior.Global;
	Loader.DisplayOrder = 1000;
	local LoaderFrame = Instance.new("Frame");
	LoaderFrame.Name = "LoaderFrame";
	LoaderFrame.Parent = Loader;
	LoaderFrame.ClipsDescendants = true;
	LoaderFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5);
	LoaderFrame.BackgroundTransparency = 0;
	LoaderFrame.AnchorPoint = Vector2.new(0.5, 0.5);
	LoaderFrame.Position = UDim2.new(0.5, 0, 0.5, 0);
	LoaderFrame.Size = UDim2.new(1.5, 0, 1.5, 0);
	LoaderFrame.BorderSizePixel = 0;
	local MainLoaderFrame = Instance.new("Frame");
	MainLoaderFrame.Name = "MainLoaderFrame";
	MainLoaderFrame.Parent = LoaderFrame;
	MainLoaderFrame.ClipsDescendants = true;
	MainLoaderFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5);
	MainLoaderFrame.BackgroundTransparency = 0;
	MainLoaderFrame.AnchorPoint = Vector2.new(0.5, 0.5);
	MainLoaderFrame.Position = UDim2.new(0.5, 0, 0.5, 0);
	MainLoaderFrame.Size = UDim2.new(0.5, 0, 0.5, 0);
	MainLoaderFrame.BorderSizePixel = 0;
	local TitleLoader = Instance.new("TextLabel");
	TitleLoader.Parent = MainLoaderFrame;
	TitleLoader.Text = "BloxBush";
	TitleLoader.Font = Enum.Font.FredokaOne;
	TitleLoader.TextSize = 50;
	TitleLoader.TextColor3 = Color3.fromRGB(255, 255, 255);
	TitleLoader.BackgroundTransparency = 1;
	TitleLoader.AnchorPoint = Vector2.new(0.5, 0.5);
	TitleLoader.Position = UDim2.new(0.5, 0, 0.3, 0);
	TitleLoader.Size = UDim2.new(0.8, 0, 0.2, 0);
	TitleLoader.TextTransparency = 0;
	local DescriptionLoader = Instance.new("TextLabel");
	DescriptionLoader.Parent = MainLoaderFrame;
	DescriptionLoader.Text = "Carregando...";
	DescriptionLoader.Font = Enum.Font.Gotham;
	DescriptionLoader.TextSize = 15;
	DescriptionLoader.TextColor3 = Color3.fromRGB(255, 255, 255);
	DescriptionLoader.BackgroundTransparency = 1;
	DescriptionLoader.AnchorPoint = Vector2.new(0.5, 0.5);
	DescriptionLoader.Position = UDim2.new(0.5, 0, 0.6, 0);
	DescriptionLoader.Size = UDim2.new(0.8, 0, 0.2, 0);
	DescriptionLoader.TextTransparency = 0;
	local LoadingBarBackground = Instance.new("Frame");
	LoadingBarBackground.Parent = MainLoaderFrame;
	LoadingBarBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
	LoadingBarBackground.AnchorPoint = Vector2.new(0.5, 0.5);
	LoadingBarBackground.Position = UDim2.new(0.5, 0, 0.7, 0);
	LoadingBarBackground.Size = UDim2.new(0.7, 0, 0.05, 0);
	LoadingBarBackground.ClipsDescendants = true;
	LoadingBarBackground.BorderSizePixel = 0;
	LoadingBarBackground.ZIndex = 2;
	local LoadingBar = Instance.new("Frame");
	LoadingBar.Parent = LoadingBarBackground;
	LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
	LoadingBar.Size = UDim2.new(0, 0, 1, 0);
	LoadingBar.ZIndex = 3;
	CriarArredondado(FundoDaBarraDeCarregamento, 20);
	CriarArredondado(BarraDeCarregamento, 20);
	local tweenService = game:GetService("TweenService");
	local dotCount = 0;
	local running = true;
	local barTweenInfoPart1 = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
	local barTweenPart1 = tweenService:Create(LoadingBar, barTweenInfoPart1, {
		Tamanho = UDim2.new(0.25, 0, 1, 0)
	});
	local barTweenInfoPart2 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
	local barTweenPart2 = tweenService:Create(LoadingBar, barTweenInfoPart2, {
		Tamanho = UDim2.new(1, 0, 1, 0)
	});
	barTweenPart1:Reproduzir();
	função Atualizar:Carregado()
		barTweenPart2:Reproduzir();
	fim;
	barTweenPart1.Completed:Connect(function()
		correndo = verdadeiro;
		barTweenPart2.Completed:Connect(function()
			aguarde(1);
			correndo = falso;
			DescriptionLoader.Text = "Carregado!";
			aguarde(0,5);
			Carregador:Destruir();
		fim);
	fim);
	spawn(função()
		enquanto executa
			contagemDePontos = (contagemDePontos + 1) % 4;
			local dots = string.rep(".", dotCount);
			DescriptionLoader.Text = "Por favor, aguarde" .. pontos;
			aguarde(0,5);
		fim;
	fim);
fim;
local SettingsLib = {
	SalvarConfigurações = verdadeiro,
	CarregarAnimação = verdadeiro
};
(getgenv()).LoadConfig = função()
	se readfile e writefile e isfile e isfolder então
		se não isfolder("BloxBush") então
			criarpasta("BloxBush");
		fim;
		se não isfolder("BloxBush/Library/") então
			criarpasta("BloxBush/Library/");
		fim;
		se não isfile(("BloxBush/Library/" .. game.Players.LocalPlayer.Name .. ".json")) então
			writefile("BloxBush/Library/" .. game.Players.LocalPlayer.Name .. ".json", (game:GetService("HttpService")):JSONEncode(SettingsLib));
		outro
			local Decode = (game:GetService("HttpService")):JSONDecode(readfile("RTaO/Library/" .. game.Players.LocalPlayer.Name .. ".json"));
			para i, v em pares(Decodificar) faça
				SettingsLib[i] = v;
			fim;
		fim;
		print("Biblioteca carregada!");
	outro
		retornar aviso("Status: Executor não detectado");
	fim;
fim;
(getgenv()).SaveConfig = função()
	se readfile e writefile e isfile e isfolder então
		se não isfile(("BloxBush/Library/" .. game.Players.LocalPlayer.Name .. ".json")) então
			(getgenv()).Carregar();
		outro
			local Decode = (game:GetService("HttpService")):JSONDecode(readfile("RTaO/Library/" .. game.Players.LocalPlayer.Name .. ".json"));
			Array local = {};
			para i, v em pares(SettingsLib) faça
				Array[i] = v;
			fim;
			writefile("BloxBush/Library/" .. game.Players.LocalPlayer.Name .. ".json", (game:GetService("HttpService")):JSONEncode(Array));
		fim;
	outro
		retornar aviso("Status: Executor não detectado");
	fim;
fim;
(getgenv()).LoadConfig();
função Atualizar:SalvarConfigurações()
	se SettingsLib.SaveSettings então
		retornar verdadeiro;
	fim;
	retornar falso;
fim;
função Update:LoadAnimation()
	se SettingsLib.LoadAnimation então
		retornar verdadeiro;
	fim;
	retornar falso;
fim;
Função Atualizar:Janela(Configuração)
	assert(Config.SubTitle, "v4");
	local WindowConfig = {
		Tamanho = Config.Tamanho,
		TabWidth = Config.TabWidth
	};
	local osfunc = {};
	local uihide = false;
	local abc = false;
	página atual local = "";
	local keybind = keybind ou Enum.KeyCode.RightControl;
	local yoo = string.gsub(tostring(keybind), "Enum.KeyCode.", "");
	local RTaO = Instance.new("ScreenGui");
	RTaO.Nome = "BloxBush";
	RTaO.Parent = game.CoreGui;
	RTaO.DisplayOrder = 999;
	local OutlineMain = Instance.new("Frame");
	OutlineMain.Name = "OutlineMain";
	OutlineMain.Parent = RTaO;
	OutlineMain.ClipsDescendants = true;
	OutlineMain.AnchorPoint = Vector2.new(0.5, 0.5);
	OutlineMain.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
	OutlineMain.BackgroundTransparency = 0.4;
	OutlineMain.Position = UDim2.new(0.5, 0, 0.45, 0);
	OutlineMain.Size = UDim2.new(0, 0, 0, 0);
	CriarArredondado(OutlinePrincipal, 15);
	local Main = Instance.new("Frame");
	Main.Name = "Principal";
	Principal.Pai = OutlineMain;
	Main.ClipsDescendants = true;
	Main.AnchorPoint = Vector2.new(0.5, 0.5);
	Main.BackgroundColor3 = Color3.fromRGB(24, 24, 26);
	Main.BackgroundTransparency = 0;
	Main.Position = UDim2.new(0.5, 0, 0.5, 0);
	Main.Size = WindowConfig.Size;
	OutlineMain:TweenSize(UDim2.new(0, WindowConfig.Size.X.Offset + 15, 0, WindowConfig.Size.Y.Offset + 15), "Out", "Quad", 0.4, true);
	CriarArredondado(Principal, 12);
	local BtnStroke = Instance.new("UIStroke");
	local DragButton = Instance.new("Frame");
	DragButton.Name = "DragButton";
	DragButton.Parent = Main;
	DragButton.Position = UDim2.new(1, 5, 1, 5);
	DragButton.AnchorPoint = Vector2.new(1, 1);
	DragButton.Size = UDim2.new(0, 15, 0, 15);
	DragButton.BackgroundColor3 = _G.Primary;
	DragButton.BackgroundTransparency = 1;
	DragButton.ZIndex = 10;
	local mouse = game.Players.LocalPlayer:GetMouse();
	local uis = game:GetService("UserInputService");
	local CircleDragButton = Instance.new("UICorner");
	CircleDragButton.Name = "CircleDragButton";
	CircleDragButton.Parent = DragButton;
	CircleDragButton.CornerRadius = UDim.new(0, 99);
	local Top = Instance.new("Frame");
	Top.Name = "Topo";
	Top.Parent = Principal;
	Top.BackgroundColor3 = Color3.fromRGB(10, 10, 10);
	Top.Size = UDim2.new(1, 0, 0, 40);
	Top.BackgroundTransparency = 1;
	CriarArredondado(Topo, 5);
	local NameHub = Instance.new("TextLabel");
	NameHub.Name = "NameHub";
	NameHub.Parent = Top;
	NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	NameHub.BackgroundTransparency = 1;
	NameHub.RichText = true;
	NameHub.Position = UDim2.new(0, 15, 0.5, 0);
	NameHub.AnchorPoint = Vector2.new(0, 0.5);
	NameHub.Size = UDim2.new(0, 1, 0, 25);
	NameHub.Font = Enum.Font.GothamBold;
	NameHub.Text = "RTaO";
	NameHub.TextSize = 20;
	NameHub.TextColor3 = Color3.fromRGB(255, 255, 255);
	NameHub.TextXAligment = Enum.TextXAligment.Left;
	local nameHubSize = (game:GetService("TextService")):GetTextSize(NameHub.Text, NameHub.TextSize, NameHub.Font, Vector2.new(math.huge, math.huge));
	NameHub.Size = UDim2.new(0, nameHubSize.X, 0, 25);
	local SubTitle = Instance.new("TextLabel");
	SubTitle.Name = "Subtítulo";
	Subtítulo.Pai = NameHub;
	SubTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Subtítulo.TransparênciaDeFundo = 1;
	SubTitle.Position = UDim2.new(0, nameHubSize.X + 8, 0.5, 0);
	SubTitle.Size = UDim2.new(0, 1, 0, 20);
	Subtítulo.Fonte = Enum.Fonte.Desenho animado;
	SubTitle.AnchorPoint = Vector2.new(0, 0.5);
	SubTitle.Text = Config.SubTitle;
	Subtítulo.TamanhoDoTexto = 15;
	SubTitle.TextColor3 = Color3.fromRGB(150, 150, 150);
	local SubTitleSize = (game:GetService("TextService")):GetTextSize(SubTitle.Text, SubTitle.TextSize, SubTitle.Font, Vector2.new(math.huge, math.huge));
	SubTitle.Size = UDim2.new(0, SubTitleSize.X, 0, 25);
	local CloseButton = Instance.new("ImageButton");
	CloseButton.Name = "CloseButton";
	BotãoFechar.Pai = Topo;
	CloseButton.BackgroundColor3 = _G.Primary;
	CloseButton.BackgroundTransparency = 1;
	CloseButton.AnchorPoint = Vector2.new(1, 0.5);
	CloseButton.Position = UDim2.new(1, -15, 0.5, 0);
	CloseButton.Size = UDim2.new(0, 20, 0, 20);
	CloseButton.Image = "rbxassetid://7743878857";
	CloseButton.ImageTransparency = 0;
	CloseButton.ImageColor3 = Color3.fromRGB(245, 245, 245);
	CriarArredondado(BotãoFechar, 3);
	CloseButton.MouseButton1Click:connect(function()
		(game.CoreGui:FindFirstChild("RTaO")).Enabled = not (game.CoreGui:FindFirstChild("RTaO")).Enabled;
	fim);
	local ResizeButton = Instance.new("ImageButton");
	ResizeButton.Name = "ResizeButton";
	ResizeButton.Parent = Top;
	ResizeButton.BackgroundColor3 = _G.Primary;
	ResizeButton.BackgroundTransparency = 1;
	ResizeButton.AnchorPoint = Vector2.new(1, 0.5);
	ResizeButton.Position = UDim2.new(1, -50, 0.5, 0);
	ResizeButton.Size = UDim2.new(0, 20, 0, 20);
	ResizeButton.Image = "rbxassetid://10734886735";
	ResizeButton.ImageTransparency = 0;
	ResizeButton.ImageColor3 = Color3.fromRGB(245, 245, 245);
	CriarArredondado(BotãoRedimensionar, 3);
	local BackgroundSettings = Instance.new("Frame");
	BackgroundSettings.Name = "BackgroundSettings";
	BackgroundSettings.Parent = OutlineMain;
	BackgroundSettings.ClipsDescendants = true;
	BackgroundSettings.Active = true;
	BackgroundSettings.AnchorPoint = Vector2.new(0, 0);
	BackgroundSettings.BackgroundColor3 = Color3.fromRGB(10, 10, 10);
	BackgroundSettings.BackgroundTransparency = 0.3;
	BackgroundSettings.Position = UDim2.new(0, 0, 0, 0);
	BackgroundSettings.Size = UDim2.new(1, 0, 1, 0);
	BackgroundSettings.Visible = false;
	CriarArredondado(ConfiguraçõesDeFundo, 15);
	local SettingsFrame = Instance.new("Frame");
	SettingsFrame.Name = "SettingsFrame";
	SettingsFrame.Parent = BackgroundSettings;
	SettingsFrame.ClipsDescendants = true;
	SettingsFrame.AnchorPoint = Vector2.new(0.5, 0.5);
	SettingsFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 26);
	SettingsFrame.BackgroundTransparency = 0;
	SettingsFrame.Position = UDim2.new(0.5, 0, 0.5, 0);
	SettingsFrame.Size = UDim2.new(0.7, 0, 0.7, 0);
	CriarArredondado(ConfiguraçõesFrame, 15);
	local CloseSettings = Instance.new("ImageButton");
	CloseSettings.Name = "CloseSettings";
	CloseSettings.Parent = SettingsFrame;
	CloseSettings.BackgroundColor3 = _G.Primary;
	CloseSettings.BackgroundTransparency = 1;
	CloseSettings.AnchorPoint = Vector2.new(1, 0);
	CloseSettings.Position = UDim2.new(1, -20, 0, 15);
	CloseSettings.Size = UDim2.new(0, 20, 0, 20);
	CloseSettings.Image = "rbxassetid://10747384394";
	CloseSettings.ImageTransparency = 0;
	CloseSettings.ImageColor3 = Color3.fromRGB(245, 245, 245);
	CriarArredondado(FecharConfigurações, 3);
	CloseSettings.MouseButton1Click:connect(function()
		BackgroundSettings.Visible = false;
	fim);
	local SettingsButton = Instance.new("ImageButton");
	SettingsButton.Name = "Botão de Configurações";
	SettingsButton.Parent = Top;
	SettingsButton.BackgroundColor3 = _G.Primary;
	SettingsButton.BackgroundTransparency = 1;
	SettingsButton.AnchorPoint = Vector2.new(1, 0.5);
	SettingsButton.Position = UDim2.new(1, -85, 0.5, 0);
	SettingsButton.Size = UDim2.new(0, 20, 0, 20);
	SettingsButton.Image = "rbxassetid://10734950020";
	ConfiguraçõesButton.ImageTransparency = 0;
	SettingsButton.ImageColor3 = Color3.fromRGB(245, 245, 245);
	CriarArredondado(BotãoConfigurações, 3);
	SettingsButton.MouseButton1Click:connect(function()
		BackgroundSettings.Visible = true;
	fim);
	local TitleSettings = Instance.new("TextLabel");
	TitleSettings.Name = "TitleSettings";
	TitleSettings.Parent = SettingsFrame;
	TitleSettings.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	TitleSettings.BackgroundTransparency = 1;
	TitleSettings.Position = UDim2.new(0, 20, 0, 15);
	TitleSettings.Size = UDim2.new(1, 0, 0, 20);
	TitleSettings.Font = Enum.Font.GothamBold;
	TitleSettings.AnchorPoint = Vector2.new(0, 0);
	TitleSettings.Text = "Configurações da Biblioteca";
	TitleSettings.TextSize = 20;
	TitleSettings.TextColor3 = Color3.fromRGB(245, 245, 245);
	TitleSettings.TextXAlignment = Enum.TextXAlignment.Left;
	local SettingsMenuList = Instance.new("Frame");
	SettingsMenuList.Name = "SettingsMenuList";
	SettingsMenuList.Parent = SettingsFrame;
	SettingsMenuList.ClipsDescendants = true;
	SettingsMenuList.AnchorPoint = Vector2.new(0, 0);
	SettingsMenuList.BackgroundColor3 = Color3.fromRGB(24, 24, 26);
	SettingsMenuList.BackgroundTransparency = 1;
	SettingsMenuList.Position = UDim2.new(0, 0, 0, 50);
	SettingsMenuList.Size = UDim2.new(1, 0, 1, -70);
	CriarArredondado(ListaMenuConfigurações, 15);
	local ScrollSettings = Instance.new("ScrollingFrame");
	ScrollSettings.Name = "ScrollSettings";
	ScrollSettings.Parent = SettingsMenuList;
	ScrollSettings.Active = true;
	ScrollSettings.BackgroundColor3 = Color3.fromRGB(10, 10, 10);
	ScrollSettings.Position = UDim2.new(0, 0, 0, 0);
	ScrollSettings.BackgroundTransparency = 1;
	ScrollSettings.Size = UDim2.new(1, 0, 1, 0);
	ScrollSettings.ScrollBarThickness = 3;
	ScrollSettings.ScrollingDirection = Enum.ScrollingDirection.Y;
	CriarArredondado(ListaMenuConfigurações, 5);
	local SettingsListLayout = Instance.new("UIListLayout");
	SettingsListLayout.Name = "SettingsListLayout";
	SettingsListLayout.Parent = ScrollSettings;
	SettingsListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
	SettingsListLayout.Padding = UDim.new(0, 8);
	local PaddingScroll = Instance.new("UIPadding");
	PaddingScroll.Name = "PaddingScroll";
	PaddingScroll.Parent = ScrollSettings;
	função CreateCheckbox(título, estado, retorno de chamada)
		local checked = estado ou falso;
		local Background = Instance.new("Frame");
		Background.Name = "Fundo";
		Background.Parent = ScrollSettings;
		Background.ClipsDescendants = true;
		Background.BackgroundColor3 = Color3.fromRGB(24, 24, 26);
		Background.BackgroundTransparency = 1;
		Background.Size = UDim2.new(1, 0, 0, 20);
		local Title = Instance.new("TextLabel");
		Título.Nome = "Título";
		Título.Pai = Plano de fundo;
		Título.CorDeFundo3 = Cor3.fromRGB(255, 255, 255);
		Título.TransparênciaDeFundo = 1;
		Título.Posição = UDim2.new(0, 60, 0.5, 0);
		Título.Tamanho = UDim2.novo(1, -60, 0, 20);
		Título.Fonte = Enum.Fonte.Código;
		Título.PontoDeÂncora = Vector2.new(0, 0.5);
		Título.Texto = título ou "";
		Título.TamanhoDoTexto = 15;
		Title.TextColor3 = Color3.fromRGB(200, 200, 200);
		Título.TextXAlignment = Enum.TextXAlignment.Left;
		local Checkbox = Instance.new("ImageButton");
		Checkbox.Name = "Checkbox";
		Checkbox.Parent = Background;
		Checkbox.BackgroundColor3 = Color3.fromRGB(100, 100, 100);
		Checkbox.BackgroundTransparency = 0;
		Checkbox.AnchorPoint = Vector2.new(0, 0.5);
		Checkbox.Position = UDim2.new(0, 30, 0.5, 0);
		Checkbox.Size = UDim2.new(0, 20, 0, 20);
		Checkbox.Image = "rbxassetid://10709790644";
		Checkbox.ImageTransparency = 1;
		Checkbox.ImageColor3 = Color3.fromRGB(245, 245, 245);
		CriarArredondado(Caixa de seleção, 5);
		Checkbox.MouseButton1Click:Connect(function()
			verificado = não verificado;
			se marcado então
				Checkbox.ImageTransparency = 0;
				Checkbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
			outro
				Checkbox.ImageTransparency = 1;
				Checkbox.BackgroundColor3 = Color3.fromRGB(100, 100, 100);
			fim;
			pcall(callback, verificado);
		fim);
		se marcado então
			Checkbox.ImageTransparency = 0;
			Checkbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
		outro
			Checkbox.ImageTransparency = 1;
			Checkbox.BackgroundColor3 = Color3.fromRGB(100, 100, 100);
		fim;
		pcall(callback, verificado);
	fim;
	função CreateButton(título, callback)
		local Background = Instance.new("Frame");
		Background.Name = "Fundo";
		Background.Parent = ScrollSettings;
		Background.ClipsDescendants = true;
		Background.BackgroundColor3 = Color3.fromRGB(24, 24, 26);
		Background.BackgroundTransparency = 1;
		Background.Size = UDim2.new(1, 0, 0, 30);
		local Button = Instance.new("TextButton");
		Button.Name = "Botão";
		Botão.Pai = Fundo;
		Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
		Button.BackgroundTransparency = 0;
		Button.Size = UDim2.new(0.8, 0, 0, 30);
		Button.Font = Enum.Font.Code;
		Button.Text = título ou "Botão";
		Button.AnchorPoint = Vector2.new(0.5, 0);
		Button.Position = UDim2.new(0.5, 0, 0, 0);
		Button.TextColor3 = Color3.fromRGB(255, 255, 255);
		Button.TextSize = 15;
		Button.AutoButtonColor = false;
		Button.MouseButton1Click:Connect(function()
			ligar de volta();
		fim);
		CriarArredondado(Botão, 5);
	fim;
	CreateCheckbox("Salvar configurações", SettingsLib.SaveSettings, function(state)
		SettingsLib.SaveSettings = estado;
		(getgenv()).SalvarConfiguração();
	fim);
	CreateCheckbox("Animação de carregamento", SettingsLib.LoadAnimation, function(state)
		SettingsLib.LoadAnimation = estado;
		(getgenv()).SalvarConfiguração();
	fim);
	CreateButton("Redefinir Configuração", função()
		se isfolder("RTaO") então
			delfolder("RTaO");
		fim;
		Atualização:Notificar("A configuração foi redefinida!");
	fim);
	local Tab = Instance.new("Frame");
	Tab.Name = "Aba";
	Tab.Parent = Principal;
	Tab.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
	Tab.Position = UDim2.new(0, 8, 0, Top.Size.Y.Offset);
	Tab.BackgroundTransparency = 1;
	Tab.Size = UDim2.new(0, WindowConfig.TabWidth, Config.Size.Y.Scale, Config.Size.Y.Offset - Top.Size.Y.Offset - 8);
	local BtnStroke = Instance.new("UIStroke");
	local ScrollTab = Instance.new("ScrollingFrame");
	ScrollTab.Name = "ScrollTab";
	ScrollTab.Parent = Tab;
	ScrollTab.Active = true;
	ScrollTab.BackgroundColor3 = Color3.fromRGB(10, 10, 10);
	ScrollTab.Position = UDim2.new(0, 0, 0, 0);
	ScrollTab.BackgroundTransparency = 1;
	ScrollTab.Size = UDim2.new(1, 0, 1, 0);
	ScrollTab.ScrollBarThickness = 0;
	ScrollTab.ScrollingDirection = Enum.ScrollingDirection.Y;
	CriarArredondado(Tab, 5);
	local TabListLayout = Instance.new("UIListLayout");
	TabListLayout.Name = "TabListLayout";
	TabListLayout.Parent = ScrollTab;
	TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
	TabListLayout.Padding = UDim.new(0, 2);
	local PPD = Instance.new("UIPadding");
	PPD.Nome = "PPD";
	PPD.Parent = ScrollTab;
	local Page = Instance.new("Frame");
	Page.Name = "Página";
	Página.Pai = Principal;
	Page.BackgroundColor3 = _G.Dark;
	Page.Position = UDim2.new(0, Tab.Size.X.Offset + 18, 0, Top.Size.Y.Offset);
	Page.Size = UDim2.new(Config.Size.X.Scale, Config.Size.X.Offset - Tab.Size.X.Offset - 25, Config.Size.Y.Scale, Config.Size.Y.Offset - Top.Size.Y.Offset - 8);
	Page.BackgroundTransparency = 1;
	CriarArredondado(Página, 3);
	local MainPage = Instance.new("Frame");
	MainPage.Name = "MainPage";
	PáginaPrincipal.Pai = Página;
	MainPage.ClipsDescendants = true;
	MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	MainPage.BackgroundTransparency = 1;
	MainPage.Size = UDim2.new(1, 0, 1, 0);
	local PageList = Instance.new("Pasta");
	PageList.Name = "PageList";
	PageList.Parent = MainPage;
	local UIPageLayout = Instance.new("UIPageLayout");
	UIPageLayout.Parent = PageList;
	UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder;
	UIPageLayout.EasingDirection = Enum.EasingDirection.InOut;
	UIPageLayout.EasingStyle = Enum.EasingStyle.Quad;
	UIPageLayout.FillDirection = Enum.FillDirection.Vertical;
	UIPageLayout.Padding = UDim.new(0, 10);
	UIPageLayout.TweenTime = 0;
	UIPageLayout.GamepadInputEnabled = false;
	UIPageLayout.ScrollWheelInputEnabled = false;
	UIPageLayout.TouchInputEnabled = false;
	TornarArrastável(Superior, OutlinePrincipal);
	UserInputService.InputBegan:Connect(function(input)
		Se input.KeyCode == Enum.KeyCode.Insert então
			(game.CoreGui:FindFirstChild("RTaO")).Enabled = not (game.CoreGui:FindFirstChild("RTaO")).Enabled;
		fim;
	fim);
	local Arrastar = falso;
	DragButton.InputBegan:Connect(function(Input)
		Se Input.UserInputType == Enum.UserInputType.MouseButton1 ou Input.UserInputType == Enum.UserInputType.Touch então
			Arrastar = verdadeiro;
		fim;
	fim);
	UserInputService.InputEnded:Connect(function(Input)
		Se Input.UserInputType == Enum.UserInputType.MouseButton1 ou Input.UserInputType == Enum.UserInputType.Touch então
			Arrastar = falso;
		fim;
	fim);
	UserInputService.InputChanged:Connect(function(Input)
		Se arrastar e (Input.UserInputType == Enum.UserInputType.MouseMovement ou Input.UserInputType == Enum.UserInputType.Touch) então
			OutlineMain.Size = UDim2.new(0, math.clamp(Input.Position.X - Main.AbsolutePosition.X + 15, WindowConfig.Size.X.Offset + 15, math.huge), 0, math.clamp(Input.Position.Y - Main.AbsolutePosition.Y + 15, WindowConfig.Size.Y.Offset + 15, math.huge));
			Main.Size = UDim2.new(0, math.clamp(Input.Position.X - Main.AbsolutePosition.X, WindowConfig.Size.X.Offset, math.huge), 0, math.clamp(Input.Position.Y - Main.AbsolutePosition.Y, WindowConfig.Size.Y.Offset, math.huge));
			Page.Size = UDim2.new(0, math.clamp(Input.Position.X - Page.AbsolutePosition.X - 8, WindowConfig.Size.X.Offset - Tab.Size.X.Offset - 25, math.huge), 0, math.clamp(Input.Position.Y - Page.AbsolutePosition.Y - 8, WindowConfig.Size.Y.Offset - Top.Size.Y.Offset - 10, math.huge));
			Tab.Size = UDim2.new(0, WindowConfig.TabWidth, 0, math.clamp(Input.Position.Y - Tab.AbsolutePosition.Y - 8, WindowConfig.Size.Y.Offset - Top.Size.Y.Offset - 10, math.huge));
		fim;
	fim);
	local uitab = {};
	função uitab:Tab(texto, imagem)
		local BtnStroke = Instance.new("UIStroke");
		local TabButton = Instance.new("TextButton");
		título local = Instance.new("TextLabel");
		local TUICorner = Instance.new("UICorner");
		local UICorner = Instance.new("UICorner");
		local Title = Instance.new("TextLabel");
		TabButton.Parent = ScrollTab;
		TabButton.Name = texto .. "Único";
		TabButton.Text = "";
		TabButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100);
		TabButton.BackgroundTransparency = 1;
		TabButton.Size = UDim2.new(1, 0, 0, 35);
		TabButton.Font = Enum.Font.Nunito;
		TabButton.TextColor3 = Color3.fromRGB(255, 255, 255);
		TabButton.TextSize = 12;
		TabButton.TextTransparency = 0.9;
		local SelectedTab = Instance.new("Frame");
		SelectedTab.Name = "SelectedTab";
		SelectedTab.Parent = TabButton;
		SelectedTab.BackgroundColor3 = _G.Third;
		SelectedTab.BackgroundTransparency = 0;
		SelectedTab.Size = UDim2.new(0, 3, 0, 0);
		SelectedTab.Position = UDim2.new(0, 0, 0.5, 0);
		SelectedTab.AnchorPoint = Vector2.new(0, 0.5);
		UICorner.CornerRadius = UDim.new(0, 100);
		UICorner.Parent = SelectedTab;
		Título.Pai = TabButton;
		Título.Nome = "Título";
		Título.CorDeFundo3 = Cor3.fromRGB(150, 150, 150);
		Título.TransparênciaDeFundo = 1;
		Título.Posição = UDim2.new(0, 30, 0.5, 0);
		Título.Tamanho = UDim2.novo(0, 100, 0, 30);
		Título.Fonte = Enum.Fonte.Roboto;
		Título.Texto = texto;
		Título.PontoDeÂncora = Vector2.new(0, 0.5);
		Title.TextColor3 = Color3.fromRGB(255, 255, 255);
		Título.TextTransparência = 0,4;
		Título.TamanhoDoTexto = 14;
		Título.TextXAlignment = Enum.TextXAlignment.Left;
		local IDK = Instance.new("ImageLabel");
		IDK.Nome = "IDK";
		IDK.Parent = TabButton;
		IDK.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		IDK.BackgroundTransparency = 1;
		IDK.ImageTransparency = 0.3;
		IDK.Position = UDim2.new(0, 7, 0.5, 0);
		IDK.Size = UDim2.new(0, 15, 0, 15);
		IDK.PontoDeÂncora = Vector2.new(0, 0.5);
		IDK.Imagem = img;
		CriarArredondado(TabButton, 6);
		local MainFramePage = Instance.new("ScrollingFrame");
		MainFramePage.Name = texto .. "_Página";
		MainFramePage.Parent = PageList;
		MainFramePage.Active = true;
		MainFramePage.BackgroundColor3 = _G.Dark;
		MainFramePage.Position = UDim2.new(0, 0, 0, 0);
		MainFramePage.BackgroundTransparency = 1;
		MainFramePage.Size = UDim2.new(1, 0, 1, 0);
		MainFramePage.ScrollBarThickness = 0;
		MainFramePage.ScrollingDirection = Enum.ScrollingDirection.Y;
		local zzzR = Instance.new("UICorner");
		zzzR.Parent = MainPage;
		zzzR.CornerRadius = UDim.new(0, 5);
		local UIPadding = Instance.new("UIPadding");
		local UIListLayout = Instance.new("UIListLayout");
		UIPadding.Parent = MainFramePage;
		UIListLayout.Padding = UDim.new(0, 3);
		UIListLayout.Parent = MainFramePage;
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
		TabButton.MouseButton1Click:Connect(function()
			para i, v em next, ScrollTab:GetChildren() faça
				se v:IsA("TextButton") então
					(TweenService:Create(v, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundTransparency = 1
					})):Jogar();
					(TweenService:Create(v.SelectedTab, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Tamanho = UDim2.new(0, 3, 0, 0)
					})):Jogar();
					(TweenService:Create(v.IDK, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Transparência da imagem = 0,4
					})):Jogar();
					(TweenService:Create(v.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Transparência do texto = 0,4
					})):Jogar();
				fim;
				(TweenService:Create(TabButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundTransparency = 0.8
				})):Jogar();
				(TweenService:Create(SelectedTab, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Tamanho = UDim2.new(0, 3, 0, 15)
				})):Jogar();
				(TweenService:Create(IDK, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Transparência da imagem = 0
				})):Jogar();
				(TweenService:Create(Título, TweenInfo.new(0.3, Enum.EasingStyle.Quadrado, Enum.EasingDirection.Out), {
					Transparência do texto = 0
				})):Jogar();
			fim;
			para i, v em next, PageList:GetChildren() faça
				currentpage = string.gsub(TabButton.Name, "Unique", "") .. "_Page";
				se v.Name == currentpage então
					UIPageLayout:JumpTo(v);
				fim;
			fim;
		fim);
		se abc == falso então
			para i, v em next, ScrollTab:GetChildren() faça
				se v:IsA("TextButton") então
					(TweenService:Create(v, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundTransparency = 1
					})):Jogar();
					(TweenService:Create(v.SelectedTab, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Tamanho = UDim2.new(0, 3, 0, 15)
					})):Jogar();
					(TweenService:Create(v.IDK, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Transparência da imagem = 0,4
					})):Jogar();
					(TweenService:Create(v.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Transparência do texto = 0,4
					})):Jogar();
				fim;
				(TweenService:Create(TabButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundTransparency = 0.8
				})):Jogar();
				(TweenService:Create(SelectedTab, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Tamanho = UDim2.new(0, 3, 0, 15)
				})):Jogar();
				(TweenService:Create(IDK, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Transparência da imagem = 0
				})):Jogar();
				(TweenService:Create(Título, TweenInfo.new(0.3, Enum.EasingStyle.Quadrado, Enum.EasingDirection.Out), {
					Transparência do texto = 0
				})):Jogar();
			fim;
			UIPageLayout:JumpToIndex(1);
			abc = verdadeiro;
		fim;
		(game:GetService("RunService")).Stepped:Connect(function()
			pcall(função()
				MainFramePage.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y);
				ScrollTab.CanvasSize = UDim2.new(0, 0, 0, TabListLayout.AbsoluteContentSize.Y);
				ScrollSettings.CanvasSize = UDim2.new(0, 0, 0, SettingsListLayout.AbsoluteContentSize.Y);
			fim);
		fim);
		local defaultSize = true;
		ResizeButton.MouseButton1Click:Connect(function()
			se tamanho padrão então
				tamanhoPadrão = falso;
				OutlineMain:TweenPosition(UDim2.new(0.5, 0, 0.45, 0), "Out", "Quad", 0.2, true);
				Principal:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quad", 0.4, true, function()
					Page:TweenSize(UDim2.new(0, Main.AbsoluteSize.X - Tab.AbsoluteSize.X - 25, 0, Main.AbsoluteSize.Y - Top.AbsoluteSize.Y - 10), "Out", "Quad", 0.4, true);
					Tab:TweenSize(UDim2.new(0, WindowConfig.TabWidth, 0, Main.AbsoluteSize.Y - Top.AbsoluteSize.Y - 10), "Out", "Quad", 0.4, true);
				fim);
				OutlineMain:TweenSize(UDim2.new(1, -10, 1, -10), "Out", "Quad", 0.4, true);
				ResizeButton.Image = "rbxassetid://10734895698";
			outro
				tamanhoPadrão = verdadeiro;
				Principal:TweenSize(UDim2.new(0, WindowConfig.Size.X.Offset, 0, WindowConfig.Size.Y.Offset), "Out", "Quad", 0.4, true, function()
					Page:TweenSize(UDim2.new(0, Main.AbsoluteSize.X - Tab.AbsoluteSize.X - 25, 0, Main.AbsoluteSize.Y - Top.AbsoluteSize.Y - 10), "Out", "Quad", 0.4, true);
					Tab:TweenSize(UDim2.new(0, WindowConfig.TabWidth, 0, Main.AbsoluteSize.Y - Top.AbsoluteSize.Y - 10), "Out", "Quad", 0.4, true);
				fim);
				OutlineMain:TweenSize(UDim2.new(0, WindowConfig.Size.X.Offset + 15, 0, WindowConfig.Size.Y.Offset + 15), "Out", "Quad", 0.4, true);
				ResizeButton.Image = "rbxassetid://10734886735";
			fim;
		fim);
		local principal = {};
		função principal:Botão(texto, retorno de chamada)
			local Button = Instance.new("Frame");
			local UICorner = Instance.new("UICorner");
			local TextLabel = Instance.new("TextLabel");
			local TextButton = Instance.new("TextButton");
			local UICorner_2 = Instance.new("UICorner");
			local Black = Instance.new("Frame");
			local UICorner_3 = Instance.new("UICorner");
			Button.Name = "Botão";
			Button.Parent = MainFramePage;
			Button.BackgroundColor3 = _G.Primary;
			Button.BackgroundTransparency = 1;
			Button.Size = UDim2.new(1, 0, 0, 36);
			UICorner.CornerRadius = UDim.new(0, 5);
			UICorner.Parent = Button;
			local ImageLabel = Instance.new("ImageLabel");
			ImageLabel.Name = "ImageLabel";
			ImageLabel.Parent = TextButton;
			ImageLabel.BackgroundColor3 = _G.Primary;
			ImageLabel.BackgroundTransparency = 1;
			ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5);
			ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0);
			ImageLabel.Size = UDim2.new(0, 15, 0, 15);
			ImageLabel.Image = "rbxassetid://10734898355";
			ImageLabel.ImageTransparency = 0;
			ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255);
			CriarArredondado(BotãoTexto, 4);
			TextButton.Name = "TextButton";
			TextButton.Parent = Button;
			TextButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200);
			TextButton.BackgroundTransparency = 0.8;
			TextButton.AnchorPoint = Vector2.new(1, 0.5);
			TextButton.Position = UDim2.new(1, -1, 0.5, 0);
			TextButton.Size = UDim2.new(0, 25, 0, 25);
			TextButton.Font = Enum.Font.Nunito;
			TextButton.Text = "";
			TextButton.TextXAligment = Enum.TextXAligment.Left;
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255);
			TextButton.TextSize = 15;
			TextLabel.Name = "TextLabel";
			TextLabel.Parent = Button;
			TextLabel.BackgroundColor3 = _G.Primary;
			TextLabel.BackgroundTransparency = 1;
			TextLabel.AnchorPoint = Vector2.new(0, 0.5);
			TextLabel.Position = UDim2.new(0, 20, 0.5, 0);
			TextLabel.Size = UDim2.new(1, -50, 1, 0);
			TextLabel.Font = Enum.Font.Cartoon;
			TextLabel.RichText = true;
			TextLabel.Text = texto;
			TextLabel.TextXAligment = Enum.TextXAligment.Left;
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
			TextLabel.TextSize = 15;
			TextLabel.ClipsDescendants = true;
            local ArrowRight = Instance.new("ImageLabel");
			ArrowRight.Name = "ArrowRight";
			ArrowRight.Parent = Button;
			ArrowRight.BackgroundColor3 = _G.Primary;
			ArrowRight.BackgroundTransparency = 1;
			ArrowRight.AnchorPoint = Vector2.new(0, 0.5);
			ArrowRight.Position = UDim2.new(0, 0, 0.5, 0);
			ArrowRight.Size = UDim2.new(0, 15, 0, 15);
			ArrowRight.Image = "rbxassetid://10709768347";
			ArrowRight.ImageTransparency = 0;
			ArrowRight.ImageColor3 = Color3.fromRGB(255, 255, 255);
			Black.Name = "Preto";
			Preto.Pai = Botão;
			Preto.CorDeFundo3 = Cor3.fromRGB(0, 0, 0);
			Black.BackgroundTransparency = 1;
			Black.BorderSizePixel = 0;
			Black.Position = UDim2.new(0, 0, 0, 0);
			Black.Size = UDim2.new(1, 0, 0, 33);
			UICorner_3.CornerRadius = UDim.new(0, 5);
			UICorner_3.Parent = Preto;
			TextButton.MouseButton1Click:Connect(function()
				ligar de volta();
			fim);
		fim;
		função principal:Alternar(texto, configuração, descrição, retorno de chamada)
			config = config ou falso;
			local toggled = config;
			local UICorner = Instance.new("UICorner");
			local TogglePadding = Instance.new("UIPadding");
			local UIStroke = Instance.new("UIStroke");
			local Button = Instance.new("TextButton");
			local UICorner_2 = Instance.new("UICorner");
			local Title = Instance.new("TextLabel");
			local Title2 = Instance.new("TextLabel");
			local Desc = Instance.new("TextLabel");
			local ToggleImage = Instance.new("TextButton");
			local UICorner_3 = Instance.new("UICorner");
			local UICorner_5 = Instance.new("UICorner");
			local Circle = Instance.new("Frame");
			local ToggleFrame = Instance.new("Frame");
			local UICorner_4 = Instance.new("UICorner");
			local TextBoxIcon = Instance.new("ImageLabel");
			Button.Name = "Botão";
			Button.Parent = MainFramePage;
			Button.BackgroundColor3 = _G.Primary;
			Button.BackgroundTransparency = 0.8;
			Button.AutoButtonColor = false;
			Button.Font = Enum.Font.SourceSans;
			Button.Text = "";
			Button.TextColor3 = Color3.fromRGB(0, 0, 0);
			Button.TextSize = 11;
			CriarArredondado(Botão, 5);
			Título2.Pai = Botão;
			Título2.CorDeFundo3 = Cor3.fromRGB(150, 150, 150);
			Título2.TransparênciaDeFundo = 1;
			Título2.Tamanho = UDim2.novo(1, 0, 0, 35);
			Título2.Fonte = Enum.Fonte.Desenho animado;
			Título2.Texto = texto;
			Título2.TextColor3 = Color3.fromRGB(255, 255, 255);
			Título2.TamanhoDoTexto = 15;
			Título2.TextXAlignment = Enum.TextXAlignment.Left;
			Título2.PontoDeÂncora = Vector2.new(0, 0.5);
			Desc.Parent = Título2;
			Desc.BackgroundColor3 = Color3.fromRGB(100, 100, 100);
			Desc.BackgroundTransparency = 1;
			Desc.Position = UDim2.new(0, 0, 0, 22);
			Desc.Size = UDim2.new(0, 280, 0, 16);
			Desc.Font = Enum.Font.Gotham;
			se desc então
				Desc.Text = desc;
				Título2.Posição = UDim2.new(0, 15, 0.5, -5);
				Desc.Position = UDim2.new(0, 0, 0, 22);
				Button.Size = UDim2.new(1, 0, 0, 46);
			outro
				Título2.Posição = UDim2.new(0, 15, 0.5, 0);
				Desc.Visível = falso;
				Button.Size = UDim2.new(1, 0, 0, 36);
			fim;
			Desc.TextColor3 = Color3.fromRGB(150, 150, 150);
			Desc.TextSize = 10;
			Desc.TextXAlignment = Enum.TextXAlignment.Left;
			ToggleFrame.Name = "ToggleFrame";
			ToggleFrame.Parent = Button;
			ToggleFrame.BackgroundColor3 = _G.Dark;
			ToggleFrame.BackgroundTransparency = 1;
			ToggleFrame.Position = UDim2.new(1, -10, 0.5, 0);
			ToggleFrame.Size = UDim2.new(0, 35, 0, 20);
			ToggleFrame.AnchorPoint = Vector2.new(1, 0.5);
			UICorner_5.CornerRadius = UDim.new(0, 10);
			UICorner_5.Parent = ToggleFrame;
			ToggleImage.Name = "ToggleImage";
			ToggleImage.Parent = ToggleFrame;
			ToggleImage.BackgroundColor3 = Color3.fromRGB(200, 200, 200);
			ToggleImage.BackgroundTransparency = 0.8;
			ToggleImage.Position = UDim2.new(0, 0, 0, 0);
			ToggleImage.AnchorPoint = Vector2.new(0, 0);
			ToggleImage.Size = UDim2.new(1, 0, 1, 0);
			ToggleImage.Text = "";
			ToggleImage.AutoButtonColor = false;
			CriarArredondado(AlternarImagem, 10);
			Circle.Name = "Circle";
			Círculo.Pai = AlternarImagem;
			Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Circle.BackgroundTransparency = 0;
			Circle.Position = UDim2.new(0, 3, 0.5, 0);
			Circle.Size = UDim2.new(0, 14, 0, 14);
			Circle.AnchorPoint = Vector2.new(0, 0.5);
			UICorner_4.CornerRadius = UDim.new(0, 10);
			UICorner_4.Parent = Circle;
			ToggleImage.MouseButton1Click:Connect(function()
				se alternado == falso então
					alternado = verdadeiro;
					Circle:TweenPosition(UDim2.new(0, 17, 0.5, 0), "Out", "Sine", 0.2, true);
					(TweenService:Create(ToggleImage, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundColor3 = _G.Third,
						BackgroundTransparency = 0
					})):Jogar();
				outro
					alternado = falso;
					Circle:TweenPosition(UDim2.new(0, 4, 0.5, 0), "Out", "Sine", 0.2, true);
					(TweenService:Create(ToggleImage, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(200, 200, 200),
						BackgroundTransparency = 0.8
					})):Jogar();
				fim;
				pcall(callback, alternado);
			fim);
			se config == verdadeiro então
				alternado = verdadeiro;
				Circle:TweenPosition(UDim2.new(0, 17, 0.5, 0), "Out", "Sine", 0.4, true);
				(TweenService:Create(ToggleImage, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundColor3 = _G.Third,
					BackgroundTransparency = 0
				})):Jogar();
				pcall(callback, alternado);
			fim;
		fim;
		função principal:Dropdown(texto, opção, var, callback)
			local isdropping = falso;
			local Dropdown = Instance.new("Frame");
			local DropdownFrameScroll = Instance.new("Frame");
			local UICorner = Instance.new("UICorner");
			local UICorner_2 = Instance.new("UICorner");
			local UICorner_3 = Instance.new("UICorner");
			local UICorner_4 = Instance.new("UICorner");
			local DropTitle = Instance.new("TextLabel");
			local DropScroll = Instance.new("ScrollingFrame");
			local UIListLayout = Instance.new("UIListLayout");
			local UIPadding = Instance.new("UIPadding");
			local DropButton = Instance.new("TextButton");
			local HideButton = Instance.new("TextButton");
			local SelectItems = Instance.new("TextButton");
			local DropImage = Instance.new("ImageLabel");
			local UIStroke = Instance.new("UIStroke");
			Dropdown.Name = "Dropdown";
			Dropdown.Parent = MainFramePage;
			Dropdown.BackgroundColor3 = _G.Primary;
			Dropdown.BackgroundTransparency = 0.8;
			Dropdown.ClipsDescendants = false;
			Dropdown.Size = UDim2.new(1, 0, 0, 40);
			UICorner.CornerRadius = UDim.new(0, 5);
			UICorner.Parent = Dropdown;
			DropTitle.Name = "DropTitle";
			DropTitle.Parent = Dropdown;
			DropTitle.BackgroundColor3 = _G.Primary;
			DropTitle.BackgroundTransparency = 1;
			DropTitle.Size = UDim2.new(1, 0, 0, 30);
			DropTitle.Font = Enum.Font.Cartoon;
			DropTitle.Text = texto;
			DropTitle.TextColor3 = Color3.fromRGB(255, 255, 255);
			DropTitle.TextSize = 15;
			DropTitle.TextXAlignment = Enum.TextXAlignment.Left;
			DropTitle.Position = UDim2.new(0, 15, 0, 5);
			DropTitle.AnchorPoint = Vector2.new(0, 0);
			SelectItems.Name = "SelectItems";
			SelectItems.Parent = Lista suspensa;
			SelectItems.BackgroundColor3 = Color3.fromRGB(24, 24, 26);
			SelectItems.TextColor3 = Color3.fromRGB(255, 255, 255);
			SelectItems.BackgroundTransparency = 0;
			SelectItems.Position = UDim2.new(1, -5, 0, 5);
			SelectItems.Size = UDim2.new(0, 100, 0, 30);
			SelectItems.AnchorPoint = Vector2.new(1, 0);
			SelectItems.Font = Enum.Font.GothamMedium;
			SelectItems.AutoButtonColor = false;
			SelectItems.TextSize = 9;
			SelectItems.ZIndex = 1;
			SelectItems.ClipsDescendants = true;
			SelectItems.Text = "Selecione os itens";
			SelectItems.TextXAlignment = Enum.TextXAlignment.Left;
			local ArrowDown = Instance.new("ImageLabel");
			ArrowDown.Name = "ArrowDown";
			ArrowDown.Parent = Lista suspensa;
			ArrowDown.BackgroundColor3 = _G.Primary;
			ArrowDown.BackgroundTransparency = 1;
			ArrowDown.AnchorPoint = Vector2.new(1, 0);
			ArrowDown.Position = UDim2.new(1, -110, 0, 10);
			ArrowDown.Size = UDim2.new(0, 20, 0, 20);
			ArrowDown.Image = "rbxassetid://10709790948";
			ArrowDown.ImageTransparency = 0;
			ArrowDown.ImageColor3 = Color3.fromRGB(255, 255, 255);
			CriarArredondado(SelecionarItens, 5);
			CriarRodado(RolagemDrop, 5);
			DropdownFrameScroll.Name = "DropdownFrameScroll";
			DropdownFrameScroll.Parent = Dropdown;
			DropdownFrameScroll.BackgroundColor3 = Color3.fromRGB(24, 24, 26);
			DropdownFrameScroll.BackgroundTransparency = 0;
			DropdownFrameScroll.ClipsDescendants = true;
			DropdownFrameScroll.Size = UDim2.new(1, 0, 0, 100);
			DropdownFrameScroll.Position = UDim2.new(0, 5, 0, 40);
			DropdownFrameScroll.Visible = false;
			DropdownFrameScroll.AnchorPoint = Vector2.new(0, 0);
			UICorner_4.Parent = DropdownFrameScroll;
			UICorner_4.CornerRadius = UDim.new(0, 5);
			DropScroll.Name = "DropScroll";
			DropScroll.Parent = DropdownFrameScroll;
			DropScroll.ScrollingDirection = Enum.ScrollingDirection.Y;
			DropScroll.Active = true;
			DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			DropScroll.BackgroundTransparency = 1;
			DropScroll.BorderSizePixel = 0;
			DropScroll.Position = UDim2.new(0, 0, 0, 10);
			DropScroll.Size = UDim2.new(1, 0, 0, 80);
			DropScroll.AnchorPoint = Vector2.new(0, 0);
			DropScroll.ClipsDescendants = true;
			DropScroll.ScrollBarThickness = 3;
			DropScroll.ZIndex = 3;
			local PaddingDrop = Instance.new("UIPadding");
			PaddingDrop.PaddingLeft = UDim.new(0, 10);
			PaddingDrop.PaddingRight = UDim.new(0, 10);
			PaddingDrop.Parent = DropScroll;
			PaddingDrop.Name = "PaddingDrop";
			UIListLayout.Parent = DropScroll;
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
			UIListLayout.Padding = UDim.new(0, 1);
			UIPadding.Parent = DropScroll;
			UIPadding.PaddingLeft = UDim.new(0, 5);
			para i, v em próximo, opção faça
				local Item = Instance.new("TextButton");
				local CRNRitems = Instance.new("UICorner");
				local UICorner_5 = Instance.new("UICorner");
				local ItemPadding = Instance.new("UIPadding");
				Item.Name = "Item";
				Item.Parent = DropScroll;
				Item.BackgroundColor3 = _G.Primary;
				Item.BackgroundTransparency = 1;
				Item.Size = UDim2.new(1, 0, 0, 30);
				Item.Font = Enum.Font.Nunito;
				Item.Text = tostring(v);
				Item.TextColor3 = Color3.fromRGB(255, 255, 255);
				Item.TextSize = 13;
				Item.TextTransparency = 0.5;
				Item.TextXAligment = Enum.TextXAligment.Left;
				Item.ZIndex = 4;
				ItemPadding.Parent = Item;
				ItemPadding.PaddingLeft = UDim.new(0, 8);
				UICorner_5.Parent = Item;
				UICorner_5.CornerRadius = UDim.new(0, 5);
				local SelectedItems = Instance.new("Frame");
				SelectedItems.Name = "SelectedItems";
				SelectedItems.Parent = Item;
				SelectedItems.BackgroundColor3 = _G.Third;
				SelectedItems.BackgroundTransparency = 1;
				SelectedItems.Size = UDim2.new(0, 3, 0.4, 0);
				SelectedItems.Position = UDim2.new(0, -8, 0.5, 0);
				SelectedItems.AnchorPoint = Vector2.new(0, 0.5);
				SelectedItems.ZIndex = 4;
				CRNRitems.Parent = SelectedItems;
				CRNRitems.CornerRadius = UDim.new(0, 999);
				se var então
					pcall(callback, var);
					SelectItems.Text = " " .. var;
					activeItem = tostring(var);
					para i, v em next, DropScroll:GetChildren() faça
						se v:IsA("TextButton") então
							local SelectedItems = v:FindFirstChild("SelectedItems");
							se activeItem == v.Text então
								v.BackgroundTransparency = 0.8;
								v.TextTransparency = 0;
								se SelectedItems então
									SelectedItems.BackgroundTransparency = 0;
								fim;
							fim;
						fim;
					fim;
				fim;
				Item.MouseButton1Click:Connect(function()
					SelectItems.ClipsDescendants = true;
					callback(Item.Text);
					activeItem = Item.Text;
					para i, v em next, DropScroll:GetChildren() faça
						se v:IsA("TextButton") então
							local SelectedItems = v:FindFirstChild("SelectedItems");
							se activeItem == v.Text então
								v.BackgroundTransparency = 0.8;
								v.TextTransparency = 0;
								se SelectedItems então
									SelectedItems.BackgroundTransparency = 0;
								fim;
							outro
								v.BackgroundTransparency = 1;
								v.TextTransparency = 0.5;
								se SelectedItems então
									SelectedItems.BackgroundTransparency = 1;
								fim;
							fim;
						fim;
					fim;
					SelectItems.Text = " " .. Item.Text;
				fim);
			fim;
			DropScroll.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y);
			SelectItems.MouseButton1Click:Connect(function()
				se isdropping == falso então
					isdropping = verdadeiro;
					(TweenService:Create(DropdownFrameScroll, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Tamanho = UDim2.new(1, -10, 0, 100),
						Visível = verdadeiro
					})):Jogar();
					(TweenService:Create(Dropdown, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Tamanho = UDim2.new(1, 0, 0, 145)
					})):Jogar();
                    (TweenService:Create(ArrowDown, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Rotação = 180
                    })):Jogar();
				outro
					isdropping = falso;
					(TweenService:Create(DropdownFrameScroll, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Tamanho = UDim2.new(1, -10, 0, 0),
						Visível = falso
					})):Jogar();
					(TweenService:Create(Dropdown, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Tamanho = UDim2.new(1, 0, 0, 40)
					})):Jogar();
                    (TweenService:Create(ArrowDown, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Rotação = 0
                    })):Jogar();
				fim;
			fim);
			local dropfunc = {};
			função dropfunc:Adicionar(t)
				local Item = Instance.new("TextButton");
				local CRNRitems = Instance.new("UICorner");
				local UICorner_5 = Instance.new("UICorner");
				local ItemPadding = Instance.new("UIPadding");
				Item.Name = "Item";
				Item.Parent = DropScroll;
				Item.BackgroundColor3 = _G.Primary;
				Item.BackgroundTransparency = 1;
				Item.Size = UDim2.new(1, 0, 0, 30);
				Item.Font = Enum.Font.Nunito;
				Item.Text = tostring(t);
				Item.TextColor3 = Color3.fromRGB(255, 255, 255);
				Item.TextSize = 13;
				Item.TextTransparency = 0.5;
				Item.TextXAligment = Enum.TextXAligment.Left;
				Item.ZIndex = 4;
				ItemPadding.Parent = Item;
				ItemPadding.PaddingLeft = UDim.new(0, 8);
				UICorner_5.Parent = Item;
				UICorner_5.CornerRadius = UDim.new(0, 5);
				local SelectedItems = Instance.new("Frame");
				SelectedItems.Name = "SelectedItems";
				SelectedItems.Parent = Item;
				SelectedItems.BackgroundColor3 = _G.Third;
				SelectedItems.BackgroundTransparency = 1;
				SelectedItems.Size = UDim2.new(0, 3, 0.4, 0);
				SelectedItems.Position = UDim2.new(0, -8, 0.5, 0);
				SelectedItems.AnchorPoint = Vector2.new(0, 0.5);
				SelectedItems.ZIndex = 4;
				CRNRitems.Parent = SelectedItems;
				CRNRitems.CornerRadius = UDim.new(0, 999);
				Item.MouseButton1Click:Connect(function()
					callback(Item.Text);
					activeItem = Item.Text;
					para i, v em next, DropScroll:GetChildren() faça
						se v:IsA("TextButton") então
							local SelectedItems = v:FindFirstChild("SelectedItems");
							se activeItem == v.Text então
								v.BackgroundTransparency = 0.8;
								v.TextTransparency = 0;
								se SelectedItems então
									SelectedItems.BackgroundTransparency = 0;
								fim;
							outro
								v.BackgroundTransparency = 1;
								v.TextTransparency = 0.5;
								se SelectedItems então
									SelectedItems.BackgroundTransparency = 1;
								fim;
							fim;
						fim;
					fim;
					SelectItems.Text = " " .. Item.Text;
				fim);
			fim;
			função dropfunc:Limpar()
				SelectItems.Text = "Selecione os itens";
				isdropping = falso;
				DropdownFrameScroll.Visible = false;
				para i, v em next, DropScroll:GetChildren() faça
					se v:IsA("TextButton") então
						v:Destruir();
					fim;
				fim;
			fim;
			retornar dropfunc;
		fim;
		função principal: Slider(texto, mínimo, máximo, definir, retorno de chamada)
			local Slider = Instance.new("Frame");
			local slidercorner = Instance.new("UICorner");
			local sliderr = Instance.new("Frame");
			local sliderrcorner = Instance.new("UICorner");
			local ImageLabel = Instance.new("ImageLabel");
			local SliderStroke = Instance.new("UIStroke");
			local Title = Instance.new("TextLabel");
			local ValueText = Instance.new("TextLabel");
			local HAHA = Instance.new("Frame");
			local AHEHE = Instance.new("TextButton");
			local bar = Instance.new("Frame");
			local bar1 = Instance.new("Frame");
			local bar1corner = Instance.new("UICorner");
			local barcorner = Instance.new("UICorner");
			local circlebar = Instance.new("Frame");
			local UICorner = Instance.new("UICorner");
			valor do controle deslizante local = Instance.new("Frame");
			local valuecorner = Instance.new("UICorner");
			local TextBox = Instance.new("TextBox");
			local UICorner_2 = Instance.new("UICorner");
			local posto = Instance.new("UIStroke");
			Slider.Name = "Slider";
			Slider.Parent = MainFramePage;
			Slider.BackgroundColor3 = _G.Primary;
			Slider.BackgroundTransparency = 1;
			Slider.Size = UDim2.new(1, 0, 0, 35);
			slidercorner.CornerRadius = UDim.new(0, 5);
			slidercorner.Name = "slidercorner";
			slidercorner.Parent = Slider;
			sliderr.Name = "sliderr";
			sliderr.Parent = Slider;
			sliderr.BackgroundColor3 = _G.Primary;
			sliderr.BackgroundTransparency = 0.8;
			sliderr.Position = UDim2.new(0, 0, 0, 0);
			sliderr.Size = UDim2.new(1, 0, 0, 35);
			sliderrcorner.CornerRadius = UDim.new(0, 5);
			sliderrcorner.Name = "sliderrcorner";
			sliderrcorner.Parent = sliderr;
			Título.Pai = sliderr;
			Título.CorDeFundo3 = Cor3.fromRGB(150, 150, 150);
			Título.TransparênciaDeFundo = 1;
			Título.Posição = UDim2.new(0, 15, 0.5, 0);
			Título.Tamanho = UDim2.new(1, 0, 0, 30);
			Título.Fonte = Enum.Fonte.Desenho animado;
			Título.Texto = texto;
			Título.PontoDeÂncora = Vector2.new(0, 0.5);
			Title.TextColor3 = Color3.fromRGB(255, 255, 255);
			Título.TamanhoDoTexto = 15;
			Título.TextXAlignment = Enum.TextXAlignment.Left;
			ValueText.Parent = barra;
			ValueText.BackgroundColor3 = Color3.fromRGB(150, 150, 150);
			ValueText.BackgroundTransparency = 1;
			ValorTexto. Posição = UDim2 . novo (0, -38, 0,5, 0);
			ValueText.Size = UDim2.new(0, 30, 0, 30);
			ValueText.Font = Enum.Font.GothamMedium;
			ValueText.Text = conjunto;
			ValueText.AnchorPoint = Vector2.new(0, 0.5);
			ValueText.TextColor3 = Color3.fromRGB(255, 255, 255);
			ValueText.TextSize = 12;
			ValueText.TextXAligment = Enum.TextXAligment.Right;
			bar.Name = "bar";
			barra.Pai = sliderr;
			bar.BackgroundColor3 = Color3.fromRGB(200, 200, 200);
			bar.Size = UDim2.new(0, 100, 0, 4);
			bar.Position = UDim2.new(1, -10, 0.5, 0);
			bar.BackgroundTransparency = 0.8;
			bar.AnchorPoint = Vector2.new(1, 0.5);
			bar1.Name = "bar1";
			bar1.Parent = bar;
			bar1.BackgroundColor3 = _G.Third;
			bar1.BackgroundTransparency = 0;
			bar1.Size = UDim2.new(set / max, 0, 0, 4);
			bar1corner.CornerRadius = UDim.new(0, 5);
			bar1corner.Name = "bar1corner";
			bar1corner.Parent = bar1;
			barcorner.CornerRadius = UDim.new(0, 5);
			barcorner.Name = "barcorner";
			barcorner.Parent = bar;
			circlebar.Name = "circlebar";
			circlebar.Parent = bar1;
			circlebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			circlebar.Position = UDim2.new(1, 0, 0, -5);
			circlebar.AnchorPoint = Vector2.new(0.5, 0);
			circlebar.Size = UDim2.new(0, 13, 0, 13);
			UICorner.CornerRadius = UDim.new(0, 100);
			UICorner.Parent = circlebar;
			valorcorner.CornerRadius = UDim.new(0, 2);
			valuecorner.Name = "valuecorner";
			valuecorner.Parent = valor do controle deslizante;
			local mouse = game.Players.LocalPlayer:GetMouse();
			local uis = game:GetService("UserInputService");
			Se o valor for igual a nulo, então
				Valor = conjunto;
				pcall(função()
					callback(Valor);
				fim);
			fim;
			local Arrastar = falso;
			circlebar.InputBegan:Connect(function(Input)
				Se Input.UserInputType == Enum.UserInputType.MouseButton1 ou Input.UserInputType == Enum.UserInputType.Touch então
					Arrastar = verdadeiro;
				fim;
			fim);
			bar.InputBegan:Connect(function(Input)
				Se Input.UserInputType == Enum.UserInputType.MouseButton1 ou Input.UserInputType == Enum.UserInputType.Touch então
					Arrastar = verdadeiro;
				fim;
			fim);
			UserInputService.InputEnded:Connect(function(Input)
				Se Input.UserInputType == Enum.UserInputType.MouseButton1 ou Input.UserInputType == Enum.UserInputType.Touch então
					Arrastar = falso;
				fim;
			fim);
			UserInputService.InputChanged:Connect(function(Input)
				Se arrastar e (Input.UserInputType == Enum.UserInputType.MouseMovement ou Input.UserInputType == Enum.UserInputType.Touch) então
					Valor = math.floor((tonumber(max) - tonumber(min)) / 100 * bar1.AbsoluteSize.X + tonumber(min)) ou 0;
					pcall(função()
						callback(Valor);
					fim);
					ValueText.Text = Valor;
					bar1.Size = UDim2.new(0, math.clamp(Input.Position.X - bar1.AbsolutePosition.X, 0, 100), 0, 4);
					circlebar.Position = UDim2.new(0, math.clamp(Input.Position.X - bar1.AbsolutePosition.X - 5, 0, 100), 0, -5);
				fim;
			fim);
		fim;
		função principal: Caixa de texto(texto, desaparecer, retorno de chamada)
			local Textbox = Instance.new("Frame");
			local TextboxCorner = Instance.new("UICorner");
			local TextboxLabel = Instance.new("TextLabel");
			local RealTextbox = Instance.new("TextBox");
			local UICorner = Instance.new("UICorner");
			local TextBoxIcon = Instance.new("ImageLabel");
			Textbox.Name = "Caixa de texto";
			Textbox.Parent = MainFramePage;
			Textbox.BackgroundColor3 = _G.Primary;
			Textbox.BackgroundTransparency = 0.8;
			Textbox.Size = UDim2.new(1, 0, 0, 35);
			TextboxCorner.CornerRadius = UDim.new(0, 5);
			TextboxCorner.Name = "TextboxCorner";
			TextboxCorner.Parent = Textbox;
			TextboxLabel.Name = "TextboxLabel";
			TextboxLabel.Parent = Textbox;
			TextboxLabel.BackgroundColor3 = _G.Primary;
			TextboxLabel.BackgroundTransparency = 1;
			TextboxLabel.Position = UDim2.new(0, 15, 0.5, 0);
			TextboxLabel.Text = texto;
			TextboxLabel.Size = UDim2.new(1, 0, 0, 35);
			TextboxLabel.Font = Enum.Font.Nunito;
			TextboxLabel.AnchorPoint = Vector2.new(0, 0.5);
			TextboxLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
			TextboxLabel.TextSize = 15;
			TextboxLabel.TextTransparency = 0;
			TextboxLabel.TextXAligment = Enum.TextXAligment.Left;
			RealTextbox.Name = "RealTextbox";
			RealTextbox.Parent = Textbox;
			RealTextbox.BackgroundColor3 = Color3.fromRGB(200, 200, 200);
			RealTextbox.BackgroundTransparency = 0.8;
			RealTextbox.Position = UDim2.new(1, -5, 0.5, 0);
			RealTextbox.AnchorPoint = Vector2.new(1, 0.5);
			RealTextbox.Size = UDim2.new(0, 80, 0, 25);
			RealTextbox.Font = Enum.Font.Gotham;
			RealTextbox.Text = "";
			RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225);
			RealTextbox.TextSize = 11;
			RealTextbox.TextTransparency = 0;
			RealTextbox.ClipsDescendants = true;
			RealTextbox.FocusLost:Connect(function()
				callback(RealTextbox.Text);
			fim);
			UICorner.CornerRadius = UDim.new(0, 5);
			UICorner.Parent = RealTextbox;
		fim;
		função principal: Rótulo(texto)
			local Frame = Instance.new("Frame");
			local Label = Instance.new("TextLabel");
			local PaddingLabel = Instance.new("UIPadding");
			local labelfunc = {};
			Frame.Name = "Frame";
			Frame.Parent = MainFramePage;
			Frame.BackgroundColor3 = _G.Primary;
			Frame.BackgroundTransparency = 1;
			Frame.Size = UDim2.new(1, 0, 0, 30);
			Label.Name = "Rótulo";
			Rótulo.Pai = Quadro;
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Label.BackgroundTransparency = 1;
			Label.Size = UDim2.new(1, -30, 0, 30);
			Label.Font = Enum.Font.Nunito;
			Label.Position = UDim2.new(0, 30, 0.5, 0);
			Label.AnchorPoint = Vector2.new(0, 0.5);
			Label.TextColor3 = Color3.fromRGB(225, 225, 225);
			Label.TextSize = 15;
			Rótulo.Texto = texto;
			Label.TextXAligment = Enum.TextXAligment.Left;
			local ImageLabel = Instance.new("ImageLabel");
			ImageLabel.Name = "ImageLabel";
			ImageLabel.Parent = Frame;
			ImageLabel.BackgroundColor3 = Color3.fromRGB(200, 200, 200);
			ImageLabel.BackgroundTransparency = 1;
			ImageLabel.ImageTransparency = 0;
			ImageLabel.Position = UDim2.new(0, 10, 0.5, 0);
			ImageLabel.Size = UDim2.new(0, 14, 0, 14);
			ImageLabel.AnchorPoint = Vector2.new(0, 0.5);
			ImageLabel.Image = "rbxassetid://10723415903";
			ImageLabel.ImageColor3 = Color3.fromRGB(200, 200, 200);
			função labelfunc:Set(novotexto)
				Label.Text = novotexto;
			fim;
			retornar função_rótulo;
		fim;
		função principal:Separador(texto)
			local Seperator = Instance.new("Frame");
			local Sep1 = Instance.new("TextLabel");
			local Sep2 = Instance.new("TextLabel");
			local Sep3 = Instance.new("TextLabel");
			local SepRadius = Instance.new("UICorner");
			Separador.Nome = "Separador";
			Separador.Pai = MainFramePage;
			Separator.BackgroundColor3 = _G.Primary;
			Separador.TransparênciaDeFundo = 1;
			Separator.Size = UDim2.new(1, 0, 0, 36);
			Sep1.Name = "Sep1";
			Sep1.Parent = Separador;
			Sep1.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Sep1.BackgroundTransparency = 1;
			Sep1.AnchorPoint = Vector2.new(0, 0.5);
			Sep1.Position = UDim2.new(0, 0, 0.5, 0);
			Sep1.Size = UDim2.new(0, 20, 0, 36);
			Sep1.Font = Enum.Font.GothamBold;
			Sep1.RichText = verdadeiro;
			Sep1.Text = "âŒ©<font color=\"rgb(255, 0, 0)\">âŒ©</font>";
			Sep1.TextColor3 = Color3.fromRGB(255, 255, 255);
			Sep1.TextSize = 14;
			Sep2.Name = "Sep2";
			Sep2.Parent = Separador;
			Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Sep2.BackgroundTransparency = 1;
			Sep2.AnchorPoint = Vector2.new(0.5, 0.5);
			Sep2.Position = UDim2.new(0.5, 0, 0.5, 0);
			Sep2.Size = UDim2.new(1, 0, 0, 36);
			Sep2.Font = Enum.Font.GothamBold;
			Sep2.Text = texto;
			Sep2.TextColor3 = Color3.fromRGB(255, 255, 255);
			Sep2.TextSize = 14;
			Sep3.Name = "Sep3";
			Sep3.Parent = Separador;
			Sep3.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Sep3.BackgroundTransparency = 1;
			Sep3.AnchorPoint = Vector2.new(1, 0.5);
			Sep3.Position = UDim2.new(1, 0, 0.5, 0);
			Sep3.Size = UDim2.new(0, 20, 0, 36);
			Sep3.Font = Enum.Font.GothamBold;
			Sep3.RichText = verdadeiro;
			Sep3.Text = "<font color=\"rgb(255, 0, 0)\">âŒª</font>âŒª";
			Sep3.TextColor3 = Color3.fromRGB(255, 255, 255);
			Sep3.TextSize = 14;
		fim;
		função principal:Linha()
			local Linee = Instance.new("Frame");
			local Line = Instance.new("Frame");
			local UIGradient = Instance.new("UIGradient");
			Linhas.Nome = "Linhas";
			Linee.Parent = MainFramePage;
			Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Linee.BackgroundTransparency = 1;
			Linee.Position = UDim2.new(0, 0, 0.119999997, 0);
			Linee.Size = UDim2.new(1, 0, 0, 20);
			Linha.Nome = "Linha";
			Linha.Pai = Linha;
			Linha.BackgroundColor3 = Color3.new(125, 125, 125);
			Line.BorderSizePixel = 0;
			Linha.Posição = UDim2.new(0, 0, 0, 10);
			Line.Size = UDim2.new(1, 0, 0, 1);
			UIGradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, _G.Dark),
				ColorSequenceKeypoint.new(0.4, _G.Primary),
				ColorSequenceKeypoint.new(0.5, _G.Primary),
				ColorSequenceKeypoint.new(0.6, _G.Primary),
				ColorSequenceKeypoint.new(1, _G.Dark)
			});
			UIGradient.Parent = Linha;
		fim;
		retornar principal;
	fim;
	retornar uitab;
fim;
Retornar atualização;
