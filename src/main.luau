--!nolint
--!nocheck

repeat task.wait() until game:IsLoaded()
-- if getgenv().SaintLoaded then return end
-- getgenv().SaintLoaded = true

-- # Imports
local Library = require("@packages/Obsidian");
local SaveManager = require("@packages/SaveManager");
local ThemeManager = require("@packages/ThemeManager");
local ImageManager = Library.ImageManager;

local Players = cloneref(game:GetService("Players"))
local RunService = cloneref(game:GetService("RunService"))
local UserInputService = cloneref(game:GetService("UserInputService"))

local eName, eVersion = identifyexecutor();
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

local SaintCC = {
    Build = "0.0.0",
    Version = "0.0.0",

    Aimlock = {
        Enabled = false,
        LockOn = "Head", -- "Head", "Torso"
        Prediction = 0, -- 1 - 100
        Smoothness = 0, -- 1 - 100
        FOV = {
            Enabled = false,
            Shape = "Circle", -- "Circle", "Square", "Star", "Diamond", "Hexagon"
            Radius = 100, -- 100 - ?
            Color = Color3.fromRGB(255, 255, 255)
        },
    },

    Ragelock = {
        Enabled = false,
        LockOn = "Head", -- "Head", "Torso"
        Target = nil,
        AutoSwitch = false, -- Switch to another target if current target dies
        FOV = {
            Enabled = false,
            Shape = "Circle", -- "Circle", "Square", "Star", "Diamond", "Hexagon"
            Radius = 100, -- 100 - ?
            Color = Color3.fromRGB(255, 255, 255)
        },
    },

    Visual = {
        Enabled = false,
        Corners = {
            Enabled = false,
            Color = Color3.fromRGB(255, 255, 255)
        },
        Chams = {
            Enabled = false,
            Color = Color3.fromRGB(255, 255, 255)
        },
        Weapon = {
            Enabled = false,
            Color = Color3.fromRGB(255, 255, 255)
        },
        HealthBar = {
            Enabled = false,
            Text = false, -- 100HP etc..
            Color = Color3.fromRGB(255, 255, 255)
        },
        Username = {
            Display = false,
            Enabled = false,
            Color = Color3.fromRGB(255, 255, 255)
        },
        Distance = {
            Enabled = false,
            Color = Color3.fromRGB(255, 255, 255)
        },
        Tracers = {
            Enabled = false,
            Orgin = "Bottom", -- "Top", "Bottom", "Mouse"
            Color = Color3.fromRGB(255, 255, 255)
        },
    }
}

Library:Notify({
    Title = "Software Detected.",
    Description = `Executor - {eName} {eVersion}`,
    Icon = "info",
    Time = 3
})

Library:Notify({
    Title = "Game Detected",
    Description = "DaHood - DaHood Entertainment",
    Icon = "info",
    Time = 3
})

local Window = Library:CreateWindow({
    Title = "Saint",
    Footer = `Build: ${SaintCC.Build} | Version: ${SaintCC.Version}`,
    GlobalSearch = true,
    Compact = true
})

local Main = Window:AddTab("Main", "component")
local Visual = Window:AddTab("Visuals", "eye")
local Character = Window:AddTab("Character", "user")
local Misc = Window:AddTab("Misc", "flask-conical")
local Settings = Window:AddTab("Settings", "cog")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.M then
        Library:Unload()
    end
end)

Main:AddLeftGroupbox("Aimlock", "crosshair-2")