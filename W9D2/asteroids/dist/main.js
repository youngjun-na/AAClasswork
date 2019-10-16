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

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nUtil.inherits(Asteroid, MovingObject);\n\nfunction Asteroid(options) {\n  \n  MovingObject.call(this, {\n    vel: Util.randomVec(3),\n    radius: 2,\n    color: \"black\"\n  }); \n  this.pos = options.pos;\n  this.game = options.game;\n}\n\nAsteroid.prototype.collideWith = function(otherObject) {\n  if (otherObject instanceof Ship) {\n    otherObject.relocate();\n  }\n};\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const DIM_X = 500;\nconst DIM_Y = 500;\nconst NUM_ASTEROIDS = 1;\n\nfunction Game() {\n  this.asteroids = [];\n  while (this.asteroids.length < NUM_ASTEROIDS) {\n    this.asteroids.push(this.addAsteroids());\n  }\n  this.ship = new Ship({pos: Game.randomPosition(), game: this});\n}\n\nGame.prototype.addAsteroids = function() {\n  let new_ast = new Asteroid({pos: Game.randomPosition(), game: this});\n  return new_ast;\n}\n\nGame.randomPosition = function() {\n  return [Math.floor(Math.random()*DIM_X), Math.floor(Math.random()*DIM_Y)];\n}\n// Game.randomPosition = function() {\n//   return [Math.floor(Math.random()*100), Math.floor(Math.random()*100)];\n// }\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0,0,DIM_X,DIM_Y);\n  for (let i=0; i < this.allObjects().length; i++) {\n    this.allObjects()[i].draw(ctx);\n  }\n}\n\nGame.prototype.moveObjects = function() {\n \n  for (let i = 0; i < this.allObjects().length; i++) {\n    debugger\n    this.allObjects()[i].move();\n  }\n};\n\nGame.prototype.wrap = function(pos) {\n  if (pos[0] > DIM_X) pos[0] -= DIM_X;\n  if (pos[0] < 0) pos[0] += DIM_X;\n  if (pos[1] > DIM_Y) pos[1] -= DIM_Y;\n  if (pos[1] < 0) pos[1] += DIM_Y;\n  return pos;\n};\n\nGame.prototype.checkCollisions = function () {\n  for (let i = 0; i < this.allObjects().length; i++) {\n    for (let j = i + 1; j < this.allObjects().length; j++) {\n      if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])) {\n        this.allObjects()[i].collideWith(this.allObjects()[j]);\n      }\n    }\n  }\n};\n\nGame.prototype.step = function() {\n  this.moveObjects();\n  this.checkCollisions();\n}\n\nGame.prototype.remove = function(asteroid) {\n  for (let i = 0; i < this.asteroids.length; i++) {\n    if (this.asteroids[i] === asteroid) {\n      this.asteroids.splice(i, 1);\n    } \n  }\n};\n\nGame.prototype.allObjects = function() {\n\n   let obj = this.asteroids + [this.ship];\n   return obj;\n};\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(ctx) {\n  this.game = new Game();\n  this.ctx = ctx;\n}\n\nGameView.prototype.start = function() {\n  let that = this;\n  setInterval(function () {\n    that.game.step();\n    that.game.draw(that.ctx);\n  }, 10);\n};\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("console.log(\"Webpack is Working!\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\nwindow.GameView = GameView;\nwindow.Game = Game;\nwindow.Ship = Ship;\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n  const canvas = document.getElementById('game-canvas');\n  let ctx = canvas.getContext('2d');\n  const newGame = new GameView(ctx);\n  newGame.start();\n\n\n  // const mo = new MovingObject({\n  //   pos: [30, 30],\n  //   vel: [10, 10],\n  //   radius: 5,\n  //   color: \"#00FF00\"\n  // });\n  // const ast = new Asteroid({ pos: [300, 300]});\n  // console.log(ast);\n  // mo.draw(ctx);\n  // ast.draw(ctx);\n});\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\n\nfunction MovingObject(options) {\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n  this.game = options.game;\n}\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n  ctx.fillStyle = this.color;\n  ctx.fill();\n  ctx.strokeStyle = this.color;\n  ctx.stroke();\n  ctx.closePath();\n  \n};\n\nMovingObject.prototype.move = function() {\n  this.pos[0] += this.vel[0];\n  this.pos[1] += this.vel[1];\n  this.game.wrap(this.pos);\n};\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n  let dist1 = Math.pow(this.pos[0] - otherObject.pos[0], 2); \n  let dist2 = Math.pow(this.pos[1] - otherObject.pos[1], 2); \n  return Math.sqrt(dist1 + dist2) < (this.radius + otherObject.radius)*0.9;\n};\n\nMovingObject.prototype.collideWith = function(otherObject) {\n  // this.game.remove(this);\n  // this.game.remove(otherObject);\n  \n};\n\nmodule.exports = MovingObject;\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nUtil.inherits(Ship, MovingObject);\n\nfunction Ship(options) {\n  MovingObject.call(this, {\n    vel: 0,\n    radius: 10,\n    color: \"red\"\n  });\n  this.pos = options.pos;\n  this.game = options.game;\n}\n\nShip.prototype.relocate = function() {\n  this.vel = 0;\n  this.pos = this.game.randomPosition();\n}\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\nconst Util = {\n  inherits(child, parent) {\n    function Surrogate() {}\n    Surrogate.prototype = parent.prototype;\n    child.prototype = new Surrogate();\n    child.prototype.constructor = child;\n  },\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });