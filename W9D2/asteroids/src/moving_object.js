

function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
  ctx.fillStyle = this.color;
  ctx.fill();
  ctx.strokeStyle = this.color;
  ctx.stroke();
  ctx.closePath();
  
};

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  this.game.wrap(this.pos);
};

MovingObject.prototype.isCollidedWith = function(otherObject) {
  let dist1 = Math.pow(this.pos[0] - otherObject.pos[0], 2); 
  let dist2 = Math.pow(this.pos[1] - otherObject.pos[1], 2); 
  return Math.sqrt(dist1 + dist2) < (this.radius + otherObject.radius)*0.9;
};

MovingObject.prototype.collideWith = function(otherObject) {
  // this.game.remove(this);
  // this.game.remove(otherObject);
  
};

module.exports = MovingObject;
