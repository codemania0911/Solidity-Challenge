require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
  networks:{
    ropsten: {
      url: `https://ropsten.infura.io/v3/26afa91d18df4c68b6c525d9f936b21f`,
      chainId: 3,
      accounts: ["41f6e321b31e72173f8ff2e292359e1862f24fba42fe6f97efaf641980eff298"],
      timeout:100000,
    },
  },
    etherscan:{
      apiKey:"97WJJ1S3YEQ35JHWB29Q3QMH57YVAXRW4K",
    }
};
