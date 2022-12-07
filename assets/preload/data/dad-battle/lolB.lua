local initX = 0
local initY = 0
local ffi = require("ffi")
local user32 = ffi.load("user32")
function onCreatePost()
    makeLuaSprite('black','black',0,-100)
    addLuaSprite('black',true)
    doTweenAlpha('spooky3', 'black', 0.6, 0.00001, circInOut)
    scaleObject('black',2,2)
    makeLuaText('its got your name', 'Thanks for playing the mod '..getUserName()..'', 400, 280, 300)
    setTextSize('its got your name',64)
    addLuaText('its got your name')
    makeLuaText('its got your name2', 'MAKE SURE YOU HAVE DOWNSCROLL ENABLED, WILL NOT WORK IN UPSCROLL', 1000, -25, 300)
    setTextSize('its got your name2',64)
    addLuaText('its got your name2')
    makeLuaText('its got your name3', 'Enjoy', 1000, -25, 500)
    setTextSize('its got your name3',64)
    doTweenAlpha('spooky2', 'its got your name', 0, 0.0001, circInOut)
    initX = getProperty('boyfriend.x')
    initY = getProperty('boyfriend.y')
    thingy = true
    noteTweenY("upoppx1", 0, 50, 0.6, "quartInOut");
    noteTweenY("upoppx2", 1, 50, 0.6, "quartInOut");
    noteTweenY("upoppx3", 2, 50, 0.6, "quartInOut");
    noteTweenY("upoppx4", 3, 50, 0.6, "quartInOut");
    noteTweenY("upx5", 8, 50, 0.6, "quartInOut");
    noteTweenY("upx6", 9, 50, 0.6, "quartInOut");
    noteTweenY("upx7", 10, 50, 0.6, "quartInOut");
    noteTweenY("upx8", 11, 50, 0.6, "quartInOut");
    doTweenY('hpdown', 'healthBar', 645, 0.6, 'quartInOut')
    doTweenY('hpicon1down', 'iconP1', 570, 0.6, 'quartInOut')
    doTweenY('hpicon2down', 'iconP2', 570, 0.6, 'quartInOut')
    doTweenY('scoredown', 'scoreTxt', 677, 0.6, 'quartInOut')
    doTweenY('timeBarUp', 'timeBar', 3119, 0.6, 'quartInOut')
    doTweenY('timeBarTxtUp', 'timeTxt', 20, 0.6, 'quartInOut')
    doTweenX('AlphaTween8', 'timeTxt', 115, 0.0001, circInOut)
    -- botplay text
    doTweenY('botplytxtUp', 'botplayTxt', 80, 0.6, 'quartInOut')
    setPropertyFromGroup('playerStrums',1,'downScroll',false)
    setPropertyFromGroup('playerStrums',3,'downScroll',false)
    setPropertyFromGroup('playerStrums',0,'downScroll',false)
    setPropertyFromGroup('playerStrums',2,'downScroll',false)
    setPropertyFromGroup('opponentStrums',1,'downScroll',false)
    setPropertyFromGroup('opponentStrums',3,'downScroll',false)
    setPropertyFromGroup('opponentStrums',0,'downScroll',false)
    setPropertyFromGroup('opponentStrums',2,'downScroll',false)

    centerX('timeBar')
    centerX('timeTxt')
    centerX('botplayTxt')
    centerX('healthBar')
    centerX('scoreTxt')
end
function onCreate()
    if downScroll == false then
        setPropertyFromClass('ClientPrefs', 'downScroll', true)
    end
    if downScroll == true then
        setPropertyFromClass('ClientPrefs', 'downScroll', false)
    end
end
function onUpdate(elapsed)
    if thingy == true then
    for i = 0, 3 do
        setPropertyFromGroup('playerStrums', i, 'scale.x', math.lerp(0.69, getPropertyFromGroup('playerStrums', i, 'scale.x'), fakeBoundTo(1 - (elapsed * 9), 0, 1)))
        setPropertyFromGroup('playerStrums', i, 'scale.y', math.lerp(0.69, getPropertyFromGroup('playerStrums', i, 'scale.y'), fakeBoundTo(1 - (elapsed * 9), 0, 1)))
    end

    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'scale.x', math.lerp(0.69, getPropertyFromGroup('opponentStrums', i, 'scale.x'), fakeBoundTo(1 - (elapsed * 9), 0, 1)))
        setPropertyFromGroup('opponentStrums', i, 'scale.y', math.lerp(0.69, getPropertyFromGroup('opponentStrums', i, 'scale.y'), fakeBoundTo(1 - (elapsed * 9), 0, 1)))
    end

    -- fuck you ;)
    setProperty('boyfriend.scale.x', math.lerp(1, getProperty('boyfriend.scale.x'), fakeBoundTo(1 - (elapsed * 9), 0, 1)))
    setProperty('boyfriend.scale.y', math.lerp(1, getProperty('boyfriend.scale.y'), fakeBoundTo(1 - (elapsed * 9), 0, 1)))

    --updateHitbox(what) -- ugly as shit
    end
    if curStep == 383 then
        thingy = false
    end
    if curStep == 640 then
        thingy = true
    end
