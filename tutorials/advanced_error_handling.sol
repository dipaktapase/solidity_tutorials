//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/*
ERROR HANDLING

Solidity has function that help with error handling 
A way of tackling this is that when an error happens, the state reverts back to its original state
Below are some of the important method for error handling

    assert(bool condtion) - In case condition is not met, this method can call causes on 
    invalid opcodes and any changes done to state got reverted. This method is to be used for internal errors.
    //We use assert in the sense things should never happens.

    require(bool condtition) - In case condition is not met, this method call reverts to original state.
    - This method is to be used for errors in inputs or external components.

    require(bool condition, string memory response) - In case condition is not met. this method call reverts to original state.
    - This method is to be used for errors in inputs or external components. It provides an option to provide a custom message.

    revert() - This method aborts the execution and revert any changes due to the state.

    revert(string memory response) - This method aborts the execution and reverts any changes done to the state.
    It provides an option to provide custom message.
*/

contract LearnErrorHandling {

    bool public sunny = true;
    bool public umbrella = false;
    uint finalCalc = 0;

    // Solar panel machine
    function solarCal() public {
        require(sunny, "The weather is not sunny today!");
        finalCalc += 3;
        assert(finalCalc != 6); // This is how we use assert function
    }

    // final can never equal to 6
    function internalTestUnits() public {
        assert(finalCalc != 6);
    }

    function weatherChanger() public {
        sunny = !sunny;
    }

    // Grab final cal
    function finalCal() public view returns(uint) {
        return finalCalc;
    }

    function bringUmbrella() public {
        if(!sunny) { 
            umbrella = true;
        } else {
            revert("No need to bring an umbrella today!");
        }
    }
}

contract Vendor {

    address seller;

    modifier onlySeller {
        require(seller == msg.sender, "Only the seller can sell this!");
        _;
    }

    function becomeSeller() public {
        seller = msg.sender;
    }

    function sell(uint amount) public payable onlySeller {
        if(amount > msg.value) {
            revert("There is not enough ether provided!");
        }
    }
}


