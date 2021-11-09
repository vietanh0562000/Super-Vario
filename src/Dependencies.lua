-- library for render virtual resolution but keep size of window
push = require('libs/push');

-- library for basic class
Class = require("libs/class");

-- library timer for creating animation, waiting time,etc..
Timer = require('libs/knife/timer');

-- all constants
require('src/Constants');

-- all global functions
require('src/Utils');

-- animation class
require('src/Animation');

-- game state machine and all state
require('src/StateMachine');
require('src/states/BaseState');
require('src/states/PlayState');

-- game object
require('src/objects/Ground');
require('src/objects/Alien');