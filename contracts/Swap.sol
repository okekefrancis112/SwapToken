// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/IERC20.sol";

contract TokenSwap {
    IERC20 public token1;
    address public owner1;
    uint public amount1;
    
    IERC20 public token2;
    address public owner2;
    uint public amount2;
    uint public rate;

    // constructor(
    //     address _token1,
    //     address _owner1,
    //     uint _amount1,
    //     address _token2,
    //     address _owner2,
    //     uint _amount2
    // ) {
    //     token1 = IERC20(_token1);
    //     owner1 = _owner1;
    //     amount1 = _amount1;
    //     token2 = IERC20(_token2);
    //     owner2 = _owner2;
    //     amount2 = _amount2;
    // }

    // 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB

    // 0x617F2E2fD72FD9D5503197092aC168c91465E7f2

    function getTokens(  
        address _token1,
        address _owner1,
        uint _amount1,
        address _token2,
        address _owner2,
        uint _amount2) public {
        token1 = IERC20(_token1);
        owner1 = _owner1;
        amount1 = _amount1;
        token2 = IERC20(_token2);
        owner2 = _owner2;
        amount2 = _amount2;
        }

    function swap() public {
        require(msg.sender == owner1 || msg.sender == owner2, "Not authorized");
        require(
            token1.allowance(owner1, address(this)) >= amount1,
            "Token 1 allowance too low"
        );
        require(
            token2.allowance(owner2, address(this)) >= amount2,
            "Token 2 allowance too low"
        );

        _safeTransferFrom(token1, owner1, owner2, amount1);
        _safeTransferFrom(token2, owner2, owner1, amount2);
    }

    function _safeTransferFrom(
        IERC20 token,
        address sender,
        address recipient,
        uint amount
    ) private {
        bool sent = token.transferFrom(sender, recipient, amount);
        require(sent, "Transfer failed");

    }

    // function _transferFrom(address sender, address recipient, uint amount) internal {
    //     bool sent = transfer(sender, recipient, amount);
    //     require(sent, "Failed");
    // }

// have a mapping, as your tutor said. This will store information about how a token (token's contract address) and another token (again, contract address) rate against each other.
// mapping(address => mapping (address => uint256)) rates;

// function setRating(address _token1, address _token2, uint256 rate) public {
//      rates[_token1][_token2] = rate;
// }
}



// 0x652c9ACcC53e765e1d96e2455E618dAaB79bA595    owner1
// 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB    token1

// 0x4815A8Ba613a3eB21A920739dE4cA7C439c7e1b1    owner2
// 0x617F2E2fD72FD9D5503197092aC168c91465E7f2    token2

// 0x7EF2e0048f5bAeDe046f6BF797943daF4ED8CB47    tokenSwap

// 30000000000000000000
