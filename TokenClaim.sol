//SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract ClaimToken {
    address public owner;
    uint256 public balance;
    address tokenAddress = //<token contract address> change this to the token address of the token contract

    event TransferSent(address _from, address _destAddr, uint256 _amount);
    event Deposit(address _addr, uint _tokenAmount);

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        require(msg.value > 0, "Invalid Amount");
        balance += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function getAllTokenBalance() public view returns (uint256) {
        return IERC20(tokenAddress).balanceOf(address(this));
    }

    function checkBalance() public view returns (uint256) {
        return IERC20(tokenAddress).balanceOf(address(msg.sender));
    }

//token claim hardcoded tokens

    function claimTST(address _addr, string calldata _passcode, uint _secret, bytes32 _hashValue) public  {
        uint amount = 500 * 10**18;

        bytes32 hashValue2 = keccak256(abi.encode(_addr, _passcode, _secret));

        if (_hashValue == hashValue2) {
            IERC20(tokenAddress).approve(msg.sender, amount);
            IERC20(tokenAddress).transfer(_addr, amount); 
            emit TransferSent(msg.sender, _addr, amount);
            
        } else {
            revert("Claim is invalid");
        }
                                
    }

