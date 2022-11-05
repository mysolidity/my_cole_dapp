// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract feelNft is ERC721, Ownable {
    constructor() ERC721("feelNft", "ok") {
        // mint an NFT to i.
        _mint(msg.sender, 10);
    }
    
    uint8 private _value;

    event ValueChanged(uint8 value);

    // The onlyOwner modifier restricts who can call the store function
    function store(uint8 value) public onlyOwner {
        _value = value;
        emit ValueChanged(value);
    }

    function retrieve() public view returns (uint8) {
        return _value;
    }
}