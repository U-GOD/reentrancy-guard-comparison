// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title NoReentrancy
/// @notice Demonstrates a contract without reentrancy protection
contract NoReentrancy {
    mapping(address => uint256) public balances;

    /// @notice Deposit ETH into the contract
    function deposit() external payable {
        require(msg.value > 0, "Must send ETH");
        balances[msg.sender] += msg.value;
    }

    /// @notice Withdraw your ETH (vulnerable to reentrancy)
    function withdraw() external {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "Nothing to withdraw");

        // Vulnerable part: sending ETH before state update
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdraw failed");

        // Update balance AFTER sending ETH
        balances[msg.sender] = 0;
    }

    /// @notice Check the contract's ETH balance
    function contractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
