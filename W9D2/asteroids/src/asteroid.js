const Util = require('./util.js');
const MovingObject = require('./moving_object.js');

Util.inherits(Asteroid, MovingObject);

function Asteroid(options) {
  
  MovingObject.call(this, {
    vel: Util.randomVec(3),
    radius: 2,
    color: "black"
  }); 
  this.pos = options.pos;
  this.game = options.game;
}

Asteroid.prototype.collideWith = function(otherObject) {
  if (otherObject instanceof Ship) {
    otherObject.relocate();
  }
};

module.exports = Asteroid;