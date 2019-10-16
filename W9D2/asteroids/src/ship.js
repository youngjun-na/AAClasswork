const Util = require('./util.js');
const MovingObject = require('./moving_object.js');
Util.inherits(Ship, MovingObject);

function Ship(options) {
  MovingObject.call(this, {
    vel: 0,
    radius: 10,
    color: "red"
  });
  this.pos = options.pos;
  this.game = options.game;
}

Ship.prototype.relocate = function() {
  this.vel = 0;
  this.pos = this.game.randomPosition();
}

module.exports = Ship;