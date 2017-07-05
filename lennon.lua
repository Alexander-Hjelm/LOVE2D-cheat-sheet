-- Example of a separate file

outLennon = {} -- return value (object)

local function drawLennon()
    local imgLennon = love.graphics.newImage("lennon.jpg")
    love.graphics.draw(imgLennon, 150, 450)
end

--set function to return value
outLennon.drawLennon = drawLennon

-- Needs a return value
return outLennon
