songended = false
function onUpdatePost()

    if songended == false then

    setPropertyFromClass('lime.app.Application', 'current.window.title', 'Psych Engine | '..'Song: '..getProperty('curSong')..' | '..getProperty('scoreTxt.text'))

    end

end

function onDestroy()

    songended = true

    setPropertyFromClass('lime.app.Application', 'current.window.title', 'Psych Engine')

end

function onGameOver()

    songended = true

    setPropertyFromClass('lime.app.Application', 'current.window.title', 'Psych Engine |'..' Song: '..getProperty('curSong')..' | Game Over')

    return Function_Continue

end