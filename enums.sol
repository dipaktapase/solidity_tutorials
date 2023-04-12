//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// Enum restrict a variable to have one of only a few predefined values. The values in this enumerated list is called enums.
// With the use of enum it is possible to reduce the number of bugs in your code.  

contract enumsLearn {

    enum frenchFriesSize {LARGE, MEDIUM, SMALL}
    frenchFriesSize choice;
    frenchFriesSize constant defaultChoice = frenchFriesSize.MEDIUM;

    function setSmall() public {
        choice = frenchFriesSize.SMALL;
    }

    function getChoice() public view returns(frenchFriesSize) {
        return choice;
    }

    function getDefaultChoice() public view returns (uint) {
        return uint(defaultChoice);
    }
}


contract ShirtEnums {

    enum shirtColor {RED, WHITE, BLUE}
    shirtColor constant defaultChoice = shirtColor.BLUE;
    shirtColor choice;

    function setWhite() public {
        choice = shirtColor.WHITE;
    }

    function getChoice() public view returns (shirtColor) {
        return choice;
    }

    function getDefaultChoice() public pure returns (shirtColor) {
        return defaultChoice;
    }
}