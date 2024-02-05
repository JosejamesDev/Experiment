
local typeof = typeof

local hookfunc = hookfunction

local getmt = getrawmetatable or debug.getmetatable

local gsub = string.gsub

local match = string.match

local rnd = math.random

local cache = setmetatable({}, {__mode = "k"})

local possibleMemoryChars = {

    "a", "b", "c", "d", "e", "f", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"

}



-- Secure call implementation for (more) secure calling of tostring

-- Still detectable though.



local setidentity = setidentity or setthreadidentity or set_thread_identity or setthreadcontext or set_thread_context or (syn and syn.set_thread_identity)

local getidentity = getidentity or getthreadidentity or get_thread_identity or getthreadcontext or get_thread_context or (syn and syn.get_thread_identity)

local securecall = syn and syn.secure_call or newcclosure(function(func, env, ...)

    return coroutine.wrap(function(...)

        local id = getidentity()

        setidentity(2)

        setfenv(0, getsenv(env))

        setfenv(1, getsenv(env))

        local res = {func(...)}

        setidentity(id)

        return table.unpack(res) -- Hidden args maybe removed? idk about packing and unpacking the arguments

    end)(...)

end)



local _tostring; _tostring = hookfunc(tostring, newcclosure(function(data)

    if checkcaller() then -- return normal if its exploit call

        return _tostring(data)

    end



    local callingScript = getcallingscript()

    local res = securecall(_tostring, callingScript, data)

    local type = typeof(data)



    if type == "table" or type == "userdata" or type == "function" or type == "thread" then

        if type == "table" or type == "userdata" then

            local mt = getmt(data)

            if mt and rawget(mt, "__tostring") then

                return res

            end

        end



        --32bit res E.G > table: 0x000000008b9b661b

        --64bit res E.G > table: 0x7a3241c3abbb4de8

        if match(res, "x00000000") then

            if cache[data] then

                return cache[data]

            end



            -- 32 bit string

            res = gsub(res, "x00000000", function()

                -- Generate fake string

                local finalStr = ""



                for i = 1, 8 do

                    finalStr = finalStr .. possibleMemoryChars[rnd(#possibleMemoryChars)]

                end

               

                return "x" .. finalStr

            end)



            cache[data] = res

        end

    end



    return res

end))



local newversion

task.spawn(function()

    newversion = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://clientsettings.roblox.com/v2/client-version/WindowsPlayer")).version

end)



local getVersionMiddleware = Instance.new("BindableFunction")

getVersionMiddleware.OnInvoke = function()

    if (not newversion) then

        repeat task.wait() until newversion

    end

    return newversion

end



hookfunction(Version, newcclosure(function()

    return getVersionMiddleware:Invoke()

end))



hookfunction(version, newcclosure(function()

    return getVersionMiddleware:Invoke()

end))

  

  print("anti cheat bypassed")

  

game:GetService("ReplicatedStorage").Security.RemoteEvent:Destroy()

game:GetService("ReplicatedStorage").Security[""]:Destroy()

game:GetService("ReplicatedStorage").Security:Destroy()

game:GetService("Players").LocalPlayer.PlayerScripts.Client.DeviceChecker:Destroy()

  

  print("anti cheat fucked and destroyed")

  

local CheckMobile = function()

    if

        game:GetService("UserInputService").TouchEnabled

     then

        return true 

    end

end 

IsMobile = CheckMobile()

local UserInputService = game:GetService("UserInputService")

local RunService = game:GetService("RunService")

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer



local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
  local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
  local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
  local GuiService = game:GetService("GuiService")
  


local screenResolution = GuiService:GetScreenResolution()

local screenWidth = screenResolution.X

local screenHeight = screenResolution.Y



local windowWidth = screenWidth * 0.6

local windowHeight = screenHeight * 0.6



-- UDim2.fromOffset(500, 200),

if not IsMobile then 

    windowWidth,windowHeight = 500,200
else

    local ClickButton = Instance.new("ScreenGui")

    local MainFrame = Instance.new("Frame")

    local ImageLabel = Instance.new("ImageLabel")

    local TextButton = Instance.new("TextButton") 

    local UICorner = Instance.new("UICorner") 

    local UICorner_2 = Instance.new("UICorner")

    if game.CoreGui:FindFirstChild("ClickButton") then 

        game.CoreGui:FindFirstChild("ClickButton"):Destroy()

    end

    ClickButton.Name = "ClickButton"

    ClickButton.Parent = game.CoreGui

    ClickButton.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    

    MainFrame.Name = "MainFrame"

    MainFrame.Parent = ClickButton

    MainFrame.Active = true

    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

    MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)

    MainFrame.BorderColor3 = Color3.new(0, 0, 0)

    MainFrame.BorderSizePixel = 0

    MainFrame.Transparency = 1

    MainFrame.Position = UDim2.new(0.187441245, 0, 0.476932675, 0)

    MainFrame.Size = UDim2.new(0, 45, 0, 45)

    

    UICorner.CornerRadius = UDim.new(0, 100)

    UICorner.Parent = MainFrame

    

    UICorner_2.CornerRadius = UDim.new(0, 100)

    UICorner_2.Parent = ImageLabel

    

    ImageLabel.Parent = MainFrame

    ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)

    ImageLabel.BackgroundColor3 = Color3.new(0, 0, 0)

    ImageLabel.BorderColor3 = Color3.new(0, 0, 0)

    ImageLabel.BorderSizePixel = 0

    ImageLabel.Position = UDim2.new(0.48888889, 0, 0.48888889, 0)

    ImageLabel.Size = UDim2.new(0, 45, 0, 45)

    ImageLabel.Image = ""

    

    TextButton.Parent = MainFrame

    TextButton.BackgroundColor3 = Color3.new(1, 1, 1)

    TextButton.BackgroundTransparency = 1

    TextButton.BorderColor3 = Color3.new(0, 0, 0)

    TextButton.BorderSizePixel = 0

    TextButton.Position = UDim2.new(3.3908421e-07, 0, 0, 0)

    TextButton.Size = UDim2.new(0, 45, 0, 45)

    TextButton.AutoButtonColor = false

    TextButton.Font = Enum.Font.SourceSans

    TextButton.Text = "teste"

    TextButton.TextColor3 = Color3.new(255, 255, 255)

    TextButton.TextSize = 15

    TextButton.MouseButton1Click:Connect(function()

        game:GetService("VirtualInputManager"):SendKeyEvent(true,"LeftControl",false,game)

        game:GetService("VirtualInputManager"):SendKeyEvent(false,"LeftControl",false,game)

    end)

end  



  
  local Window = Fluent:CreateWindow({
      Title = "Heaven Hub",
      SubTitle = "Blade Ball -- Developer peste -- beto",
      TabWidth = 160,
      Size = UDim2.new(0, windowWidth, 0, windowHeight),
      Acrylic = false,                       -- The blur may be detectable, setting this to false disables blur entirely
      Theme = "Darker",
      MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
  })


-- Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional

