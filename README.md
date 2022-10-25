# EIP-1167

> Minimal Proxy Contract

By standardizing on a known minimal bytecode redirect implementation, this standard allows users and third party tools (e.g. Etherscan) to (a) simply discover that a contract will always redirect in a known manner and (b) depend on the behavior of the code at the destination contract as the behavior of the redirecting contract. Specifically, tooling can interrogate the bytecode at a redirecting address to determine the location of the code that will run - and can depend on representations about that code (verified source, third-party audits, etc). This implementation forwards all calls and 100% of the gas to the implementation contract and then relays the return value back to the caller. In the case where the implementation reverts, the revert is passed back along with the payload data (for revert with message).

[Contract Source](src/PairFactory.sol)
