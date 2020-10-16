// Custom JavaScript
// display value
function displayValue(val) {
  document.getElementById("result").value += val;
}

// evaluates the digit and return result
function solve() {
  let x = document.getElementById("result").value;
  let y = eval(x);
  document.getElementById("result").value = y;
}

// clear the result
function clearResult() {
  document.getElementById("result").value = "";
}

/*
NOTES
- 'document.getElementById()' returns an element object representing the element whose id property matches the specified string.
   Read here https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementById.
- 'eval()' function evaluates JavaScript code represented as String.
  Read here https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval.
*/
