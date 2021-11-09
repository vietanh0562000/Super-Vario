Alien = Class{};

function Alien:init()
    -- position alien
    self.x = 50;
    self.y = 220;

    -- velocity of alien
    self.dx = 0;
    self.dy = 0;

    -- direction
    self.direction = 'right';

    -- animation of Alien
    self.currentAnimation = 'idle';
    self.animation = {
        ['idle'] = Animation({frames = {1}, interval = 1}),
        ['move'] = Animation({frames = {10, 11}, interval = 0.2}),
        ['jump'] = Animation({frames = {3}, interval = 0.2})
    }
end

-- update every dt, grid is table contain type of ground on the map
-- Need grid to detect collision
function Alien:update(dt, ground)
    self.currentAnimation = 'idle';
    self.dx = 0;

    -- input for alien: move left, right, jump up
    -- move left
    if (love.keyboard.isDown('left')) then
        self.currentAnimation = 'move';
        self.direction = 'left';
        self.dx = -ALIEN_SPEED;
    end    
    -- move right
    if (love.keyboard.isDown('right')) then    
        self.currentAnimation = 'move';
        self.direction = 'right';
        self.dx = ALIEN_SPEED;    
    end
    -- jump up
    if (love.keyboard.isDown('up')) then
        self.currentAnimation = 'jump';
        self.dy = -ALIEN_SPEED;
    end

    -- detect collision with map
    for i = 0, GRID_ROWS - 1 do
        for j = 0, GRID_COLS - 1 do
            if (ground.grid[i][j] == 8) then
                self:collide({
                    x = ground.x + j * TILE_WIDTH,
                    y = ground.y + i * TILE_HEIGHT
                });
            end
        end
    end

    -- change position alien
    self.x = self.x + self.dx * dt;
    self.y = self.y + self.dy * dt;

    -- update animation
    self.animation[self.currentAnimation]:update(dt);
end

-- detect alien collide with a box of grid or not ?
-- a box {x, y} with x, y with x, y is top-left corner of box
function Alien:collide(box)
    if (self.x + CHAR_WIDTH / 2 < box.x) or (self.x - CHAR_WIDTH / 2 > box.x + TILE_WIDTH)
        or (self.y + CHAR_HEIGHT / 2 < box.y) or (self.y - CHAR_HEIGHT / 2 > box.y + TILE_HEIGHT) then
            return false;
    end

    --[[
        resolve collision
    ]]
    -- collide at right
    if (self.x + CHAR_WIDTH / 2 - OFF_SET < box.x) then
        self.dx = math.min(0, self.dx);

    -- collide at left
    elseif (self.x - CHAR_WIDTH / 2 + OFF_SET > box.x + TILE_WIDTH) then
            print("collision "..self.dx.." "..love.timer.getTime());
            self.dx = math.max(0, self.dx);

     -- collide at top        
    elseif (self.y + CHAR_HEIGHT / 2 - OFF_SET < box.y) then
        print(self.dy);
        self.dy = math.min(0, self.dy);

     -- collide at bottom    
    elseif (self.y - CHAR_HEIGHT / 2 + OFF_SET > box.y + TILE_HEIGHT) then
        print(self.dy);
        self.dy = math.max(0, self.dy);
    end
   
    return true;
end

function Alien:render()
    love.graphics.draw(gTextures['alien'], 
        -- frame
        gSprites['alien'][self.animation[self.currentAnimation]:getCurrentFrame()], 
        -- position
        self.x, self.y,
        -- rotation
        0,
        -- scale
        self.direction == 'right' and 1 or -1, 1,

        -- set anchor point to scale to center
        CHAR_WIDTH / 2, CHAR_HEIGHT / 2
    );
end
