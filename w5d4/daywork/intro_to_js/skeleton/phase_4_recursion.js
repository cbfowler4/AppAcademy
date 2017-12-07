function range(start, end) {
  
  if (start === end) {
    return end;
  }
  
  var arr = [start].concat(range(start+1, end));
  return arr;
}


function sumRec(arr) {
  if (arr.length === 1) {
    return arr[0];
  }
  
  var sum = arr[0] + sumRec(arr.slice(1, arr.length));
  return sum;
}

function exponent(base, exp) {
  if (exp === 1) {
    return base;
  }
  
  let ans = base * exponent(base,exp-1);
  return ans;
}

function fib(n) {
  if (n === 2) {
    return [0, 1];
  }
  
  let fib_arr = fib(n-1);
  let ans = fib_arr.concat(fib_arr[n-2]+fib_arr[n-3]);
  
  return ans;
}


function bsearch(arr, target) {
  let mid = Math.floor(arr.length/2);
  if (arr[mid] === target) {
    return mid;
  } else if (arr.length <= 1) {
    return -1;
  }
  
  let left = arr.slice(0, mid);
  let right = arr.slice(mid+1, arr.length);
  if (arr[mid] > target) {
    return bsearch(left, target);
  } else {
    let ans = bsearch(right, target);
    if (ans === -1) { 
      return ans;
    }
    return (ans + mid + 1);
  }
  
}


function mergesort(arr) {
  let mid = Math.floor(arr.length/2);
  if (arr.length <= 1) {
    return arr;
  }
  
  let left = arr.slice(0, mid);
  let right = arr.slice(mid, arr.length);

  return merger(mergesort(left), mergesort(right));
}

function merger(left, right) {
  let merged = [];
  
  while ((left.length > 0) && (right.length > 0)) {
    if (left[0] > right[0]) {
      merged.push(right.shift());
    } else {
      merged.push(left.shift());
    }
  }
  
  return (merged.concat(left).concat(right));
}




function subset(arr) {
  if (arr.length <= 1) {
    return [arr]; 
  }
  
  var sub_arr = [];
  
  for (let i = 0; i < arr.length; i++) {
    sub_arr.push(arr.slice(0, i+1));
  }
  
  return sub_arr.concat(subset(arr.slice(1, arr.length)));
  
}














