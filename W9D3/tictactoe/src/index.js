const View = require('./ttt-view.js');
const Game = require('./game.js');
  $(() => {
    let $el = $('.ttt');
    
    const game = new Game();
    const view = new View(game, $el);
    
   
  });
