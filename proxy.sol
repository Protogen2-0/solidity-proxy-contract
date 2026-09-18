// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Proxy{
    
    uint256 public number;
    string public version;
    bool public isActive;

    address owner;
    address implementationAddress;
    
    modifier forOwner(){
        require(msg.sender == owner, "only for owner");
        _;
    }

    constructor(address implAdr){
        owner = msg.sender;
        implementationAddress = implAdr;
    }

    function changeImplimentation ( address newAddress ) public forOwner() {
        implementationAddress = newAddress;
    }

    function changeOwner (address newOwner) public forOwner() {
        owner = newOwner;
    }

    // using callData proxy will call impl function
    function callOtherMethod(bytes memory methodData) public returns(bytes memory){
        (bool success, bytes memory returnData) = implementationAddress.delegatecall(methodData); 
        require(success, "error");
        return returnData;
    }

    // calling impl function in context of impl, should return 0 even if in proxy number is not 0
    function getOtherMethod(bytes memory methodData) view public returns(bytes memory){
        (bool success, bytes memory returnData) = implementationAddress.staticcall(methodData); 
        require(success, "error");
        return returnData;
    }

}