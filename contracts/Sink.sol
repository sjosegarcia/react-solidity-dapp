pragma solidity ^0.8.10;

contract Sink {
    // Contract keeps all the funds deposited
    event Received(address, uint);
    receive() external payable { ///for empty calldata and any value
        emit Received(msg.sender, msg.value);
    }

    // fallback external [payable] -- when no other function matches (not even receive)

    //https://ethereum.stackexchange.com/a/81995
}