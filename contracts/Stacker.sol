//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Context.sol";


contract Stacker {

   address public rewardToken;
   mapping(address=>uint256) public stacks;
   mapping(address=>uint256) public lastUpdatedTime;
   bool pause = false;
   address public owner;
   uint256 public rewardRate;

   modifier pausable{
       _;
       require(pause==true,"functions are temporarily unavilable");
   }

   modifier onlyOwner{
       _;
       require(msg.sender==owner,"Caller is not the owner");
   }


    constructor(address _rewardToken){
        rewardToken = _rewardToken;
        owner = msg.sender;
    }

    function addStack(uint256 _amount) public {
        uint256 lastbalance = stacks[msg.sender];
        bool isDone = RewardToken(rewardToken).transferToken(msg.sender,address(this),_amount);
        require(isDone==true,"Transaction Failed");
        stacks[msg.sender] = totalReward() + lastbalance;
        stacks[msg.sender] += _amount;
        lastUpdatedTime[msg.sender] = block.timestamp;
    }

    function setRewardRate(uint256 _rewardRate) public onlyOwner{
        rewardRate = _rewardRate;
    }   

     function totalReward() public view returns (uint) {
         if(lastUpdatedTime[msg.sender]==0){
             return 0;
         }
        return (((block.timestamp - lastUpdatedTime[msg.sender]) * rewardRate));
    }
    
    
    function withdraw(uint256 _amount) public {
        require(stacks[msg.sender] >= _amount);
        bool isDone = RewardToken(rewardToken).transferToken(address(this),msg.sender,_amount);
        require(isDone==true,"Transaction Failed");
        lastUpdatedTime[msg.sender] = block.timestamp;
    }

    function balanceOf() public view returns(uint256) {
        return(stacks[msg.sender]);
    }

    function lastTimeFundAdded() public view returns(uint256) {
        return(lastUpdatedTime[msg.sender]);
    }
    
}

interface RewardToken{
    function transfer(address recepient,uint256 amount) external returns(bool);
      function transferToken(address sender,address recepient,uint256 amount) external returns(bool);
    function balanceOf(address _account) external returns(uint256);
}

