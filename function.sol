pragma solidity >= 0.7.0 < 0.9.0;

/* 
    A function is a group of reusable code which can be called anywhere in your program.
    This eliminates the need of writting the same code again and again.

*/

contract  learnFunction {
    // function function-name(parameter list) scope returns() {
        //statement}
        uint a = 45;
    
    function addValues() public view returns(uint) {
        //uint a = 2;
        uint b = 3;
        uint result = a + b;
        return result;
    }

    function addNewValue() public view returns(uint) {
        uint b = 5;
        uint result = a + b;
        return result;
    }

    function multiplyCalculator(uint a, uint b) public view returns(uint) {
        uint result = a * b;
        return result;
    }

    function dividedCalculator(uint a, uint b) public view returns(uint) {
        uint result = a / b;
        return result;
    }
}