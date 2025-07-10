# 🛡️ Solidity Reentrancy Guard Comparison

This project demonstrates and compares **three contracts** that handle deposits and withdrawals in Solidity, showcasing how different reentrancy protection strategies impact security and gas usage.

---

## 📂 Contracts

### 1️⃣ NoReentrancy.sol
- No protection against reentrancy.
- Vulnerable to reentrancy attacks.
- For educational purposes only.

### 2️⃣ SimpleReentrancyGuard.sol
- Minimal reentrancy guard implemented manually.
- Uses a `status` flag to prevent reentrant calls.
- More gas-efficient than importing external libraries.

### 3️⃣ OpenZeppelinReentrancyGuard.sol
- Industry-standard protection.
- Uses OpenZeppelin’s `ReentrancyGuard`.
- Slightly more gas usage but widely audited and battle-tested.

---

## ⚙️ How to Use

1. **Compile all contracts** in Remix or Hardhat.
2. **Deploy each contract.**
3. **Deposit ETH:**
   - Call `deposit()` and send ETH.
4. **Withdraw ETH:**
   - Call `withdraw()` and observe behavior.

---

## 🧪 Gas Usage Comparison

| Contract                     | Transaction Cost (Deposit) | Execution Cost (Deposit) |
|------------------------------|---------------------------|--------------------------|
| NoReentrancy                 | 43,645                    | 22,581                   |
| SimpleReentrancyGuard        | 43,645                    | 22,581                   |
| OpenZeppelinReentrancyGuard  | 43,645                    | 22,581                   |

> **Note:** In this test scenario (single deposit/withdraw), all variants used similar gas. However, in more complex contracts, OpenZeppelin’s version can be slightly costlier due to additional state variables and modifiers.

---

## 🧠 Why This Matters

Reentrancy is a critical security issue in Solidity. If an attacker manages to re-enter a withdrawal function before the balance is set to zero, they can drain funds. 

**Use cases:**
- Learning how reentrancy attacks work.
- Benchmarking different protection approaches.
- Understanding trade-offs between simplicity, gas costs, and safety.

---

## ✨ Learning Outcomes

✅ Understand how reentrancy works and why it is dangerous.  
✅ Compare minimal custom guards vs. standardized solutions.  
✅ Learn how to measure gas usage in different patterns.

---

## 📚 Further Reading

- [Solidity Docs: Reentrancy](https://docs.soliditylang.org/en/latest/security-considerations.html#re-entrancy)
- [OpenZeppelin ReentrancyGuard](https://docs.openzeppelin.com/contracts/4.x/api/security#ReentrancyGuard)
- [Damn Vulnerable DeFi](https://www.damnvulnerabledefi.xyz/) — practice reentrancy exploits

---

## 🛑 Disclaimer

These contracts are for **educational purposes only**.  
**Never deploy vulnerable or unaudited code to mainnet.**

---