local Tabs = {

    Credits = Window:AddTab({

        Title = "Discord",

        Icon = "gem"

    }),

   Combat = Window:AddTab({

        Title = "Combat",

        Icon = "Swords"

    }),

    ESP = Window:AddTab({

        Title = "Esp",

        Icon = "eye"

    }),

    World = Window:AddTab({

        Title = "World",

        Icon = "globe-2"

    }),


    Shop = Window:AddTab({ 
      
      Title = "Buy",
      
      Icon = "shopping-cart" 
      
      
    }),

    Misc = Window:AddTab({

        Title = "Misc",

        Icon = "settings"

    }),

}

Tabs.Credits:AddButton({

  Title = "Heaven Hub Discord Server",

  Description = "Copy Link Discord Server",

  Callback = function()

    setclipboard("https://discord.gg/Kdn59bYju5")

  end

})


local Options = Fluent.Options



-- Variables

local runService = game:GetService("RunService")

local workspace = game:GetService("Workspace")

local players = game:GetService("Players")

local localPlayer = players.LocalPlayer

local players = game:GetService("Players")

local LocalPlayer = game:GetService("Players").LocalPlayer

local Balls = game:GetService("Workspace").Balls

local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()

local UserInputService = game:GetService("UserInputService")

local replicatedStorage = game:GetService("ReplicatedStorage")

local upgrades = localPlayer.Upgrades





-- Functions
local function ViewParryArea()

  local BallParry = Instance.new("Part", workspace)

  BallParry.Name = "Parry Range <redz hub>"

  BallParry.Material = "ForceField"

  BallParry.CastShadow = false

  BallParry.CanCollide = false

  BallParry.Anchored = true

  BallParry.BrickColor = BrickColor.new("Really white")

  BallParry.Shape = "Ball"

  

  local PartFind = workspace:FindFirstChild(BallParry.Name)

  if PartFind and PartFind ~= BallParry then

    PartFind:Destroy()

  end

  

  local Alive = workspace:WaitForChild("Alive", 9e9)

  local Players = game:GetService("Players")

  local Player = Players.LocalPlayer

  

  task.spawn(function()

    local Balls = workspace:WaitForChild("Balls", 9e9)

    local function GetBall()

      for _,ball in pairs(Balls:GetChildren()) do

        if ball and ball:GetAttribute("realBall") then

          return ball

        end

      end

    end

    

    while getgenv().ViewParryArea do task.wait()

      local Ball = GetBall()

      

      if Ball then

        getgenv().ParryRange = Ball.Velocity.Magnitude * 0.5

      end

    end

  end)

  

  while getgenv().ViewParryArea do task.wait()

    local plrChar = Player.Character

    local plrPP = plrChar and plrChar.PrimaryPart

    local Range = getgenv().ParryRange

    

    if tonumber(Range) then

      BallParry.Size = Vector3.new(Range, Range, Range)

      

      if plrChar and plrChar:FindFirstChild("Highlight") then

        BallParry.BrickColor = BrickColor.new("Really red")

      else

        BallParry.BrickColor = BrickColor.new("Really white")

      end

      

      if Alive:FindFirstChild(Player.Name) then

        if plrPP then

          BallParry.Position = plrPP.Position

        end

      else

        BallParry.Position = Vector3.new(1000, 1000, 1000)

      end

    end

  end

  

  if BallParry then

    BallParry:Destroy()

  end

end



local function startAutoFarm()

    local maxDistance = 60



    heartbeatConnectionAutoFarm = game:GetService("RunService").Heartbeat:Connect(function()

        local playerIsAlive = CheckPlayerIsAlive(LocalPlayer)

        if not playerIsAlive then

            return

        end



        local humanoidRootPart = LocalPlayer.Character:WaitForChild("HumanoidRootPart")

        local playerTarget = GetTarget()

        if not humanoidRootPart or not playerTarget or playerTarget == LocalPlayer then

            return

        end



        local humanoidRootPartTarget = playerTarget.Character:WaitForChild("HumanoidRootPart")



        if humanoidRootPartTarget then

            local direction = (humanoidRootPartTarget.Position - humanoidRootPart.Position)

            direction = Vector3.new(direction.X, 0, direction.Z).unit



            local distance = (humanoidRootPart.Position - humanoidRootPartTarget.Position).magnitude



            if distance > maxDistance then

                humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position, humanoidRootPart.Position + direction)

                humanoidRootPart.Velocity = direction * 41

            else

                humanoidRootPart.Velocity = Vector3.new(0, 0, 0) -- Pare o movimento

            end

        end

    end)

end



local function stopAutoFarm()

    if heartbeatConnectionAutoFarm then

        heartbeatConnectionAutoFarm:Disconnect()

        heartbeatConnectionAutoFarm = nil

    end

end



local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RunService = game:GetService("RunService")

local ParryAttempt = ReplicatedStorage.Remotes.ParryAttempt



local defaultPosition = Vector3.new(-273.400146484375, -724.8031005859375, -20.92414093017578)

local defaultAngles = CFrame.Angles(-2.029526710510254, 0.5662040710449219, 2.314905881881714)

local defaultCFrame = CFrame.new(-254.2939910888672, 112.13581848144531, -119.27256774902344) * defaultAngles



local function SpamParry()

    while spamParry do

        local targetPosition = Vector3.new(-273.400146484375, -724.8031005859375, -20.92414093017578)

        local angles = CFrame.Angles(-2.029526710510254, 0.5662040710449219, 2.314905881881714)

        local parryCFrame = CFrame.new(-254.2939910888672, 112.13581848144531, -119.27256774902344) * angles

        ParryAttempt:FireServer(1.5, parryCFrame, {["2617721424"] = targetPosition}, {910, 154})



        RunService.Heartbeat:Wait()

    end

end

  --Codigos esps

local function ESP_Ball()
  while getgenv().ESP_Ball == true do task.wait()
    local plr = game.Players.LocalPlayer
    local plrRP = plr.Character:FindFirstChild("HumanoidRootPart")
    for ___,ball in pairs(workspace:WaitForChild("Balls", 10):GetChildren()) do
      if ball and ball:IsA("Part") and ball:GetAttribute("realBall") == true and not ball:FindFirstChild("ESP_samirayt") then
        
        local Folder = Instance.new("Folder", ball)
        local BHA = Instance.new("BoxHandleAdornment",Folder)
        local BillboardGui = Instance.new("BillboardGui", BHA)
        local TextLabel = Instance.new("TextLabel", BillboardGui)
        Folder.Name = "ESP_samirayt"
        
        BHA.Size = Vector3.new(1,0, 1,0)
        BHA.Name = "ESP_samirayt"
        BHA.AlwaysOnTop = true
        BHA.ZIndex = 10
        BHA.Transparency = 0
        
        BillboardGui.Adornee = ball
        BillboardGui.Size = UDim2.new(0, 100, 0, 150)
        BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
        BillboardGui.AlwaysOnTop = true
        
        TextLabel.BackgroundTransparency = 1
        TextLabel.Position = UDim2.new(0, 0, 0, -50)
        TextLabel.Size = UDim2.new(0, 100, 0, 100)
        TextLabel.TextSize = 10
        TextLabel.TextColor3 = Color3.new(1, 1, 1)
        TextLabel.TextStrokeTransparency = 0
        TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
        TextLabel.Text = "Ball <...>"
        TextLabel.ZIndex = 15
        TextLabel.TextColor3 = Color3.fromRGB(0,255,0)
        
        task.spawn(function()
          while task.wait() do
            local plr = game.Players.LocalPlayer
            local plrRP = plr.Character:FindFirstChild("HumanoidRootPart")
            if plrRP and ball then
              local distance = math.floor((plrRP.Position - ball.Position).Magnitude)
              TextLabel.Text = "Ball <" .. tostring(distance) .. ">"
            end
          end
        end)
      end
    end
  end
  task.wait()
  for _,v in pairs(workspace:WaitForChild("Balls", 10):GetChildren()) do
    if v:FindFirstChild("ESP_samirayt") then
      v:Destroy()
    end
  end
