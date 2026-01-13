--// Library Hub - Full Fixed Version

local Fluent = loadstring(game:HttpGet(
    "https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
))()

--// Window
local Window = Fluent:CreateWindow({
    Title = "Library Hub",
    SubTitle = "by Library",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

--// Tabs
local Tabs = {
    All  = Window:AddTab({ Title = "All Scripts", Icon = "layout-grid" }),
    ADM  = Window:AddTab({ Title = "Adopt Me", Icon = "heart" }),
    MM2  = Window:AddTab({ Title = "Murder Mystery 2", Icon = "swords" }),
    SAB  = Window:AddTab({ Title = "Steal A Brainrot", Icon = "skull" }),
    Hubs = Window:AddTab({ Title = "Hubs", Icon = "package" }),
    Info = Window:AddTab({ Title = "Info", Icon = "info" })
}

--// Script Database
local scriptData = {
    ["Kuni Hub MM2"] = "https://raw.githubusercontent.com/KuniX99/MurderMystery2/refs/heads/main/main.lua",
    ["Kuni Hub ADM"] = "https://raw.githubusercontent.com/KuniX99/AdoptMe/refs/heads/main/main.lua",
    ["Adopt Me Force Trade"] = "https://raw.githubusercontent.com/KuniX99/AdoptMe/refs/heads/main/forcetrade",
    ["Kuni Hub SAB"] = "https://raw.githubusercontent.com/KuniX99/StealABrainrot/refs/heads/main/main.lua",

    ["Ronix Hub"] = "https://api.luarmor.net/files/v3/loaders/b44706178039e9b88c4d768d4d8b012f.lua",
    ["Thunder Z Hub"] = "https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua",
    ["Limit Hub"] = "https://raw.githubusercontent.com/FakeModz/LimitHub/refs/heads/main/LimitHub_Luarmor_E.lua",
    ["Speed Hub"] = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua",
    ["Quantum Hub"] = "https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua"
}

local lastUsed = "None"

--// Execute Function
local function Execute(name, url)
    lastUsed = name

    Fluent:Notify({
        Title = "Library Hub",
        Content = "Executing " .. name .. "...",
        Duration = 3
    })

    task.spawn(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)

        if success then
            Fluent:Notify({
                Title = "Success",
                Content = name .. " loaded successfully!",
                Duration = 4
            })
        else
            Fluent:Notify({
                Title = "Error",
                Content = "Failed to load " .. name,
                Duration = 5
            })
            warn("Script Error:", err)
        end
    end)
end

--// ALL TAB
Tabs.All:AddParagraph({
    Title = "All Available Scripts",
    Content = "Click any button below to execute the script"
})

for name, url in pairs(scriptData) do
    Tabs.All:AddButton({
        Title = name,
        Description = "Execute " .. name,
        Callback = function()
            Execute(name, url)
        end
    })
end

--// ADOPT ME TAB (FIXED FILTER)
Tabs.ADM:AddParagraph({
    Title = "Adopt Me Scripts",
    Content = "Scripts specifically for Adopt Me"
})

for name, url in pairs(scriptData) do
    if name:find("ADM") or name:lower():find("adopt") then
        Tabs.ADM:AddButton({
            Title = name,
            Description = "Execute Adopt Me script",
            Callback = function()
                Execute(name, url)
            end
        })
    end
end

--// MM2 TAB
Tabs.MM2:AddParagraph({
    Title = "Murder Mystery 2",
    Content = "Scripts for MM2"
})

for name, url in pairs(scriptData) do
    if name:find("MM2") then
        Tabs.MM2:AddButton({
            Title = name,
            Description = "Execute MM2 script",
            Callback = function()
                Execute(name, url)
            end
        })
    end
end

--// SAB TAB
Tabs.SAB:AddParagraph({
    Title = "Steal A Brainrot",
    Content = "Scripts for SAB"
})

for name, url in pairs(scriptData) do
    if name:find("SAB") then
        Tabs.SAB:AddButton({
            Title = name,
            Description = "Execute SAB script",
            Callback = function()
                Execute(name, url)
            end
        })
    end
end

--// HUBS TAB
Tabs.Hubs:AddParagraph({
    Title = "Universal Hubs",
    Content = "Multi-game script hubs"
})

local hubList = {
    "Ronix Hub",
    "Thunder Z Hub",
    "Limit Hub",
    "Speed Hub",
    "Quantum Hub"
}

for _, name in ipairs(hubList) do
    if scriptData[name] then
        Tabs.Hubs:AddButton({
            Title = name,
            Description = "Execute hub",
            Callback = function()
                Execute(name, scriptData[name])
            end
        })
    end
end

--// INFO TAB
Tabs.Info:AddParagraph({
    Title = "Library Hub",
    Content = "Professional script hub for mobile and PC.\nCreated by Library"
})

Tabs.Info:AddButton({
    Title = "Show Last Used Script",
    Description = "View last executed script",
    Callback = function()
        Fluent:Notify({
            Title = "Last Used",
            Content = lastUsed,
            Duration = 5
        })
    end
})

Tabs.Info:AddParagraph({
    Title = "Controls",
    Content = "Press Left Control to minimize/maximize the GUI"
})

Tabs.Info:AddButton({
    Title = "Close GUI",
    Description = "Close the hub completely",
    Callback = function()
        Fluent:Notify({
            Title = "Closing",
            Content = "Goodbye!",
            Duration = 2
        })
        task.wait(2)
        pcall(function()
            game:GetService("CoreGui"):FindFirstChild("ScreenGui"):Destroy()
        end)
    end
})

--// Loaded Notify
Fluent:Notify({
    Title = "Library Hub",
    Content = "Successfully loaded!",
    Duration = 5
})            Title = name,
            Description = "Execute script",
            Callback = function()
                Execute(name, url)
            end
        })
    end
