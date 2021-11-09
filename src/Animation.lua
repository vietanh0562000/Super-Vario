--[[
    Sprite animation
]]

Animation = Class{};

--[[
    init animation with: 
    1. list of frames
    2. time frame change (interval)
]]
function Animation:init(params)
    self.frames = params.frames;
    self.interval = params.interval;
    -- this timer count time dt pass
    self.timer = 0;
    -- this currentFrame is index of frame is displayed right now
    self.currentFrame = 1;
end

-- update or change frame when time dt over time interval of animation
function Animation:update(dt)
    if (#self.frames > 0) then
        -- update timer
        self.timer = self.timer + dt;
        -- timer pass interval -> update frame
        if (self.timer >= self.interval) then
            self.currentFrame = math.max(1, (self.currentFrame + 1) % (#self.frames + 1));
            self.timer = 0;
        end
    end
end

-- get current frame at any time
function Animation:getCurrentFrame()
    return self.frames[self.currentFrame];
end
