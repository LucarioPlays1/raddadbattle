function opponentNoteHit(id,data,type,sus)
    local noteHealth = 0.015
    local dadCharacter = getProperty('dad.curCharacter')
    if getProperty('health') > 0.5 then
            if not sus then
                setProperty('health',getProperty('health') - noteHealth)
            else
                setProperty('health',getProperty('health') - (noteHealth/3))
            end
        end
    end