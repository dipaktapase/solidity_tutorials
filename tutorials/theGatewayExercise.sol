// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// We can't use external for state variable

contract C {
    uint private data;
    uint public info;

    constructor() {
        info = 10;
    }

    function increment(uint a) private pure returns(uint) {
        return a + 1;
    }

    function updateData(uint a) public {
        data = a;
    }

    function getData() public view returns(uint) {
        return data;
    }

    // By changing visibility to internal we can call this function with inheritance at function level without c.compute => compute(arg1, arg2)
    function compute(uint a, uint b) internal pure returns(uint) {
        return a + b;
    } 

}

contract D {

    C c = new C();

    function readInfo() public view returns(uint) {
        return c.info();
    }

}

contract E is C {

    uint private result;
    C private c;  // This is how we create private var c which inherites the contract C
    // C c = new C();
    
    constructor() {
        c = new C(); // Set var c to a new instance of contract C
    }

    function getComputedResult() public {
        result = compute(23, 5);
    }

    function getResult() public view returns(uint) {
        return result;
    }

    function getInfo() public view returns(uint) {
        return c.info();
    }

}