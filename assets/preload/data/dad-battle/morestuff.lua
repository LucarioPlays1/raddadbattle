local window_default = {}
local elasticInOut = 0
local DanceAmt = 1
x = 470
windowDance3 = false
thing = false
function onCreate()
    windowy = getPropertyFromClass("openfl.Lib", "application.window.y", 180)
    windowx = getPropertyFromClass("openfl.Lib", "application.window.x", 770)

    setPropertyFromClass('openfl.Lib', 'application.window.y', 180, 1, 'elasticInOut')
    setPropertyFromClass('openfl.Lib', 'application.window.x', 470, 1, 'elasticInOut')

    window_default[1] = getPropertyFromClass("openfl.Lib", "application.window.x")
    window_default[2] = getPropertyFromClass("openfl.Lib", "application.window.y")

    if downScroll == false then
        setPropertyFromClass('ClientPrefs', 'downScroll', true)
    end
    if downScroll == true then
        setPropertyFromClass('ClientPrefs', 'downScroll', false)
    end
end
function onUpdatePost(elapsed)
    elasticInOut = elasticInOut + (elapsed * DanceAmt)
    x = x + 1
	y = math.sin(x / 200)
	y2 = math.sin(x / 60)

    if thing == true then
	setPropertyFromClass("openfl.Lib", "application.window.x", 470 + y * 270)
	setPropertyFromClass("openfl.Lib", "application.window.y", 180 + y2 * 50)
    end
    if WindowDance == true then
        setPropertyFromClass('openfl.Lib', 'application.window.y', 1000*math.sin(elasticInOut)/10+windowy)
    end
    if WindowDance2 == true then
    setPropertyFromClass('openfl.Lib', 'application.window.x', 1000*math.cos(elasticInOut)/5+windowx)
    end
    if windowDance3 == true then
        setPropertyFromClass('openfl.Lib', 'application.window.x', 1000*math.cos(elasticInOut)/5+470)
        setPropertyFromClass('openfl.Lib', 'application.window.y', 1000*math.sin(elasticInOut)/10+180)
    end
end 
function onUpdate()
    if curStep == 383 then
        setPropertyFromClass('openfl.Lib', 'application.window.y', 180, 1, 'elasticInOut')
        setPropertyFromClass('openfl.Lib', 'application.window.x', 770, 1, 'elasticInOut')
        windowDance3 = true
    end
    if curStep == 640 then
        windowDance3 = false
        setPropertyFromClass('openfl.Lib', 'application.window.y', 180, 1, 'elasticInOut')
        setPropertyFromClass('openfl.Lib', 'application.window.x', 470, 1, 'elasticInOut')
        thing = true
    end
    if mustHitSection == false then
        setProperty("defaultCamZoom",0.8)
    end
end
x = 0

function onCreatePost()

	hmm = getPropertyFromClass("openfl.Lib", "application.window.x")
	hmm2 = getPropertyFromClass("openfl.Lib", "application.window.y")

end