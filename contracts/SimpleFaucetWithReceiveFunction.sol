pragma solidity ^0.8.10;

contract SimpleFaucetWithReceiveFunction {

    event Received(address, uint);
    
    function payout(uint amount) public {
        require(amount <= 10000000000000000000, "Incorrect input for amount");
        payable(msg.sender).transfer(amount);

    }

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
}