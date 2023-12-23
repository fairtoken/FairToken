// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Fair is ERC20{
    uint256 public constant MAX_SUPPLY = 10 ** 30;
    uint256 public constant MAX_PER_MINT = 10 ** 24;
    address public devAddr;

    constructor(
        string memory _name,
        string memory _symbol
    ) ERC20(_name, _symbol) {
        devAddr = msg.sender;
    }

    function mint() public {
        if (totalSupply() < MAX_SUPPLY) {
            _mint(msg.sender, MAX_PER_MINT);
            _mint(devAddr, MAX_PER_MINT/10);
        }
    }

    function burn(uint256 _amount) public {
        _burn(msg.sender, _amount);
    }

    function setDev(address _devAddr) public{
        require(msg.sender == devAddr, "not dev");
        devAddr = _devAddr;
    }
}
