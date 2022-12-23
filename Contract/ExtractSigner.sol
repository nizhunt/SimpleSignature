// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/cryptography/ECDSA.sol";

contract BookRoom {
    using ECDSA for bytes32;
    address immutable HotelAddress;
    mapping(address => uint256) public bookings;

    constructor(address _hotelAddress) {
        HotelAddress = _hotelAddress;
    }

    function bookRoom(uint256 room, bytes calldata signature) external {
        bytes32 hash = keccak256(abi.encodePacked(room));
        address signer = hash.toEthSignedMessageHash().recover(signature);

        if (signer == HotelAddress) {
            // Book the room
            bookings[msg.sender] = room;
        } else {
            // don't book the room
            revert("invalid signature");
        }
    }
}
