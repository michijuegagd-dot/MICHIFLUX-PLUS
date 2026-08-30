if not game:IsLoaded() then game.Loaded:Wait() end
local Plrs, UIS, RS = game:GetService("Players"), game:GetService("UserInputService"), game:GetService("RunService")
local lp = Plrs.LocalPlayer local pGui = lp:WaitForChild("PlayerGui")
local cg = game:GetService("CoreGui")
if pGui:FindFirstChild("MichiFluxPlus_Resize") then pGui.MichiFluxPlus_Resize:Destroy() end
if cg:FindFirstChild("MichiFluxPlus_Resize") then cg.MichiFluxPlus_Resize:Destroy() end
local SG = Instance.new("ScreenGui") SG.Name = "MichiFluxPlus_Resize" SG.ResetOnSpawn = false
pcall(function() SG.Parent = cg end) if not SG.Parent then SG.Parent = pGui end
local function makeFrame(sz, pos, vis)
    local f = Instance.new("Frame") f.Size = sz f.Position = pos f.BackgroundColor3 = Color3.fromRGB(15, 16, 22)
    f.BorderSizePixel = 0 f.Active = true f.Draggable = true f.Visible = vis f.Parent = SG
    local st = Instance.new("UIStroke") st.Thickness = 2.5 st.ApplyStrokeMode = Enum.ApplyStrokeMode.Border st.Parent = f
    local cn = Instance.new("UICorner") cn.CornerRadius = UDim.new(0, 12) cn.Parent = f
    return f, st
end
local szMain = UDim2.new(0, 280, 0, 240) local posMain = UDim2.new(0.5, -140, 0.4, -120)
local MF, UIStroke = makeFrame(szMain, posMain, false)
local WF, WelcomeStroke = makeFrame(szMain, posMain, true)
local function makeLabel(p, sz, pos, txt, col, ts)
    local l = Instance.new("TextLabel") l.Size = sz l.Position = pos l.Text = txt l.TextColor3 = col
    l.BackgroundTransparency = 1 l.Font = Enum.Font.GothamBold l.TextSize = ts l.Parent = p return l
end
makeLabel(WF, UDim2.new(1, 0, 0, 50), UDim2.new(0, 0, 0, 30), "MICHIFLUX PLUS", Color3.fromRGB(255, 255, 255), 18)
makeLabel(WF, UDim2.new(1, 0, 0, 20), UDim2.new(0, 0, 0, 75), "Advanced Resize & Hitbox FE", Color3.fromRGB(0, 200, 255), 11)
local function makeBtn(p, sz, pos, txt, bg)
    local b = Instance.new("TextButton") b.Size = sz b.Position = pos b.BackgroundColor3 = bg
    b.TextColor3 = Color3.fromRGB(255, 255, 255) b.Text = txt b.Font = Enum.Font.GothamBold b.TextSize = 12
    b.BorderSizePixel = 0 b.Parent = p local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, 8) c.Parent = b
    return b
