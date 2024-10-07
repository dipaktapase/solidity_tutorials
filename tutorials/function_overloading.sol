//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/* You can have multiple defination for the same function name in the same scope
The defination of the function must differ from each other by the type and/or the number of arguments in the argument list.
You cannot overload function declaration that differ only by return type.

*/

contract FunctionOverloading {
    function getSum(uint a, uint b) public pure returns(uint) {
        return a + b;
    }

    function getSum(uint a, uint b, uint c) public pure returns(uint) {
        return a + b + c;
    }

    function getSumTwoArgs() public pure returns(uint) {
        return getSum(2,3);
    }

    function getSumThreeArgs() public pure returns(uint) {
        return getSum(1,2,3);
    }
}