pragma solidity ^0.8.10;

contract SimpleFaucet {

    function payout(uint256 payoutAmount) public {
        require(payoutAmount <= 100000000000000000, "Supplied an invalid number");
        payable(msg.sender).transfer(payoutAmount);        
    }

    fallback() external payable {}
}