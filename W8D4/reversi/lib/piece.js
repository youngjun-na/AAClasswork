/**
 * Initializes the Piece with its color.
 */
function Piece (color) {
  this.color = color;
}

/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {
  if (this.color === 'white') {
    this.color = 'black';
  }
  else if (this.color === 'black') {
    this.color = 'white';
  }
};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
  this.oppColor();
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {
  if (this.color === 'black') return "B";
  else if (this.color === "white") return "W";

};

module.exports = Piece;

// if (!piecesToFlip) {
//   piecesToFlip = [];
// }
// else {
//   piecesToFlip.push(board.getPiece(pos));
// }
// let nextPos = [pos[0] + dir[0], pos[1] + dir[1]];


// if (!board.isValidPos(nextPos)) return null;

// if (!board.isOccupied(nextPos)) return null;

// if (board.getPiece(nextPos).color === color) {
//   if (piecesToFlip.length === 0) {
//     return null;
//   }
//   else {
//     return piecesToFlip;
//   }
// }
// return _positionsToFlip(board, nextPos, color, dir, piecesToFlip);