end

local function ESP_plr()
  while getgenv().ESP_plr == true do task.wait()
    local plr1 = game.Players.LocalPlayer
    for _,plr in pairs(game.Players:GetPlayers()) do
      if plr.Name ~= plr1.Name and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and not plr.Character:FindFirstChild("ESP_samirayt") and workspace:WaitForChild("Alive", 60):FindFirstChild(plr.Name) then
        
        local Folder = Instance.new("Folder", plr.Character)
        local BHA = Instance.new("BoxHandleAdornment", Folder)
        local BillboardGui = Instance.new("BillboardGui", BHA)
        local TextLabel = Instance.new("TextLabel", BillboardGui)
        Folder.Name = "ESP_samirayt"
        
        BHA.Size = Vector3.new(1, 0, 1, 0)
        BHA.Name = "ESP_samirayt"
        BHA.AlwaysOnTop = true
        BHA.ZIndex = 10
        BHA.Transparency = 0
        
        BillboardGui.Adornee = plr.Character.HumanoidRootPart
        BillboardGui.Size = UDim2.new(0, 100, 0, 150)
        BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
        BillboardGui.AlwaysOnTop = true
        
        TextLabel.BackgroundTransparency = 1
        TextLabel.Position = UDim2.new(0, 0, 0, -50)
        TextLabel.Size = UDim2.new(0, 100, 0, 100)
        TextLabel.TextSize = 10
        TextLabel.TextColor3 = Color3.new(1, 1, 1)
        TextLabel.TextStrokeTransparency = 0
        TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
        TextLabel.Text = plr.Name .. " <...>"
        TextLabel.ZIndex = 15
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
        
        task.spawn(function()
          while task.wait() do
            local plrRP = plr1.Character:FindFirstChild("HumanoidRootPart")
            if plr1 and plrRP and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
              local distance = math.floor((plrRP.Position - plr.Character.HumanoidRootPart.Position).Magnitude)
              TextLabel.Text = plr.Name .. " <" .. tostring(distance) .. ">"
            end
          end
        end)
      end
    end
  end
  task.wait()
  for _,plr in pairs(game.Players:GetPlayers()) do
    if plr and plr.Character and plr.Character:FindFirstChild("ESP_samiyt") then
      plr.Character.ESP_samirayt:Destroy()
    end
  end
end
  
local function nightMode()

  local lighting = game:GetService("Lighting")

 lighting.TimeOfDay = 0.4

 lighting = game:GetService("Lighting")

 lighting.Ambient = Color3.new(0, 0, 0.2)

  

  local luaModel = game.ReplicatedStorage:WaitForChild("LuaModel"):Clone()

  luaModel.Parent = game.Workspace

  luaModel:SetPrimaryPartCFrame(CFrame.new(Vector3.new(0, 100, -500)))

  

  local estrelasModel = game.ReplicatedStorage:WaitForChild("EstrelasModel"):Clone()

  estrelasModel.Parent = game.Workspace

  

   end



local function day()

  

  

    local lighting = game:GetService("Lighting")

      lighting.TimeOfDay = 14

      lighting.Ambient = Color3.new(1, 1, 1) 

  

   end



  



do


  

  

    -- Options.MyToggle:SetValue(false)

  Tabs.Combat:AddButton({

        Title = "Auto Parry",

        Description = "",

        Callback = function()

      local Debug = false
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Players = game:GetService("Players")

        local Player = Players.LocalPlayer or Players.PlayerAdded:Wait()
        local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
        local Balls = workspace:WaitForChild("Balls", 9e9)

        local function print(...)
            if Debug then
                warn(...)
            end
        end

        local function VerifyBall(Ball)
            if typeof(Ball) == "Instance" and Ball:IsA("BasePart") and Ball:IsDescendantOf(Balls) and Ball:GetAttribute("realBall") == true then
                return true
            end
        end

        local function IsTarget()
            return (Player.Character and Player.Character:FindFirstChild("Highlight"))
        end

        local function Parry()
            Remotes:WaitForChild("ParryButtonPress"):Fire()
        end

        local function GetAngle(Ball)
            local Camera = workspace.CurrentCamera
            local BallVector = Ball.Position - Camera.Focus.Position
            local CameraVector = Camera.CFrame.LookVector
            local DotProduct = BallVector:Dot(CameraVector)
            local MagnitudeProduct = BallVector.Magnitude * CameraVector.Magnitude
            local Cosine = DotProduct / MagnitudeProduct
            local Angle = math.acos(Cosine)
            return Angle
        end

        Balls.ChildAdded:Connect(function(Ball)
            if not VerifyBall(Ball) then
                return
            end
            
            print("Ball Spawned: {Ball}")
            
            local OldPosition = Ball.Position
            local OldTick = tick()
            
            Ball:GetPropertyChangedSignal("Position"):Connect(function()
                if IsTarget() then
                    local Distance = (Ball.Position - workspace.CurrentCamera.Focus.Position).Magnitude
                    local Velocity = (OldPosition - Ball.Position).Magnitude
                    local Angle = GetAngle(Ball)
                    
                    print("Distance: {Distance}\nVelocity: {Velocity}\nAngle: {Angle}\nTime: {Distance / Velocity}")
                
                    if (Distance / Velocity) <= 34 and Angle <= 1 then
                        Parry()
                    end
                end
                
                if (tick() - OldTick >= 1/60) then
                    OldTick = tick()
                    OldPosition = Ball.Position
                end
            end)
        end)
        end,

    })


     local toggle = Tabs.Combat:AddToggle("MyToggle", {Title = "Teleport Parry", Default = false })

toggle:OnChanged(function(bool)
    getgenv().god = bool

    while getgenv().god and wait() do

        for _, ball in ipairs(workspace.Balls:GetChildren()) do
            if ball and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, ball.Position)

                if game.Players.LocalPlayer.Character:FindFirstChild("Highlight") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ball.CFrame * CFrame.new(0, 0, (ball.Velocity).Magnitude * -0.5)
                    game.ReplicatedStorage.Remotes.ParryButtonPress:Fire()
                end
            end
        end
    end
