// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@aave/core-v3/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract FlashLoanExample is FlashLoanSimpleReceiverBase {
    using SafeMath for uint256;

    event Log(address asset, uint256 val);

    constructor(IPoolAddressesProvider provider)
        public
        FlashLoanSimpleReceiverBase(provider)
    {}

    // Call this Function to initialize the loan
    function createFlashLoan(address asset, uint256 amount) external {
        address receiver = address(this);
        bytes memory params = "";
        uint16 referralCode = 0;

        POOL.flashLoanSimple(receiver, asset, amount, params, referralCode);
    }

    // If the above function executed properly, AAVE contract
    // has sent the asset in our contract

    // AVVE contract calls this function after sending the amount
    // Do anything with the money in this function and return at the end of the function
    function executeOperation(
        address asset,
        uint256 amount,
        uint256 premium,
        address initiator,
        bytes calldata params
    ) external returns (bool) {
        // do things like arbitrage, liquidation, etc
        // abi.decode(params) to decode params
        uint256 amountOwing = amount.add(premium);
        IERC20(asset).approve(address(POOL), amountOwing);
        emit Log(asset, amountOwing);
        return true;
    }
}
