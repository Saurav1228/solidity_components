//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import {Unauthorized as u1} from "./timelock.sol" ;

contract con {
    uint  public maxint = type(uint).max;
    address public owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    mapping(address => mapping(address => uint)) public allowance;

    event log(address indexed caller, uint indexed  value);

    receive () payable external {
        // emit log(msg.sender, msg.value);
    }

    fallback () payable external {
        emit log(msg.sender, msg.value);
    }

    uint[] public arra = [1,2,3,4,3];

    enum Status {
        pending,
        shipped,
        accepted, 
        rejected
    }

    struct Info {
        string name;
        address addr;
        uint age;
        bool married;
    }

    Info[] public infos;
    Status public status;
    Info public info;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function getBalance() public view onlyOwner returns (uint) {
        revert u1(msg.sender);
        return address(this).balance;
    }

    function setStatus() public {
        status = Status.accepted;
    }


}
