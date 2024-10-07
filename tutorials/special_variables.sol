//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// Special variable (global variables) are globally available and provides information about the blockchain.
// msg.sender - Sender of the message (Current Call) / It's a person who is the current caller of that is sending message
// msg.value (uint) - Number of wei sent with the message. 
// block.timestamp - Current block timestamp since unix epoch,
// block.number (uint) - Current blokc number

contract LedgerBalance {

    mapping(address => uint) balance;

    function updatesBalance(uint newBalance) public {
        balance[msg.sender] = newBalance;
    }

    function getBalance() public view returns(uint){
        return balance[msg.sender];
    }
}

contract Updated {

    function updatesBalance() public {
        LedgerBalance ledgerBalance = new LedgerBalance();
        ledgerBalance.updatesBalance(40);

    }
}

// Other global variables

contract SimpleStorage {

    uint storedData;

    function set(uint x) public {
        // storedData = x;
        // storedData = block.difficulty;
        // storedData = block.timestamp;
        storedData = block.gaslimit;
    }

    function get() public view returns(uint) {
        return storedData;
    }
}