const Asteroid = require('./asteroid');
const Util = require("./util");

const Game = function (DIM_X, DIM_Y, NUM_ASTEROIDS) {
  this.DIM_X = DIM_X;
  this.DIM_Y = DIM_Y;
  this.NUM_ASTEROIDS = NUM_ASTEROIDS;
  this.asteroidArray = this.addAsteroids();
};

Game.prototype.addAsteroids = function () {
  const asteroidArray = [];

  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    asteroidArray.push(new Asteroid({pos: this.randomPosition()}));
  }

  return asteroidArray;
};

Game.prototype.randomPosition = function () {
  return [Math.random() * this.DIM_X, Math.random() * this.DIM_Y];
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0,0,this.DIM_X, this.DIM_Y);

  this.asteroidArray.forEach((ast) => {
    ast.draw(ctx);
  });
};

Game.prototype.moveObjects = function () {
  this.asteroidArray.forEach((ast) => {
    ast.move();
  });
};

module.exports = Game;
