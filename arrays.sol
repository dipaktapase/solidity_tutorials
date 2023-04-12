//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract LearnArrays {

    uint[] public myArray;
    uint[] public myArray2;
    uint[200] public myFixedSizeArray;

    function push(uint number) public {
        myArray.push(number);
    }

    function pop() public {
        myArray.pop();
    }

    function getLength() public view returns (uint) {
        return myArray.length;
    }

    function remove(uint i) public {
        // When you delete in your array legnth remains the same
        delete myArray[i];
    }
}

contract ExerciseArray {
    uint[] public changeArray;

    function removeElement(uint i) public {
        changeArray[i] = changeArray[changeArray.length -1];
        changeArray.pop();
    }

    function test() public {
  
      // changeArray.push(1);
        // changeArray.push(2);
        // changeArray.push(3);
        // changeArray.push(4);
        for(uint i = 1; i <= 4; i++) {
            changeArray.push(i);
        }

    }

    function getChangeArray() public view returns (uint[] memory){
        return changeArray;
    }

    function getLength() public view returns (uint) {
        return changeArray.length;
    }
}