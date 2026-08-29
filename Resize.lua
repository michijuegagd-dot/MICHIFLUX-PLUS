-- FE MICHIFLUX PLUS EDITION (Premium RGB Border & Neon Title)
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- 1. CREACIÓN DE LA INTERFAZ VISUAL PREMIUM
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MichiFluxPlusGui"
ScreenGui.Parent = game:CoreGui
ScreenGui.ResetOnSpawn = false

-- Contorno Animado Neon RGB
local BorderFrame = Instance.new("Frame")
BorderFrame.Name = "BorderFrame"
BorderFrame.Parent = ScreenGui
BorderFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
BorderFrame.BorderSizePixel = 0
BorderFrame.Position = UDim2.new(0.5, -135, 0.4, -150)
BorderFrame.Size = UDim2.new(0, 270, 0, 310)
BorderFrame.Active = true
BorderFrame.Draggable = true

local BorderCorner = Instance.new("UICorner")
BorderCorner.CornerRadius = UDim.new(0, 10)
BorderCorner.Parent = BorderFrame

-- Panel Interno Oscuro
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = BorderFrame
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0, 3, 0, 3)
MainFrame.Size = UDim2.new(1, -6, 1, -6)

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

-- Título Oficial MICHIFLUX PLUS
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.FredokaOne
Title.Text = "MICHIFLUX PLUS"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20

-- Labels de Estado
local CurrentSizeLabel = Instance.new("TextLabel")
CurrentSizeLabel.Parent = MainFrame
CurrentSizeLabel.BackgroundTransparency = 1
CurrentSizeLabel.Position = UDim2.new(0, 15, 0, 40)
CurrentSizeLabel.Size = UDim2.new(1, -30, 0, 15)
CurrentSizeLabel.Font = Enum.Font.SourceSansBold
CurrentSizeLabel.Text = "TAMAÑO ACTUAL: 1.00x"
CurrentSizeLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
CurrentSizeLabel.TextSize = 13
CurrentSizeLabel.TextXAlignment = Enum.TextXAlignment.Left

local SelectedSizeLabel = Instance.new("TextLabel")
SelectedSizeLabel.Parent = MainFrame
SelectedSizeLabel.BackgroundTransparency = 1
SelectedSizeLabel.Position = UDim2.new(0, 15, 0, 55)
SelectedSizeLabel.Size = UDim2.new(1, -30, 0, 15)
SelectedSizeLabel.Font = Enum.Font.SourceSansBold
SelectedSizeLabel.Text = "TAMAÑO A APLICAR: 1.00x"
SelectedSizeLabel.TextColor3 = Color3.fromRGB(255, 180, 0)
SelectedSizeLabel.TextSize = 13
SelectedSizeLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Deslizador Estilizado
local SliderBackground = Instance.new("Frame")
SliderBackground.Parent = MainFrame
SliderBackground.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
SliderBackground.BorderSizePixel = 0
SliderBackground.Position = UDim2.new(0, 15, 0, 80)
SliderBackground.Size = UDim2.new(1, -30, 0, 10)

local SliderCorner = Instance.new("UICorner")
SliderCorner.CornerRadius = UDim.new(1, 0)
SliderCorner.Parent = SliderBackground

local SliderButton = Instance.new("TextButton")
SliderButton.Parent = SliderBackground
SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderButton.BorderSizePixel = 0
SliderButton.Position = UDim2.new(0, 35, 0, -5)
SliderButton.Size = UDim2.new(0, 20, 0, 20)
SliderButton.Text = ""

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(1, 0)
ButtonCorner.Parent = SliderButton

-- Entrada de Tamaño Manual
local SizeInput = Instance.new("TextBox")
SizeInput.Parent = MainFrame
SizeInput.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
SizeInput.BorderSizePixel = 0
SizeInput.Position = UDim2.new(0, 15, 0, 110)
SizeInput.Size = UDim2.new(1, -30, 0, 30)
SizeInput.Font = Enum.Font.SourceSansItalic
SizeInput.PlaceholderText = "Tamaño personalizado..."
SizeInput.Text = ""
SizeInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SizeInput.TextSize = 14

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 6)
InputCorner.Parent = SizeInput

-- Entrada para Nombre de Visualización (Display Name)
local NameInput = Instance.new("TextBox")
NameInput.Parent = MainFrame
NameInput.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
NameInput.BorderSizePixel = 0
NameInput.Position = UDim2.new(0, 15, 0, 150)
NameInput.Size = UDim2.new(1, -30, 0, 35)
NameInput.Font = Enum.Font.SourceSansBold
NameInput.PlaceholderText = "Escribe tu Display Name aquí..."
NameInput.Text = ""
NameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
NameInput.TextSize = 15

local NameCorner = Instance.new("UICorner")
NameCorner.CornerRadius = UDim.new(0, 6)
NameCorner.Parent = NameInput

