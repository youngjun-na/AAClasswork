const Game = require('./game.js');

function GameView(ctx) {
  this.game = new Game();
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  let that = this;
  setInterval(function () {
    that.game.step();
    that.game.draw(that.ctx);
  }, 10);
};

module.exports = GameView;