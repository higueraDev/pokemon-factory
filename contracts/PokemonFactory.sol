// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract PokemonFactory {
    struct Hability {
        string name;
        string description;
    }

    struct Pokemon {
        uint id;
        string name;
    }

    Pokemon[] private pokemons;

    mapping(uint => address) public pokemonToOwner;
    mapping(address => uint) ownerPokemonCount;

    mapping(uint => Hability[]) habilities;

    event eventNewPokemon(Pokemon);

    function createPokemon(
        string memory _name,
        uint _id
    ) public {
        require(_id > 0, "Pokemon's Id must be greater than 0");
        bytes memory name = bytes(_name);
        require(
            name.length > 2,
            "Pokemon's Name should be greater than 2 characters"
        );

        Pokemon memory pokemon = Pokemon(_id, _name);

        pokemons.push(pokemon);
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;

        emit eventNewPokemon(pokemon);
    }

    function addHability(uint _pokemonId,string memory _habilityName,string memory _habilityDescription)public {
        Hability memory hability = Hability(_habilityName,_habilityDescription);
        habilities[_pokemonId].push(hability);
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
