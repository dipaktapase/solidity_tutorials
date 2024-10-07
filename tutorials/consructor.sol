//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// 1. A contract can only have one constructor.
// 2. A constructor code is executed only once when a contract is created and it is used to initialize contract state.
// 3. After a constructor code is executed, the final code is delayed to the blockchahin
// 4. A constructor can be either public or internal.
// 5. An internal contructor marks the contract as abstract.

// In case, no constructor is defined, a default constructor is present in the contract.

contract Member {
    string name;
    uint age;
    
    // initialize name and age upon deployment

    constructor(string memory _name, uint _age) public {
        name = _name;
        age = _age;
    }
}


contract Teacher is Member //('Rachel', 28) 
{
    constructor(string memory _n, uint _a) Member(_n, _a) public {}
    
    function getName() public view returns (string memory) {
        return name;
    }

    function getAge() public view returns (uint) {
        return age;
    }
}

contract Base {
    uint data;
    constructor(uint _data) public {
        data = _data;
    }

    function getData() public view returns (uint) {
        return data;
    }
}

contract Derived is Base (8) {
    
    function getBaseData() public view returns (uint) {
        return data;
    }
}