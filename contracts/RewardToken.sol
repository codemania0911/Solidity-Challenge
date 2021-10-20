//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RewardTokens is ERC20 {

    constructor(string memory _tokenname,string memory _tokensymbol)  ERC20(_tokenname,_tokensymbol) {
       
    }

    function mint(uint256 _amount) public {
        _mint(_msgSender(),_amount);
    }
    
    function transferToken(address sender,address recepient,uint256 amount) public returns(bool){
            _transfer(sender,recepient,amount);
            return true;
    }
   
}
