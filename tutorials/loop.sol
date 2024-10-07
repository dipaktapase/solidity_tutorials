pragma solidity >= 0.7.0 < 0.9.0;

contract LoopContract {

    uint [] public numbersList = [1,2,3,4,5,6,7,8,9,10];

    function checkMultiples(uint _number) public view returns (uint) {
        uint count = 0;
        // 3 parts statement of a for loop
        //1. initialize start a loop
        //2. determine length of loop
        //3. to direct the index after each turn
        for(uint i=1; i<numbersList.length; i++) {
            if(checkMultipleValidity(numbersList[i], _number)) {
                count++;
            }
        }
        return count;
    }

    function checkMultipleValidity(uint _num, uint _nums) public view returns (bool) {
        // Modulo operator = %
        if (_num % _nums == 0) {
            return true;
        } else {
            return false;
        }
    }
}

contract MyLoopingPractice {
    uint [] longList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
    uint [] numbersList = [1,4,34,56];

    function numbersListLoop(uint userNumber) public view returns (bool) {
        bool numberExists = false;
        for(uint i = 0; i < numbersList.length; i++) {
            if(numbersList[i] == userNumber) {
                numberExists = true;
            }
        }
        return numberExists;
    }

    function evenNumbersLoop() public view returns (uint) {
        uint count = 0;

        for(uint i = 0; i < longList.length; i++) {
            if(longList[i] % 2 == 0) {
                count++;
            }
        }
        return count;
    }
}