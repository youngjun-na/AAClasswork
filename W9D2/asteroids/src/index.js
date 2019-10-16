console.log("Webpack is Working!");
const MovingObject = require('./moving_object.js');
const Asteroid = require('./asteroid.js');
const GameView = require('./game_view.js');
const Game = require('./game.js');
const Ship = require('./ship.js');
window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.GameView = GameView;
window.Game = Game;
window.Ship = Ship;

window.addEventListener('DOMContentLoaded', (event) => {
  const canvas = document.getElementById('game-canvas');
  let ctx = canvas.getContext('2d');
  const newGame = new GameView(ctx);
  newGame.start();


  // const mo = new MovingObject({
  //   pos: [30, 30],
  //   vel: [10, 10],
  //   radius: 5,
  //   color: "#00FF00"
  // });
  // const ast = new Asteroid({ pos: [300, 300]});
  // console.log(ast);
  // mo.draw(ctx);
  // ast.draw(ctx);
});
