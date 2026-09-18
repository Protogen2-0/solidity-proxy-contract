// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {

    uint256 public number;
    string public version = "1.0.0";
    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
    
    function getByteStore(uint num) pure public returns(bytes memory){
        return abi.encodeWithSignature("store(uint256)", num);
    }

    function getByteretrieve() pure public returns(bytes memory){
        return abi.encodeWithSignature("retrieve()");
    }
}