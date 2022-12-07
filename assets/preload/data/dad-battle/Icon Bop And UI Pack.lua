-- Script by RandoScript
-- sonic.exe icon bounce by ltrx#5670
-- nps script by NF | beihu#6113
-- (for people who hate dnb, its not bad its the fucking fantracks by 5 year olds so stop saying dnb is bad when its the fantracks bc the fantracks are not real dnb songs)
KadeHealthBar = false -- idk why i added this
ScoreText = '' -- Rando, Psych or Kade Score Text
IconBop = '' -- G.A, Vs Ron, Banbodi, Swing, OS, In-n-Out, BP, DnB, Sonic.exe, Cassette Girl, Squish, Static or leave it blank for psych
SeparateIconBops = false -- if false just use the IconBop var
BFBop = '' -- if SeparateIconBops is true
FatherBop = '' -- if SeparateIconBops is true
EyesoreTB = false
EyesoreIcons = false
RainbowNotes = false
RandomColorNotes = false
Nps = false -- notes per second
MaxNps = false -- there you go rambi stop complaining about me not adding it

local npsmax = 0
local nps = 0
local reduce = true
local rank = ''
widthP1 = 5
widthP2 = 5
t = 0
delta = 0
function lerp(a, b, x) return a + (b - a) * x end

function onCreatePost()
    setProperty('timeTxt.visible', false)

    --add this song name and timer text
    makeLuaText('timeAugh', 'rip', 0, 20)
    setObjectCamera('timeAugh', 'hud', true)
    setProperty('timeAugh.alpha', 0)
    setTextSize('timeAugh', 20)
    addLuaText('timeAugh', true)
    setProperty('timeAugh.y', getProperty('timeBar.y')-8)

	initLuaShader("rainbow")
	addHaxeLibrary("ShaderFilter", "openfl.filters")

	if EyesoreIcons == true then
        setSpriteShader("iconP1", "rainbow")
		setSpriteShader("iconP2", "rainbow")
        setSpriteShader("healthBar", "rainbow")
		setSpriteShader("healthBarBG", "rainbow")
	end

	if EyesoreTB == true then
        setSpriteShader("timeBar", "rainbow")
		setTimeBarColors('FF0000')
	end
end

