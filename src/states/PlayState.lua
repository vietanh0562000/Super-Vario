PlayState = Class{__includes = BaseState};

function PlayState:init()
end

function PlayState:update(dt)
end

function PlayState:render()
    love.graphics.setFont(gFonts['medium']);
    love.graphics.printf("ABC", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center');
end
