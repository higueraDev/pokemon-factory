// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract PokemonFactory {
    struct Pokemon {
        uint id;
        string name;
    }

    Pokemon[] private pokemons;

    mapping(uint => address) public pokemonToOwner;
    mapping(address => uint) ownerPokemonCount;

    event eventNewPokemon(Pokemon);

    function createPokemon(string memory _name, uint _id) public {
        require(_id > 0, "Pokemon's Id must be greater than 0");
        bytes memory name = bytes(_name);
        require(name.length == 0, "Pokemon's Name can't be empty");

        pokemons.push(Pokemon(_id, _name));
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
        
        emit eventNewPokemon(Pokemon(_id, _name));
    }

    function getAllPokemons() public view returns (Pokemon[] memory) {
        return pokemons;
    }

    function getResult() public pure returns (uint product, uint sum) {
        uint a = 1;
        uint b = 2;
        product = a * b;
        sum = a + b;
    }
}
