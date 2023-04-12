//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract LearnStrings {

    string greetings = 'Hello world,\n It\'s great';

    function sayHello() public view returns(string memory) {
        return greetings;
    }

    function changeGreetings(string memory _change) public {
        greetings = _change;
    } 

    function getChar() public view returns (uint) {
        //bytes is the basic unit of measurement in computer processing
        bytes memory stringToBytes = bytes(greetings); // This is how we convert strings to bytes
        return stringToBytes.length;
    }
}

contract StringPractice {
    string favoriteColor = 'blue';

    function returnStringLiteral() public view returns (string memory) {
        return favoriteColor;
    }

    function changeColor(string memory _color) public {
        favoriteColor = _color;
    }

    function getCharOfColor() public view returns (uint) {
        bytes memory stringToBytesColor = bytes(favoriteColor);
        return stringToBytesColor.length;
    } 
}