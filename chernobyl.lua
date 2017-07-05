-- Use of classes

Chernobyl = Object:extend()  -- Inheritance, Object can be swapped for any other class

-- Constuctor
function Chernobyl.new(self)
    self.x = math.random(1, 500)
    self.y = math.random(1,500)
    self.imgChernobyl = love.graphics.newImage("chernobyl.jpg")
end

function Chernobyl.drawChernobyl(self)
    love.graphics.draw(self.imgChernobyl, self.x, self.y)
end
