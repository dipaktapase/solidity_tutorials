// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleContract {
    mapping(uint256 => uint256) public myMapping;

    function setMapping(uint256 key, uint256 value) public {
        myMapping[key] = value;
    }

    function getValue(uint256 key) public view returns (uint256) {
        return myMapping[key];
    }
}

contract ExampleContract2 {
    // returns false by default
    mapping(uint256 => bool) public mapToBool;

    // returns 0 by default
    mapping(uint256 => uint256) public mapToUint;

    // returns 0x0000000000000000000000000000000000000000 by default
    mapping(uint256 => address) public mapToAddress;
}

contract SimpleTransferDemo {
    mapping(address => uint256) public balances;

    function setSomeoneBal(address owner, uint256 amount) public {
        balances[owner] = amount;
    }

    function transferTokenBetween(
        address sender,
        address receiver,
        uint256 amount
    ) public {
        balances[sender] -= amount;
        balances[receiver] += amount;
    }
}

// Mappings can only be declared as storage, you cannot declare them inside a function
// Mappings cannot be iterated over
// Mappings cannot be returned `function wontWork() public view returns (mapping(uint256 => uint256)) {}`

// Exercise
contract SpecialNumbers {
    mapping(uint256 => bool) public isSpecial;

    /**
     * The goal is to use mappings and store if a number is special or not (using booleans)
     */

    /// make @param n special
    function makeNumberSpecial(uint256 n) public {
        // your code here
        isSpecial[n] = true;
    }

    /// make @param n not special
    function makeNumberNotSpecial(uint256 n) public {
        // your code here
        isSpecial[n] = false;
    }

    /// return if a number @param n is special or not
    function isNumberSpecial(uint256 n) public view returns (bool) {
        // your code here
        return isSpecial[n];
    }
}
