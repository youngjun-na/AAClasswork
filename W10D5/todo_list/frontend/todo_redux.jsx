import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import {receiveTodo, removeTodo, fetchTodos} from './actions/todo_actions';
import Root from "./components/root";
import {allTodos} from "./reducers/selectors";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.removeTodo = removeTodo;
  window.allTodos = allTodos;
  window.fetchTodos = fetchTodos;
  ReactDOM.render(<Root store = {store}/>, root)
});