if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local pGui = player:WaitForChild("PlayerGui")

if pGui:FindFirstChild("MichiFluxPlus_Resize") then pGui.MichiFluxPlus_Resize:Destroy() end
if game:GetService("CoreGui"):FindFirstChild("MichiFluxPlus_Resize") then game:GetService("CoreGui").MichiFluxPlus_Resize:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MichiFluxPlus_Resize"
ScreenGui.ResetOnSpawn = false

pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end) 
if not ScreenGui.Parent then ScreenGui.Parent = pGui end

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
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = MainFrame

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 120, 0, 35)
ToggleButton.Position = UDim2.new(0, 15, 0, 15)
ToggleButton.BackgroundColor3 = Color3.fromRGB(15, 16, 22)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Text = "MICHIFLUX [OCULTAR]"
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 10
ToggleButton.BorderSizePixel = 0
ToggleButton.Parent = ScreenGui

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Thickness = 2.5
ToggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
ToggleStroke.Parent = ToggleButton

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 12)
ToggleCorner.Parent = ToggleButton

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "MICHIFLUX PLUS [FE]"
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

RunService.RenderStepped:Connect(function()
    local hue = (tick() % 4) / 4
    local dynamicColor = Color3.fromHSV(hue, 1, 1)
    UIStroke.Color = dynamicColor
    ToggleStroke.Color = dynamicColor
end)

local function toggleMenu()
    MainFrame.Visible = not MainFrame.Visible
    ToggleButton.Text = MainFrame.Visible and "MICHIFLUX [OCULTAR]" or "MICHIFLUX [MOSTRAR]"
end
ToggleButton.MouseButton1Click:Connect(toggleMenu)

local minSize, maxSize = 0.2, 5.0
local isDragging = false
local originalHitboxSize = Vector3.new(2, 2, 1)
local defaultJumpPower = 50
local defaultJumpHeight = 7.2

local function resizeCharacterFE(scale)
    scale = math.clamp(scale, minSize, maxSize)
    local char = player.Character
    if not char then return end
    
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    
    local valueNames = {"BodyHeightScale", "BodyWidthScale", "BodyDepthScale", "HeadScale"}
    for _, name in ipairs(valueNames) do
        local val = hum:FindFirstChild(name)
        if val and val:IsA("NumberValue") then 
            val.Value = scale 
        else
            local newVal = Instance.new("NumberValue")
            newVal.Name = name
            newVal.Value = scale
            newVal.Parent = hum
        end
    end
    
    pcall(function() char:ScaleTo(scale) end)
    
    local rootPart = char:FindFirstChild("HumanoidRootPart")
    if rootPart and rootPart:IsA("BasePart") then
        rootPart.Size = originalHitboxSize * scale
        rootPart.Massless = true
    end
    
    if hum.UseJumpPower then
        hum.JumpPower = defaultJumpPower * math.sqrt(scale)
    else
        hum.JumpHeight = defaultJumpHeight * scale
    end
    
    local torso = char:FindFirstChild("Torso") or char:FindFirstChild("LowerTorso")
    if rootPart and torso then
        local rootJoint = rootPart:FindFirstChild("RootJoint") or torso:FindFirstChild("Root")
        if rootJoint and rootJoint:IsA("Motor6D") then
            rootJoint.C0 = CFrame.new(0, (scale - 1) * 2, 0) * CFrame.Angles(rootJoint.C0:ToEulerAnglesXYZ())
        end
    end
    
    player.CameraMaxZoomDistance = math.clamp(400 * scale, 128, 5000)
    player.CameraMinZoomDistance = math.clamp(0.5 * scale, 0.1, 10)
    hum.CameraOffset = Vector3.new(0, (scale - 1) * 2, 0)
end

local function updateSliderPosition(scale)
    local percentage = (scale - minSize) / (maxSize - minSize)
    SliderButton.Position = UDim2.new(math.clamp(percentage, 0, 1), -8, 0, -5)
end

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
        
        resizeCharacterFE(calculatedScale)
    end
end)

ApplyBtn.MouseButton1Click:Connect(function()
    local targetScale = tonumber(TextBox.Text)
    if targetScale then
        targetScale = math.clamp(targetScale, minSize, maxSize)
        TextBox.Text = string.format("%.2f", targetScale)
        ValueLabel.Text = "Escala: " .. string.format("%.2f", targetScale) .. "x"
        updateSliderPosition(targetScale)
        resizeCharacterFE(targetScale) 
    else
        TextBox.Text = "Inválido"
    end
end)

ResetBtn.MouseButton1Click:Connect(function()
    ValueLabel.Text = "Escala: 1.00x (Normal)"
    TextBox.Text = "1.0"
    updateSliderPosition(1.0)
    resizeCharacterFE(1.0)
end)

