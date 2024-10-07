//SPDX-License-Identifier: MIT

pragma solidity >= 0.7.0 < 0.9.0;

contract ThisIsAContract {
    constructor() public {}
    
    function getResult(uint a, uint b) public view returns(uint) {
        uint result = a + b;
        return result;
    }
}

// This is how you write the comments for the single line. 
/* This is how you write the comments for the multile line of information.

    Commenting is very important in programming so that you can understand when you did what and other can understand your code
    that is why write comments for important part of code. So you and any other can know the program that you write.
    */
    