end)
     
     

     Tabs.Combat:AddButton({

        Title = "Auto-Spam",

        Description = "",

        Callback = function()

           loadstring(game:HttpGet(

                "https://raw.githubusercontent.com/legoLol/spamksjdksks/main/spamkdjskxj"))()

        end

     })

  
  local ToggleParry = Tabs.Combat:AddToggle("ParryArea", {
    Title = "View Area",
    Default = false,
    Callback = function(Value)
        if Value then
            getgenv().ViewParryArea = true
        else
            getgenv().ViewParryArea = false
        end
        ViewParryArea()
    end
})

local ToggleParry = Tabs.Combat:AddToggle("ParryArea", {
    Title = "Auto Rapture",
    Default = false,
    Callback = function(Value)
      local function chooseNewFocusedBall()
    local balls = ballsFolder:GetChildren()
    for _, ball in ipairs(balls) do
        if ball:GetAttribute("realBall") ~= nil and ball:GetAttribute("realBall") == true then
            focusedBall = ball
            print(focusedBall.Name)
            break
        elseif ball:GetAttribute("target") ~= nil then
            focusedBall = ball
            print(focusedBall.Name)
            break
        end
    end
    
    if focusedBall == nil then
        print("Debug: Could not find a ball that's the realBall or has a target.")
        wait(1)
        chooseNewFocusedBall()
    end
    return focusedBall
end

local function getDynamicThreshold(ballVelocityMagnitude)
    if ballVelocityMagnitude > 60 then
        return math.max(30, BASE_THRESHOLD - (ballVelocityMagnitude * VELOCITY_SCALING_FACTOR_FAST))
    else
        return math.min(10, BASE_THRESHOLD + (ballVelocityMagnitude * VELOCITY_SCALING_FACTOR_SLOW))
    end
end

local function timeUntilImpact(ballVelocity, distanceToPlayer, playerVelocity)
    if not character then return end
    local directionToPlayer = (character.HumanoidRootPart.Position - focusedBall.Position).Unit
    local velocityTowardsPlayer = ballVelocity:Dot(directionToPlayer) - playerVelocity:Dot(directionToPlayer)
    
    if velocityTowardsPlayer <= 10 then
        return math.huge
    end
    
    return (distanceToPlayer - sliderValue) / velocityTowardsPlayer
end

local function updateDistanceVisualizer()
    local charPos = character and character.PrimaryPart and character.PrimaryPart.Position
    if charPos and focusedBall then
        if distanceVisualizer then
            distanceVisualizer:Destroy()
        end

        local timeToImpactValue = timeUntilImpact(focusedBall.Velocity, (focusedBall.Position - charPos).Magnitude, character.PrimaryPart.Velocity)
        local ballFuturePosition = focusedBall.Position + focusedBall.Velocity * timeToImpactValue

        distanceVisualizer = Instance.new("Part")
        distanceVisualizer.Size = Vector3.new(1, 1, 1)
        distanceVisualizer.Anchored = true
        distanceVisualizer.CanCollide = false
        distanceVisualizer.Position = ballFuturePosition
        distanceVisualizer.Parent = workspace    
    end
end

local function checkIfTarget()
    for _, v in pairs(ballsFolder:GetChildren()) do
        if v:IsA("Part") and v.BrickColor == BrickColor.new("Really red") then 
            print("Ball is targetting player.")
            return true 
        end 
    end 
    return false
end

local function isCooldownInEffect(uigradient)
    return uigradient.Offset.Y < 0.5
end


local function checkBallDistance()
    if not character or not checkIfTarget() then return end

    local charPos = character.PrimaryPart.Position
    local charVel = character.PrimaryPart.Velocity

    if focusedBall and not focusedBall.Parent then
        print("Focused ball lost parent. Choosing a new focused ball.")
        chooseNewFocusedBall()
    end
    if not focusedBall then 
        print("No focused ball.")
        chooseNewFocusedBall()
    end

    local ball = focusedBall
    local distanceToPlayer = (ball.Position - charPos).Magnitude
    local ballVelocityTowardsPlayer = ball.Velocity:Dot((charPos - ball.Position).Unit)
    
    if distanceToPlayer < 15 then
        parryButtonPress:Fire()
        task.wait()
    end

    if timeUntilImpact(ball.Velocity, distanceToPlayer, charVel) < getDynamicThreshold(ballVelocityTowardsPlayer) then
        if (character.Abilities["Raging Deflection"].Enabled or character.Abilities["Rapture"].Enabled) and UseRage == true then
            if not isCooldownInEffect(uigrad2) then
                abilityButtonPress:Fire()
            end

            if isCooldownInEffect(uigrad2) and not isCooldownInEffect(uigrad1) then
                parryButtonPress:Fire()
                if notifyparried == true then
                    notify("Auto Parry", "Manually Parried Ball (Ability on CD)", 0.3)
                end
            end

        elseif not isCooldownInEffect(uigrad1) then
            print(isCooldownInEffect(uigrad1))
            parryButtonPress:Fire()
            if notifyparried == true then
                notify("Auto Parry", "Automatically Parried Ball", 0.3)
            end
            task.wait(0.3)
        end
    end
end


local function autoParryCoroutine()
    while isRunning do
        checkBallDistance()
        updateDistanceVisualizer()
        task.wait()
    end
end



localPlayer.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    chooseNewFocusedBall()
    updateDistanceVisualizer()
end)

localPlayer.CharacterRemoving:Connect(function()
    if distanceVisualizer then
        distanceVisualizer:Destroy()
        distanceVisualizer = nil
    end
end)



local function startAutoParry()
    print("Script successfully ran.")
    
    chooseNewFocusedBall()
    
    isRunning = true
    local co = coroutine.create(autoParryCoroutine)
    coroutine.resume(co)
end

local function stopAutoParry()
    isRunning = false
end
    end
})
      


