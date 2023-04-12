//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/* A cryptographic hash function (CHF) is a mathematical algorithm that maps data of arbitrary size (often called the 'message')
to a bit array of fixed size ( the "hash value", "hash" or "message digest" ).

It is a one way function, that is, a function which is practically infeasible to invert or reverse the computation.

Keccak256(bytes memory) returns(bytes32) - compute the keccak256 hash of the input
*/

/* Oracle is database management system is not only used for storing the data but to effective manage
 it and provide high performance, autorized access and failure recovery feature
*/

contract Oracle {

    address admin;
    uint public rand;

    constructor() public {
        admin = msg.sender;
    }

    function feedRand(uint _value) external {
        require(msg.sender == admin, "You are not the owner");
        rand = _value;
    }
}

contract GenerateRandomNumber {

    // Build a random number generator which takes an input range and uses cryptographic hashing
    // module(%) - so by computing against remainder we will able to produce a random number within a range
    // Cryptographic hashing

    Oracle oracle;

    constructor(address _oracleAddress) {
        oracle = Oracle(_oracleAddress);
    }   

    function randMod(uint range) external view returns(uint) {
       // Grab information from the blockchain randomly to generate random number - we need something dynamically changing
       // abi.encodePacked concatonates arguments nicely
       return uint(keccak256(abi.encodePacked(oracle.rand, block.timestamp, block.difficulty, msg.sender))) % range;     
    }

}
