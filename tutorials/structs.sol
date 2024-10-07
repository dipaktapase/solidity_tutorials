//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// Struct are the type that are used to represent a record. Suppose you want to keep track of your movies in a library.
// We can create our own data types

contract learnStruct {

    struct Movie {
        string title;
        string director;
        uint movie_id;
    }

    Movie movie;
    Movie comedy;

    function setMovie() public {
        movie = Movie('Blade Runner', 'Ridley Scott', 1);
        movie = Movie('Escape from New York', 'John Carpenter', 2);
        comedy = Movie('Good Boys', 'Gene stupnitsky', 3);
    }

    function getMovieId() public view returns (uint) {
        // return movie.movie_id;
        return comedy.movie_id;
    }
}