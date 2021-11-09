Ground = Class{};

-- ground surround all screen
function Ground:init()
    self.x = 0;
    self.y = 0;

    -- grid seperate screen into many pieces. One piece has one type(land, sky, cloud,...)
    -- init type is 5 - transparent
    self.grid = {};
    for i = 0, GRID_ROWS - 1 do
        self.grid[i] = {};
        for j = 0, GRID_COLS - 1 do
            self.grid[i][j] = 5;
        end
    end

    -- create map
    for i = GRID_ROWS - 3, GRID_ROWS - 1 do
        for j = 0, GRID_COLS do
            self.grid[i][j] = 8;
        end
    end
    for i = GRID_ROWS - 6, GRID_ROWS - 3 do
        self.grid[i][8] = 8;
    end
    self.grid[GRID_ROWS - 7][7] = 8;
end

function Ground:update(dt)
    
end

function Ground:render()
    for i = 0, 17 do
        for j = 0, 31 do
            love.graphics.draw(gTextures['tiles'], gSprites['tiles'][self.grid[i][j]], 
                self.x + j * 16, self.y + i * 16);
        end
    end
end
