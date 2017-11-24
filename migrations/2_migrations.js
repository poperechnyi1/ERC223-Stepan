var ERC223 = artifacts.require("./ERC223Token.sol");

module.exports = function(deployer) {
  deployer.deploy(ERC223);
};