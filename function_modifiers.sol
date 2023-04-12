//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// Function modifiers are used to modify the behaviour of a function.
// Function modifiers are customizable modification for function.

// is - is a keyword grabbing inheritance from another contract  - Owner

contract Owner {

    // Function modifier
    address owner;
    // When we deploy this contract we want to set the address to the owner (msg.sender)

    // Constructor is a function so we should write the parenthesis
    constructor() public {
        owner = msg.sender;
    }

    // To write a modifier we statically decalre "modifier" keyword and then name it and inside we write logic and modification
    modifier onlyOwner {
        // customizable logic to modify our functions
        // _ = function continueing / 
        require(msg.sender == owner, 'You\'re not the owner');
        _;
        //the underscore continues with the function
    }

    modifier Costs(uint _price) {
        // what msg.value = the amount in wei being sent with a message to a contract
        require(msg.value >= _price);
        _;
    }
}

contract Register is Owner {

    mapping(address => bool) registeredAddresses;
    uint price;

    constructor(uint initialPrice) public {
        price = initialPrice;
    }

    function register() public payable Costs(price){
        registeredAddresses[msg.sender] = true;
    }

    // onlyOwner is our functin modifier that requires only the owner to be able to change the price
    function changePrice(uint _price) public onlyOwner {
        price = _price;
    }
}
