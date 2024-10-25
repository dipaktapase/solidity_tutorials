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

// Nested Mappings

contract ExampleContract3 {
    mapping(uint256 => mapping(uint256 => uint256)) public nestedMap;

    function setNestedMap(
        uint256 key1,
        uint256 key2,
        uint256 finalValue
    ) public {
        nestedMap[key1][key2] = finalValue;
    }

    function getNestedMap(uint256 key1, uint256 key2)
        public
        view
        returns (uint256)
    {
        return nestedMap[key1][key2];
    }
}

// You cannot iterate over the keys, declare them inside a function, or return them from a function.

// Public Nested Mappings Don’t Work:- Solidity automatically creates getting functions for variables when you declare them as public.
// However, the public getter functions allow you to supply the necessary arguments.
// The solution is to make nested mappings private and wrap them in a public function that gets their value.

// Exercise 1
contract NestedMapping {
    /* This exercise assumes you know how nested mappings work.
        1. Create a public nested mapping of (address => uint256 => bool).
        2. The name of the mapping must be `nestedBool`
        3. Set the boolean value of the arguments to `true` in the 'setNestedDetails' function
        4. use the 'returnNestedDetails' function to return the values of a nested data
    */
    mapping(address => mapping(uint256 => bool)) public nestedBool;

    function setNestedDetails(address _addr, uint256 _num) public {
        // your code here
        nestedBool[_addr][_num] = true;
    }

    function returnNestedDetails(address _addr, uint256 _num)
        public
        view
        returns (bool)
    {
        // your code here
        return nestedBool[_addr][_num];
    }
}

// Exercise 2
contract TripleNestedMapping {
    /* 
        This exercise assumes you know how mappings work.
        1. Create a public TRIPLE nested mapping of 
           (string(_name) => uint256(_password) => uint256(_pin) => bool).
        2. The name of the mapping must be `isLoggedIn` and it should be public.
        3. Set the boolean value of the arguments to `true` in the 'setLogin' function.
    */
    mapping(string => mapping(uint256 => mapping(uint256 => bool)))
        public isLoggedIn;

    function setLogin(
        string memory _name,
        uint256 _password,
        uint256 _pin
    ) public {
        // your code here
        isLoggedIn[_name][_password][_pin] = true;
    }
}
