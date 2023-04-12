//SPDX-License-Identifier: MIT
pragma solidity <0.7.0 <= 0.9.0;

contract Auction {
    address payable public beneficiary;
    uint public auctionEndTime;
    address public  highestBidder;
    uint public highestBid;
    bool ended;

    event highestBidIncreased(address bidder, uint amount);
    event auctionEnded(address payablewinner, uint amount);

    mapping(address => uint) pendingReturns;

    constructor(uint _biddingTime, address payable _beneficiary ) public {
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
    }

    function bid() public payable {

        if(block.timestamp >= auctionEndTime) revert("The auction has ended!");
        if(msg.value <= highestBid) revert("Sorry, Bid is not enough high!");
        if(highestBid !=0) {
            pendingReturns[highestBidder] += highestBid;
        }
        highestBidder = msg.sender;
        highestBid = msg.value; 
        emit highestBidIncreased(msg.sender, msg.value);        
    }

    // Withdraw bids that were overbid
    function withdraw() public payable returns(bool success) {
        uint amount = pendingReturns[msg.sender];
        if(amount > 0) {
            pendingReturns[msg.sender] = 0;
        }

        if(!payable(msg.sender).send(amount)) {
            pendingReturns[msg.sender] = amount;
        }
        return true;
    }

    function auctionEnd() public {
        if(block.timestamp < auctionEndTime) revert("The auction has not ended yet!");
        if(ended) revert("The auction is already over");
        ended = true;
        emit auctionEnded(highestBidder, highestBid);
        beneficiary.transfer(highestBid);
    }
}