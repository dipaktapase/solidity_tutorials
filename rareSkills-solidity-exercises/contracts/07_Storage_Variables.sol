// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleContract {
    uint256 internal x;

    function setX(uint256 newValue) public {
        x = newValue;
    }

    function getX() public view returns (uint256) {
        return x;
    }
}

// Note that If variable x itself has the modifier `internal`. This means other smart contracts cannot see the value.

// Storage variables are declared outside of functions
// Public functions that do not have a view or pure modifier can change storage variables
// Pure functions cannot access storage variables

// Exercise 1

contract PublicVariable {
    // change this code so this number
    // is visible outside the contract
    uint256 public number = 42;
}

// Exercise 2
contract BasicStorage {
    uint256 private x;

    function setX(uint256 newValue) public {
        // your code here
        x = newValue;
    }

    function getX() public view returns (uint256) {
        // your code here
        return x;
    }
}

// Exercise 3
contract PublicFunction {
    // change this code so this function
    // is callable outside the contract
    function magicNumber() public pure returns (uint256) {
        return 42;
    }
}

// Exercise 4
contract PureVsView {
    uint256 private x = 24;
    uint256 private y = 42;

    // this code does not compile. Change it so
    // that it compiles.
    function getX() public view returns (uint256) {
        return x;
    }

    function getY() public view returns (uint256) {
        return y;
    }
}
