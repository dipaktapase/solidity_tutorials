// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// ------------------------------------- 13. msg.sender and address(this) -------------------------------------

// It will return the test address you are using in remix.
contract ExampleContract {
    function whoami() public view returns (address) {
        address sender = msg.sender;
        return sender;
    }
}

// address(this)
contract ExampleContract2 {
    function whoami() public view returns (address) {
        return address(this);
    }
}

// Exercise 1
contract WhoCalledMe {
    address public caller;

    function callMe() public {
        // use msg.sender to store the address
        // of the person who called this contract
        caller = msg.sender;
    }
}

// ------------------------------------- 14. Constructor -------------------------------------
// constructors cannot return values

contract ExampleContract3 {
    address public banker;

    constructor(address _banker) {
        banker = _banker;
    }
}

// calldata cannot be used in constructor arguments.

contract ExampleContract4 {
    string public name;

    // if you use calldata, it won't compile
    constructor(string memory _name) {
        name = _name;
    }
}

// You may be tempted as a response to just use memory everywhere and not bother to use calldata.
// But it is worth trying to remember this for now, because calldata results in cheaper transactions
// (I.e. lower gas fees for the user).

// Exercise 1
contract Deployer {
    string public greeting;

    /* This exercise assumes you know how constructors works.
    The contract must have a constructor with a string argument
    that sets the greeting variable, if not it reverts. */
    constructor(string memory _greeting) {
        greeting = _greeting;
    }
}

// ------------------------------------- 15. Require -------------------------------------

contract ExampleContract5 {
    function mustNotBeFive(uint256 x) public pure returns (uint256) {
        require(x != 5, "five is not valid");
        return x * 2;
    }
}

// Exercise 1
contract NotEnough {
    /* This exercise assumes you know how require statements works.
    The function below should only be called with a number greater than 10,
    else it reverts. */
    function largeEnough(uint256 _number) external pure {
        // add code here
        require(_number > 10, "Number is not greater than 10");
    }
}

// Exercise 2
contract OnlyOwner {
    /*
        This exercise assumes you know how restrict a function call to an address.
        1. Restrict `updateMagicNumber` function call to only the address
           passed in the constructor.
    */

    address owner;
    uint256 public magicNumber;

    constructor(address _owner, uint256 _magicNumber) {
        owner = _owner;
        magicNumber = _magicNumber;
    }

    function updateMagicNumber(uint256 _number) public {
        require(owner == msg.sender, "You're not the owner");
        magicNumber = _number;
    }
}
