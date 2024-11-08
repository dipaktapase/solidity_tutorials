// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Tuples allow you to group several variables together, making it easier to return multiple values from a
// function or to store multiple types of data in a single assignment.
// tuples do not need to be of length 2. It can be 3, 4 or even longer.

contract ExampleContract {
    function getTopLeaderboardScore() public pure returns (address, uint256, bool) {
        return (0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045, 100, true);
    }

    function highestScoreIsOver9000() public pure returns (bool) {
        (address leader, uint256 score, bool isTrue) = getTopLeaderboardScore();

        if (score > 9000) {
            return true;
        }

        return false;
    }
}

// Exercise 1
contract Tupledore {
    /* This exercise assumes you know about tuples/struct in solidity.
        1. Create a struct named `UserInfo` with types address and uint256.
        2. Create a variable of type UserInfo, named `userInfo`.
        3. Create a function called `setTuple` that takes in a address and uint256 and sets the all values 
           the `userInfo` variable you created above.
        4. Create a function called `returnTuple`, that returns `userInfo` (as a tuple)
    */

    struct UserInfo {
        address user;
        uint256 Id;
    }

    UserInfo public userInfo;

    function setTuple(address _user, uint256 _id) public {
        userInfo = UserInfo(_user, _id);
    }

    function returnTuple() public view returns (address, uint256) {
        return (userInfo.user, userInfo.Id);
    }
}
