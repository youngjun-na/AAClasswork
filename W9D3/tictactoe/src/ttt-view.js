class View {
  constructor(game, $el) {
    this.$el = $el;
    this.game = game;
    this.setupBoard();
    this.bindEvents();
    
  }

  bindEvents() {
    let that = this;
    $('li').on('click', function (e) {
      if (!that.game.isOver()) {
        that.makeMove(e.target);
        that.game.playMove($(e.target).data().pos);
      }
      if (that.game.isOver()) {
        if (that.game.winner()) {
          let all = Array.from($('li'));
        
          all.forEach((ele)=> {
            if ($(ele).hasClass(that.game.winner())) {
              $(ele).addClass("winner");
              
            }
            else {
              $(ele).addClass("loser");
            
            }
          });
          $(document.body).append(`<h1>You Won ${that.game.winner()}! </h1>`);
        }
        else {
          $(document.body).append(`<h1>It was a Tie! </h1>`);
        }

      }
      
    });
    
  }

  makeMove($square) {
    console.log($square);
    let marks = ['x', 'o'];
    let mark = this.game.currentPlayer;
    if ($($square).hasClass('x') || $($square).hasClass('o')) alert("Invalid Move");
    else if (mark === 'x') $($square).addClass("x");
    else if (mark === 'o') $($square).addClass("o");

  }

  setupBoard() {
    this.$el.append('<ul>');
    // for (let i = 0; i < 9; i++){
    //   $('ul').append('<li>');
    // }
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let x = $("<li>");
        x.data("pos", [i, j]);
        $('ul').append(x);

    }
  }
}
}

module.exports = View;
