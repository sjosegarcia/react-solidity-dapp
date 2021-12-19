pragma solidity ^0.8.10;

contract Array {
    //Several ways to initialize an array
    uint[] public arr;
    uint[] public arr2;
    //Fixed sized array, all elements initialize to 0
    uint[10] public myFixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    //Solidity can return the entire array but should be avoided
    //because arrays can group indefinitely in length.
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        //appends to array
        //inc length by 1
        arr.push(i);
    }

    function pop() public {
        arr.pop();//remove last element (stack style)
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        delete arr[index];
    }

    function examples() external pure {
        uint[] memory a = new uint[](5);
    }
}