end

Tabs.SAB:AddParagraph({
    Title = "Steal A Brainrot",
    Content = "Scripts for SAB"
})

for name, url in pairs(scriptData) do
    if name:find("SAB") then
        Tabs.SAB:AddButton({
            Title = name,
            Description = "Execute script",
            Callback = function()
                Execute(name, url)
            end
        })
    end
end

Tabs.Hubs:AddParagraph({
    Title = "Universal Hubs",
    Content = "Multi-game script hubs"
})

local hubList = {
    "Ronix Hub",
    "Thunder Z Hub",
    "Limit Hub",
    "Speed Hub",
    "Quantum Hub"
}

for _, name in ipairs(hubList) do
    if scriptData[name] then
        Tabs.Hubs:AddButton({
            Title = name,
            Description = "Execute hub",
            Callback = function()
                Execute(name, scriptData[name])
            end
        })
    end
end

Tabs.Info:AddParagraph({
    Title = "Library Hub",
    Content = "Professional script hub for mobile and PC.\nCreated by Library"
})

Tabs.Info:AddButton({
    Title = "Show Last Used Script",
    Description = "View last executed script",
    Callback = function()
        Fluent:Notify({
            Title = "Last Used",
            Content = lastUsed,
            Duration = 5
        })
    end
})

Tabs.Info:AddParagraph({
    Title = "Controls",
    Content = "Press Left Control to minimize/maximize the GUI"
})

Tabs.Info:AddButton({
    Title = "Close GUI",
    Description = "Close the hub completely",
    Callback = function()
        Fluent:Notify({
            Title = "Closing",
            Content = "Goodbye!",
            Duration = 2
        })
        task.wait(2)
        game:GetService("CoreGui"):FindFirstChild("ScreenGui"):Destroy()
    end
})

Fluent:Notify({
    Title = "Library Hub",
    Content = "Successfully loaded!",
    Duration = 5
})
