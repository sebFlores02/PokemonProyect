//
//  PokemonInfoRequirement.swift
//  PrepExamenFinal
//
//  Created by Sebastian Flores on 09/10/23.
//

import Foundation

protocol PokemonInfoRequirementProtocol {
    func getPokemonInfo(idPokemon:Int) async -> Perfil?
}

class PokemonInfoRequirement: PokemonInfoRequirementProtocol {
    static let shared = PokemonInfoRequirement()
    let dataRepository: PokemonRepository

    init(dataRepository: PokemonRepository = PokemonRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getPokemonInfo(idPokemon:Int) async -> Perfil? {
        return await dataRepository.getPokemonInfo(idPokemon: idPokemon)
    }
}