Tabs.Combat:AddButton({
    Title = "Clash Delete",
    Description = "",
    Callback = function()
        while game:GetService("RunService").Heartbeat:wait() do
            local workspaceItems = game.Workspace:GetChildren()
            for i = 1, #workspaceItems do
                local item = workspaceItems[i]
                if item.Name == "clash" then
                    item:Destroy()
                end
            end
        end
    end
})

   Tabs.Combat:AddButton({

        Title = "Auto Click Mobile",

        Description = "",

        Callback = function()

           local gui = Instance.new('ScreenGui')
gui.ResetOnSpawn = false
gui.Name = 'Berserker'
gui.Parent = game.CoreGui

local frame = Instance.new('Frame')
frame.Position = UDim2.new(0.5, -70, 0.4, -60)
frame.Size = UDim2.new(0, 140, 0, 120)
frame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
frame.BackgroundTransparency = 0.5
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local corner2 = Instance.new('UICorner')
corner2.CornerRadius = UDim.new(0, 10)
corner2.Parent = frame

local topBar = Instance.new('Frame')
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
topBar.BorderSizePixel = 0
topBar.Parent = frame

local corner4 = Instance.new('UICorner')
corner4.CornerRadius = UDim.new(0, 10)
corner4.Parent = topBar

local titleLabel = Instance.new('TextLabel')
titleLabel.Size = UDim2.new(1, -6, 1, -6)
titleLabel.Position = UDim2.new(0, 3, 0, 3)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = 'Heaven Hub'
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 14
titleLabel.Parent = topBar

local corner = Instance.new('UICorner')
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = titleLabel

local button = Instance.new('TextButton')
button.Text = 'SPAM: OFF'
button.Size = UDim2.new(1, -20, 0, 50)
button.Position = UDim2.new(0, 10, 0, 50)
button.BackgroundColor3 = Color3.fromRGB(0, 34 / 255, 102 / 255)
button.BorderColor3 = Color3.fromRGB(30, 30, 30)
button.BorderSizePixel = 2
button.Font = Enum.Font.GothamSemibold
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 14
button.Parent = frame

local corner3 = Instance.new('UICorner')
corner3.CornerRadius = UDim.new(0, 10)
corner3.Parent = button

local activated = false

local function toggle()
    activated = not activated
    button.Text = activated and 'ON' or 'OFF'
    button.BackgroundColor3 = activated and Color3.fromRGB(135, 206, 250) or Color3.fromRGB(0, 34 / 255, 102 / 255)

    while activated do
        local args = {
            [1] = 1.5,
            [2] = CFrame.new(-254.2939910888672, 112.13581848144531, -119.27256774902344) *
                CFrame.Angles(-2.029526710510254, 0.5662040710449219, 2.314905881881714),
            [3] = {
                ['2617721424'] = Vector3.new(-273.400146484375, -724.8031005859375, -20.92414093017578),
            },
            [4] = {
                [1] = 910,
                [2] = 154,
            },
        }

        game:GetService('ReplicatedStorage').Remotes.ParryAttempt:FireServer(unpack(args))
        game:GetService('RunService').Heartbeat:Wait()
    end
end

button.MouseButton1Click:Connect(toggle)
local UserInputService = game:GetService("UserInputService")
      local eKeyPressed = false
      UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
        if input.KeyCode == Enum.KeyCode.E and not gameProcessedEvent then
          eKeyPressed = true
          toggle()
        end
      end)
      UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
        if input.KeyCode == Enum.KeyCode.E then
          eKeyPressed = false
        end
      end)
     
   end
})
  
Tabs.Combat:AddButton({
    Title = "Spam Parry (PC)",
    Description = "Spam = E",
    Callback = function()
        local activatedD = false

        local function toggle()
            activatedD = not activatedD
            while activatedD do
                local args = {
                    [1] = 1.5,
                    [2] = CFrame.new(-254.2939910888672, 112.13581848144531, -119.27256774902344) * CFrame.Angles(-2.029526710510254, 0.5662040710449219, 2.314905881881714),
                    [3] = {
                        ["2617721424"] = Vector3.new(-273.400146484375, -724.8031005859375, -20.92414093017578),
                    },
                    [4] = {
                        [1] = 910,
                        [2] = 154
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.ParryAttempt:FireServer(unpack(args))
                game:GetService("RunService").Heartbeat:Wait()
            end
        end

        local UserInputService = game:GetService("UserInputService")
        local eKeyPressed = false

        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.E and not gameProcessedEvent then
                eKeyPressed = true
                toggle()
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.E then
                eKeyPressed = false
            end
        end)
    end
})




Tabs.ESP:AddButton({
      Title = "Rgb player",
      Description = "",
      Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/Xeno01010/Zeno-Hub/main/HightLighttasdfa"))()
        end
      
})

local ToggleParry = Tabs.ESP:AddToggle("ParryArea", {
    Title = "Player Esp",
    Default = false,
    Callback = function(Value)
      getgenv().ESP_plr = Value
    ESP_plr()
  end
})
      
      local ToggleParry = Tabs.ESP:AddToggle("ParryArea", {
    Title = "Ball Esp",
    Default = false,
    Callback = function(Value)
      getgenv().ESP_Ball = Value
    ESP_Ball()
  end
})



local ToggleNight = Tabs.World:AddToggle("NightMode", {
    Title = "Night & Day",
    Default = false,
    Callback = function(Value)
        if Value then
            nightMode()
        else
            day()
        end
    end
})

Tabs.World:AddButton({
    Title = "Fps Boost",
    Description = "",
    Callback = function()
        local ToDisable = {
            Textures = true,
            VisualEffects = true,
            Parts = true,
            Particles = true,
            Sky = true
        }

        local ToEnable = {
            FullBright = false
        }

        local Stuff = {}

        local function disableTextures(obj)
            if obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Texture = ""
                table.insert(Stuff, obj)
            end
        end

        local function disableParticlesAndEffects(obj)
            if obj:IsA("ParticleEmitter") or obj:IsA("Smoke") or obj:IsA("Explosion") or obj:IsA("Sparkles") or obj:IsA("Fire") then
                obj.Enabled = false
                table.insert(Stuff, obj)
            elseif obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or obj:IsA("DepthOfFieldEffect") or obj:IsA("SunRaysEffect") then
                obj.Enabled = false
                table.insert(Stuff, obj)
            end
        end

        local function disableObjects()
            for _, v in pairs(game:GetDescendants()) do
                if ToDisable.Parts and (v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart")) then
                    v.Material = Enum.Material.SmoothPlastic
                    table.insert(Stuff, v)
                end

                if ToDisable.Particles then
                    disableParticlesAndEffects(v)
                end

                if ToDisable.VisualEffects then
                    disableParticlesAndEffects(v)
                end

                if ToDisable.Textures then
                    disableTextures(v)
                end

                if ToDisable.Sky and v:IsA("Sky") then
                    v.Parent = nil
                    table.insert(Stuff, v)
                end
            end
        end

        local function enableFullBright()
            if ToEnable.FullBright then
                local Lighting = game:GetService("Lighting")
                Lighting.FogColor = Color3.new(1, 1, 1)
                Lighting.FogEnd = math.huge
                Lighting.FogStart = math.huge
                Lighting.Ambient = Color3.new(1, 1, 1)
                Lighting.Brightness = 5
                Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
                Lighting.ColorShift_Top = Color3.new(1, 1, 1)
                Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
                Lighting.Outlines = true
            end
        end

        while wait(1) do
            local success, error = pcall(function()
                Stuff = {} -- Clear previous objects
                disableObjects()
                enableFullBright()
                game:GetService("TestService"):Message("Effects Disabler Script: Successfully disabled " .. #Stuff .. " assets/effects. Settings:")
                for i, v in pairs(ToDisable) do
                    print(tostring(i) .. ": " .. tostring(v))
                end
            end)

            if not success then
                warn("Error in script:", error)
            end
        end
    end
})


Tabs.World:AddButton({
    Title = "Remove Texture",
    Description = "",
    Callback = function()
        local ToDisable = {
    Colors = true,
    Textures = true,
    VisualEffects = true,
    Parts = true,
    Particles = true,
    Sky = true
}

local ToEnable = {
    FullBright = false
}

local LastRunTime = 0
local RunInterval = 5 -- Intervalo de 5 segundos entre as execuções

-- Function to disable colors
local function disableColors(obj)
    if obj:IsA("BasePart") then
        obj.Color = Color3.new(0.5, 0.5, 0.5)
    end
end

-- Function to disable textures
local function disableTextures(obj)
    if obj:IsA("Decal") or obj:IsA("Texture") then
        obj.Texture = ""
    end
end

-- Function to disable particles and visual effects
local function disableParticlesAndEffects(obj)
    if obj:IsA("ParticleEmitter") or obj:IsA("Smoke") or obj:IsA("Explosion") or obj:IsA("Sparkles") or obj:IsA("Fire") then
        obj.Enabled = false
    elseif obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or obj:IsA("DepthOfFieldEffect") or obj:IsA("SunRaysEffect") then
        obj.Enabled = false
    end
end

-- Function to apply changes to specific objects
local function applyChangesToObject(obj)
    if ToDisable.Parts and (obj:IsA("Part") or obj:IsA("Union") or obj:IsA("BasePart")) then
        pcall(function()
            obj.Material = Enum.Material.SmoothPlastic
            if ToDisable.Colors then disableColors(obj) end
        end)
    end

    if ToDisable.Particles or ToDisable.VisualEffects then
        pcall(function()
            disableParticlesAndEffects(obj)
        end)
    end

    if ToDisable.Textures then
        pcall(function()
            disableTextures(obj)
        end)
    end

    if ToDisable.Sky and obj:IsA("Sky") then
        pcall(function()
            obj:Destroy()
        end)
    end
end

-- Function to apply changes to the entire map
local function applyChangesToMap()
    for _, obj in pairs(workspace:GetDescendants()) do
        applyChangesToObject(obj)
    end

    print("Effects Disabler Script: Successfully applied changes.")
end

-- Connect the function applyChangesToMap to the DescendantAdded event
game:GetService("RunService").Stepped:Connect(function()
    local currentTime = tick()
    if not game:IsLoaded() or (currentTime - LastRunTime) < RunInterval then
        return
    end

    applyChangesToMap()
    LastRunTime = currentTime
end)

-- Call the function initially to apply the changes to the current map
applyChangesToMap()
    end
})


Tabs.Shop:AddButton({
    Title = "Buy Sword Box",
    Description = "",
    Callback = function()
        local args = {
            [1] = "PromptPurchaseCrate",
            [2] = workspace.Spawn.Crates.NormalSwordCrate
        }

        game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer(unpack(args))
    end
})

Tabs.Shop:AddButton({
    Title = "Buy Explosion Box",
    Description = "",
    Callback = function()
local args = {
    [1] = "PromptPurchaseCrate",
    [2] = workspace.Spawn.Crates.NormalExplosionCrate
}

game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer(unpack(args))
  end
})




Tabs.Misc:AddButton({
    Title = "Re-Enter",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/mM7JBG5h", true))() 
    end
})

Tabs.Misc:AddButton({

        Title = "Mobile Keyboard",

        Description = "",

        Callback = function()

            loadstring(game:HttpGet(

                "https://gist.githubusercontent.com/RedZenXYZ/4d80bfd70ee27000660e4bfa7509c667/raw/da903c570249ab3c0c1a74f3467260972c3d87e6/KeyBoard%20From%20Ohio%20Fr%20Fr"))()

        end

    })

--interface
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Misc)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Heaven Hub",
    Content = "The script has been loaded.",
    Duration = 5
})

end titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 14
titleLabel.Parent = topBar

local corner = Instance.new('UICorner')
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = titleLabel

local button = Instance.new('TextButton')
button.Text = 'SPAM: OFF'
button.Size = UDim2.new(1, -20, 0, 50)
button.Position = UDim2.new(0, 10, 0, 50)
button.BackgroundColor3 = Color3.fromRGB(0, 34 / 255, 102 / 255)
button.BorderColor3 = Color3.fromRGB(30, 30, 30)
button.BorderSizePixel = 2
button.Font = Enum.Font.GothamSemibold
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 14
button.Parent = frame

local corner3 = Instance.new('UICorner')
corner3.CornerRadius = UDim.new(0, 10)
corner3.Parent = button

local activated = false

local function toggle()
    activated = not activated
    button.Text = activated and 'ON' or 'OFF'
    button.BackgroundColor3 = activated and Color3.fromRGB(135, 206, 250) or Color3.fromRGB(0, 34 / 255, 102 / 255)

    while activated do
        local args = {
            [1] = 1.5,
            [2] = CFrame.new(-254.2939910888672, 112.13581848144531, -119.27256774902344) *
                CFrame.Angles(-2.029526710510254, 0.5662040710449219, 2.314905881881714),
            [3] = {
                ['2617721424'] = Vector3.new(-273.400146484375, -724.8031005859375, -20.92414093017578),
            },
            [4] = {
                [1] = 910,
                [2] = 154,
            },
        }

        game:GetService('ReplicatedStorage').Remotes.ParryAttempt:FireServer(unpack(args))
        game:GetService('RunService').Heartbeat:Wait()
    end
end

button.MouseButton1Click:Connect(toggle)
local UserInputService = game:GetService("UserInputService")
      local eKeyPressed = false
      UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
        if input.KeyCode == Enum.KeyCode.E and not gameProcessedEvent then
          eKeyPressed = true
          toggle()
        end
      end)
      UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
        if input.KeyCode == Enum.KeyCode.E then
          eKeyPressed = false
        end
      end)
     
   end
})
  