-- Botón de Aplicar Todo (Tamaño y Nombre)
local ApplyButton = Instance.new("TextButton")
ApplyButton.Parent = MainFrame
ApplyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
ApplyButton.BorderSizePixel = 0
ApplyButton.Position = UDim2.new(0, 15, 0, 205)
ApplyButton.Size = UDim2.new(1, -30, 0, 45)
ApplyButton.Font = Enum.Font.FredokaOne
ApplyButton.Text = "APLICAR CAMBIOS"
ApplyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ApplyButton.TextSize = 16

local ApplyCorner = Instance.new("UICorner")
ApplyCorner.CornerRadius = UDim.new(0, 6)
ApplyCorner.Parent = ApplyButton

-- Botón Flotante Plus
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
ToggleButton.Position = UDim2.new(0, 15, 0, 15)
ToggleButton.Size = UDim2.new(0, 65, 0, 40)
ToggleButton.Font = Enum.Font.FredokaOne
ToggleButton.Text = "MICHI+"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 12

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 6)
ToggleCorner.Parent = ToggleButton

-- 2. ANIMACIÓN DE CONTORNO RGB EN VIVO + EFECTO TEXTO NEON
local frecuencia = 0.5
RunService.RenderStepped:Connect(function()
    local tiempo = tick()
    local colorRGB = Color3.fromHSV((tiempo * frecuencia) % 1, 1, 1)
    BorderFrame.BackgroundColor3 = colorRGB
    SliderButton.BackgroundColor3 = colorRGB
    Title.TextColor3 = colorRGB -- El título brilla junto al borde
end)

-- 3. LÓGICA DE ACTUALIZACIÓN DE TAMAÑO Y NOMBRE (FE)
local TamañoSeleccionado = 1.0

local function AplicarTodo(FactorTamaño, NuevoNombre)
    local Char = LP.Character
    if not Char then return end
    local Hum = Char:FindFirstChildOfClass("Humanoid")
    if not Hum then return end

    if NuevoNombre and NuevoNombre ~= "" then
        Hum.DisplayName = NuevoNombre
    end

    for _, parte in pairs(Char:GetChildren()) do
        if parte:IsA("BasePart") or parte:IsA("MeshPart") then
            for _, v in pairs(parte:GetChildren()) do
                if v.Name == "OriginalSize" or v.Name == "OriginalPosition" then
                    v:Destroy()
                end
            end
        end
    end

    if Hum:FindFirstChild("HeadScale") then
        Hum.HeadScale.Value = FactorTamaño
        Hum.BodyWidthScale.Value = FactorTamaño
        Hum.BodyDepthScale.Value = FactorTamaño
        Hum.BodyHeightScale.Value = FactorTamaño
        CurrentSizeLabel.Text = "TAMAÑO ACTUAL: " .. string.format("%.2f", FactorTamaño) .. "x"
    else
        CurrentSizeLabel.Text = "¡ERROR: USA AVATAR R15!"
    end
end

-- 4. INTERACTIVIDAD DEL DESLIZADOR
local arrastrando = false
local MinTamaño = 0.1
local MaxTamaño = 8.0

SliderButton.MouseButton1Down:Connect(function() arrastrando = true end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        arrastrando = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if arrastrando and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local MousePos = input.Position.X
        local SliderPos = SliderBackground.AbsolutePosition.X
        local SliderWidth = SliderBackground.AbsoluteSize.X
        
        local Porcentaje = math.clamp((MousePos - SliderPos) / SliderWidth, 0, 1)
        SliderButton.Position = UDim2.new(Porcentaje, -10, 0, -5)
        
        TamañoSeleccionado = MinTamaño + (Porcentaje * (MaxTamaño - MinTamaño))
        SelectedSizeLabel.Text = "TAMAÑO A APLICAR: " .. string.format("%.2f", TamañoSeleccionado) .. "x"
        SizeInput.Text = ""
    end
end)

-- 5. INTERACTIVIDAD MANUAL DE TEXTO
SizeInput:GetPropertyChangedSignal("Text"):Connect(function()
    local NumeroIngresado = tonumber(SizeInput.Text)
    if NumeroIngresado and NumeroIngresado > 0 then
        if NumeroIngresado > 20 then NumeroIngresado = 20 end
        TamañoSeleccionado = NumeroIngresado
        SelectedSizeLabel.Text = "TAMAÑO A APLICAR: " .. string.format("%.2f", TamañoSeleccionado) .. "x"
    end
end)

-- 6. BOTÓN APLICAR Y CONTROLES DE VISIBILIDAD (BOTÓN Y TECLA P)
ApplyButton.MouseButton1Click:Connect(function()
    AplicarTodo(TamañoSeleccionado, NameInput.Text)
end)

local function AlternarMenu()
    BorderFrame.Visible = not BorderFrame.Visible
end

ToggleButton.MouseButton1Click:Connect(AlternarMenu)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.P then
        AlternarMenu()
    end
end)
