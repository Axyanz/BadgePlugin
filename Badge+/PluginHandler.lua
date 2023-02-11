--[[
██████╗░░█████╗░██████╗░░██████╗░███████╗░░░░░░░
██╔══██╗██╔══██╗██╔══██╗██╔════╝░██╔════╝░░██╗░░
██████╦╝███████║██║░░██║██║░░██╗░█████╗░░██████╗
██╔══██╗██╔══██║██║░░██║██║░░╚██╗██╔══╝░░╚═██╔═╝
██████╦╝██║░░██║██████╔╝╚██████╔╝███████╗░░╚═╝░░
╚═════╝░╚═╝░░╚═╝╚═════╝░░╚═════╝░╚══════╝░░░░░░░
]]

-------------------------------------------------
-- // Plugin Variables
local ModulesFolder = script.Modules
local ResourcesFolder = script.Resources
-------------------------------------------------
-- // Plugin Setup
local toolbar = plugin:CreateToolbar("Badge+")
local ToolbarButton = toolbar:CreateButton ("Home", "Opens Badge+ main menu", "rbxassetid://11415209953")
local InterfaceUi = script.Interface
-------------------------------------------------
InterfaceUi.Parent = game.CoreGui
ToolbarButton.Click:Connect(function()
	InterfaceUi.Enabled = not InterfaceUi.Enabled
end)
-------------------------------------------------
-- // Modules
local BadgeInserter = require(ModulesFolder.BadgesModule.BadgeInserter)
-------------------------------------------------
-- // Interface Variables
local BackgroundFrame = InterfaceUi.Background
local HomeFrame = BackgroundFrame.Home
local BadgesFrame = BackgroundFrame.Badges
local BadgesListFrame = BadgesFrame.BadgesList
local SettingsFrame = BackgroundFrame.Settings
-------------------------------------------------
-- // HomeFrame Variables
local HomeButtonBadges = BadgesFrame.HomeButton
local BadgesButton = HomeFrame.BadgesButton
local SettingsButton = HomeFrame.SettingsButton
local HomeButtonSettings = SettingsFrame.HomeButton
-------------------------------------------------
-- // Functions
function badgesPage()
	BadgesFrame.Visible = true
	HomeFrame.Visible = false
	SettingsFrame.Visible = false
end
function homePage()
	HomeFrame.Visible = true
	BadgesFrame.Visible = false
	SettingsFrame.Visible = false
	
end
function settingsPage()
	SettingsFrame.Visible = true
	HomeFrame.Visible = false
	BadgesFrame.Visible = false
end
-------------------------------------------------
-- // HomeInterface
HomeButtonBadges.MouseButton1Click:Connect(function()
	homePage()
end)
HomeButtonSettings.MouseButton1Click:Connect(function()
	homePage()
end)
BadgesButton.MouseButton1Click:Connect(function()
	badgesPage()
end)
SettingsButton.MouseButton1Click:Connect(function()
	settingsPage()
end)
-------------------------------------------------
-- // Badge Buttons
function OnChild(child)
	if child:IsA("TextButton") then
		child.MouseButton1Click:Connect(BadgeInserter[child.Name])
	end
end
for _,child in pairs(BadgesListFrame:GetChildren()) do
	task.spawn(OnChild,child)
end

BadgesListFrame.ChildAdded:Connect(OnChild)
-------------------------------------------------



