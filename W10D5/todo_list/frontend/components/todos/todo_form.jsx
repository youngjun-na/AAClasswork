import React from "react";

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false,
    };
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.props = props;
  }
  updateTitle(e) {
    this.setState({title: e.target.value});
  }

  updateBody(e) {
    this.setState({ body: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    debugger
    this.props.createTodo(this.state).then(() => this.setState({
      title: "",
      body: "",
      done: false,
    }));
  }
  render() {
    return(
      <form onSubmit={this.handleSubmit}> 
        <label>Title:
          <input type="text" value={this.state.title} onChange={this.updateTitle}/>
        </label>
        <label>Body:
          <input type="text" value={this.state.body} onChange={this.updateBody}/>
        </label>
        <input type="submit" value="Add Todo Item" />
        <div>{this.props.errors}</div>
      </form>
    )
  }
}

export default TodoForm;