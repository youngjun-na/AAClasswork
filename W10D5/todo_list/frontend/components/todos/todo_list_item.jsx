import React from "react";

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = Object.assign({}, props.todo);
    this.handleDelete = this.handleDelete.bind(this);
    this.toggleDone = this.toggleDone.bind(this);
    this.props = this.props;
  };

  handleDelete(e) {
    e.preventDefault();
    this.props.deleteTodo(this.state);
  }

  toggleDone(e) {
    e.preventDefault();
    this.setState({ done: !this.state.done });
    let todo = Object.assign({}, this.props.todo, {done: !this.props.todo.done});
    this.props.updateTodo(todo);
  }
  changeDone() {
    return this.state.done === true ? this.setState({ done: false }) : this.setState({ done: true });
    
  }
  render() {
    return (
      <li> {this.props.todo.title}
        < input type="submit" value="Remove Item" onClick={this.handleDelete} />
        <button onClick = {(e) => this.toggleDone(e) }> { this.props.todo.done ? "Undo" : "Done" } </button>
      </li>
    );
  } 
}

export default TodoListItem;