function onBeatHit()
	if SeparateIconBops == false then
		if IconBop == 'OS' then
			if curBeat % 2 == 0 then
				setProperty('iconP1.angle', 5)
				setProperty('iconP2.angle', 5)
			else
				setProperty('iconP1.angle', -5)
				setProperty('iconP2.angle', -5)
			end
		end
		if IconBop == 'G.A' then
			local angleshit = 15;
			local anglevar = 13;
			if curBeat % 2 == 0 then
				angleshit = anglevar;
			else
				angleshit = -anglevar;
			end
			setGraphicSize('iconP1', angleshit*-10)
			setGraphicSize('iconP2', angleshit*10)
			setProperty('iconP1.angle',angleshit*-1.2)
			setProperty('iconP2.angle',angleshit*1.2)
			doTweenAngle('turn', 'iconP1', 0, stepCrochet*0.004, 'cubeOut')
			doTweenX('tuin', 'iconP1', -angleshit*8, crochet*0.001, 'linear')
			doTweenAngle('tt', 'iconP2', 0, stepCrochet*0.004, 'cubeOut')
			doTweenX('ttrn', 'iconP2', -angleshit*8, crochet*0.001, 'linear')
		end
		if IconBop == 'Banbodi' then
			local angleshit = 15;
			local anglevar = 12;
			if curBeat % 2 == 0 then
				angleshit = anglevar;
			else
				angleshit = -anglevar;
			end
			setGraphicSize('iconP1', angleshit*-10)
			setGraphicSize('iconP2', angleshit*10)
			doTweenX('ban', 'iconP1', -angleshit*8, crochet*0.001, 'cubeOut')
			doTweenX('ban2', 'iconP2', -angleshit*8, crochet*0.001, 'cubeOut')
		end
		if IconBop == 'Static' then
			scaleObject('iconP1', 1, 1)
			scaleObject('iconP2', 1, 1)
		end
		if IconBop == 'DnB' then
			bounceStr = (getProperty('healthBar.percent') * 0.01) - 0.5;
			t = 0;
			widthP1 = 0.35 * (1 + bounceStr);
			widthP2 = 0.35 * (1 - bounceStr);
			updateIcons();
		end
		if IconBop == 'Vs Ron' then
			if curBeat % 3 == 0 then
				CoolWay = 0.001;
				t = 0;
				widthP1 = 0.10 * (1 + CoolWay);
				widthP2 = 0.10 * (1 - CoolWay);
				updateIcons();
			end
			scaleObject('iconP1', 1, 1)
			scaleObject('iconP2', 1, 1)
		end
		if IconBop == 'Cassette Girl' then
			if curBeat % 2 == 0 then
				setProperty('iconP1.angle', 10)
				setProperty('iconP2.angle', -10)
			else
				setProperty('iconP1.angle', -10)
				setProperty('iconP2.angle', 10)
			end
		end
		if IconBop == 'Swing' then
			scaleObject('iconP1', 1, 1)
			scaleObject('iconP2', 1, 1)
		end
		if IconBop == 'In-n-Out' then
			local angleshit = 15;
			local anglevar = 13;
			if curBeat % 2 == 0 then
				angleshit = anglevar;
			else
				angleshit = -anglevar;
			end
			setGraphicSize('iconP1', angleshit*-10)
			setGraphicSize('iconP2', angleshit*10)
		end
		if IconBop == 'BP' then
			local anglecrap = -1
		    if curBeat % 4 == 0 then
				setProperty('iconP1.angle',anglecrap*30)
				setProperty('iconP2.angle',anglecrap*-30)
				doTweenAngle('hr', 'iconP1', 0, 0.5, 'circOut')
				doTweenAngle('hrr', 'iconP2', 0, 0.5, 'circOut')
			end
		end
	end
	if SeparateIconBops == true then
		if BFBop == 'OS' then
			if curBeat % 2 == 0 then
				setProperty('iconP1.angle', 5)
			else
				setProperty('iconP1.angle', -5)
			end
		end
		if BFBop == 'Banbodi' then
			local angleshit = 15;
			local anglevar = 12;
			if curBeat % 2 == 0 then
				angleshit = anglevar;
			else
				angleshit = -anglevar;
			end
			setGraphicSize('iconP1', angleshit*-10)
			doTweenX('ban', 'iconP1', -angleshit*8, crochet*0.001, 'cubeOut')
		end
		if BFBop == 'G.A' then
			local angleshit = 15;
			local anglevar = 13;
			if curBeat % 2 == 0 then
				angleshit = anglevar;
			else
				angleshit = -anglevar;
			end
			setGraphicSize('iconP1', angleshit*-10)
			setProperty('iconP1.angle',angleshit*-1.2)
			doTweenAngle('turn', 'iconP1', 0, stepCrochet*0.004, 'cubeOut')
			doTweenX('tuin', 'iconP1', -angleshit*8, crochet*0.001, 'linear')
		end
		if BFBop == 'Static' then
			scaleObject('iconP1', 1, 1)
		end
		if BFBop == 'DnB' then
			bounceStr = (getProperty('healthBar.percent') * 0.01) - 0.5;
			t = 0;
			widthP1 = 0.35 * (1 + bounceStr);
			updateIcons();
		end
		if BFBop == 'Cassette Girl' then
			if curBeat % 2 == 0 then
				setProperty('iconP1.angle', 10)
			else
				setProperty('iconP1.angle', -10)
			end
		end
		if BFBop == 'Swing' then
			scaleObject('iconP1', 1, 1)
		end
		if BFBop == 'In-n-Out' then
			local angleshit = 15;
			local anglevar = 13;
			if curBeat % 2 == 0 then
				angleshit = anglevar;
			else
				angleshit = -anglevar;
			end
			setGraphicSize('iconP1', angleshit*-10)
		end
		if BFBop == 'BP' then
			local anglecrap = -1
		    if curBeat % 4 == 0 then
				setProperty('iconP1.angle',anglecrap*30)
				doTweenAngle('hr', 'iconP1', 0, 0.5, 'circOut')
			end
		end
		if BFBop == 'Vs Ron' then
			if curBeat % 3 == 0 then
				CoolWay = 0.001;
				t = 0;
				widthP1 = 0.10 * (1 + CoolWay);
				updateIcons();
			end
			scaleObject('iconP1', 1, 1)
		end
		if FatherBop == 'OS' then
			if curBeat % 2 == 0 then
				setProperty('iconP2.angle', 5)
			else
				setProperty('iconP2.angle', -5)
			end
		end
		if FatherBop == 'Banbodi' then
			local angleshit = 15;
			local anglevar = 12;
			if curBeat % 2 == 0 then
				angleshit = anglevar;
			else
				angleshit = -anglevar;
			end
			setGraphicSize('iconP2', angleshit*10)
			doTweenX('ban2', 'iconP2', -angleshit*8, crochet*0.001, 'cubeOut')
		end
		if FatherBop == 'G.A' then
			local angleshit = 15;
			local anglevar = 13;
			if curBeat % 2 == 0 then
				angleshit = anglevar;
			else
				angleshit = -anglevar;
			end
			setGraphicSize('iconP2', angleshit*10)
			setProperty('iconP2.angle',angleshit*1.2)
			doTweenAngle('tt', 'iconP2', 0, stepCrochet*0.004, 'cubeOut')
			doTweenX('ttrn', 'iconP2', -angleshit*8, crochet*0.001, 'linear')
		end
		if FatherBop == 'Static' then
			scaleObject('iconP2', 1, 1)
		end
		if FatherBop == 'DnB' then
			bounceStr = (getProperty('healthBar.percent') * 0.01) - 0.5;
			t = 0;
			widthP2 = 0.35 * (1 - bounceStr);
			updateIcons();
		end
		if FatherBop == 'Cassette Girl' then
			if curBeat % 2 == 0 then
				setProperty('iconP2.angle', -10)
			else
				setProperty('iconP2.angle', 10)
			end
		end
		if FatherBop == 'Swing' then
			scaleObject('iconP2', 1, 1)
		end
		if FatherBop == 'Vs Ron' then
			if curBeat % 3 == 0 then
				CoolWay = 0.001;
				t = 0;
				widthP2 = 0.10 * (1 - CoolWay);
				updateIcons();
			end
			scaleObject('iconP2', 1, 1)
		end
		if FatherBop == 'In-n-Out' then
			local angleshit = 15;
			local anglevar = 13;
			if curBeat % 2 == 0 then
				angleshit = anglevar;
			else
				angleshit = -anglevar;
			end
			setGraphicSize('iconP2', angleshit*10)
		end
		if FatherBop == 'BP' then
			local anglecrap = -1
		    if curBeat % 4 == 0 then
				setProperty('iconP2.angle',anglecrap*-30)
				doTweenAngle('hrr', 'iconP2', 0, 0.5, 'circOut')
			end
		end
	end
