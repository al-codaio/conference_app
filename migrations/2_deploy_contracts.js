var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var Conference = artifacts.require("./Conference.sol");
var HelloWorld = artifacts.require("./HelloWorld.sol");

module.exports = function(deployer) {
  	deployer.deploy(ConvertLib);
  	deployer.link(ConvertLib, MetaCoin);
  	deployer.deploy(MetaCoin);
  	deployer.deploy(Conference);
  	deployer.deploy(HelloWorld);
};
