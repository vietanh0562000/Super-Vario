require("src/Dependencies");

function love.load()
    love.window.setTitle("Super Vario");

    -- use filter for clearer and more beautiful when in virtual resolution
    love.graphics.setDefaultFilter("nearest", "nearest");

    -- set up screen game for virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    });

    LoadResource();

    -- create game state machine
    gStateMachine = StateMachine({
        ['Play'] = function() return PlayState() end,
    })

    gStateMachine:change('Play');

end

function love.update(dt)
    gStateMachine:update(dt);
end

function love.draw()
    push:apply('start');

    gStateMachine:render();

    push:apply('end');
end

-- function load all graphics, fonts and music
function LoadResource()
    -- load all image
    gTextures = {
        ['background'] = love.graphics.newImage('graphics/backgrounds.png'),
        ['alien'] = love.graphics.newImage('graphics/blue_alien.png'),
        ['tiles'] = love.graphics.newImage('graphics/tiles.png')
    }

    gSprites = {

    }

    -- load all fonts
    gFonts = {
        ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
        ['medium'] = love.graphics.newFont('fonts/fipps.otf', 16),
        ['large'] = love.graphics.newFont('fonts/ArcadeAlternate.ttf', 32)
    }


    -- load all music
end
