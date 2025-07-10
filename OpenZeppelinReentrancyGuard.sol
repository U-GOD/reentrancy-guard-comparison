// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/// @title OpenZeppelinReentrancyGuard
/// @notice Uses OpenZeppelin's ReentrancyGuard modifier
contract OpenZeppelinReentrancyGuard is ReentrancyGuard {
    mapping(address => uint256) public balances;

    /// @notice Deposit ETH into the contract
    function deposit() external payable {
        require(msg.value > 0, "Must send ETH");
        balances[msg.sender] += msg.value;
    }

    /// @notice Withdraw ETH with nonReentrant modifier
    function withdraw() external nonReentrant {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "Nothing to withdraw");

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdraw failed");

        balances[msg.sender] = 0;
    }

    /// @notice Check the contract's ETH balance
    function contractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
