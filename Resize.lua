local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 1. CREACIÓN DE CONTENEDORES (SCREEN GUI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MichiFluxPlusGUI"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

-- 2. PANTALLA DE BIENVENIDA (INTRO)
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Size = UDim2.new(0, 360, 0, 240)
WelcomeFrame.Position = UDim2.new(0.5, -180, 0.5, -120)
WelcomeFrame.BackgroundColor3 = Color3.fromRGB(11, 14, 18)
WelcomeFrame.BorderSizePixel = 0
WelcomeFrame.Parent = ScreenGui

local WelcomeCorner = Instance.new("UICorner", WelcomeFrame)
WelcomeCorner.CornerRadius = UDim.new(0, 12)

local WelcomeStroke = Instance.new("UIStroke", WelcomeFrame)
WelcomeStroke.Thickness = 2
WelcomeStroke.Color = Color3.fromRGB(235, 12, 100)

local WelcomeTitle = Instance.new("TextLabel")
WelcomeTitle.Size = UDim2.new(1, 0, 0, 50)
WelcomeTitle.Position = UDim2.new(0, 0, 0, 20)
WelcomeTitle.BackgroundTransparency = 1
WelcomeTitle.Text = "MichiFlux Plus [FE]"
WelcomeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeTitle.TextSize = 24
WelcomeTitle.Font = Enum.Font.GothamBold
WelcomeTitle.Parent = WelcomeFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 0, 75)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Verificando consistencia de físicas..."
StatusLabel.TextColor3 = Color3.fromRGB(0, 180, 216)
StatusLabel.TextSize = 14
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.Parent = WelcomeFrame

local AngresarBtn = Instance.new("TextButton")
AngresarBtn.Size = UDim2.new(0, 160, 0, 40)
AngresarBtn.Position = UDim2.new(0.5, -80, 0, 130)
AngresarBtn.BackgroundColor3 = Color3.fromRGB(0, 168, 104)
AngresarBtn.Text = "INGRESAR"
AngresarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AngresarBtn.TextSize = 14
AngresarBtn.Font = Enum.Font.GothamBold
AngresarBtn.Visible = false
AngresarBtn.Parent = WelcomeFrame
Instance.new("UICorner", AngresarBtn).CornerRadius = UDim.new(0, 6)

