

Array.prototype.bubbleSort = function () {
  let not_sorted = true;
  
  while (not_sorted) {
    not_sorted = true;
    for (let i = 0; i < this.length-1; i++) {
      if (this[i] > this[i+1]) {
        let bigger = this[i];
        let smaller = this[i+1];
        this[i] = smaller;
        this[i+1] = bigger;
        not_sorted = false;
      }
    }
  }
  return this;
};


String.prototype.substrings = function () {
  const arr = [];
  
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length+1; j++) {
      // debugger
      arr.push(this.slice(i,j));
    }
  }
  
  return arr;
};