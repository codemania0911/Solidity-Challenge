const { expect } = require("chai");
const { ethers } = require("hardhat");

before(async () => {
  [deployer, user0, user1, user2] = await ethers.getSigners();
    RewardTokens = await ethers.getContractFactory("RewardTokens", deployer);
    Stacker = await ethers.getContractFactory("Stacker", deployer);
});

beforeEach(async () => {
  rewardTokens = await RewardTokens.deploy("RewardToken","RT");
  await rewardTokens.connect(deployer).initialize();
  stacker = await Stacker.deploy(rewardTokens.address);
  await stacker.connect(deployer).initialize();
});

describe("Greeter", function () {
  it("Should return the new greeting once it's changed", async function () {
      console.log(RewardTokens);
      console.log(rewardToken.address);
  });
});
