const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin, 
  output: process.stdout
});


const addNumbers = function(sum, numsLeft, completionCallback) {
  if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();
  } else {
    
    console.log(`Sum = ${sum}`);
    
    reader.question('What is your number?', (answer) => {
      let new_sum = sum + parseInt(answer);
      numsLeft--;
      addNumbers(new_sum, numsLeft, completionCallback);
    } );
    
  }
};

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

