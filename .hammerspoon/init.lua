-- When using 2 monitors there is no way to switch focus
-- from one to another using the keyboard on macOs.
-- This hammerspoon config works around this limitation
-- by moving the cursor to some "calculated" positions an
-- then left clicking.
hs.hotkey.bind({"alt"}, "`", function() clickLeftSpace() end)
hs.hotkey.bind({"alt"}, "1", function() clickLeftSpace() end)
hs.hotkey.bind({"alt"}, "2", function() clickLeftSpace() end)
hs.hotkey.bind({"alt"}, "3", function() clickLeftSpace() end)
hs.hotkey.bind({"alt"}, "4", function() clickLeftSpace() end)
hs.hotkey.bind({"alt"}, "5", function() clickLeftSpace() end)
hs.hotkey.bind({"alt"}, "6", function() clickLeftSpace() end)
hs.hotkey.bind({"alt"}, "7", function() clickLeftSpace() end)
hs.hotkey.bind({"alt"}, "8", function() clickLeftSpace() end)
hs.hotkey.bind({"alt"}, "9", function() clickLeftSpace() end)
hs.hotkey.bind({"alt"}, "0", function() clickRightSpace() end)
hs.hotkey.bind({"alt"}, "f11", function() incVolume(-3) end)
hs.hotkey.bind({"alt"}, "f12", function() incVolume(3) end)

-- I have no idea how these space IDs are chosen, or if they change
-- at restart. For some reason space 2 has ID 3 and so on...
hs.hotkey.bind({"alt", "shift"}, "1", function() moveToSpace(1) end)
hs.hotkey.bind({"alt", "shift"}, "2", function() moveToSpace(3) end)
hs.hotkey.bind({"alt", "shift"}, "3", function() moveToSpace(4) end)
hs.hotkey.bind({"alt", "shift"}, "4", function() moveToSpace(5) end)
hs.hotkey.bind({"alt", "shift"}, "5", function() moveToSpace(6) end)
hs.hotkey.bind({"alt", "shift"}, "6", function() moveToSpace(7) end)
hs.hotkey.bind({"alt", "shift"}, "7", function() moveToSpace(8) end)
hs.hotkey.bind({"alt", "shift"}, "8", function() moveToSpace(9) end)
hs.hotkey.bind({"alt", "shift"}, "9", function() moveToSpace(10) end)
hs.hotkey.bind({"alt", "shift"}, "0", function() moveToSpace(1766) end)

function clickLeftSpace()
    clickAndMove({x=754, y=5}, {x=754, y=492})
end
function clickRightSpace()
    clickAndMove({x=2440, y=10}, {x=2440, y=492})
end
function clickAndMove(clickPos, endPos)
    hs.mouse.absolutePosition(clickPos)
    hs.eventtap.leftClick(clickPos)
    hs.mouse.absolutePosition(endPos)
end
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

function incVolume(by)
    local newVolume = hs.audiodevice.current().volume + by
    if newVolume < 0 then hs.audiodevice.defaultOutputDevice():setMuted(true) end
    if newVolume > 100 then newVolume = 100 end
    if by > 0 then hs.audiodevice.defaultOutputDevice():setMuted(false) end
    hs.audiodevice.defaultOutputDevice():setVolume(newVolume)
end

function moveToSpace(space)
    local win = hs.window.focusedWindow()
    hs.spaces.moveWindowToSpace(win, space)
end
