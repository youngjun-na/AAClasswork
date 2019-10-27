import { connect } from "react-redux";
import TodoList from "./todo_list";
import { allTodos } from "../../reducers/selectors";
import { removeTodo, createTodo, fetchTodos, updateTodo, deleteTodo } from "../../actions/todo_actions";

const mapStateToProps = (state) => {
  return {
    todos: allTodos(state),
    errors: state.errors.responseJSON
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    fetchTodos: () => dispatch(fetchTodos()),
    removeTodo: (todo) => dispatch(removeTodo(todo)),
    createTodo: (todo) => dispatch(createTodo(todo)),
    updateTodo: (todo) => dispatch(updateTodo(todo)),
    deleteTodo: (todo) => dispatch(deleteTodo(todo))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);