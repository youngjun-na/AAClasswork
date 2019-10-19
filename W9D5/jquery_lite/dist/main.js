/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n  constructor(collection) {\n    this.collection = Array.from(collection);\n  }\n  html(string) {\n    if (!string) return this.collection[0].innerHTML;\n    else {\n      this.collection.forEach ((el) => {\n        el.innerHTML = string;\n      })\n    }\n  }\n\n  empty() {\n    this.collection.forEach ((el) => {\n      el.innerHTML = \"\";\n    })\n  }\n  append(content) {\n    if (typeof content === \"string\" || content instanceof DOMNodeCollection || content instanceof HTMLElement) {\n      this.collection.forEach ((el) => {\n        el.innerHTML += content;\n      });\n    }\n  }\n  attr(attrName, val) {\n    if (val === undefined) {\n      return this.collection[0].getAttribute(attrName);\n    }\n    else {\n      this.collection.forEach ((el)=> {\n        el.setAttribute(attrName, val);\n      });\n    }\n  }\n  addClass(className){\n    this.collection.forEach( (el) => {\n      let classes = el.getAttribute(\"class\");\n      classes += ` ${className}`;\n      el.setAttribute(\"class\", classes)\n    });\n  }\n  removeClass(className){\n    this.collection.forEach((el) => {\n      let classes = el.getAttribute(\"class\");\n      classes = classes.split(\" \");\n      let removed = classes.filter((el) => el !== className);\n      el.setAttribute(\"class\", removed);\n      // el.classList.remove(className);\n    });\n  }\n\n  children() {\n    let childArr = [];\n    let queue = [];\n    for (let i = 0; i < this.collection.length; i++) {\n      queue = queue.concat(Array.from(this.collection[i].children));\n    }\n    let el;\n    while (queue.length > 0){\n      el = queue.shift();\n      queue = queue.concat(Array.from(el.children));\n      childArr.push(el);\n    }\n\n    return new DOMNodeCollection(childArr);\n\n  }\n}\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./src/dom_node_collection.js\");\n\nwindow.$l = function(arg) {\n  if (typeof arg === \"string\") {\n    return new DOMNodeCollection((document.querySelectorAll(arg)));\n  }\n  // else if (arg instanceof HTMLElement) {\n  else {\n    let collection = new DOMNodeCollection(arg);\n    return collection;\n  }\n};\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });