// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract StudentDetails {
    address public admin;

    struct Student {
        string name;
        uint age;
        string major;
    }

    mapping(address => Student) public students;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin () {
     require (msg.sender == admin, "Invalid address");
     _;
    }

    function defaultDetails() public onlyAdmin{
        students[msg.sender] = Student("Ade", 15, "physics");
    }

    function updateDetails(address _address, string memory _name, uint _age, string memory _major) public onlyAdmin{
        students[_address] = Student(_name, _age, _major);
    }

    function updateName(address _address, string memory _name) public onlyAdmin{
        Student storage stud = students[_address];
        if(msg.sender == _address) {
            stud.name = _name;
        }
    }

    function deleteDetails(address _address) public {
        delete students[_address];
    }
}