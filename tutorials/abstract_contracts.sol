//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/*

Abstract Contracts - It is a one which contains at least one function without any implementation
Such contract is used as a base contract
Generally an abstract contract contains both implemented as well as abstract functions.
Derived contract will implement the abstract function and use the existing function as and when required

*/

// base
contract X {
    
    // Since the function has no implementation we should make it as virtual
    function y() public view virtual returns(string memory) {}
}

// derive
contract Z is X{
    
    function y() public view override returns(string memory) {
        return "Hello";
    }
}

/*****************/

// Technically contract is still abstract since it has at least one function without a body
// base contract
contract Member {

    string name;
    uint age = 38;

    // Because function setName has no body the contract is now abstract
    function setName() public virtual returns(string memory) {} 

    function returnAge() public view returns(uint) {
        return age;
    }
}

// derive contract
contract Teacher is Member {

    function setName() public override pure returns(string memory) {
        return "Gordon";
    }
}

/***********************/


//base contract
abstract contract Calculator {
    // uint result;
    function getResult() public virtual view returns(uint) {}
}

//derived contract
contract Test is Calculator {
    function getResult() public override pure returns(uint) {
        uint a = 1;
        uint b = 2;
        uint result;
        return result = a + b;
    }
}