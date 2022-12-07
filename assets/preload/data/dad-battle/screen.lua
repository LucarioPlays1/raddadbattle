local keep = false

function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.resizable", false)

    addHaxeLibrary("RatioScaleMode", "flixel.system.scaleModes")
    runHaxeCode("FlxG.scaleMode = new RatioScaleMode(true);")

    local w, h = 960, 720

    setPropertyFromClass("flixel.FlxG", "width", w)
    setPropertyFromClass("flixel.FlxG", "height", h)

    setPropertyFromClass("flixel.FlxG", "scaleMode.scale.x", 1)
    setPropertyFromClass("flixel.FlxG", "scaleMode.scale.y", 1)
    setPropertyFromClass("flixel.FlxG", "game.x", 0)
    setPropertyFromClass("flixel.FlxG", "game.y", 0)

    local ow, oh, z = getPropertyFromClass("flixel.FlxG", "camera.width"),
                      getPropertyFromClass("flixel.FlxG", "camera.height"),
                      getPropertyFromClass("flixel.FlxG", "camera.zoom")
    local nw, nh = math.ceil(w / z), math.ceil(h / z)
    setPropertyFromClass("flixel.FlxG", "camera.width", nw)
    setPropertyFromClass("flixel.FlxG", "camera.height", nh)
    setPropertyFromClass("flixel.FlxG", "camera.flashSprite.x",
                         getPropertyFromClass("flixel.FlxG",
                                              "camera.flashSprite.x") +
                             (nw - ow) / 2)
    setPropertyFromClass("flixel.FlxG", "camera.flashSprite.y",
                         getPropertyFromClass("flixel.FlxG",
                                              "camera.flashSprite.y") +
                             (nh - oh) / 2)

    runHaxeCode("FlxG.resizeWindow(" .. w .. "," .. h .. ");")
end

function onCreatePost()
    if not getPropertyFromClass("ClientPrefs", "cursing") then
        setPropertyFromClass("ClientPrefs", "cursing", true)
    else
        setPropertyFromClass("ClientPrefs", "cursing", false)
        keep = true
        restartSong(true)
    end
    for i = 0, 3 do
        setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup(
                                 'strumLineNotes', i, 'x') + -70)
    end
    local add = 69
    if getPropertyFromClass('PlayState', 'isPixelStage') then add = add - 7 end
    for i = 8, 11 do
        setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup(
                                 'strumLineNotes', i, 'x') - add)
    end
end

function onDestroy()
    if not keep then
        setPropertyFromClass("openfl.Lib", "application.window.resizable", true)
        runHaxeCode([[
            FlxG.scaleMode = new RatioScaleMode(false);
            FlxG.resizeGame(FlxG.initialWidth, FlxG.initialHeight);
            FlxG.resizeWindow(FlxG.initialWidth, FlxG.initialHeight);
            if (FlxG.camera != null) {
                FlxG.camera.width = FlxG.width;
                FlxG.camera.height = FlxG.height;
            }
        ]])
    end
end