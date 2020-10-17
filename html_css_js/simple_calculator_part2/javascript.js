// Custom JavaScript
const OPERATORS = ["+", "-", "*", "/"];
// display value
function displayValue(val) {
  let initialVal = document.getElementById("result").value;

  if (initialVal == "") {
    if (OPERATORS.indexOf(val) != -1) {
      return;
    }
  }
  document.getElementById("result").value += val;
}

// evaluates the digit and return result
function solve() {
  let x = document.getElementById("result").value;
  if (x == "") {
    return;
  }
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
