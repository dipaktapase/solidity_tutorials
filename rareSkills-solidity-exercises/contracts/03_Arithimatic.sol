// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Arithmetic {
    uint256 public sum = 10 + 5; // sum == 15

    uint256 public x = 1;
    uint256 public y = 2;

    uint256 public anotherSum = x + y; // anotherSum == 3

    uint256 public exp = 2**3; // exp == 8

    uint256 public publicremainder = 10 % 4; // remainder == 2 // modulus

    // Solidity does not have floats

    uint256 public interest = 200 * 0.1; // fails, 0.1 is not valid

    uint256 public interest2 = 200 / 10;

    uint256 public interest3 = (200 * 75) / 1000;

    // Note: Why doesn’t solidity support floats? Floats are not always deterministic, 
    // and blockchains must be deterministic otherwise nodes won’t agree on the outcomes of transactions. 
    // For example, if you divide 2/3, some computers will return 0.6666, and others 0.66667. 
    // This disagreement could cause the blockchain network to split up! Therefore, solidity does not allow floats.

    function calculateInterest(uint256 _amount, uint256 _percent) public pure returns(uint256) {
        return (_amount * _percent) / 100;
    } 
    
}
