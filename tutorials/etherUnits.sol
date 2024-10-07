//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract learnEtherUnits {

    function test() public {

        // wei is the smallest denomination of ether.
        // 10^18 wei = 1 ether

        // 1 ether = 1e18
        assert(1000000000000000000 wei == 1 ether);
        assert(1 wei == 1);
        assert(1 ether == 1e18);
        assert(2000000000000000000 wei == 2 ether);
        assert(2 ether == 2e18 wei);
    }

    function exercise() public {

        assert(1 minutes == 60 seconds);
        assert(1 hours == 60 minutes);
        assert(24 hours == 1440 minutes);
        assert(1 days == 24 hours);
        assert(1 weeks == 7 days);

        assert(20 == 9 + 11 );
    }
}