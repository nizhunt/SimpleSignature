// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/cryptography/ECDSA.sol";

    contract AccessControl {
    using ECDSA for bytes32;

    function getSigner(
        uint256 passcode,
        string calldata secretMessage,
        bytes calldata signature
    )
        external
        pure
        returns(address signer)
    {

        bytes32 hash = keccak256(abi.encodePacked(passcode, secretMessage));
        signer = hash.toEthSignedMessageHash().recover(signature);
        
    }

}