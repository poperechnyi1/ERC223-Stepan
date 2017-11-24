var ERC223 = artifacts.require("./ERC223_token.sol");

module.exports = function(deployer) {
  deployer.deploy(ERC223);
};