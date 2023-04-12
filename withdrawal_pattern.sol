//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract WithdrawalPattern {

    address owner;
    mapping(address => uint) public balance;


    modifier onlyOwner {
        require(owner == msg.sender, "You are not the owner");
        _;
    }
    
    function sendRefund() public onlyOwner returns(bool success) {
        if(!tatiana.send(amount)) {
            // do something with the failure

        }
    }

    // By the customer working directly to claim a refund with their contract address we eliminate outside interference very
    // Key Takeaway - making our tranasctions one at a time we greatly reduce danger to our executions.

    function claimRefunds() public view returns(bool success) {
        require(balance[msg.sender] > 0, "Insufficient Funds");
        msg.sender.transfer(balance[msg.sender]);

    }

    function withdrawalFunds(uint _amount) public returns(bool success) {
        require(balance[msg.sender] >= _amount); // This guards upfronts
        balance[msg.sender] -= _amount; // optimistic accounting
        msg.sender.transfer(_amount); // transfer
        return true;
    }


}

