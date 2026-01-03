# Smart Contracts

This directory hosts the core smart contract projects of the Onchain-Proc platform.

## 📂 Structure

- **smartcontracts/**: A vast collection of community-submitted smart contract projects (DeFi, NFTs, DAOs, etc.).
- **multichain_deployment/**: configurations and scripts for deploying contracts across multiple EVM chains (Base, Arbitrum, Optimism, Polymer, etc.).

## 🚀 Getting Started

To explore or work on a smart contract project:

1. **Navigate** to the specific project folder in `smartcontracts/`.
2. **Install dependencies** (most use Hardhat/Foundry).
   ```bash
   npm install
   # or
   forge install
   ```
3. **Compile** the contracts.
   ```bash
   npx hardhat compile
   # or
   forge build
   ```

## 🤝 Contributing

To submit a new smart contract project, please create a new folder in `smartcontracts/` and follow the guidelines in the root [CONTRIBUTING.md](../../.github/CONTRIBUTING.md).

Make sure to include:
- A clear `README.md`
- Unit tests
- Deployment scripts (if applicable)
