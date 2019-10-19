class DOMNodeCollection {
  constructor(collection) {
    this.collection = Array.from(collection);
  }
  html(string) {
    if (!string) return this.collection[0].innerHTML;
    else {
      this.collection.forEach ((el) => {
        el.innerHTML = string;
      })
    }
  }

  empty() {
    this.collection.forEach ((el) => {
      el.innerHTML = "";
    })
  }
  append(content) {
    if (typeof content === "string" || content instanceof DOMNodeCollection || content instanceof HTMLElement) {
      this.collection.forEach ((el) => {
        el.innerHTML += content;
      });
    }
  }
  attr(attrName, val) {
    if (val === undefined) {
      return this.collection[0].getAttribute(attrName);
    }
    else {
      this.collection.forEach ((el)=> {
        el.setAttribute(attrName, val);
      });
    }
  }
  addClass(className){
    this.collection.forEach( (el) => {
      let classes = el.getAttribute("class");
      classes += ` ${className}`;
      el.setAttribute("class", classes)
    });
  }
  removeClass(className){
    this.collection.forEach((el) => {
      let classes = el.getAttribute("class");
      classes = classes.split(" ");
      let removed = classes.filter((el) => el !== className);
      el.setAttribute("class", removed);
      // el.classList.remove(className);
    });
  }

  children() {
    let childArr = [];
    let queue = [];
    for (let i = 0; i < this.collection.length; i++) {
      queue = queue.concat(Array.from(this.collection[i].children));
    }
    let el;
    while (queue.length > 0){
      el = queue.shift();
      queue = queue.concat(Array.from(el.children));
      childArr.push(el);
    }

    return new DOMNodeCollection(childArr);

  }
}

module.exports = DOMNodeCollection;