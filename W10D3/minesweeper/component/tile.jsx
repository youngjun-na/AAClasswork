import React from "react";

const Tile = function({tileObj, updateGame}) {
  let klass = `tile ${tileObj.bombed ? "bombed" : ""} ${tileObj.explored ? "explored" : ""} ${tileObj.flagged ? "flagged" : ""}`
  let tileDisplay = tileObj.flagged ? "✅" : !tileObj.explored ? "⬜" : tileObj.bombed ? "💣" : tileObj.adjacentBombCount() ? tileObj.adjacentBombCount() : ""; 


  function handleClick(event) {
    event.preventDefault();
    console.log(event.type);
    if (event.type === "click") updateGame(tileObj, false);
    else if (event.type === "contextmenu") updateGame(tileObj, true);
  }
  return (
    <div className = {klass} onClick = {handleClick} onContextMenu = {handleClick}>{tileDisplay}</div>
  )
}

   

export default Tile;




// board: Board { gridSize: 5, grid: Array(5), numBombs: 10 }
// bombed: true
// explored: false
// flagged: false
// pos: (2)[1, 2]
