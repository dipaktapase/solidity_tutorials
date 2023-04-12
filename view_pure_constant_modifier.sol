//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// View function ensure that they will not modify the state (return value)
// Pure function ensure that they will not read or modify the state (return calculations)

contract MyContract {   
    
    uint value;

    // getValue is a read only function
    function getValue() external view returns(uint) {
        return value;
    }

    // setValue modifies the state value
    function setValue(uint _value) external {
        value = _value;
    }

    function multiply() external pure returns(uint) {
        return 3 * 7;
    }

    function valuePlusThree() external view returns(uint) {
        return value + 3;
    }

}