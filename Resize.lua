local P, CG, UIS, LS, RS, TS = game:GetService("Players"), game:GetService("CoreGui"), game:GetService("UserInputService"), game:GetService("LocalizationService"), game:GetService("RunService"), game:GetService("TweenService")
local p, id = P.LocalPlayer, LS.RobloxLocaleId:sub(1,2)
local T = { es = {b="¡BIENVENIDO!", s="Deslizar: ", m="Manual:", a="APLICAR", r="RESET", i="EMPEZAR SCRIPT"}, en = {b="WELCOME!", s="Slider: ", m="Manual:", a="APPLY", r="RESET", i="START SCRIPT"} }
local l = T[id] or T.en local size, mn, mx = 1.00, 0.01, 25.00

if CG:FindFirstChild("MFP") then CG.MFP:Destroy() end
local sg = Instance.new("ScreenGui", CG) sg.Name = "MFP" sg.ResetOnSpawn = false

-- INTERFAZ PRINCIPAL
local mf = Instance.new("Frame", sg) mf.Size = UDim2.new(0,260,0,260) mf.Position = UDim2.new(0.5,-130,0.4,-130) mf.BackgroundColor3 = Color3.fromRGB(15,15,25) mf.Visible = false mf.Active = true mf.Draggable = true Instance.new("UICorner", mf)
local str = Instance.new("UIStroke", mf) str.Thickness = 3

local ob = Instance.new("TextButton", sg) ob.Size = UDim2.new(0,50,0,50) ob.Position = UDim2.new(0,10,0.5,-25) ob.BackgroundColor3 = Color3.fromRGB(15,15,25) ob.Text = "🧬" ob.TextSize = 24 ob.TextColor3 = Color3.fromRGB(255,255,255) ob.Font = Enum.Font.SourceSansBold ob.Visible = false ob.Active = true ob.Draggable = true Instance.new("UICorner", ob) local obst = Instance.new("UIStroke", ob) obst.Thickness = 3

local tl = Instance.new("TextLabel", mf) tl.Size = UDim2.new(1,0,0,35) tl.BackgroundColor3 = Color3.fromRGB(25,25,35) tl.Text = "  MichiFlux" tl.TextSize = 16 tl.Font = Enum.Font.SourceSansBold tl.TextXAlignment = 0 Instance.new("UICorner", tl)
local mb = Instance.new("TextButton", mf) mb.Size = UDim2.new(0,30,0,30) mb.Position = UDim2.new(1,-35,0,2) mb.BackgroundTransparency = 1 mb.Text = "—" mb.TextColor3 = Color3.fromRGB(200,200,200) mb.TextSize = 16 mb.Font = 4 mb.MouseButton1Click:Connect(function() mf.Visible = false ob.Visible = true end)
ob.MouseButton1Click:Connect(function() ob.Visible = false mf.Visible = true end)

local sl = Instance.new("TextLabel", mf) sl.Size = UDim2.new(1,-20,0,25) sl.Position = UDim2.new(0,10,0,50) sl.BackgroundTransparency = 1 sl.Text = l.s.."1.00x" sl.TextColor3 = Color3.fromRGB(200,200,200) sl.TextXAlignment = 0
local sf = Instance.new("Frame", mf) sf.Size = UDim2.new(1,-20,0,8) sf.Position = UDim2.new(0,10,0,80) sf.BackgroundColor3 = Color3.fromRGB(40,40,50)
local sb = Instance.new("TextButton", sf) sb.Size = UDim2.new(0,16,0,16) sb.Text = "" Instance.new("UICorner", sb)

local ml = Instance.new("TextLabel", mf) ml.Size = UDim2.new(1,-20,0,25) ml.Position = UDim2.new(0,10,0,105) ml.BackgroundTransparency = 1 ml.Text = l.m ml.TextColor3 = Color3.fromRGB(200,200,200)
local tb = Instance.new("TextBox", mf) tb.Size = UDim2.new(1,-20,0,35) tb.Position = UDim2.new(0,10,0,130) tb.BackgroundColor3 = Color3.fromRGB(30,30,40) tb.TextColor3 = Color3.fromRGB(255,255,255) tb.Text = "1.00" tb.TextSize = 16 Instance.new("UICorner", tb) local bst = Instance.new("UIStroke", tb)

local ab = Instance.new("TextButton", mf) ab.Size = UDim2.new(0,115,0,40) ab.Position = UDim2.new(0,10,0,185) ab.TextColor3 = Color3.fromRGB(255,255,255) ab.Text = l.a ab.Font = 4 ab.TextSize = 16 Instance.new("UICorner", ab) local abst = Instance.new("UIStroke", ab)
local rb = Instance.new("TextButton", mf) rb.Size = UDim2.new(0,115,0,40) rb.Position = UDim2.new(0,135,0,185) rb.TextColor3 = Color3.fromRGB(255,255,255) rb.Text = l.r rb.Font = 4 rb.TextSize = 16 Instance.new("UICorner", rb) local rbst = Instance.new("UIStroke", rb)

