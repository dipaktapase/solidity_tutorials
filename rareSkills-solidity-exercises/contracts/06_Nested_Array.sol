// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleContract {
    function containsAThree(
        uint256[][] calldata nestedArray
    ) public pure returns (bool) {
        for (uint256 i = 0; i < nestedArray.length; i++) {
            for (uint256 j = 0; j < nestedArray[i].length; j++) {
                if (nestedArray[i][j] == 3) {
                    return true;
                }
            }
        }
        return false;
    }
}

// Exercise 1
contract NestedArray {
    uint256[][] public arr;

    function setArr(uint256[][] memory newArr) public {
        arr = newArr;
    }

    /**
     * This function is expected to get the sum of all members of each nested array and finally return the sum of all the nested sums
     * Example: [[1,2], [3,4]] this should return 1 + 2 + 3 + 4 = 10
     */
    function getNestedSum() public view returns (uint256) {
        // your code here
        uint256 sum = 0;

        for (uint256 i = 0; i < arr.length; i++) {
            for (uint256 j = 0; j < arr[i].length; j++) {
                sum += arr[i][j];
            }
        }

        return sum;
    }
}

// Exercise 2
contract TicTacToe {
    /* 
        This exercise assumes you know how to manipulate nested array.
        1. This contract checks if TicTacToe board is winning or not.
        2. Write your code in `isWinning` function that returns true if a board is winning
           or false if not.
        3. Board contains 1's and 0's elements and it is also a 3x3 nested array.
    */

    function isWinning(uint8[3][3] memory board) public pure returns (bool) {
        // your code here
        for (uint256 i = 0; i < board.length; i++) {
            for (uint256 j = 0; j < board[i].length; j++) {
                if (board[i][j] == 1 || board[i][i] == 1 || board[j][j] == 1) {
                    return true;
                } else if (board[j][i] == 1) {}
            }
        }

        return false;
    }
}