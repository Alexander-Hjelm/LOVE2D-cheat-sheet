local angle = 0
local trans = 0
local scale = 0
local imgTrotsky
local fruits = {"pear", "banana", "avocado", "grapes"}	--table
local myRect = {}	--object
local lennon

function love.load()
    -- use of standard library classic for class functionality
    Object = require("classic")
    require("chernobyl") -- load separate class file

    imgTrotsky = love.graphics.newImage("trotsky.png")
    
    -- insert into table
    table.insert(fruits, "Asparagus")

    -- define myRect object
    myRect.x = 100
    myRect.y = 300
    myRect.width = 70
    myRect.height = 90

    -- Load a separate file
    lennon = require("lennon")	
    print(type(lennon))	--typeof
end

function love.draw()

    ---Print text
    -- table length: #table_name, string concat operator: ..
    for i=1,#fruits do
        love.graphics.print("I'd like myself a good " .. fruits[i], 600, 300 + 10*i) --string, x, y
    end

    -- draw object
    love.graphics.rectangle("line", myRect.x, myRect.y, myRect.width, myRect.height)    


    love.graphics.circle("fill", 330, 330, 100)	--mode, x, y, radius
    love.graphics.line(100, 100, 400, 200) -- x1, y1, x2, y2
    
    --rotate image
    
    love.graphics.draw(imgTrotsky, 500, 450, angle, 1, 1, imgTrotsky:getWidth()/2, imgTrotsky:getHeight()/2)
    --drawable, x, y, rot, scalex, scaley, originx, originy

    -- : is for implementing methods that pass self as the first parameter.
    -- x:bar(3,4)should == x.bar(x,3,4).    


    --translate image

    love.graphics.draw(imgTrotsky, 200 + trans, 100)


    --scale image

    love.graphics.draw(imgTrotsky, 650, 150, 0, scale, scale, imgTrotsky:getWidth()/2, imgTrotsky:getHeight()/2)

    --call function from a separate file
    lennon.drawLennon()

    --instantiate a class
    c1 = Chernobyl()
    c2 = Chernobyl()

    c1:drawChernobyl()
    c2:drawChernobyl()

end

function love.update(dt)
    --Update angle
    if love.keyboard.isDown("right") then
	angle = updateAngle(angle, dt)
    elseif love.keyboard.isDown("left") then
        angle = updateAngle(angle, -dt)
    end
    --Update translation parameter
    trans = 60 * math.sin(angle)

    --Update scale parameter
    scale = 1 + 0.5 * math.sin(angle)
end

function updateAngle(a_prev, dt)
    a = 0
    a = a_prev + dt * math.pi/2
    a = a % (2*math.pi)
    return a
end
