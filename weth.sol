// SPDX-License-Identifier: MIT
// Executed on VM Berlin

pragma solidity ^0.8.13;

import "@rari-capital/solmate/src/tokens/ERC20.sol";

// import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";

contract WETH is ERC20 {
    event Deposit(address indexed account, uint256 amount);
    event Withdraw(address indexed account, uint256 amount);

    constructor() ERC20("Wrapped Ether", "WETH", 18) {}

    fallback() external payable {
        deposit();
    }

    function deposit() public payable {
        _mint(msg.sender, msg.value);
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) external {
        _burn(msg.sender, _amount);
        payable(msg.sender).transfer(_amount);
        emit Withdraw(msg.sender, _amount);
    }
}
