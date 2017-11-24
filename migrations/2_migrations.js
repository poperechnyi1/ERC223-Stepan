var ERC223 = artifacts.require("./ERC223BasicToken.sol");

module.exports = function(deployer) {
  deployer.deploy(ERC223);
};