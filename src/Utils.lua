-- function contains all function global of game

-- Get all quads of all tile in game form a spritesheet. See file for more understanding
-- Get same type so that has same width and height
-- rows and cols is size of rentangle we have to take
-- xStart, yStart is coordinate where start take sprites
function GetQuads(atlas, width, height, rows, cols, xStart, yStart)
    local quads = {};
    local counter = 1;

    for i = 0, rows do
        for j = 0, cols do
            quads[counter] = love.graphics.newQuad(xStart + j * width,yStart + i * height, width, height, atlas:getDimensions());
            counter = counter + 1;        
        end
    end

    return quads;
end