-- PANTALLA DE BIENVENIDA
local wbg = Instance.new("Frame", sg) wbg.Size = UDim2.new(1,0,1,0) wbg.BackgroundColor3 = Color3.fromRGB(10,10,15) wbg.BackgroundTransparency = 0.15
local cf = Instance.new("Frame", wbg) cf.Size = UDim2.new(0,340,0,220) cf.Position = UDim2.new(0.5,-170,0.5,-110) cf.BackgroundColor3 = Color3.fromRGB(18,18,28) Instance.new("UICorner", cf) local cst = Instance.new("UIStroke", cf) cst.Thickness = 4
local wl = Instance.new("TextLabel", cf) wl.Size = UDim2.new(1,0,0,30) wl.Position = UDim2.new(0,0,0,20) wl.BackgroundTransparency = 1 wl.Text = l.b wl.TextColor3 = Color3.fromRGB(200,200,200) wl.Font = 4
local ft = Instance.new("TextLabel", cf) ft.Size = UDim2.new(1,0,0,50) ft.Position = UDim2.new(0,0,0,50) ft.BackgroundTransparency = 1 ft.Text = "MichiFlux Plus" ft.TextSize = 32 ft.Font = 4
local stb = Instance.new("TextButton", cf) stb.Size = UDim2.new(0,180,0,45) stb.Position = UDim2.new(0.5,-90,0,130) stb.TextColor3 = Color3.fromRGB(255,255,255) stb.Text = l.i stb.TextSize = 16 stb.Font = 4 Instance.new("UICorner", stb) local sst = Instance.new("UIStroke", stb) sst.Thickness = 2

-- BUCLE EFECTO ARCOÍRIS
RS.RenderStepped:Connect(function()
    local rgb = Color3.fromHSV((tick() * 0.4) % 1, 0.8, 1) local drk = Color3.fromRGB(rgb.R * 30, rgb.G * 30, rgb.B * 30)
    str.Color, obst.Color, bst.Color, abst.Color, rbst.Color, sb.BackgroundColor3, tl.TextColor3 = rgb, rgb, rgb, rgb, rgb, rgb, rgb
    cst.Color, sst.Color, ft.TextColor3, stb.BackgroundColor3 = rgb, rgb, rgb, drk
end)

-- SISTEMA AVANZADO MOTOR6D BYPASS FE
local function szBypass(e)
    local c = p.Character if not c then return end
    local h = c:WaitForChild("Humanoid", 5)
    if h and h:FindFirstChild("BodyHeightScale") then
        h.BodyHeightScale.Value, h.BodyWidthScale.Value, h.BodyDepthScale.Value, h.HeadScale.Value = e, e, e, e
        for _, v in pairs(c:GetDescendants()) do
            if v:IsA("Motor6D") and v.Name ~= "RootJoint" then
                local p0, p1, c0, c1 = v.Part0, v.Part1, v.C0, v.C1
                if p0 and p1 then
                    v:Destroy() task.spawn(function()
                        while p.Character == c and task.wait() do
                            if p0 and p1 and p0.Parent and p1.Parent then
                                p1.Velocity = Vector3.new(0, 26, 0) p.MaximumSimulationRadius, p.SimulationRadius = math.huge, math.huge
                                p1.CFrame = p0.CFrame * c0 * CFrame.new(v.Transform.Position * e) * c1:Inverse()
                            end
                        end
                    end)
                end
            end
        end
        p.CameraMaxZoomDistance, p.CameraMinZoomDistance = 400, 0.5
    end
end

stb.MouseButton1Click:Connect(function()
    local fd = TweenInfo.new(0.3)
    TS:Create(wbg, fd, {BackgroundTransparency = 1}):Play() TS:Create(cf, fd, {BackgroundTransparency = 1}):Play() TS:Create(wl, fd, {TextTransparency = 1}):Play() TS:Create(ft, fd, {TextTransparency = 1}):Play() TS:Create(stb, fd, {BackgroundTransparency = 1, TextTransparency = 1}):Play() TS:Create(cst, fd, {Transparency = 1}):Play() TS:Create(sst, fd, {Transparency = 1}):Play()
    task.wait(0.3) wbg:Destroy() mf.Visible = true
end)

p.CharacterAdded:Connect(function(c) local h = c:WaitForChild("Humanoid", 5) if h then task.wait(0.5) szBypass(size) end end)
rb.MouseButton1Click:Connect(function() size = 1.00 tb.Text = "1.00" sl.Text = l.s.."1.00x" sb.Position = UDim2.new((1.00-mn)/(mx-mn), -8, 0.5, -8) if p.Character and p.Character:FindFirstChildOfClass("Humanoid") then p.Character:FindFirstChildOfClass("Humanoid"):ChangeState(15) end end)

local drag = false
sb.MouseButton1Down:Connect(function() drag = true end)
UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then drag = false end end)
UIS.InputChanged:Connect(function(input)
    if drag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local pct = math.clamp((input.Position.X - sf.AbsolutePosition.X) / sf.AbsoluteSize.X, 0, 1) sb.Position = UDim2.new(pct, -8, 0.5, -8)
        size = math.round((mn + (pct * (mx - mn))) * 100) / 100 sl.Text = l.s..string.format("%.2f", size).."x" tb.Text = string.format("%.2f", size)
    end
end)
tb.FocusLost:Connect(function()
    local v = tonumber(tb.Text) if v then size = math.clamp(v, mn, mx) tb.Text = string.format("%.2f", size) sl.Text = l.s..string.format("%.2f", size).."x" sb.Position = UDim2.new((size-mn)/(mx-mn), -8, 0.5, -8) else tb.Text = string.format("%.2f", size) end
end)

-- EJECUCIÓN INMEDIATA AL PRESIONAR
ab.MouseButton1Click:Connect(function()
    szBypass(size)
end)