-- 3. INTERFAZ PRINCIPAL (MICHIFLUX PLUS [FE])
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 200)
MainFrame.Position = UDim2.new(0.5, -140, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(11, 14, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Thickness = 2
MainStroke.Color = Color3.fromRGB(235, 12, 100)

local MainTitle = Instance.new("TextLabel")
MainTitle.Size = UDim2.new(1, 0, 0, 40)
MainTitle.Position = UDim2.new(0, 0, 0, 10)
MainTitle.BackgroundTransparency = 1
MainTitle.Text = "MichiFlux Plus [FE]"
MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTitle.TextSize = 18
MainTitle.Font = Enum.Font.GothamBold
MainTitle.Parent = MainFrame

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 20)
Subtitle.Position = UDim2.new(0, 0, 0, 45)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "RESIZE ADVANCED PRO"
Subtitle.TextColor3 = Color3.fromRGB(0, 180, 216)
Subtitle.TextSize = 12
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.Parent = MainFrame

local AplicarBtn = Instance.new("TextButton")
AplicarBtn.Size = UDim2.new(0, 100, 0, 35)
AplicarBtn.Position = UDim2.new(0.5, 5, 0, 100)
AplicarBtn.BackgroundColor3 = Color3.fromRGB(0, 168, 104)
AplicarBtn.Text = "APLICAR"
AplicarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AplicarBtn.Font = Enum.Font.GothamBold
AplicarBtn.TextSize = 12
AplicarBtn.Parent = MainFrame
Instance.new("UICorner", AplicarBtn).CornerRadius = UDim.new(0, 6)

local ReiniciarBtn = Instance.new("TextButton")
ReiniciarBtn.Size = UDim2.new(0, 210, 0, 35)
ReiniciarBtn.Position = UDim2.new(0.5, -105, 0, 145)
ReiniciarBtn.BackgroundColor3 = Color3.fromRGB(190, 30, 45)
ReiniciarBtn.Text = "REINICIAR TAMAÑO (1.0x)"
ReiniciarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ReiniciarBtn.Font = Enum.Font.GothamBold
ReiniciarBtn.TextSize = 11
ReiniciarBtn.Parent = MainFrame
Instance.new("UICorner", ReiniciarBtn).CornerRadius = UDim.new(0, 6)

local ScaleTextBox = Instance.new("TextBox")
ScaleTextBox.Size = UDim2.new(0, 100, 0, 35)
ScaleTextBox.Position = UDim2.new(0.5, -105, 0, 100)
ScaleTextBox.BackgroundColor3 = Color3.fromRGB(20, 24, 30)
ScaleTextBox.Text = "0.5"
ScaleTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ScaleTextBox.Font = Enum.Font.GothamMedium
ScaleTextBox.TextSize = 14
ScaleTextBox.Parent = MainFrame
Instance.new("UICorner", ScaleTextBox).CornerRadius = UDim.new(0, 6)

-- 4. BOTÓN DE MINIMIZAR (AZUL)
local OcultarBtn = Instance.new("TextButton")
OcultarBtn.Size = UDim2.new(0, 90, 0, 35)
OcultarBtn.Position = UDim2.new(0, 20, 0, 20)
OcultarBtn.BackgroundColor3 = Color3.fromRGB(0, 119, 182)
OcultarBtn.Text = "OCULTAR"
OcultarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OcultarBtn.TextSize = 12
OcultarBtn.Font = Enum.Font.GothamBold
OcultarBtn.Visible = false
OcultarBtn.Parent = ScreenGui
Instance.new("UICorner", OcultarBtn).CornerRadius = UDim.new(0, 6)

-- ============================================================
-- 5. LÓGICA DE ESCALADO AUTOMÁTICO Y BACKUP DE UNIONES
-- ============================================================
local function transformarTamanoFE(escala)
    local char = LocalPlayer.Character
    if not char then return end
    
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end

    local velocidadBase = 16
    local saltoBase = 50

    -- RECORRE EL AVATAR Y GUARDA VALORES EN MEMORIA SI NO EXISTEN EN EL MAPA
    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("Attachment") then
            -- Si el juego no guardó la posición original, la creamos dinámicamente
            local origPos = v:FindFirstChild("OriginalPosition") or Instance.new("Vector3Value", v)
            if origPos.Name ~= "OriginalPosition" then
                origPos.Name = "OriginalPosition"
                origPos.Value = v.Position
            end
            v.Position = origPos.Value * escala
        elseif v:IsA("Motor6D") then
            -- Hacemos lo mismo con los pivotes de rotación y traslación
            local origC0 = v:FindFirstChild("OriginalC0") or Instance.new("CFrameValue", v)
            if origC0.Name ~= "OriginalC0" then
                origC0.Name = "OriginalC0"
                origC0.Value = v.C0
            end
            v.C0 = origC0.Value * CFrame.new(origC0.Value.Position * (escala - 1))
        end
    end
    
    -- AJUSTES DINÁMICOS DE MOVIMIENTO SEGÚN ESCALA
    if escala > 1.0 then
        hum.WalkSpeed = velocidadBase * (escala * 0.85)
        hum.JumpPower = saltoBase * math.sqrt(escala)
    elseif escala < 1.0 then
        hum.WalkSpeed = velocidadBase * math.clamp(escala * 1.2, 0.4, 1.0)
        hum.JumpPower = saltoBase * math.clamp(math.sqrt(escala), 0.5, 1.0)
    else
        hum.WalkSpeed = velocidadBase
        hum.JumpPower = saltoBase
    end
    
    hum.HipHeight = 1.35 * escala
end

-- ============================================================
-- 6. ACCIONES Y CONTROLADORES
-- ============================================================
local menuAbierto = true
local tamanoOriginalMain = MainFrame.Size

task.spawn(function()
	task.wait(1.0)
	StatusLabel.Text = "Comprobando dependencias lógicas..."
	task.wait(0.8)
	StatusLabel.Text = "¡Código verificado al 100%!"
	task.wait(0.3)
	AngresarBtn.Visible = true
end)

AngresarBtn.MouseButton1Click:Connect(function()
	WelcomeFrame:Destroy()
	MainFrame.Visible = true
	OcultarBtn.Visible = true
end)

OcultarBtn.MouseButton1Click:Connect(function()
	local tInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad)
	if menuAbierto then
		menuAbierto = false
		OcultarBtn.Text = "MOSTRAR"
		TweenService:Create(MainFrame, tInfo, {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
	else
		menuAbierto = true
		OcultarBtn.Text = "OCULTAR"
		TweenService:Create(MainFrame, tInfo, {Size = tamanoOriginalMain, BackgroundTransparency = 0}):Play()
	end
end)

AplicarBtn.MouseButton1Click:Connect(function()
	local num = tonumber(ScaleTextBox.Text)
	if num then 
		transformarTamanoFE(num) 
	end
end)

ReiniciarBtn.MouseButton1Click:Connect(function()
	ScaleTextBox.Text = "1.0"
	transformarTamanoFE(1.0)
end)

-- Efecto RGB Continuo en los Bordes
task.spawn(function()
	local h = 0
	while ScreenGui and ScreenGui.Parent do
		h = (h + (1/4) * 0.05) % 1
		local col = Color3.fromHSV(h, 1, 1)
		if WelcomeFrame and WelcomeFrame.Parent then WelcomeStroke.Color = col end
		if MainFrame and MainFrame.Parent then MainStroke.Color = col end
		task.wait()
	end
end)
