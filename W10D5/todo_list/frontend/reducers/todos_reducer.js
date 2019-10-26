import {RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO} from '../actions/todo_actions';

const initialState = {};

const todosReducer = (state= initialState, action) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state);

  switch (action.type) {
    case (RECEIVE_TODOS): 
      nextState = {};
      action.todos.forEach((todo)=> {
        nextState[todo.id] = todo;
      });
      return nextState;
    case (RECEIVE_TODO):
      nextState[action.todos.id] = action.todos;
      return nextState;
    case (REMOVE_TODO):
      let deleteId = action.todos.id;
      delete nextState[deleteId];
      return nextState; 
    default:
      return state;
  }
};


export default todosReducer;