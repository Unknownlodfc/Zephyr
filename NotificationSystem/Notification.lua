local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NotificationGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local notifications = {}

local function createNotification(title, message, duration, position, r, g, b)
    local notificationFrame = Instance.new("Frame")
    notificationFrame.Size = UDim2.new(0, 300, 0, 100)
    notificationFrame.Position = position
    notificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    notificationFrame.BorderSizePixel = 0
    notificationFrame.Name = "NotificationFrame"
    
    local uICorner = Instance.new("UICorner")
    uICorner.CornerRadius = UDim.new(0, 10)
    uICorner.Parent = notificationFrame
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(r, g, b)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 20
    titleLabel.Text = title
    titleLabel.Parent = notificationFrame
    
    local progressBarBackground = Instance.new("Frame")
    progressBarBackground.Size = UDim2.new(1, 0, 0, 5)
    progressBarBackground.Position = UDim2.new(0, 0, 0, 35)
    progressBarBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    progressBarBackground.BorderSizePixel = 0
    progressBarBackground.Parent = notificationFrame
    
    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(0, 0, 1, 0)
    progressBar.Position = UDim2.new(0, 0, 0, 0)
    progressBar.BackgroundColor3 = Color3.fromRGB(r, g, b)
    progressBar.BorderSizePixel = 0
    progressBar.Parent = progressBarBackground
    
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Size = UDim2.new(1, 0, 0, 65)
    infoLabel.Position = UDim2.new(0, 0, 0, 40)
    infoLabel.BackgroundTransparency = 1
    infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    infoLabel.Font = Enum.Font.Gotham
    infoLabel.TextSize = 16
    infoLabel.Text = message
    infoLabel.Parent = notificationFrame
    
    notificationFrame.Parent = ScreenGui
    
    local startTime = tick()
    local endTime = startTime + duration
    local connection
    
    connection = game:GetService("RunService").RenderStepped:Connect(function()
        local elapsed = tick() - startTime
        local progress = elapsed / duration
        
        if progress >= 1 then
            progressBar.Size = UDim2.new(1, 0, 1, 0)
            wait(0.5)
            notificationFrame:TweenPosition(notificationFrame.Position + UDim2.new(0, 0, 1, 0), "Out", "Quad", 0.5, true, function()
                notificationFrame:Destroy()
                connection:Disconnect()
            end)
        else
            progressBar.Size = UDim2.new(progress, 0, 1, 0)
        end
    end)
end

local RightTop = UDim2.new(1, -320, 0, 20) -- Right Top of Screen 
local LeftTop = UDim2.new(0, 20, 0, 20) -- Left Top of Screen 
local RightBottom = UDim2.new(1, -320, 1, -120) -- Right Bottom of Screen 
local LeftBottom = UDim2.new(0, 20, 1, -120) -- Left Bottom of Screen
