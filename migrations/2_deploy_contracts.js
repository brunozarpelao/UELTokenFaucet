var UELToken = artifacts.require("UELToken");
var UELFaucet = artifacts.require("UELFaucet");


module.exports = function(deployer, network, accounts) {

    owner = accounts[0]; //precisa criar a estrutura accounts antes no console
    // Implanta primeiro o contrato UELToken
	deployer.deploy(UELToken, {from: owner}).then(function() {
		// Depois, implanta o UELFAucet e passa o endereço do contrato UELToken
		// e o endereço do dono de todos os tokens UEL que vai permitir que o Faucet faça as transferências.
		return deployer.deploy(UELFaucet, UELToken.address, owner);
  	});
}