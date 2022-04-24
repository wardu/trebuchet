# Trebuchet

An Aave flashloan implementation

The quickest way to borrow a million.

This repo is a simple implementation of a flashloan on Aave.
Setup in Remix IDE on the Kovan test-network it will flash-borrow a million ($1'000'000) DAI.

Some prerequisites:
You will need Metamask wallet (https://metamask.io/)
Some test Kovan ETH (https://faucets.chain.link/)
Some test DAI from Aave faucet (https://staging.aave.com/)

1. Load all of contents of the 'Contracts' folder into Remix (https://remix.ethereum.org).
2. Compile 'FlashLoan.sol'
3. Deploy contract using the LENDING_POOL_ADDRESS_PROVIDER
4. Send test-net (Kovan) ETH to the contract
5. trigger the flashloan function (with the flashloan asset address)
6. Visit Etherscan to view the transactions
