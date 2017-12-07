Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
      callback(this[i]);
  }
};


Array.prototype.myMap = function (callback) {
  const map_arr = [];
  
  this.myEach((el) => {
    map_arr.push(callback(el));
  });
  
  return map_arr;
};


Array.prototype.myReduce = function ( callback, acc ) {
  let arr = this;

  if (acc === undefined) {
    var acc = this[0];
    arr = this.slice(1,this.length);
  }
  // debugger 
  arr.myEach((el) => {
    acc = callback(acc, el);
  });
  return acc;
};