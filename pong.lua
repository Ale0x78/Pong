Pong = Object:extend()
config = require 'conf'
function Pong:resetPos()
	self.x = config.WIDTH/2 - self.w/2
	self.y = config.HEIGHT/2 - self.h/2
end
function Pong:new()
	self.w = 20
	self.h = 20
	self:resetPos()
	self.speed = 30
	self.accel = 10
	self.xv = 1 -- X vector -1 or 1
	self.yv = 1 -- Y verctor -1 or 1
	self.p1Score = 0
	self.p2Score = 0
end
function Pong:setSpeed(s)
	self.speed = s
end
function Pong:setAccel(a)
	self.accel = a
end
function Pong:update(dt)
	self.x = self.x + self.speed*dt*self.xv
	self.y = self.y + self.speed*dt*self.yv
	self.speed = self.speed + self.accel*dt
	if self.x < 0 then
		self.p1Score = self.p1Score + 1
		self.x = 0
		self.xv = self.xv * -1
		self:resetPos()
		frozen = true
	end
	if self.y < 0 then
		self.y = 0
		self.yv = self.yv * -1
	end
	if self.x > config.WIDTH - self.w then
		self.p2Score = self.p2Score + 1
		self.x = config.WIDTH - self.w
		self.xv = self.xv * -1
		self:resetPos()
		frozen = true
	end
	if self.y > config.HEIGHT - self.h then
		self.y = config.HEIGHT - self.h
		self.yv = self.yv * -1
	end
	
end
function Pong:draw()
	love.graphics.rectangle("fill",self.x,self.y,self.w,self.h)
end