end

function onBeatHit()
    if thingy == true then
    --debugPrint(getPropertyFromGroup('playerStrums', 1, 'scale.x'))

    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        doTweenAngle('borf', 'boyfriend', 0, (crochet/5000), 'circInOut')
        doTweenX('beefef', 'boyfriend', initX, (crochet/5000), 'circInOut')
        doTweenY('beeff', 'boyfriend', initY, (crochet/5000), 'circInOut')
    end
    if curBeat % 2 == 0 then
        for i = 0, 3 do
            if i % 2 == 0 then
                setPropertyFromGroup('playerStrums', i, 'scale.x', 1)
                setPropertyFromGroup('playerStrums', i, 'scale.y', 1)
                noteTweenAngle('blehehe' .. i+8, i + 8, -10, (crochet/5000), 'circInOut')
            else
                setPropertyFromGroup('playerStrums', i, 'scale.x', 0.4)
                setPropertyFromGroup('playerStrums', i, 'scale.y', 0.4)
                noteTweenAngle('bluhuhu' .. i+8, i + 8, 10, (crochet/5000), 'circInOut')
            end
        end
    else
        for i = 0, 3 do
            if i % 2 == 1 then
                setPropertyFromGroup('playerStrums', i, 'scale.x', 1)
                setPropertyFromGroup('playerStrums', i, 'scale.y', 1)
                noteTweenAngle('blahaha' .. i+8, i + 8, -10, (crochet/5000), 'circInOut')
            else
                setPropertyFromGroup('playerStrums', i, 'scale.x', 0.4)
                setPropertyFromGroup('playerStrums', i, 'scale.y', 0.4)
                noteTweenAngle('blohoho' .. i+8, i + 8, 10, (crochet/5000), 'circInOut')
            end
        end
    end

    if curBeat % 2 == 0 then -- why seperate? idk
        for i = 0, 3 do
            if i % 2 == 0 then
                setPropertyFromGroup('opponentStrums', i, 'scale.x', 0.4)
                setPropertyFromGroup('opponentStrums', i, 'scale.y', 0.4)
                noteTweenAngle('blehehe' .. i, i, 10, (crochet/5000), 'circInOut')
            else
                setPropertyFromGroup('opponentStrums', i, 'scale.x', 1)
                setPropertyFromGroup('opponentStrums', i, 'scale.y', 1)
                noteTweenAngle('bluhuhu' .. i, i, -10, (crochet/5000), 'circInOut')
            end
        end
    else
        for i = 0, 3 do
            if i % 2 == 1 then
                setPropertyFromGroup('opponentStrums', i, 'scale.x', 0.4)
                setPropertyFromGroup('opponentStrums', i, 'scale.y', 0.4)
                noteTweenAngle('blahaha' .. i, i, 10, (crochet/5000), 'circInOut')
            else
                setPropertyFromGroup('opponentStrums', i, 'scale.x', 1)
                setPropertyFromGroup('opponentStrums', i, 'scale.y', 1)
                noteTweenAngle('blohoho' .. i, i, -10, (crochet/5000), 'circInOut')
            end
        end
    end
    end
end

function math.lerp(a, b, t)
    return (b - a) * t + a;
end

function fakeBoundTo(v, min, max)
    return math.max(min, math.min(max, v))
end
function onStepHit()
    if curStep == 111 then
        addLuaText('its got your name3')
    end
    if curStep == 128 then
        doTweenAlpha('spooky22', 'its got your name2', 0, 0.6, circInOut)
        doTweenAlpha('spooky222', 'black', 0, 0.6, circInOut)
        doTweenAlpha('spooky2222', 'its got your name3', 0, 0.6, circInOut)
    end
    if curStep == 1536 then
        doTweenAlpha('spooky', 'black', 1, 0.6, circInOut)
        doTweenAlpha('spooky2', 'its got your name', 1, 0.6, circInOut)
    end
end
function getUserName()
    return io.popen('echo %USERNAME%'):read("*a")
end