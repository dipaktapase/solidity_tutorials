//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/* 
Abstraction - Decentralized Exchange: on a smart contract traders can trade a tokens - from the smart contract emit an event
they can get the data (Web from moble)

After emitting events you can't read them in the past only for entities outside of the blockchain - not stored as memory
events have lowe gas cost than storage


*/

contract LearnEventsAdvance {
    // 1. Declare the event 
    // 2. We want to emit the event

    // CamelCase is a good conviction - start with capital letter
    // indexed -  It allows consumer filter out and get the information that they need
    // You can only use 3 indexed per event and it is const higher
    event NewTrade(
        uint indexed date, 
        address from,
        address indexed to,
        uint indexed amount
    );

    function trade(address to, uint amount) external {
        // outside consumer can see the event through web3js
        // block.timestamp is a special variable that gives the current timestamp
        emit NewTrade(block.timestamp, msg.sender, to, amount);
    }

}