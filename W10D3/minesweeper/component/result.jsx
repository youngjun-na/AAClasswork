import React from "react";

const Result = function({over, newGame}) {
  function handleClick(event) {
    newGame(7, 7, 10);
  }
  return(
    <section id="modal" className="modal is-active">
      <article className="modal-content">
        <span className="modal-close js-hide-modal" onClick={handleClick}>×</span>

        <h1> {over === "won" ? "You Won!" : "You Lost!"} </h1>

        <button onClick={handleClick}>Play Again</button> 

      </article>
      <div className="modal-screen js-hide-modal"></div>
    </section>
  )
};

export default Result;
