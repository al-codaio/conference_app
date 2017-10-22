var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var Conference = artifacts.require("./Conference.sol");
var HelloWorld = artifacts.require("./HelloWorld.sol");
var Custodial = artifacts.require("./Custodial.sol");

module.exports = function(deployer) {
  	deployer.deploy(ConvertLib);
  	deployer.link(ConvertLib, MetaCoin);
  	deployer.deploy(MetaCoin);
  	deployer.deploy(Conference);
  	deployer.deploy(HelloWorld);
  	deployer.deploy(Custodial);
};