Tabs.Combat:AddButton({
    Title = "Spam Parry (PC)",
    Description = "Spam = E",
    Callback = function()
        local activatedD = false

        local function toggle()
            activatedD = not activatedD
            while activatedD do
                local args = {
                    [1] = 1.5,
                    [2] = CFrame.new(-254.2939910888672, 112.13581848144531, -119.27256774902344) * CFrame.Angles(-2.029526710510254, 0.5662040710449219, 2.314905881881714),
                    [3] = {
                        ["2617721424"] = Vector3.new(-273.400146484375, -724.8031005859375, -20.92414093017578),
                    },
                    [4] = {
                        [1] = 910,
                        [2] = 154
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.ParryAttempt:FireServer(unpack(args))
                game:GetService("RunService").Heartbeat:Wait()
            end
        end

        local UserInputService = game:GetService("UserInputService")
        local eKeyPressed = false

        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.E and not gameProcessedEvent then
                eKeyPressed = true
                toggle()
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.E then
                eKeyPressed = false
            end
        end)
    end
})




Tabs.ESP:AddButton({
      Title = "Rgb player",
      Description = "",
      Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/Xeno01010/Zeno-Hub/main/HightLighttasdfa"))()
        end
      
})

local ToggleParry = Tabs.ESP:AddToggle("ParryArea", {
    Title = "Player Esp",
    Default = false,
    Callback = function(Value)
      getgenv().ESP_plr = Value
    ESP_plr()
  end
})
      
      local ToggleParry = Tabs.ESP:AddToggle("ParryArea", {
    Title = "Ball Esp",
    Default = false,
    Callback = function(Value)
      getgenv().ESP_Ball = Value
    ESP_Ball()
  end
})



local ToggleNight = Tabs.World:AddToggle("NightMode", {
    Title = "Night & Day",
    Default = false,
    Callback = function(Value)
        if Value then
            nightMode()
        else
            day()
        end
    end
})

Tabs.World:AddButton({
    Title = "Fps Boost",
    Description = "",
    Callback = function()
        local ToDisable = {
            Textures = true,
            VisualEffects = true,
            Parts = true,
            Particles = true,
            Sky = true
        }

        local ToEnable = {
            FullBright = false
        }

        local Stuff = {}

        local function disableTextures(obj)
            if obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Texture = ""
                table.insert(Stuff, obj)
            end
        end

        local function disableParticlesAndEffects(obj)
            if obj:IsA("ParticleEmitter") or obj:IsA("Smoke") or obj:IsA("Explosion") or obj:IsA("Sparkles") or obj:IsA("Fire") then
                obj.Enabled = false
                table.insert(Stuff, obj)
            elseif obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or obj:IsA("DepthOfFieldEffect") or obj:IsA("SunRaysEffect") then
                obj.Enabled = false
                table.insert(Stuff, obj)
            end
        end

        local function disableObjects()
            for _, v in pairs(game:GetDescendants()) do
                if ToDisable.Parts and (v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart")) then
                    v.Material = Enum.Material.SmoothPlastic
                    table.insert(Stuff, v)
                end

                if ToDisable.Particles then
                    disableParticlesAndEffects(v)
                end

                if ToDisable.VisualEffects then
                    disableParticlesAndEffects(v)
                end

                if ToDisable.Textures then
                    disableTextures(v)
                end

                if ToDisable.Sky and v:IsA("Sky") then
                    v.Parent = nil
                    table.insert(Stuff, v)
                end
            end
        end

        local function enableFullBright()
            if ToEnable.FullBright then
                local Lighting = game:GetService("Lighting")
                Lighting.FogColor = Color3.new(1, 1, 1)
                Lighting.FogEnd = math.huge
                Lighting.FogStart = math.huge
                Lighting.Ambient = Color3.new(1, 1, 1)
                Lighting.Brightness = 5
                Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
                Lighting.ColorShift_Top = Color3.new(1, 1, 1)
                Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
                Lighting.Outlines = true
            end
        end

        while wait(1) do
            local success, error = pcall(function()
                Stuff = {} -- Clear previous objects
                disableObjects()
                enableFullBright()
                game:GetService("TestService"):Message("Effects Disabler Script: Successfully disabled " .. #Stuff .. " assets/effects. Settings:")
                for i, v in pairs(ToDisable) do
                    print(tostring(i) .. ": " .. tostring(v))
                end
            end)

            if not success then
                warn("Error in script:", error)
            end
        end
    end
})


Tabs.World:AddButton({
    Title = "Remove Texture",
    Description = "",
    Callback = function()
        local ToDisable = {
    Colors = true,
    Textures = true,
    VisualEffects = true,
    Parts = true,
    Particles = true,
    Sky = true
}

local ToEnable = {
    FullBright = false
}

local LastRunTime = 0
local RunInterval = 5 -- Intervalo de 5 segundos entre as execuções

-- Function to disable colors
local function disableColors(obj)
    if obj:IsA("BasePart") then
        obj.Color = Color3.new(0.5, 0.5, 0.5)
    end
end

-- Function to disable textures
local function disableTextures(obj)
    if obj:IsA("Decal") or obj:IsA("Texture") then
        obj.Texture = ""
    end
end

-- Function to disable particles and visual effects
local function disableParticlesAndEffects(obj)
    if obj:IsA("ParticleEmitter") or obj:IsA("Smoke") or obj:IsA("Explosion") or obj:IsA("Sparkles") or obj:IsA("Fire") then
        obj.Enabled = false
    elseif obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or obj:IsA("DepthOfFieldEffect") or obj:IsA("SunRaysEffect") then
        obj.Enabled = false
    end
end

-- Function to apply changes to specific objects
local function applyChangesToObject(obj)
    if ToDisable.Parts and (obj:IsA("Part") or obj:IsA("Union") or obj:IsA("BasePart")) then
        pcall(function()
            obj.Material = Enum.Material.SmoothPlastic
            if ToDisable.Colors then disableColors(obj) end
        end)
    end

    if ToDisable.Particles or ToDisable.VisualEffects then
        pcall(function()
            disableParticlesAndEffects(obj)
        end)
    end

    if ToDisable.Textures then
        pcall(function()
            disableTextures(obj)
        end)
    end

    if ToDisable.Sky and obj:IsA("Sky") then
        pcall(function()
            obj:Destroy()
        end)
    end
end

-- Function to apply changes to the entire map
local function applyChangesToMap()
    for _, obj in pairs(workspace:GetDescendants()) do
        applyChangesToObject(obj)
    end

    print("Effects Disabler Script: Successfully applied changes.")
end

-- Connect the function applyChangesToMap to the DescendantAdded event
game:GetService("RunService").Stepped:Connect(function()
    local currentTime = tick()
    if not game:IsLoaded() or (currentTime - LastRunTime) < RunInterval then
        return
    end

    applyChangesToMap()
    LastRunTime = currentTime
end)

-- Call the function initially to apply the changes to the current map
applyChangesToMap()
    end
})


Tabs.Shop:AddButton({
    Title = "Buy Sword Box",
    Description = "",
    Callback = function()
        local args = {
            [1] = "PromptPurchaseCrate",
            [2] = workspace.Spawn.Crates.NormalSwordCrate
        }

        game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer(unpack(args))
    end
})

Tabs.Shop:AddButton({
    Title = "Buy Explosion Box",
    Description = "",
    Callback = function()
local args = {
    [1] = "PromptPurchaseCrate",
    [2] = workspace.Spawn.Crates.NormalExplosionCrate
}

game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer(unpack(args))
  end
})




Tabs.Misc:AddButton({
    Title = "Re-Enter",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/mM7JBG5h", true))() 
    end
})

Tabs.Misc:AddButton({

        Title = "Mobile Keyboard",

        Description = "",

        Callback = function()

            loadstring(game:HttpGet(

                "https://gist.githubusercontent.com/RedZenXYZ/4d80bfd70ee27000660e4bfa7509c667/raw/da903c570249ab3c0c1a74f3467260972c3d87e6/KeyBoard%20From%20Ohio%20Fr%20Fr"))()

        end

    })

--interface
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Misc)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Heaven Hub",
    Content = "The script has been loaded.",
    Duration = 5
})

