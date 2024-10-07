//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Coin {

    address public minter;
    mapping(address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor() {
        minter = msg.sender;
    }

    function mint(address reciever, uint _amount) public {
        require(msg.sender == minter, "You're not the owner");
        balances[reciever] += _amount;
    }

    error InsufficientBalance(uint requested, uint available);

    function send(address reciever, uint _amount) public {
        // require(_amount <= balances[msg.sender]);
        if(_amount > balances[msg.sender]) 
        revert InsufficientBalance({
            requested: _amount,
            available: balances[msg.sender]
        });
        balances[msg.sender] -= _amount;
        balances[reciever] += _amount;
        emit Sent(msg.sender, reciever, _amount);
    }
}