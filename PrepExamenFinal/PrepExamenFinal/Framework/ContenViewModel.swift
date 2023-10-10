//
//  ContenViewModel.swift
//  PrepExamenFinal
//
//  Created by Sebastian Flores on 09/10/23.
//

import Foundation

@MainActor
class ContentViewModel: ObservableObject {
    @Published var pokemonList = [PokemonBase]()
    
    var pokemonListRequirement: PokemonListRequirementProtocol
    var pokemonInfoRequirement: PokemonInfoRequirementProtocol

    init(pokemonListRequirement: PokemonListRequirementProtocol = PokemonListRequirement.shared,
            pokemonInfoRequirement: PokemonInfoRequirementProtocol = PokemonInfoRequirement.shared) {
        self.pokemonListRequirement = pokemonListRequirement
        self.pokemonInfoRequirement = pokemonInfoRequirement
    }
    
    func getPokemonList() async {
        let result = await pokemonListRequirement.getPokemonList(limit: 1279)
        
        for i in 0...result!.results.count-1 {
            let numberPokemon = Int(result!.results[i].url.split(separator: "/")[5])!
            
            let infoPokemon = await pokemonInfoRequirement.getPokemonInfo(idPokemon: Int(String(numberPokemon))!)
            let tempPokemon = PokemonBase(id: Int(String(numberPokemon))!, pokemon: result!.results[i], perfil: infoPokemon)
            
            self.pokemonList.append(tempPokemon)
        }
    }
}
