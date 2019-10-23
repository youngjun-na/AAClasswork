import React from "react";
import {Board} from "./minesweeper";
import GameBoard from "./game_board";
import Result from "./result";


class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      board: new Board(8, 8, 10),
      over: ""
    };
    this.updateGame = this.updateGame.bind(this);
    this.newGame = this.newGame.bind(this);
  }
  updateGame(tile, flag) {
    
    if (!tile.explored && flag === true) tile.toggleFlag();
    console.log(tile);
    if (!tile.explored && !flag) tile.explore();
    this.setState({board: this.state.board});
    if (this.state.board.lost()) {
      this.setState({ over: "lost" });
    } 
    else if (this.state.board.won()) {
      this.setState({over: "won"});
    }
  }
  handleClick(event, row, col, bombs) {
    event.preventDefault();
    this.newGame(row, col, bombs);
  }
  newGame(row, col, bomb) {
    this.setState({board: new Board(row, col, bomb), 
    over: ""});
  }
  render() {
    return(
    <div class="hey">
      <h1>MineSweeper!</h1>
      <div className="game">
        
     
        <GameBoard board={this.state.board}
          updateGame={this.updateGame} />
        {this.state.over ? <Result over={this.state.over} newGame={this.newGame} /> : ""}
        <div className="break"></div>

      </div>
        <div className="difficulty">Difficulty:
        <button onClick={(e) => this.handleClick(e, 8, 8, 10)} >Beginner </button>
          <button onClick={(e) => this.handleClick(e, 16, 16, 40)} >Intermediate </button>
          <button onClick={(e) => this.handleClick(e, 16, 30, 99)} >Expert </button>
        </div>
    </div>
    
      
    );
  }
}

export default Game;