//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// Define fallback function
// 1. Cannot have have (anonymous)
// 2. Does not take any inputs
// 3. Does not return any outputs
// 4. Must be declared as external 

// Send and transfer method recieves 2300 gas but call method recieves more (all of the gas)
contract FallBack {

    event Log(uint gas);

    fallback () external payable{
        // not recommended to write code in here - because the function will fail if it uses too much gas
    
        emit Log(gasleft());
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

// new contract will send to fallback contract which will trigger fallback functions
 
contract SendToFallback {

    function transferToFallback(address payable _to) public payable {
        // send ether with the transfer method 
        // automatically transfer will transfer 2300 gas amount
        _to.transfer(msg.value);
    }

    function callFallBack(address payable _to) public payable {
        // send ether with the call method
        (bool sent,) = _to.call{value: msg.value}('');
        require(sent, 'Fail to send!');
    }
}