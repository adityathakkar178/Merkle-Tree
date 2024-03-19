// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract MerkleTree {
    bytes32 public merkleRoot;

    constructor(bytes32 _merkleRoot) {
        merkleRoot = _merkleRoot;
    }

    function isWhiteListed(address _account, bytes32[] calldata _proof) public view returns(bool) {
        bytes32 leave = keccak256(abi.encodePacked(_account));
        return MerkleProof.verify(_proof, merkleRoot, leave);
    }
}