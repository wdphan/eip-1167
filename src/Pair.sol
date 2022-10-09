// SPDX-License-Identifier: MIT

import "/Users/williamphan/Desktop/Developer/eip-1167/lib/openzeppelin-contracts/contracts/proxy/utils/Initializable.sol";
import "/Users/williamphan/Desktop/Developer/eip-1167/lib/openzeppelin-contracts/contracts/access/Ownable.sol";

pragma solidity ^0.8.0;

contract Pair is Ownable, Initializable {
    address private deployer;
    address[] private tokens;

    constructor() {
        deployer = msg.sender;
    }

    function initialize(address _tokenA, address _tokenB) public initializer {
        require(
            _tokenA != address(0) && _tokenB != address(0),
            "TokenA and TokenB must be set"
        );
        tokens = [_tokenA, _tokenB];
    }

    function getPair() external view returns (address[] memory) {
        return tokens;
    }
}
