//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/* 

Cybersecurity in solidity - against bad actors and acidental occurences

Withdrawal pattern ensure that direct transfer call is not made which poses a security threat.
Transfer are atomic (meaning all or nothing)



// Iteration function means = adding for loop and intialize it in function

contract Test {

    address owner;

    modifier OnlyOwner {
        require(owner == msg.sender, "You are not the owner!");
        _;
    }

    function returnFunds() public OnlyOwner returns(bool success) {
        for(uint i=0; funders.lenght; i++) {
            funders[i].transfer(contributedAmount);
        }
        return true;
    }

    fallback() public {}

// A default fallback function is not payable - It will reject funds.
// If one contract has a default fallback function it would be deadly for the naive contract to refund his contract address - 
// it will not work unless everyone accepts. It will fail.

}
*/

contract Victim {

    function isItAContract() public view returns(bool) {

        uint32 size;
        address a = msg.sender;
        // inline assembly accesses EVM Ethereum Virtual Machine at a low level
        assembly {
        // extcodesize retrives size of the code
            size := extcodesize(a)
        }
        return(size > 0);
    }
}

contract Attacker {

    bool public trickedYou;
    Victim victim;

    constructor(address _v) public {
        victim = Victim(_v);
        trickedYou = !victim.isItAContract();
    } 
}