# Flash Loans :money_mouth_face:
> WAGMI, Keep Buidling! :hammer_and_wrench:

## Loans with no Collaterals :bar_chart:

![](https://i.imgur.com/HZQWDCW.png)

## What are Flash Loans?

As you might be thinking its some kind of loan? Well yes it is. Its a special type of a loan where a borrower can borrow an asset as long as they return the borrowed amount and some interest before the end of the transaction. Since the borrowed amount is returned back, with interest, in the same transaction, there is no possibility for anyone to run away with the borrowed money. If the loan is not repaid in the same transaction, the transaction fails overall and is reverted.

## Use Cases:

* Arbitrage
* Liquidation
* Defi Hacks :sweat_smile:

## How do Flash Loans work? :mag_right:

There are 4 basic steps to any flash loan. To execute a flash loan, you first need to write a smart contract that has a transaction that uses a flash loan. Assume the function is called createFlashLoan(). The following 4 steps happen when you call that function, in order:

* Your contract calls a function on a Flash Loan provider, like Aave, indicating which asset you want and how much of it
* The Flash Loan provider sends the assets to your contract, and calls back into your contract for a different function, executeOperation
* executeOperation is all custom code you must have written - you go wild with the money here. At the end, you approve the Flash Loan provider to withdraw back the borrowed assets, along with a premium
* The Flash Loan provider takes back the assets it gave you, along with the premium.


<!-- Markdown link & img dfn's -->
[wiki]:  https://www.learnweb3.io/tracks/senior
