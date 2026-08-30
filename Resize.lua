local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local pGui = player:WaitForChild("PlayerGui")

if pGui:FindFirstChild("FE_PremiumResizeHub") then
    pGui.FE_PremiumResizeHub:Destroy()
end

-- 1. INTERFAZ GRÁFICA
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FE_PremiumResizeHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = pGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 240)
MainFrame.Position = UDim2.new(0.5, -140, 0.4, -120)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 16, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2.5
UIStroke.Color = Color3.fromRGB(0, 150, 255)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = MainFrame

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- Botón Ocultar/Mostrar
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 90, 0, 32)
ToggleButton.Position = UDim2.new(0, 15, 0, 15)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Text = "OCULTAR"
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 12
ToggleButton.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleButton

-- Componentes de Texto
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "RESIZE ADVANCED PRO"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = MainFrame

local ValueLabel = Instance.new("TextLabel")
ValueLabel.Size = UDim2.new(1, 0, 0, 25)
ValueLabel.Position = UDim2.new(0, 0, 0, 40)
ValueLabel.Text = "Escala: 1.00x (Normal)"
ValueLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
ValueLabel.BackgroundTransparency = 1
ValueLabel.Font = Enum.Font.GothamBold
ValueLabel.TextSize = 13
ValueLabel.Parent = MainFrame

-- Deslizador (Slider)
local SliderBackground = Instance.new("Frame")
SliderBackground.Size = UDim2.new(0, 230, 0, 6)
SliderBackground.Position = UDim2.new(0, 25, 0, 85)
SliderBackground.BackgroundColor3 = Color3.fromRGB(35, 38, 48)
SliderBackground.Parent = MainFrame

local SliderButton = Instance.new("TextButton")
SliderButton.Size = UDim2.new(0, 16, 0, 16)
SliderButton.Position = UDim2.new(0.038, -8, 0, -5)
SliderButton.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
SliderButton.Text = ""
SliderButton.Parent = SliderBackground

local RoundButton = Instance.new("UICorner")
RoundButton.CornerRadius = UDim.new(1, 0)
RoundButton.Parent = SliderButton

-- Entrada Manual e Input
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0, 110, 0, 35)
TextBox.Position = UDim2.new(0, 25, 0, 115)
TextBox.BackgroundColor3 = Color3.fromRGB(24, 26, 36)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Text = "1.0"
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 13
TextBox.Parent = MainFrame

local TBCorner = Instance.new("UICorner")
TBCorner.CornerRadius = UDim.new(0, 6)
TBCorner.Parent = TextBox

local ApplyBtn = Instance.new("TextButton")
ApplyBtn.Size = UDim2.new(0, 110, 0, 35)
ApplyBtn.Position = UDim2.new(0, 145, 0, 115)
ApplyBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 100)
ApplyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ApplyBtn.Text = "APLICAR"
ApplyBtn.Font = Enum.Font.GothamBold
ApplyBtn.TextSize = 12
ApplyBtn.Parent = MainFrame

local ApplyCorner = Instance.new("UICorner")
ApplyCorner.CornerRadius = UDim.new(0, 6)
ApplyCorner.Parent = ApplyBtn

-- Botón Reiniciar
local ResetBtn = Instance.new("TextButton")
ResetBtn.Size = UDim2.new(0, 230, 0, 42)
ResetBtn.Position = UDim2.new(0, 25, 0, 170)
ResetBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 50)
ResetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetBtn.Text = "REINICIAR TAMAÑO (1.0x)"
ResetBtn.Font = Enum.Font.GothamBold
ResetBtn.TextSize = 12
ResetBtn.Parent = MainFrame

local ResetCorner = Instance.new("UICorner")
ResetCorner.CornerRadius = UDim.new(0, 8)
ResetCorner.Parent = ResetBtn

-- 2. ANIMACIÓN RGB WAVE DEL BORDE
local isMenuRainbowActive = true
RunService.RenderStepped:Connect(function()
    if isMenuRainbowActive and MainFrame.Visible then
        local hue = (tick() % 4) / 4
        UIStroke.Color = Color3.fromHSV(hue, 1, 1)
    end
end)

