pragma solidity ^0.8.10;

contract SimpleStorage {


    struct People {
        uint256 favoriteNumber;
        string name;
    }

    uint256 favoriteNumber;
    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retreive() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256  _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
    }
}
