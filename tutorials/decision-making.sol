pragma solidity >= 0.7.0 < 0.9.0;

contract DecesionMaking {
    
    uint oranges = 4;

    function validateOranges() public view returns(bool) {
        if(oranges == 4) {
            return true;
        }
    }

    uint stakingWallet = 8;

    function airDrop() public view returns(uint) {
        if(stakingWallet == 10) {
            return stakingWallet + 10;
        } else {
            return stakingWallet + 1;
        }
    }
}