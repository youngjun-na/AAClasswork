const DOMNodeCollection = require('./dom_node_collection.js');

window.$l = function(arg) {
  if (typeof arg === "string") {
    return new DOMNodeCollection((document.querySelectorAll(arg)));
  }
  // else if (arg instanceof HTMLElement) {
  else {
    let collection = new DOMNodeCollection(arg);
    return collection;
  }
};
