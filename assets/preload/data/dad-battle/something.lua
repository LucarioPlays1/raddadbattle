
local xx = 300;
local yy = 400;
local xx2 = 870;
local yy2 = 550;
local ofs = 90;
local followchars = true;
local del = 0;
local del2 = 0;
local elasticInOut = 0
local DanceAmt = 3
local windowDance3 = false


function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.75)
            doTweenAngle('screenTilt', 'camGame', 2, 0.1, 'quadInOut')
        else
            setProperty('defaultCamZoom',0.95)
            doTweenAngle('screenTilt', 'camGame', -2, 0.1, 'quadInOut')
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end
function onUpdatePost(elapsed)
    elasticInOut = elasticInOut + (elapsed * DanceAmt)

    if WindowDance == true then
        setPropertyFromClass('openfl.Lib', 'application.window.y', 1000*math.sin(elasticInOut)/10+windowy)
    end
    if WindowDance2 == true then
    setPropertyFromClass('openfl.Lib', 'application.window.x', 1000*math.cos(elasticInOut)/5+windowx)
    end
    if windowDance3 == true then
        setPropertyFromClass('openfl.Lib', 'application.window.x', 1000*math.cos(elasticInOut)/5+windowx)
        setPropertyFromClass('openfl.Lib', 'application.window.y', 1000*math.sin(elasticInOut)/10+windowy)
    end
    setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
end 
function onStepHit()
if curStep == 384 then
    local windowDance3 = true
end
end