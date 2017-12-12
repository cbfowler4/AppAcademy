const MovingObject = require('./moving_object');
const Util = require('./util');

// {pos: [30,30], vel: Util.randomVec(10), color: "blue", radius: 15}
const DEFAULTS = {
  COLOR: "#505050",
  RADIUS: 25,
  SPEED: 4
};

const Asteroid = function Asteroid (options = {}) {
  options.color = DEFAULTS.COLOR;
  options.pos = options.pos || options.game.randomPosition();
  options.radius = DEFAULTS.RADIUS;
  options.vel = options.vel || Util.randomVec(DEFAULTS.SPEED);

  MovingObject.call(this, options);
};

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
