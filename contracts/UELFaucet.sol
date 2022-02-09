pragma solidity ^0.8.11;

import 'openzeppelin-solidity/contracts/token/ERC20/ERC20.sol';


// Este contrato é um faucet que emite tokens UEL
contract UELFaucet {

	ERC20 public UELToken;
	address public UELOwner;

	// Construtor do contrato que passa o endereço do contrato UELToken 
	// e o endereço do dono que está autorizando a transferência para um terceiro
    // lembrar que o dono tem todos os tokens gerados na criação do UELToken
	constructor(address _UELToken, address _UELOwner) {

		// Initialize the METoken from the address provided
		UELToken = ERC20(_UELToken);
		UELOwner = _UELOwner;
	}

	function withdraw(uint withdraw_amount) public {

    	// Limita o saque para 10 UEL
    	require(withdraw_amount <= 10, "A transferencia requisitada foi superior a 10 UEL");

		// Chama o transferFrom para executar a transferência
		UELToken.transferFrom(UELOwner, msg.sender, withdraw_amount);
    }

	// A ideia destas duas funções é evitar qualquer 
    // transferência de ether para este contrato
    // Assim, evita-se que o usuário queime ether
	fallback () external payable { revert(); }
    receive () external payable { revert(); }

}