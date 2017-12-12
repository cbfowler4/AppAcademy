const sum = function (){
  let sum = 0;
  for (let i = 0; i < arguments.length; i++) {
    sum += arguments[i];
  }
  return sum;
};

const sum2 = function (...args){
  let sum = 0;
  for (let i = 0; i < args.length; i++) {
    sum += args[i];
  }
  return sum;
};





// Function.prototype.myBind = function () {
//   let args = Array.from(arguments);
//   return (...callArgs) => {
//     // let new_args = Array.from(...callArgs);
//     debugger
//     this.call(...args, ...callArgs);
//   };
// };







class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

Function.prototype.myBind = function () {
  const bindTimeArgs = Array.from(arguments);
  const ctx = bindTimeArgs.shift();
  const that = this;
  return function() {
    const newArgs = Array.from(arguments);
    that.apply(ctx, bindTimeArgs.concat(newArgs));
  };
};
markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBind(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow", "me");
// Breakfast says meow to me!
// true


const curriedSum = function (numArgs) {
  const numbers = [];
  let sum = 0;
  const _curriedSum = function (num) {
    numbers.push(num);
    console.log(`this is the sum ${sum}`);
    console.log(numbers);
    if (numbers.length === numArgs) {
      for (let i = 0; i < numbers.length; i++) {
        sum += numbers[i];
      }
      return sum;
    }
    return _curriedSum;
  };
  return _curriedSum;
};


Function.prototype.curry = function (numArgs) {
  let args = [];
  const that = this;
  
  const _curry = function () {
    args = args.concat(Array.from(arguments));
    
    if (args.length === numArgs) {
      return that.call(that, ...args);
    }  
    return _curry;
  };
  return _curry;
};

const superSum = function (arg1, arg2, arg3) {
    return arg1 + arg2 + arg3; 
};
