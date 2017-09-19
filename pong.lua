Pong = Object:extend()
function Pong:new()
	self.x = 200
	self.y = 300
	self.w = 20
	self.h = 20
	self.speed = 30
	self.accel = 0
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
	end
	if self.y < 0 then
		self.y = 0
		self.yv = self.yv * -1
	end
	if self.x > 550 - self.w then
		self.p2Score = self.p2Score + 1
		self.x = 550 - self.w
		self.xv = self.xv * -1
	end
	if self.y > 550 - self.h then
		self.y = 550 - self.h
		self.yv = self.yv * -1
	end
	
end
function Pong:draw()
	love.graphics.rectangle("fill",self.x,self.y,self.w,self.h)
end