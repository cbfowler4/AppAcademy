Function.prototype.inherits = function (BaseClass) {
  const Surrogate = function () {};
  // debugger
  Surrogate.prototype = BaseClass.prototype;
  this.prototype = new Surrogate();
  // function Surrogate() {}
  // Surrogate.prototype = BaseClass.prototype;
  // this.prototype = new Surrogate();
  // this.prototype.constructor = this;
};


function MovingObject () {

}
 
MovingObject.prototype.move = function () { 
  console.log("moving!");
};

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);
// const Surrogate = function (name, level) {
//   this.name = name;
//   this.level = level;
// };
// 
// Surrogate.prototype.bark = function () {
//   console.log("bark");
// };
// Surrogate.pizza = 'w/e'
// 
// Animal = {
//   prototype: {
//     move: fn
//     __proto__: Object.prototype
//   }
// }
// 
// Surrogate = {
//   prototype: Animal.prototype
// }
// 
// surr = {
//   bark: fn,
//   __proto__: Surrogate.prototype
// }
// 
// Dog = {
//   prototype: surr,
// }
// 
// dog = {
//   name: 'something',
//   __proto__: Dog.prototype
// }