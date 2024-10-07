//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/*

Solidity provides an option to use assembly language to to write inline assembly within solidity source code
Assembly is a low level language that allow you to directly manipulate EVM (more dangerous and not recommended)
EVM = smart contract are not the read code in the blockchain - Solidity code  is complied to a lower level language

*/

contract LearnAssembly {

    function addToEVM() external {
        uint x;
        uint y;
        // uint z = x + y;
    // all of this is complied to low level instructions (opcodes - in total there is around 100)

    assembly {
        // declare an assembly block 
        // inside we can manipulate variable declared outside
        // no semi colon, = is actually := and we can bring in opcodes

        // let z := add(x, y)

        // load data for specific function slot
        // let a :- mload(0x40)

        // store something temporarily to memory
        // mstore(a, 4)

        // persistance storage
        // sstore(a, 100)
    }
    // in EVM everything is stored in the slots of 256 bits (a uint occupies one slot) whereas mapping or array is several
    }

    function addToEVM2() public view returns(bool success) {
        
        uint size;
        address addr;
    
        // check whether an address contains any bytes of code or not 
        assembly {
            size := extcodesize(addr)
        }

        if(size <= 0) {return true;
        } else {
            return false;
        }
    }

    function addToEVM3() external view { 
        bytes memory data = new bytes(10);

        // we can't convert this into fixed size
        // bytes32 dataB32 = bytes32(data);

        // but if we only care about first 32 bytes we can use assembly! :)
        bytes32 dataB32;
        assembly {
            // data points us - bytes in memory is size so data starts at second slot so we add 32 bytes
            dataB32 = mload(add(data, 32))
            // operation add and we add 32 bytes so we fill the firse slot
        }

    }

}