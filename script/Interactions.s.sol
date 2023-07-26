// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {BasicNFT} from "../src/BasicNFT.sol";


contract MintBasicNft is Script {
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    uint256 deployerKey;
    address aans = 0x6FC5db1f530f753fB7CE7e8303537F7Aca0B7ad9;

    function run() external {
        // address mostRecentlyDeployedBasicNft = DevOpsTools
        //     .get_most_recent_deployment("BasicNft", block.chainid);
        mintNftOnContract(aans);
    }

    function mintNftOnContract(address basicNftAddress) public {
        vm.startBroadcast();
        BasicNFT(basicNftAddress).mintNft(PUG_URI);
        vm.stopBroadcast();
    }
}