end             end
        end

        local UserInputService = game:GetService("UserInputService")
        local eKeyPressed = false

        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.E and not gameProcessedEvent then
                eKeyPressed = true
                toggle()
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.E then
                eKeyPressed = false
            end
        end)
    end
})




Tabs.ESP:AddButton({
      Title = "Rgb player",
      Description = "",
      Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/Xeno01010/Zeno-Hub/main/HightLighttasdfa"))()
        end
      
})

local ToggleParry = Tabs.ESP:AddToggle("ParryArea", {
    Title = "Player Esp",
    Default = false,
    Callback = function(Value)
      getgenv().ESP_plr = Value
    ESP_plr()
  end
})
      
      local ToggleParry = Tabs.ESP:AddToggle("ParryArea", {
    Title = "Ball Esp",
    Default = false,
    Callback = function(Value)
      getgenv().ESP_Ball = Value
    ESP_Ball()
  end
})



local ToggleNight = Tabs.World:AddToggle("NightMode", {
    Title = "Night & Day",
    Default = false,
    Callback = function(Value)
        if Value then
            nightMode()
        else
            day()
        end
    end
})

Tabs.World:AddButton({
    Title = "Fps Boost",
    Description = "",
    Callback = function()
        local ToDisable = {
            Textures = true,
            VisualEffects = true,
            Parts = true,
            Particles = true,
            Sky = true
        }

        local ToEnable = {
            FullBright = false
        }

        local Stuff = {}

        local function disableTextures(obj)
            if obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Texture = ""
                table.insert(Stuff, obj)
            end
        end

        local function disableParticlesAndEffects(obj)
            if obj:IsA("ParticleEmitter") or obj:IsA("Smoke") or obj:IsA("Explosion") or obj:IsA("Sparkles") or obj:IsA("Fire") then
                obj.Enabled = false
                table.insert(Stuff, obj)
            elseif obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or obj:IsA("DepthOfFieldEffect") or obj:IsA("SunRaysEffect") then
                obj.Enabled = false
                table.insert(Stuff, obj)
            end
        end

        local function disableObjects()
            for _, v in pairs(game:GetDescendants()) do
                if ToDisable.Parts and (v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart")) then
                    v.Material = Enum.Material.SmoothPlastic
                    table.insert(Stuff, v)
                end

                if ToDisable.Particles then
                    disableParticlesAndEffects(v)
                end

                if ToDisable.VisualEffects then
                    disableParticlesAndEffects(v)
                end

                if ToDisable.Textures then
                    disableTextures(v)
                end

                if ToDisable.Sky and v:IsA("Sky") then
                    v.Parent = nil
                    table.insert(Stuff, v)
                end
            end
        end

        local function enableFullBright()
            if ToEnable.FullBright then
                local Lighting = game:GetService("Lighting")
                Lighting.FogColor = Color3.new(1, 1, 1)
                Lighting.FogEnd = math.huge
                Lighting.FogStart = math.huge
                Lighting.Ambient = Color3.new(1, 1, 1)
                Lighting.Brightness = 5
                Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
                Lighting.ColorShift_Top = Color3.new(1, 1, 1)
                Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
                Lighting.Outlines = true
            end
        end

        while wait(1) do
            local success, error = pcall(function()
                Stuff = {} -- Clear previous objects
                disableObjects()
                enableFullBright()
                game:GetService("TestService"):Message("Effects Disabler Script: Successfully disabled " .. #Stuff .. " assets/effects. Settings:")
                for i, v in pairs(ToDisable) do
                    print(tostring(i) .. ": " .. tostring(v))
                end
            end)

            if not success then
                warn("Error in script:", error)
            end
        end
    end
})


Tabs.World:AddButton({
    Title = "Remove Texture",
    Description = "",
    Callback = function()
        local ToDisable = {
    Colors = true,
    Textures = true,
    VisualEffects = true,
    Parts = true,
    Particles = true,
    Sky = true
}

local ToEnable = {
    FullBright = false
}

local LastRunTime = 0
local RunInterval = 5 -- Intervalo de 5 segundos entre as execuções

-- Function to disable colors
local function disableColors(obj)
    if obj:IsA("BasePart") then
        obj.Color = Color3.new(0.5, 0.5, 0.5)
    end
end

-- Function to disable textures
local function disableTextures(obj)
    if obj:IsA("Decal") or obj:IsA("Texture") then
        obj.Texture = ""
    end
end

-- Function to disable particles and visual effects
local function disableParticlesAndEffects(obj)
    if obj:IsA("ParticleEmitter") or obj:IsA("Smoke") or obj:IsA("Explosion") or obj:IsA("Sparkles") or obj:IsA("Fire") then
        obj.Enabled = false
    elseif obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or obj:IsA("DepthOfFieldEffect") or obj:IsA("SunRaysEffect") then
        obj.Enabled = false
    end
end

-- Function to apply changes to specific objects
local function applyChangesToObject(obj)
    if ToDisable.Parts and (obj:IsA("Part") or obj:IsA("Union") or obj:IsA("BasePart")) then
        pcall(function()
            obj.Material = Enum.Material.SmoothPlastic
            if ToDisable.Colors then disableColors(obj) end
        end)
    end

    if ToDisable.Particles or ToDisable.VisualEffects then
        pcall(function()
            disableParticlesAndEffects(obj)
        end)
    end

    if ToDisable.Textures then
        pcall(function()
            disableTextures(obj)
        end)
    end

    if ToDisable.Sky and obj:IsA("Sky") then
        pcall(function()
            obj:Destroy()
        end)
    end
end

-- Function to apply changes to the entire map
local function applyChangesToMap()
    for _, obj in pairs(workspace:GetDescendants()) do
        applyChangesToObject(obj)
    end

    print("Effects Disabler Script: Successfully applied changes.")
end

-- Connect the function applyChangesToMap to the DescendantAdded event
game:GetService("RunService").Stepped:Connect(function()
    local currentTime = tick()
    if not game:IsLoaded() or (currentTime - LastRunTime) < RunInterval then
        return
    end

    applyChangesToMap()
    LastRunTime = currentTime
end)

-- Call the function initially to apply the changes to the current map
applyChangesToMap()
    end
})


Tabs.Shop:AddButton({
    Title = "Buy Sword Box",
    Description = "",
    Callback = function()
        local args = {
            [1] = "PromptPurchaseCrate",
            [2] = workspace.Spawn.Crates.NormalSwordCrate
        }

        game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer(unpack(args))
    end
})

Tabs.Shop:AddButton({
    Title = "Buy Explosion Box",
    Description = "",
    Callback = function()
local args = {
    [1] = "PromptPurchaseCrate",
    [2] = workspace.Spawn.Crates.NormalExplosionCrate
}

game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer(unpack(args))
  end
})


end 