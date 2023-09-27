-- When using 2 monitors there is no way to switch focus
-- from one to another using the keyboard on macOs.
-- This hammerspoon config works around this limitation
-- by moving the cursor to some "calculated" positions an
-- then left clicking.
hs.hotkey.bind({"alt"}, "1", function()
    clickLeftSpace()
end)
hs.hotkey.bind({"alt"}, "0", function()
    clickRightSpace()
end)


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
