// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";
import "./interfaces/IERC4626.sol";

/**
 * @title UserVault
 * @dev ERC-4626 compliant vault contract for managing user assets
 * @notice This contract implements the ERC-4626 standard for tokenized vaults
 */
contract UserVault is ERC20, IERC4626, Ownable, ReentrancyGuard, Pausable {
    using SafeERC20 for IERC20;

    // Underlying asset token
    IERC20 private immutable _asset;
    IERC20Metadata private immutable _assetMetadata;
    uint8 private immutable _decimals;

    // Factory address for protocol lookups
    address public immutable factory;

    /**
     * @dev Constructor initializes the vault with asset and owner
     * @param asset_ Address of the underlying ERC20 asset
     * @param owner_ Address of the vault owner
     * @param factory_ Address of the VaultFactory contract
     */
    constructor(
        address asset_,
        address owner_,
        address factory_
    ) ERC20("Vault Share", "VSHARE") Ownable(owner_) {
        require(asset_ != address(0), "Asset cannot be zero address");
        require(owner_ != address(0), "Owner cannot be zero address");
        require(factory_ != address(0), "Factory cannot be zero address");

        _asset = IERC20(asset_);
        _assetMetadata = IERC20Metadata(asset_);
        _decimals = _assetMetadata.decimals();
        factory = factory_;
    }

    /**
     * @dev Returns the number of decimals for vault shares
     * @return The number of decimals (matches underlying asset)
     */
    function decimals() public view virtual override(ERC20, IERC20Metadata) returns (uint8) {
        return _decimals;
    }
}

