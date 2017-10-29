var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var Conference = artifacts.require("./Conference.sol");
var HelloWorld = artifacts.require("./HelloWorld.sol");
var Custodial = artifacts.require("./Custodial.sol");
var ProofOfExistence = artifacts.require("ProofOfExistence1");
var ProofOfExistence2 = artifacts.require("ProofOfExistence2");
var ProofOfExistence3 = artifacts.require("ProofOfExistence3");

module.exports = function(deployer) {
  	deployer.deploy(ConvertLib);
  	deployer.link(ConvertLib, MetaCoin);
  	deployer.deploy(MetaCoin);
  	deployer.deploy(Conference);
  	deployer.deploy(HelloWorld);
  	deployer.deploy(Custodial);
  	deployer.deploy(ProofOfExistence);
  	deployer.deploy(ProofOfExistence2);
  	deployer.deploy(ProofOfExistence3);
};
