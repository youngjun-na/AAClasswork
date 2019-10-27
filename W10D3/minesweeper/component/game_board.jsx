import React from "react";
import Tile from "./tile";

class GameBoard extends React.Component {
  constructor(props) {
    super(props);
    console.log(props);
    this.props = props;
  }
  render() {
    return(
      <div className = "board-cont">
        {this.props.board.grid.map((row, idx1)=>{
          let rows = row.map((el, idx2) => {
            return <span key={idx2} > <Tile tileObj = {el} updateGame = {this.props.updateGame}/></span>
          })
          return <div className="board-row" key={idx1}>{rows}</div> ;
          }
        )}
      </div>
    )
  }
}
export default GameBoard;