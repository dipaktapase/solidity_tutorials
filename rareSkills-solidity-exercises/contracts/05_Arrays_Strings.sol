// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleContract {
    function useArrayForUint256(uint256[] calldata input)
        public
        pure
        returns (uint256[] memory)
    {
        return input;
    }
}

contract ExampleContract2 {
    function helloWorld() public pure returns (string memory) {
        return "Hello, world!";
    }
}

contract ExampleContract3 {
    function useArrays(string calldata user)
        public
        pure
        returns (string memory)
    {
        return string.concat("hello ", user);
    }
}

contract StringContract4 {
    function useArrays(string calldata input) public pure returns (uint256) {
        // return input.length; // does not compile because string does not support .length property
    }
}

contract FizzBuzz {
    function fizzBuzz(uint256 n) public pure returns (string memory) {
        // if n is divisible by 3, return "fizz"
        // if n is divisible by 5, return "buzz"
        // if n is divisible be 3 and 5, return "fizz buzz"
        // otherwise, return an empty string
        if (n % 3 == 0 && n % 5 == 0) {
            return "fizz buzz";
        } else if (n % 5 == 0) {
            return "buzz";
        } else if (n % 3 == 0) {
            return "fizz";
        } else {
            return "";
        }
    }
}

contract SumArray {
    function sumArray(uint256[] calldata arr) public pure returns (uint256) {
        // your code here
        // arr is a list of unsigned integers
        // return the sum of them. If the array
        // is empty, return 0
        uint256 sum = 0;

        for (uint256 i = 0; i < arr.length; i++) {
            sum += arr[i];
        }

        return sum;
    }
}

contract FilterOddNumbers {
    /*
        This exercise assumes you understand how to manipulate Array.
        1. Function `filterOdd` takes an array of uint256 as argument. 
        2. Filter and return an array with the odd numbers removed.
        Note: this is tricky because you cannot allocate a dynamic array in memory, 
              you need to count the even numbers then declare an array of that size.
              [3, 2, 5, 9, 4, 30, 1]
    */

    function filterOdd(uint256[] memory _arr)
        public
        pure
        returns (uint256[] memory)
    {
        uint256 count = 0;
        for (uint256 i = 0; i < _arr.length; i++) {
            if (_arr[i] % 2 == 0) {
                count += 1;
            }
        }

        uint256[] memory newArr = new uint256[](count);
        uint256 index = 0;

        for (uint256 i = 0; i < _arr.length; i++) {
            if (_arr[i] % 2 == 0) {
                newArr[index] = _arr[i];
                index += 1;
            }
        }

        return newArr;
    }
}

contract IsSorted {
    /**
     * The goal of this exercise is to return true if the members of "arr" is sorted (in ascending order) or false if its not.
     */
    function isSorted(uint256[] calldata arr) public pure returns (bool) {
        if (arr.length <= 1) return true;

        // your code here
        for (uint256 i = 0; i < arr.length - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                return false;
            }
        }
        return true;
    }
}

contract Mean {
    /**
     * The goal of this exercise is to return the mean of the numbers in "arr"
     */
    function mean(uint256[] calldata arr) public pure returns (uint256) {
        // your code here
        uint256 sum = 0;
        uint256 count = 0;

        for(uint256 i = 0; i < arr.length; i++ ) {
            sum += arr[i];
            count += 1;
        }

        return sum / count;
    }
}