end
local StartBtn = makeBtn(WF, UDim2.new(0, 200, 0, 45), UDim2.new(0.5, -100, 0, 135), "START", Color3.fromRGB(0, 160, 100))
local ToggleButton = makeBtn(SG, UDim2.new(0, 120, 0, 35), UDim2.new(0, 15, 0, 15), "MICHIFLUX [OCULTAR]", Color3.fromRGB(15, 16, 22))
ToggleButton.Visible = false local ToggleStroke = Instance.new("UIStroke") ToggleStroke.Thickness = 2.5
ToggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border ToggleStroke.Parent = ToggleButton
makeLabel(MF, UDim2.new(1, 0, 0, 40), UDim2.new(0, 0, 0, 0), "MICHIFLUX PLUS [FE]", Color3.fromRGB(255, 255, 255), 14)
local ValueLabel = makeLabel(MF, UDim2.new(1, 0, 0, 25), UDim2.new(0, 0, 0, 40), "Escala: 1.00x (Normal)", Color3.fromRGB(0, 200, 255), 13)
local SliderBg = Instance.new("Frame") SliderBg.Size = UDim2.new(0, 230, 0, 6) SliderBg.Position = UDim2.new(0, 25, 0, 85)
SliderBg.BackgroundColor3 = Color3.fromRGB(35, 38, 48) SliderBg.Parent = MF
local SliderBtn = Instance.new("TextButton") SliderBtn.Size = UDim2.new(0, 16, 0, 16) SliderBtn.Position = UDim2.new(0.038, -8, 0, -5)
SliderBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 255) SliderBtn.Text = "" SliderBtn.Parent = SliderBg
local rc = Instance.new("UICorner") rc.CornerRadius = UDim.new(1, 0) rc.Parent = SliderBtn
local TextBox = Instance.new("TextBox") TextBox.Size = UDim2.new(0, 110, 0, 35) TextBox.Position = UDim2.new(0, 25, 0, 115)
TextBox.BackgroundColor3 = Color3.fromRGB(24, 26, 36) TextBox.TextColor3 = Color3.fromRGB(255, 255, 255) TextBox.Text = "1.0"
TextBox.ClearTextOnFocus = false TextBox.Font = Enum.Font.Gotham TextBox.TextSize = 13 TextBox.Parent = MF
local tbc = Instance.new("UICorner") tbc.CornerRadius = UDim.new(0, 6) tbc.Parent = TextBox
local ApplyBtn = makeBtn(MF, UDim2.new(0, 110, 0, 35), UDim2.new(0, 145, 0, 115), "APLICAR", Color3.fromRGB(0, 160, 100))
local ResetBtn = makeBtn(MF, UDim2.new(0, 230, 0, 42), UDim2.new(0, 25, 0, 170), "REINICIAR TAMAÑO (1.0x)", Color3.fromRGB(180, 30, 50))
RS.RenderStepped:Connect(function()
    local h = (tick() % 4) / 4 local c = Color3.fromHSV(h, 1, 1)
    UIStroke.Color = c ToggleStroke.Color = c WelcomeStroke.Color = c
end)
StartBtn.MouseButton1Click:Connect(function() WF:Destroy() MF.Visible = true ToggleButton.Visible = true end)
ToggleButton.MouseButton1Click:Connect(function()
    MF.Visible = not MF.Visible ToggleButton.Text = MF.Visible and "MICHIFLUX [OCULTAR]" or "MICHIFLUX [MOSTRAR]"
end)
local minS, maxS, isDrag, oHSize = 0.2, 5.0, false, Vector3.new(2, 2, 1)
local function resize(scale)
    scale = math.clamp(scale, minS, maxS) local c = lp.Character if not c then return end
    local h = c:FindFirstChildOfClass("Humanoid") if not h then return end
    h.HipHeight = 1.35 * scale
    for _, n in ipairs({"BodyHeightScale", "BodyWidthScale", "BodyDepthScale", "HeadScale"}) do
        local v = h:FindFirstChild(n) if v and v:IsA("NumberValue") then v.Value = scale else
            local nv = Instance.new("NumberValue") nv.Name = n nv.Value = scale nv.Parent = h
        end
    end
    pcall(function() c:ScaleTo(scale) end)
    local rp = c:FindFirstChild("HumanoidRootPart") if rp and rp:IsA("BasePart") then rp.Size = oHSize * scale rp.Massless = true end
    if h.UseJumpPower then h.JumpPower = 50 * math.sqrt(scale) else h.JumpHeight = 7.2 * scale end
    local t = c:FindFirstChild("Torso") or c:FindFirstChild("LowerTorso")
    if rp and t then local rj = rp:FindFirstChild("RootJoint") or t:FindFirstChild("Root")
        if rj and rj:IsA("Motor6D") then rj.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(rj.C0:ToEulerAnglesXYZ()) end
    end
    lp.CameraMaxZoomDistance = math.clamp(400 * scale, 128, 5000)
    lp.CameraMinZoomDistance = math.clamp(0.5 * scale, 0.1, 10) h.CameraOffset = Vector3.new(0, (scale - 1) * 2, 0)
end
local function updSld(scale) SliderBtn.Position = UDim2.new(math.clamp((scale - minS) / (maxS - minS), 0, 1), -8, 0, -5) end
SliderBtn.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then isDrag = true end end)
UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then isDrag = false end end)
RS.RenderStepped:Connect(function()
    if isDrag then
        local p = math.clamp((UIS:GetMouseLocation().X - SliderBg.AbsolutePosition.X) / SliderBg.AbsoluteSize.X, 0, 1)
        SliderBtn.Position = UDim2.new(p, -8, 0, -5)
        local s = math.round((minS + (p * (maxS - minS))) * 100) / 100
        ValueLabel.Text = "Escala: " .. string.format("%.2f", s) .. "x" TextBox.Text = string.format("%.2f", s) resize(s)
    end
end)
ApplyBtn.MouseButton1Click:Connect(function()
    local s = tonumber(TextBox.Text) if s then s = math.clamp(s, minS, maxS) TextBox.Text = string.format("%.2f", s)
        ValueLabel.Text = "Escala: " .. string.format("%.2f", s) .. "x" updSld(s) resize(s) else TextBox.Text = "Inválido" end
end)
ResetBtn.MouseButton1Click:Connect(function() ValueLabel.Text = "Escala: 1.00x (Normal)" TextBox.Text = "1.0" updSld(1.0) resize(1.0) end)
