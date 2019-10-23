class Store {
  constructor(rootReducer) {
    this.rootReducer = rootReducer;
    this.state = {};
  }
  getState() {
    return Object.assign({},this.state);
  }
}