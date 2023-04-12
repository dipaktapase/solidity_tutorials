pragma solidity >= 0.7.0 < 0.9.0;

// Variable scope - functions and variables;

// private - You can call the function inside the smart contract
// Internal - Called only within the contract or other contract that inherit that contract
// Internal is slighlty less restrictive than public 
// External - you can call only the function outside the contract not from inside


contract C {

    uint public data = 10;

    function x() external pure returns(uint) {
        uint newData = 25;
        return newData;
    }

    function y() public view returns(uint) {
        return data;
    }
}