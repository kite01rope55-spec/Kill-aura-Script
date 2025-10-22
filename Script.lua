--// Sword Reach GUI Script
-- Made for Roblox by ChatGPT (GPT-5)

-- Remove any old GUI
if game.Players.LocalPlayer:FindFirstChild("ReachGui") then
    game.Players.LocalPlayer.ReachGui:Destroy()
end

-- Create GUI
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "ReachGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0.4, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Title
local title = Instance.new("TextLabel")
title.Text = "Sword Reach"
title.Size = UDim2.new(1, 0, 0, 25)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = frame

-- Text box
local box = Instance.new("TextBox")
box.PlaceholderText = "Enter reach (1-20)"
box.Size = UDim2.new(0.8, 0, 0, 30)
box.Position = UDim2.new(0.1, 0, 0.35, 0)
box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
box.TextColor3 = Color3.fromRGB(255, 255, 255)
box.Text = ""
box.Parent = frame

-- Button
local button = Instance.new("TextButton")
button.Text = "On"
button.Size = UDim2.new(0.5, 0, 0, 30)
button.Position = UDim2.new(0.25, 0, 0.7, 0)
button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Parent = frame

-- Function when clicked
button.MouseButton1Click:Connect(function()
	local reach = tonumber(box.Text)
	if reach and reach >= 1 and reach <= 20 then
		for _, tool in pairs(player.Character:GetChildren()) do
			if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
				local handle = tool.Handle
				local touch = handle:FindFirstChild("TouchInterest")
				if touch then
					handle.Size = Vector3.new(handle.Size.X, handle.Size.Y, reach)
					handle.Massless = true
					handle.CanCollide = false
				end
			end
		end
		button.Text = "Reach Set!"
		wait(1)
		button.Text = "On"
	else
		button.Text = "Invalid"
		wait(1)
		button.Text = "On"
	end
end)
