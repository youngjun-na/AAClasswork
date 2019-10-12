const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

function addNumbers(sum=0, numsLeft, completionCallback) {
  if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();
  }
  if (numsLeft > 0) {
    reader.question(`Enter a number:`, (number) => {
      num = parseInt(number);
      sum += num;
      // console.log(sum);
      numsLeft -= 1;
      addNumbers(sum, numsLeft, completionCallback);
    })
  }
}
addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));