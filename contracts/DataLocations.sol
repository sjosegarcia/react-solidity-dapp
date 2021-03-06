pragma solidity ^0.8.10;

contract DataLocations {
    /**
        stoage - state variable (stored on blockchain)

        memory - variable on a stack (like when a function is called, that variable is in scope)

        calldata - data location that contains function args only available for external functions.
     */
    uint[] public arr;
    mapping(uint => address) public map;

    struct MyStruct {
        uint foo;
    }

    mapping(uint => MyStruct) public myStructs;
 
    function f() public {
        _f(arr, map, myStructs[1]);

        MyStruct storage myStruct = myStructs[1];

        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {

    }

    function g(uint[] memory _arr) public returns (uint[] memory) {

    }

    function h(uint[] calldata _arr) external {
        
    }

}