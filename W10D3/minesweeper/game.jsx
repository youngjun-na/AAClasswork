import React from "react";
import * as Minesweeper from "./minesweeper";

class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      board: new Minesweeper.Board()
    };
    this.updateGame = this.updateGame.bind(this);
  }
  updateGame() {

  }
  render() {
    return(
    <div>
        <Board board={this.state.board}
          updateGame={this.updateGame} />
          <div>Hello </div>
    </div>
      
    );
  }
}

export default Game;