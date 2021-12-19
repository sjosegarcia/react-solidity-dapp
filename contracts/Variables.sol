pragma solidity ^0.8.10;

contract Variables {
    string public text = "Hello"; //state variable
    uint public num = 123; //state variable

    function doSomething() public {
        uint i = 456; // local
        uint timestamp = block.timestamp;
        address sender = msg.sender;
    }
}