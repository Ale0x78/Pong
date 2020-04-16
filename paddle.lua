Paddle = Object:extend()
config = require 'conf'
function Paddle:new(x,y,w,h,up,down)
	self.x = x
	self.y = y
	self.w = w
	self.h = h
	self.accel = 100
	self.up = up
	self.down = down

end

function Paddle:setKeys(up,down)
	self.up = up
	self.down = down
end
function Paddle:draw()
	love.graphics.rectangle("fill",self.x,self.y,self.w,self.h)
end
function Paddle:setSpeed(speed)
	self.speed = speed
end
function Paddle:setAccel(a)
	self.accel = a
end
function Paddle:setLocation(x,y)
	self.x = x
	self.y = y
end
function Paddle:update(dt)
	
	-- if love.keyboard.isDown("left") then
	-- self.speed = self.speed + self.accel*dt
	-- 	self.x = self.x - self.speed*dt
	-- elseif love.keyboard.isDown("right") then
	-- self.speed = self.speed + self.accel*dt
	-- 	self.x = self.x + self.speed*dt
	-- end
	if love.keyboard.isDown(self.up) then 
		self.speed = self.speed + self.accel*dt
		self.y = self.y - self.speed*dt
	elseif love.keyboard.isDown(self.down) then
		self.speed = self.speed + self.accel*dt
		self.y = self.y + self.speed * dt
	end
	if self.x < 0 then
		self.x = 0
	end
	if self.y < 0 then
		self.y = 0
	end
	if self.x > config.WIDTH - self.w then
		self.x = config.WIDTH - self.w
	end
	if self.y > config.HEIGHT - self.h then
		self.y = config.HEIGHT - self.h
	end
end
function Paddle:move(x,y,dt)
	
end
