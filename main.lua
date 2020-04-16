Object = require "classic"
require "paddle"
require "pong"
config = require 'conf'
local function displayMSG(msg, y, f)
	love.graphics.print(msg, config.WIDTH/2 - (f:getWidth(msg))/2,y)
end
function love.load() 
	player = Paddle(25,config.HEIGHT,15,100,'up','down')
	enemy = Paddle(config.WIDTH - 35,config.HEIGHT,15,100,'w','s')
	pong = Pong()
	player:setSpeed(200)
	enemy:setSpeed(200)
	pong:setSpeed(200)
	font = love.graphics.newFont("Zilap Sleep Demo.ttf", 60)
	msgFont = love.graphics.newFont("Zilap Sleep Demo.ttf", 20)
	frozen = true
end
local function checkCol(e1, e2)
	return e1.x < e2.x+e2.w and
		   e2.x < e1.x+e1.w and
		   e1.y < e2.y+e2.h and
		   e2.y < e1.y+e1.h
  end

function love.update(dt)
	player:update(dt)
	enemy:update(dt)
	if not frozen then
		pong:update(dt)
		if  checkCol(player, pong) then
			pong.xv = pong.xv * -1
			pong.x = player.x + player.w + 1
		end
		if checkCol(enemy, pong) then
			pong.xv = pong.xv * -1
			pong.x = enemy.x - 1 - pong.w
		end
	else
		if love.keyboard.isDown("space") then
			frozen = false
		end
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
	-- love.graphics.print(score, config.WIDTH/2 - (font:getWidth(score))/2,100)
	displayMSG(score, 100, font)
	if frozen then
		love.graphics.setFont(msgFont)

		displayMSG("Press space to start...", config.HEIGHT/2 + 100, msgFont)
	end
	love.graphics.setColor(255, 0, 0, 255)
	player:draw()
	love.graphics.setColor(0, 0, 255, 255)
	enemy:draw()
	love.graphics.setColor(255, 255, 255, 255)
	pong:draw()

end