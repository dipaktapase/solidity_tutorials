//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

//  Mapping is a reference type as arrays and struct.
// Mapping allows you to save data and add a key that you specify and then retrive that info later 
// In solidity you can't iterate through map

// Key and Value = Key can be string, uint, bool - value can be anything
// you create a library that has keys and values assigned   

contract learnMapping {

    // mapping(address => uint) public myMap;

    // function getAddress(address _addr) public view returns(uint) {
    //     return myMap[_addr];
    // }

    // function setAddress(address _addr, uint _i) public {
    //     myMap[_addr] = _i;
    // }

    // function removeAddress(address _addr) public {
    //     delete myMap[_addr];
    // }


    // //
    // //

    struct Movie {
        string title;
        string director;
    }

    mapping(uint => Movie) public movie;
    mapping(address => mapping(uint => Movie)) public myMovie;

    function addMovie(uint movie_id, string memory title, string memory director)  public {
        movie[movie_id] = Movie(title, director);
    }

    function addMyMovie(uint movie_id, string memory title, string memory director)  public {
        myMovie[msg.sender][movie_id] = Movie(title, director);
    }


}

