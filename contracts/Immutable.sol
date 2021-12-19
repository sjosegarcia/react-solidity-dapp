pragma solidity ^0.8.10;

contract Immutable {
    address public immutable myADDRESS;
    uint public immutable myUINT;

    constructor(uint _myUint) {
        myADDRESS = msg.sender;
        myUINT = _myUint;
    }
}