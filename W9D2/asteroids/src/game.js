const DIM_X = 500;
const DIM_Y = 500;
const NUM_ASTEROIDS = 1;

function Game() {
  this.asteroids = [];
  while (this.asteroids.length < NUM_ASTEROIDS) {
    this.asteroids.push(this.addAsteroids());
  }
  this.ship = new Ship({pos: Game.randomPosition(), game: this});
}

Game.prototype.addAsteroids = function() {
  let new_ast = new Asteroid({pos: Game.randomPosition(), game: this});
  return new_ast;
}

Game.randomPosition = function() {
  return [Math.floor(Math.random()*DIM_X), Math.floor(Math.random()*DIM_Y)];
}
// Game.randomPosition = function() {
//   return [Math.floor(Math.random()*100), Math.floor(Math.random()*100)];
// }

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0,0,DIM_X,DIM_Y);
  for (let i=0; i < this.allObjects().length; i++) {
    this.allObjects()[i].draw(ctx);
  }
}

Game.prototype.moveObjects = function() {
 
  for (let i = 0; i < this.allObjects().length; i++) {
    debugger
    this.allObjects()[i].move();
  }
};

Game.prototype.wrap = function(pos) {
  if (pos[0] > DIM_X) pos[0] -= DIM_X;
  if (pos[0] < 0) pos[0] += DIM_X;
  if (pos[1] > DIM_Y) pos[1] -= DIM_Y;
  if (pos[1] < 0) pos[1] += DIM_Y;
  return pos;
};

Game.prototype.checkCollisions = function () {
  for (let i = 0; i < this.allObjects().length; i++) {
    for (let j = i + 1; j < this.allObjects().length; j++) {
      if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])) {
        this.allObjects()[i].collideWith(this.allObjects()[j]);
      }
    }
  }
};

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
}

Game.prototype.remove = function(asteroid) {
  for (let i = 0; i < this.asteroids.length; i++) {
    if (this.asteroids[i] === asteroid) {
      this.asteroids.splice(i, 1);
    } 
  }
};

Game.prototype.allObjects = function() {

   let obj = this.asteroids + [this.ship];
   return obj;
};
module.exports = Game;