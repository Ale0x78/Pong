Object = require "classic"
require "paddle"
require "pong"

function love.load() 
	player = Paddle(25,550,15,100,'up','down')
	enemy = Paddle(525,550,15,100,'w','s')
	pong = Pong()
	player:setSpeed(200)
	enemy:setSpeed(200)
	pong:setSpeed(200)
	font = love.graphics.newFont("Zilap Sleep Demo.ttf", 60)
end
function love.update(dt)
	player:update(dt)
	pong:update(dt)
	enemy:update(dt)
	print(player.speed)
	if pong.x < player.x+player.w and pong.y >= player.y and pong.y <= player.y+player.h then 
		pong.xv = pong.xv * -1
	end
	if pong.x + pong.w > enemy.x and pong.y >= enemy.y and pong.y <= enemy.y+enemy.h then -- Bug the player 2 can use the force to control the pong???
		pong.xv = pong.xv * -1
	end
	-- To do: add collision on the sides. 
	if pong.x > player.x and pong.x < player.x - player.w and pong.y > player.y and pong.y < player.y + player.h then
		pong.yv = pong.yv * -1
	end

end
function love.keyreleased(key)
	player:setSpeed(200)
	enemy:setSpeed(200)

end
function love.draw()
	-- love.graphics.setColor(0, 0, 255, 255)
	love.graphics.setFont(font)
	score = tostring(pong.p2Score) .. " : " .. tostring(pong.p1Score)
    love.graphics.print(score, 225,100)
	player:draw()
	pong:draw()
	enemy:draw()
end