end

function onSpawnNote(i)
	if RandomColorNotes == true then
		setPropertyFromGroup('notes', i, 'colorSwap.hue', getRandomFloat(180, -180) / 360)
	end
end

function onSongStart()
    doTweenAlpha('timeAughTween', 'timeAugh', 1, 0.25, circIn)
end

function onUpdate()
	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/15)
	if SeparateIconBops == false then
		if IconBop == 'Swing' then
			doTweenAngle('iconP1TweenAngle', 'iconP1', 0 + 15*math.cos((currentBeat+1)*math.pi), 0.1)
			doTweenAngle('iconP2TweenAngle', 'iconP2', 0 - 15*math.cos((currentBeat+1)*math.pi), 0.1)
		end
	end

	if SeparateIconBops == true then
		if BFBop == 'Swing' then
			doTweenAngle('iconP1TweenAngle', 'iconP1', 0 + 15*math.cos((currentBeat+1)*math.pi), 0.1)
		end
		if FatherBop == 'Swing' then
			doTweenAngle('iconP2TweenAngle', 'iconP2', 0 - 15*math.cos((currentBeat+1)*math.pi), 0.1)
		end
	end

	if KadeHealthBar == true then
		setHealthBarColors('FF0000', '00FF00')
	end

	screenCenter('timeAugh', 'x')

	if nps >0 and reduce == true then
		reduce = false
		runTimer('reduce nps', 1/nps , 1)	
		--NPS logic made by beihu https://b23.tv/gxqO0GH
	end

	if nps ==0 then
		reduce = true
	end

	if Nps == true then
		if ScoreText == 'Psych' then
			if MaxNps == false then
				local ratePercent = getProperty('ratingPercent') -- no more round!
				local ratingFull = math.max(ratePercent * 100, 0)
				local ratingFullAsStr = string.format("%.2f", ratingFull)
				-- ratingFull and ratingFullAsStr were taken from i-winxd Complex Accuracy, so shout out to him
				-- also i don't know if this is accurate accuracy
				local BeforeScore = 'NPS: '..nps.. ' | Score: '..score..' | Misses: '..misses..' | Rating: '..ratingName
				local FinalScore = 'NPS: '..nps.. ' | Score: '..score..' | Misses: '..misses..' | Rating: '..ratingName..' ('..ratingFullAsStr..'%) - '..ratingFC

				if ratingName == '?' then
					setTextString('scoreTxt', BeforeScore)
				else
					setTextString('scoreTxt', FinalScore)  
				end
			end
			if MaxNps == true then
				local ratePercent = getProperty('ratingPercent') -- no more round!
				local ratingFull = math.max(ratePercent * 100, 0)
				local ratingFullAsStr = string.format("%.2f", ratingFull)
				-- ratingFull and ratingFullAsStr were taken from i-winxd Complex Accuracy, so shout out to him
				-- also i don't know if this is accurate accuracy
				local BeforeScore = 'NPS: '..nps.. ' (Max:' .. npsmax .. ') | Score: '..score..' | Misses: '..misses..' | Rating: '..ratingName
				local FinalScore = 'NPS: '..nps.. ' (Max:' .. npsmax .. ') | Score: '..score..' | Misses: '..misses..' | Rating: '..ratingName..' ('..ratingFullAsStr..'%) - '..ratingFC

				if nps > npsmax then
					npsmax = nps
				end

				if ratingName == '?' then
					setTextString('scoreTxt', BeforeScore)
				else
					setTextString('scoreTxt', FinalScore)  
				end
			end
		end
		if ScoreText == 'Kade' then
			if MaxNps == false then
				setTextString('scoreTxt', 'NPS: '..nps.. ' | Score: '..score..' | Combo Breaks: '..misses..' | Accuracy: '..round(rating * 100, 0)..'%')
			end

			if MaxNps == true then
				if nps > npsmax then
					npsmax = nps
				end
				setTextString('scoreTxt', 'NPS: '..nps.. ' (Max:' .. npsmax .. ') | Score: '..score..' | Combo Breaks: '..misses..' | Accuracy: '..round(rating * 100, 0)..'%')
			end
		end
	end
	if Nps == false then
		if ScoreText == 'Kade' then
			setTextString('scoreTxt', 'Score: '..score..' | Combo Breaks: '..misses..' | Accuracy: '..round(rating * 100, 0)..'%')
		end
	end
	if ScoreText == 'Rando' then
		health = (getProperty('healthBar.percent'))
		setTextString('scoreTxt', 'NPS: '..nps..' | Health: '..health..'%'..' | Score: '..score..' | Misses: '..misses..' | Accuracy: '..round(rating * 100, 0)..'%'..' | Rank: '..rank..'')
		if rating >= 1 then
			rank = 'S+'
		elseif rating >= 0.90 then
			rank = 'S'
		elseif rating >= 0.80 then
			rank = 'A'
		elseif rating >= 0.60 then
			rank = 'B'
		elseif rating >= 0.50 then
			rank = 'C'
		elseif rating >= 0.40 then
			rank = 'D'
		elseif rating >= 0.20 and hits > 0 then
			rank = 'F'
        elseif hits == 0 then
            rank = 'N/A'
		end
	end
	onUpdatePostPost()
