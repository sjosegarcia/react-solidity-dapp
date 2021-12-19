pragma solidity ^0.8.10;

contract ReadWriteStateVariables {
    uint public num; //state var to store num on blockchain


    //A txn must be sent to write a state var
    function set(uint _num) public {
        num = _num;
    }

    //using "view" instead of "pure" to return value and not allocation
    //A txn is not required to read a state var
    function get() public view returns (uint) {
        return num;
    }
}