PlayState = Class{__includes = BaseState};

function PlayState:init()
    self.ground = Ground();
    self.alien = Alien();
    self.cameraScroll = 0;
end

function PlayState:update(dt)
    -- update ground
    self.ground:update(dt);
    -- gravity
    self.alien.dy = 98;
    -- update alien
    self.alien:update(dt, self.ground);

    -- move camera follow alien
    self.cameraScroll = self.cameraScroll + self.alien.dx * dt;
end

function PlayState:render()
    love.graphics.translate(-self.cameraScroll, 0);

    love.graphics.setFont(gFonts['medium']);
    love.graphics.printf("ABC", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center');

    love.graphics.draw(gTextures['backgrounds'], gSprites['backgrounds'][1], 
        -- position
        0, 0,
        -- rotation
        0,
        -- scale
        VIRTUAL_WIDTH / BG_WIDTH,
        VIRTUAL_HEIGHT / BG_HEIGHT
    );

    self.ground:render();
    self.alien:render();
end
