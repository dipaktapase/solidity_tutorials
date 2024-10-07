//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/* 
    Libraries are similar to contract but are mainly intended for reuse. A library contains function which other contracts can call.
    Solidity have certain restrictions on use of library. Following are the key characteristics of a Solidity Library :-

    Library function can be called directly if they do not modify the state.
    That means pure and view function can only be called from outside the library.

    Library can not be destroyed as it is assumed to be stateless.
    A library can not have variables.
    A library can not inherite any element.
    A library cannot be inherited.
*/

library Search {
    // We want this loop to return the index value of some integer we are seraching for
    function indexOf(uint[] storage self, uint value) public view returns(uint) {
        for(uint i=0; i<self.length; i++) if(self[i] == value) return i;
    }
}

contract Test {
    // using A (library) for B (another element)
    uint[] data;
    constructor() public {
        for(uint i=1; i<=5; i++) {
            data.push(i);
        }
    }

    function isValuePresent(uint val) public view returns(uint) {
        uint value = val;
        uint index = Search.indexOf(data, value);
        return index;
    }
}

// Exercise 

library Search2 {
    // We want this loop to return the index value of some integer we are seraching for
    function indexOf(uint[] storage self, uint value) public view returns(uint) {
        for(uint i=0; i<self.length; i++) if(self[i] == value) return i;
    }
}

contract Test2 {
    // using A (library) for B (another element)
    using Search2 for uint[];
    uint[] data;
    constructor() public {
        for(uint i=1; i<=5; i++) {
            data.push(i);
        }
    }

    function isValuePresent() public view returns(uint) {
        uint value = 4;
        uint index = data.indexOf(value); // Because of using keyword at the top we don't have to write library name here
        return index;
    }
}