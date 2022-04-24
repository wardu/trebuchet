pragma solidity ^0.6.6;
import "./FlashLoanReceiverBase.sol";
import "./ILendingPoolAddressesProvider.sol";
import "./ILendingPool.sol";

// USING KOVAN NETWORK
// FLASHLOAN _ASSET ADDRESS (DAI) = 0xFf795577d9AC8bD7D90Ee22b6C1703490b6512FD
// LENDING_POOL_ADDRESS_PROVIDER = 0x506B0B2CF20FAA8f38a4E2B524EE43e1f4458Cc5

contract FlashloanV1 is FlashLoanReceiverBaseV1 {

    constructor(address _addressProvider) FlashLoanReceiverBaseV1(_addressProvider) public{}

 function flashloan(address _asset) public onlyOwner {
        bytes memory data = "";
        uint amount = 1000000 * 10**18;

        ILendingPoolV1 lendingPool = ILendingPoolV1(addressesProvider.getLendingPool());
        lendingPool.flashLoan(address(this), _asset, amount, data);
    }

    function executeOperation(
        address _reserve,
        uint256 _amount,
        uint256 _fee,
        bytes calldata _params
    )
        external
        override
    {
        require(_amount <= getBalanceInternal(address(this), _reserve), "Invalid balance, was the flashLoan successful?");

        uint totalDebt = _amount.add(_fee);
        transferFundsBackToPoolInternal(_reserve, totalDebt);
    }

}