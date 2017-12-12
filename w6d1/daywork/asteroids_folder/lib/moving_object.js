const MovingObject = function(hash) {
  this.pos = hash.pos;
  this.vel = hash.vel;
  this.radius = hash.radius;
  this.color = hash.color;
};

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI * 2, true);
  ctx.fillStyle = this.color;
  ctx.fill();
};

MovingObject.prototype.move = function () {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
};

module.exports = MovingObject;
