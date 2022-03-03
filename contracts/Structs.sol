pragma solidity ^0.8.10;

contract Struct {

    struct Struct {
        string text;
    }

    Struct[] public structs;

    function create(string memory _text) public { //Three ways to initialize a struct
        structs.push(Struct(_text));
        structs.push(Struct({text: _text}));
        Struct memory structz;
        structz.text = _text;
        structs.push(structz);
    }
}