//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/*
INTERFACES - It allow us to do is to connect information. we don't have to copy and paste code over and over again. We can actally access contract
            information through these interface

Interface are similar to abstract contracts and are created using interface keyword.
Key characteristics of an interface.

    Interface can not have any function with implementation.
    Functions of an interface can be only of type external.
    Interface can not have contructor.
    Interface can not have state variables.
    Interface can have enum, struct which can be accessed using interface name dot notation
*/

contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }
}

interface ICounter {
    function count() external view returns(uint);
    function increment() external;
}

contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns(uint) {
        return ICounter(_counter).count();
    }
}


// Exercise Interfaces with Uniswap (Decetralized Exchange)

// A function signature is a combination of a function and the types of parameters it takes, combined together as a string with no spaces.

// interface UniswapV2Factory {
//     function getPair(address tokenA, address tokenB) external view returns (address pair);
// }

// interface UniswapV2Pair {
//     function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
// }

// contract MainContract {
//     address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
//     address dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F; 
    // address weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; 

//     address pair = address(uint(keccak256(abi.encodePacked(
//     hex'ff',
//     factory,
//     keccak256(abi.encodePacked(dai, weth)),
//     hex'96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f'
// ))));

//     function getReserveTokens() external view returns(uint, uint) {
//         address pair = UniswapV2Factory(factory).getPair(dai, weth);
//         (uint reserve0, uint reserve1,) = UniswapV2Pair(pair).getReserves();
//         return(reserve0, reserve1);
//     }
// }


// Exercise with other tokens

interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}

interface UniswapV2Pair {
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract MyContractExecise {

    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address token0 = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
    address token1 = 0x7D1AfA7B718fb893dB30A3aBc0Cfc608AaCfeBB0;

    function getReserveTokens() public view returns(uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(token0, token1);
        (uint reserve0, uint reserve1,) = UniswapV2Pair(pair).getReserves();
        return(reserve0, reserve1);
    }
}