end

function onUpdatePostPost()
	if RainbowNotes == true then
		for i = 0, getProperty('notes.length') do
			setPropertyFromGroup('notes',i,'colorSwap.hue',getPropertyFromGroup('notes',i,'colorSwap.hue')+0.01)
		end
	end
end

function onUpdatePost(elapsed)
	if SeparateIconBops == false then
		if IconBop == 'G.A' then
			setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -0.6 + 1)
			setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -0.6 + 1)
			setProperty("iconP1.y", 500 + (getProperty("iconP1.scale.y") * 75))
			setProperty("iconP2.y", 500 + (getProperty("iconP2.scale.y") * 75))
   
			if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
				setProperty("iconP1.y", -65 + (getProperty("iconP1.scale.y") * 75))
				setProperty("iconP2.y", -65 + (getProperty("iconP2.scale.y") * 75))
			end
		end
		if IconBop == 'Banbodi' then
			setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -0.6 + 1)
			setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -0.6 + 1)
			setProperty("iconP1.y", 500 + (getProperty("iconP1.scale.y") * 75))
			setProperty("iconP2.y", 500 + (getProperty("iconP2.scale.y") * 75))
   
			if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
				setProperty("iconP1.y", -65 + (getProperty("iconP1.scale.y") * 75))
				setProperty("iconP2.y", -65 + (getProperty("iconP2.scale.y") * 75))
			end
		end
		if IconBop == 'DnB' then
			updateIcons();
			t = t + elapsed;
			delta = t / 0.4;
			if (delta > 1) then
				delta = 1;
			end
			widthP1 = lerp(widthP1, 0, delta);
			widthP2 = lerp(widthP2, 0, delta);
		end
		if IconBop == 'Vs Ron' then
			updateIcons();
			t = t + elapsed;
			delta = t / 0.3;
			if (delta > 1) then
				delta = 1;
			end
			widthP1 = lerp(widthP1, 0, delta);
			widthP2 = lerp(widthP2, 0, delta);
		end
		if IconBop == 'Sonic.exe' then
			setProperty('iconP1.origin.x',-30)
			setProperty('iconP2.origin.x',-10)
			setProperty('iconP2.origin.y',-10)
			setProperty('iconP1.origin.y',-5)
		end
		if IconBop == 'Squish' then
			setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -0.5 + 1)
			setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -0.5 + 1)
		end
		if IconBop == 'BP' then
			setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -2 + 1)
			setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -2 + 1)
			setProperty("iconP1.y", 500 + (getProperty("iconP1.scale.y") * 75))
			setProperty("iconP2.y", 500 + (getProperty("iconP2.scale.y") * 75))
   
			if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
				setProperty("iconP1.y", -65 + (getProperty("iconP1.scale.y") * 75))
				setProperty("iconP2.y", -65 + (getProperty("iconP2.scale.y") * 75))
			end
		end
	end
	if SeparateIconBops == true then
		if BFBop == 'G.A' then
			setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -0.6 + 1)
			setProperty("iconP1.y", 500 + (getProperty("iconP1.scale.y") * 75))
   
			if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
			setProperty("iconP1.y", -65 + (getProperty("iconP1.scale.y") * 75))
			end
		end
		if BFBop == 'Banbodi' then
			setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -0.6 + 1)
			setProperty("iconP1.y", 500 + (getProperty("iconP1.scale.y") * 75))
   
			if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
				setProperty("iconP1.y", -65 + (getProperty("iconP1.scale.y") * 75))
			end
		end
		if BFBop == 'DnB' then
			updateIcons();
			t = t + elapsed;
			delta = t / 0.4;
			if (delta > 1) then
				delta = 1;
			end
			widthP1 = lerp(widthP1, 0, delta);
		end
		if BFBop == 'Vs Ron' then
			updateIcons();
			t = t + elapsed;
			delta = t / 0.3;
			if (delta > 1) then
				delta = 1;
			end
			widthP1 = lerp(widthP1, 0, delta);
		end
		if BFBop == 'Sonic.exe' then
			setProperty('iconP1.origin.x',-30)
			setProperty('iconP1.origin.y',-5)
		end
		if BFBop == 'Squish' then
			setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -0.5 + 1)
		end
		if BFBop == 'BP' then
			setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -2 + 1)
			setProperty("iconP1.y", 500 + (getProperty("iconP1.scale.y") * 75))
   
			if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
				setProperty("iconP1.y", -65 + (getProperty("iconP1.scale.y") * 75))
			end
		end
		if FatherBop == 'G.A' then
			setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -0.6 + 1)
			setProperty("iconP2.y", 500 + (getProperty("iconP2.scale.y") * 75))
   
			if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
			setProperty("iconP2.y", -65 + (getProperty("iconP2.scale.y") * 75))
			end
		end
		if FatherBop == 'DnB' then
			updateIcons();
			t = t + elapsed;
			delta = t / 0.4;
			if (delta > 1) then
				delta = 1;
			end
			widthP2 = lerp(widthP2, 0, delta);
		end
		if FatherBop == 'Vs Ron' then
			updateIcons();
			t = t + elapsed;
			delta = t / 0.3;
			if (delta > 1) then
				delta = 1;
			end
			widthP2 = lerp(widthP2, 0, delta);
		end
		if FatherBop == 'Banbodi' then
			setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -0.6 + 1)
			setProperty("iconP2.y", 500 + (getProperty("iconP2.scale.y") * 75))
   
			if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
				setProperty("iconP2.y", -65 + (getProperty("iconP2.scale.y") * 75))
			end
		end
		if FatherBop == 'Sonic.exe' then
			setProperty('iconP2.origin.x',-10)
			setProperty('iconP2.origin.y',-10)
		end
		if FatherBop == 'Squish' then
			setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -0.5 + 1)
		end
		if FatherBop == 'BP' then
			setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -2 + 1)
			setProperty("iconP2.y", 500 + (getProperty("iconP2.scale.y") * 75))
   
			if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
				setProperty("iconP2.y", -65 + (getProperty("iconP2.scale.y") * 75))
			end
		end
	end
	if ScoreText == '' then
		setTextString('scoreTxt', '')
	end
	if Nps == false then
		if ScoreText == 'Kade' then
			setTextString('scoreTxt', 'Score: '..score..' | Combo Breaks: '..misses..' | Accuracy: '..round(rating * 100, 0)..'%')
		end
	end

	setTextString('timeAugh', songName..' ('..formatTime(getSongPosition() - noteOffset)..' / '..formatTime(getProperty('songLength'))..')')
