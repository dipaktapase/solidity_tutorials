//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/* 
Restricted access to Contract is a common pattern

by default a contract state is read-only unless it is specified as public
We can restrict who can modify the contract's state or call a contract's functions using modifiers

Let's build a contract with modified restricted access with the following common writeouts

    onlyBy - only the mentioned caller can call this function
    onlyAfter - called after certain time period
    costs - call this function only if certain value is provided

*/

contract RestrictedAccess {

    address public owner = msg.sender;
    uint public creationTime = block.timestamp;

    modifier onlyBy(address _account) {
        require(msg.sender == _account,"Sender not authorized");
        _;
    }

    modifier onlyAfter(uint _time) {
        require(block.timestamp >= _time,"Function is called too ealry!");
        _;
    }

    modifier costs(uint _amount) {
        require(msg.value >= _amount,"Not Enough Ether Provided");
        _;
    }

    // write a function that will change the owner address
    function changeOwnerAddress(address _newAddress) onlyBy(owner) public {
        owner = _newAddress;
    }

    // write a function that can disown the current owner
    // only run the function 3 weeks or 5 seconds after the creation of the contract
    function disownCurrentOwner() onlyBy(owner) onlyAfter(creationTime + 5 seconds) public {
        delete owner;
    }

    function forceOwnerChange(address _newOwner) payable public costs(200 ether) {
        owner = _newOwner;
    }
}