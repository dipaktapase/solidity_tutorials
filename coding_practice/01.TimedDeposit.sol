// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// It's a basic contract that let user deposit eth in contract and only able to withdraw eth after 5 minutes

contract TimedDeposit {
    mapping(address => uint256) public balances;
    mapping(address => uint256) public depositedTime;

    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than 0");

        balances[msg.sender] += msg.value;

        depositedTime[msg.sender] = block.timestamp;
    }

    function withdraw() public payable {
        require(balances[msg.sender] >= 0, "Insufficient balance");
        require(block.timestamp >= depositedTime[msg.sender] + 5 minutes);

        uint256 amount = balances[msg.sender];

        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }

    fallback() external payable {}

    receive() external payable {}
}
