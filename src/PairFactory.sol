// SPDX-License-Identifier: MIT

import "/Users/williamphan/Desktop/Developer/eip-1167/lib/openzeppelin-contracts/contracts/proxy/Clones.sol";
import "/Users/williamphan/Desktop/Developer/eip-1167/lib/openzeppelin-contracts/contracts/access/Ownable.sol";

pragma solidity ^0.8.0;

contract PairFactory is Ownable {
    address public master;

    event NewPair(address indexed contractAddress);

    using Clones for address;

    constructor(address _master) {
        master = _master;
    }

    function getPairAddress(bytes32 salt) external view returns (address) {
        require(master != address(0), "master must be set");
        return master.predictDeterministicAddress(salt);
    }

    function createPair(bytes32 salt) external payable {
        master.cloneDeterministic(salt);
    }
}
