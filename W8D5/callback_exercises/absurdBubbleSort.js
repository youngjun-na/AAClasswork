const readline = require('readline');
reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps=true) {
    if (madeAnySwaps) {
      
    }
  }
}

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} >= ${el2}?`, (res) => {
    if (res === "yes") callback(true);
    else callback(false);
  })
}
// askIfGreaterThan(5, 2, el=>console.log(`this is ${el}`))

function innerBubbleSortLoop(arr, i, madeAnySwaps) {
  if (i === (arr.length - 1)) {
    console.log("outer loop here");
  }
  else if (i < arr.length - 1)  {
    askIfGreaterThan(arr[i], arr[i+1], isGreaterThan => {
      if (isGreaterThan === true) {
        let x = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = x;
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i+1, madeAnySwaps)
    })
  }
  console.log(arr);
}

innerBubbleSortLoop([1, 2, 5, 4, 3], 0, false);
// reader.question(`Enter a number:`, (number) => {
//   num = parseInt(number);
//   sum += num;
//   // console.log(sum);
//   numsLeft -= 1;
//   addNumbers(sum, numsLeft, completionCallback);
// })