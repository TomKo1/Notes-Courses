var read_line = require('readline-sync');


do {
  var operand1 = read_line.question('Please enter a number: ');
  var operand2 = read_line.question('Please enter another number: ');
  var operation = read_line.question('Enter operation [ + - / * ]: ');
  switch(operation) {
    case "+":
      console.log(Number(operand1) + Number(operand2));
      break;
    case "-":
      console.log(operand1 - operand2);
      break;
    case "/":
      console.log(operand1 / operand2);
      break;
    case "*":
      console.log(operand1 * operand2);
      break;
    default:
      console.log('No such operation!');
  }
} while(operation != 'q');