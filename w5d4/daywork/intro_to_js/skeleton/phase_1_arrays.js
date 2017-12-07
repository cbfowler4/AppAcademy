Array.prototype.uniq = function () {
  const uniq_arr = [];
  
  this.forEach((el) => {
    if (uniq_arr.includes(el) === false) {
      uniq_arr.push(el);
    }
  });
  
  return uniq_arr;
};


Array.prototype.twoSum = function () {
  const two_sum_arr = [];
  
  for (let i = 0; i < (this.length-1); i++) {
    for (let j = 1; j < this.length; j++) {
      if ((this[i] + this[j]) === 0) {
        two_sum_arr.push([i,j]);
      }
    }
  }
  
  return two_sum_arr;
};

Array.prototype.transpose = function () {
  const trans_arr = [];
  
  
  for (let y = 0; y < (this[0].length); y++) {
    var sub_arr = [];
    for (let x = 0; x < (this.length); x++) {
      sub_arr.push(this[x][y]);
    }
    trans_arr.push(sub_arr);
  }
  return trans_arr;
};