-- Animaciones Hover simples
local function setHover(btn, hCol, nCol)
    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = hCol end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = nCol end)
end
setHover(ToggleButton, Color3.fromRGB(0, 150, 255), Color3.fromRGB(0, 120, 255))
setHover(ApplyBtn, Color3.fromRGB(0, 190, 120), Color3.fromRGB(0, 160, 100))
setHover(ResetBtn, Color3.fromRGB(220, 40, 70), Color3.fromRGB(180, 30, 50))

-- 3. LÓGICA DE APERTURA / CIERRE
local function toggleMenu()
    MainFrame.Visible = not MainFrame.Visible
    if MainFrame.Visible then
        ToggleButton.Text = "OCULTAR"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        isMenuRainbowActive = true
    else
        ToggleButton.Text = "MOSTRAR"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
        isMenuRainbowActive = false
    end
end

ToggleButton.MouseButton1Click:Connect(toggleMenu)
UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == Enum.KeyCode.Q then toggleMenu() end
end)

-- 4. LÓGICA REPLICACIÓN FE Y CÁMARA
local minSize, maxSize = 0.05, 25.0
local isDragging = false

local function resizeCharacter(scale)
    scale = math.clamp(scale, minSize, maxSize)
    local character = player.Character
    if character then
        pcall(function() character:ScaleTo(scale) end)
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local vars = {"BodyHeightScale", "BodyWidthScale", "BodyDepthScale", "HeadScale"}
            for _, v in pairs(vars) do
                local val = humanoid:FindFirstChild(v)
                if val and val:IsA("NumberValue") then val.Value = scale end
            end
            player.CameraMaxZoomDistance = math.clamp(400 * scale, 128, 5000)
            player.CameraMinZoomDistance = math.clamp(0.5 * scale, 0.1, 10)
            humanoid.CameraOffset = Vector3.new(0, (scale - 1) * 2, 0)
        end
    end
end

local function updateSliderPosition(scale)
    local percentage = (scale - minSize) / (maxSize - minSize)
    SliderButton.Position = UDim2.new(math.clamp(percentage, 0, 1), -8, 0, -5)
end

-- Controles del Slider
SliderButton.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then isDragging = true end
end)
UserInputService.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then isDragging = false end
end)

RunService.RenderStepped:Connect(function()
    if isDragging then
        local mousePos = UserInputService:GetMouseLocation().X
        local sliderX = SliderBackground.AbsolutePosition.X
        local sliderWidth = SliderBackground.AbsoluteSize.X
        local percentage = math.clamp((mousePos - sliderX) / sliderWidth, 0, 1)
        SliderButton.Position = UDim2.new(percentage, -8, 0, -5)
        local calculatedScale = math.round((minSize + (percentage * (maxSize - minSize))) * 100) / 100
        ValueLabel.Text = "Escala: " .. string.format("%.2f", calculatedScale) .. "x"
        TextBox.Text = string.format("%.2f", calculatedScale)
        resizeCharacter(calculatedScale)
    end
end)

ApplyBtn.MouseButton1Click:Connect(function()
    local targetScale = tonumber(TextBox.Text)
    if targetScale then
        targetScale = math.clamp(targetScale, minSize, maxSize)
        TextBox.Text = string.format("%.2f", targetScale)
        ValueLabel.Text = "Escala: " .. string.format("%.2f", targetScale) .. "x"
        updateSliderPosition(targetScale)
        resizeCharacter(targetScale)
    else
        TextBox.Text = "Inválido"
    end
end)

ResetBtn.MouseButton1Click:Connect(function()
    ValueLabel.Text = "Escala: 1.00x (Normal)"
    TextBox.Text = "1.0"
    updateSliderPosition(1.0)
    resizeCharacter(1.0)
    player.CameraMaxZoomDistance = 400
    player.CameraMinZoomDistance = 0.5
end)
