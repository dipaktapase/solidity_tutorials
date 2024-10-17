// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IfStatement {
    function max(uint256 a, uint256 b) public pure returns (uint256) {
        // return the maximum of a and b
        uint maxVal;
        if (a > b) {
            maxVal = a;
        } else {
            maxVal = b;
        }
        return maxVal;
    }

    function min(uint256 a, uint256 b) public pure returns (uint256) {
        // return the minimum of a and b
        uint minVal;
        if (a < b) {
            minVal = a;
        } else {
            minVal = b;
        }
        return minVal;
    }
}
