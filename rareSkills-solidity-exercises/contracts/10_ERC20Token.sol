// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC20Token {
    string public name;
    string public symbol;
    address public owner;
    uint256 public totalSupply;
    uint8 public decimals;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        decimals = 18;

        owner = msg.sender;
    }

    function mint(address _to, uint256 _amount) public {
        require(msg.sender == owner, "Only owner can create token");
        require(totalSupply <= 1000000, "Not allowed to mint more than 1M"); // Exercise: not allowed to mint more than 1M

        totalSupply += _amount;
        balanceOf[_to] = _amount;
    }

    function transfer(address _to, uint256 _amount) public returns (bool) {
        _transfer(msg.sender, _to, _amount);
    }

    function approve(address _spender, uint256 _amount) public returns (bool) {
        allowance[msg.sender][_spender] = _amount;
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) public returns (bool) {
        if (_from != msg.sender) {
            require(allowance[_from][_to] >= _amount, "Insufficient Balance");
            allowance[_from][_to] -= _amount;
        }

        _transfer(_from, _to, _amount);
    }

    function _transfer(
        address _from,
        address _to,
        uint256 _amount
    ) internal returns (bool) {
        require(balanceOf[msg.sender] >= _amount, "Insufficient Balance");
        require(_to != address(0), "Can't send to address(0)");
        balanceOf[_from] -= _amount;
        balanceOf[_to] += _amount;
        return true;
    }
}
