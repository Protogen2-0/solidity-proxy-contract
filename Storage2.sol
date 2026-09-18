// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "contracts/1_Storage.sol";

contract Storage2 is Storage{

    bool public isActive = true;

    function changeVer(string memory newVer) public {
        version = newVer;
    }

    function changeBool(bool newStatus) public {
        isActive = newStatus;
    }

    function getAll() public view returns(uint num, string memory ver, bool IsActive){
        return(number, version, isActive);
    }
    
    function getByteVer(string memory ver) pure public returns(bytes memory){
        return abi.encodeWithSignature("changeVer(string)", ver);
    }

    function getByteBool(bool active) pure public returns(bytes memory){
        return abi.encodeWithSignature("changeBool(bool)", active);
    }

}