end

function updateIcons()
	if SeparateIconBops == false then
		setProperty('iconP1.scale.x', 1 + widthP1);
		setProperty('iconP2.scale.x', 1 + widthP2);
		if downscroll then
			setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -1.5 + 1)

			setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -1.5 + 1)

			setProperty("iconP1.y", -70 + (getProperty("iconP1.scale.y") * 75))

			setProperty("iconP2.y", -70 + (getProperty("iconP2.scale.y") * 75))
		else
			setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -1.5 + 1)

			setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -1.5 + 1)

			setProperty("iconP1.y", 500 + (getProperty("iconP1.scale.y") * 75))

			setProperty("iconP2.y", 500 + (getProperty("iconP2.scale.y") * 75))
		end
	end
	if SeparateIconBops == true then
		if BFBop == 'DnB' then
			setProperty('iconP1.scale.x', 1 + widthP1);
			if downscroll then
				setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -1.5 + 1)

				setProperty("iconP1.y", -70 + (getProperty("iconP1.scale.y") * 75))
			else
				setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -1.5 + 1)

				setProperty("iconP1.y", 500 + (getProperty("iconP1.scale.y") * 75))
			end
		end
		if FatherBop == 'DnB' then
			setProperty('iconP2.scale.x', 1 + widthP2);
			if downscroll then
				setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -1.5 + 1)

				setProperty("iconP2.y", -70 + (getProperty("iconP2.scale.y") * 75))
			else
				setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -1.5 + 1)

				setProperty("iconP2.y", 500 + (getProperty("iconP2.scale.y") * 75))
			end
		end
		if BFBop == 'Vs Ron' then
			setProperty('iconP1.scale.x', 1 + widthP1);
			if downscroll then
				setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -1.5 + 1)

				setProperty("iconP1.y", -70 + (getProperty("iconP1.scale.y") * 75))
			else
				setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -1.5 + 1)

				setProperty("iconP1.y", 500 + (getProperty("iconP1.scale.y") * 75))
			end
		end
		if FatherBop == 'Vs Ron' then
			setProperty('iconP2.scale.x', 1 + widthP2);
			if downscroll then
				setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -1.5 + 1)

				setProperty("iconP2.y", -70 + (getProperty("iconP2.scale.y") * 75))
			else
				setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -1.5 + 1)

				setProperty("iconP2.y", 500 + (getProperty("iconP2.scale.y") * 75))
			end
		end
	end
end

function round(x, n)
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return  x / n
end

function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)

    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if not isSustainNote then
        nps = nps +1
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	--NPS logic made by beihu https://b23.tv/gxqO0GH
	if tag == 'reduce nps'  and nps > 0 then
		runTimer('reduce nps', 1/nps, 1)
		nps = nps - 1
	end
end