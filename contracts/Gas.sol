pragma solidity ^0.8.10;

contract Gas {
    uint public i = 0;

    //gasPayment = gas spent * gas price
    //gas spent = total amount of gas used in txn
    //gas price is how much ether you are willing to pay PER gas

    function forever() public { //loop until all the gas is spent and txn fails
        while (true) i += 1; //Do not write unbounded loops to not hit the gas limit
    }
}