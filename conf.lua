local config = {}
io.stdout:setvbuf("no")
config.WIDTH = 1000 
config.HEIGHT = 500
function love.conf(t)
	t.window.width = config.WIDTH                -- The window width (number)
    t.window.height = config.HEIGHT               -- The window height (number)
    t.window.title = "Very Good Pong"
end
return config