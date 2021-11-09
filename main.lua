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

    -- key input
    love.keyboard.pressedKeys = {};
end

-- save input in a frame
function love.keypressed(key)
    love.keyboard.pressedKeys[key] = true;
end

-- check input (key was pressed) in current frame
function love.keyboard.wasPressed(key)
    print("input"..key);
    return love.keyboard.pressedKeys[key];
end

-- update every frame
function love.update(dt)
    gStateMachine:update(dt);

    -- remove all input in this frame
    love.keyboard.pressedKeys = {};
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
        ['backgrounds'] = love.graphics.newImage('graphics/backgrounds.png'),
        ['alien'] = love.graphics.newImage('graphics/pink_alien.png'),
        ['tiles'] = love.graphics.newImage('graphics/tiles.png')
    }

    gSprites = {
        ['tiles'] = GetQuads(gTextures['tiles'], 16, 16, 3, 4, 0, 0),
        ['backgrounds'] = GetQuads(gTextures['backgrounds'], 256, 128, 2, 0, 0, 0),
        ['alien'] = GetQuads(gTextures['alien'], 16, 20, 0, 10, 0, 0)
    }

    -- load all fonts
    gFonts = {
        ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
        ['medium'] = love.graphics.newFont('fonts/fipps.otf', 16),
        ['large'] = love.graphics.newFont('fonts/ArcadeAlternate.ttf', 32)
    }


    -- load all music
end

function love.conf(t)
    t.console = true;
end

