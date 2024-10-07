//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/* Inheritance

Inheritance is a way to extend functionality of contract 
Solidity supports single as well as multiple inheritance. 

Observe: The contract in solidity is similar to a Class in C++ - a blueprint for an object

Classes can inherit and so can contracts!

*/

contract A {
    uint innerVal = 120;

    function innerAddTen(uint val) public pure returns(uint) {
        return val + 10;
    }
}

contract B is A {

    function outerAddTen(uint val) public pure returns(uint) {
        // a = new A();
        return A.innerAddTen(val);
    }

    function readInnerVal() public view returns(uint) {
        return A.innerVal;
    }
}