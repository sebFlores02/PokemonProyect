//
//  PokemonListRequirement.swift
//  PrepExamenFinal
//
//  Created by Sebastian Flores on 09/10/23.
//

import Foundation

protocol PokemonListRequirementProtocol {
    func getPokemonList(limit: Int) async -> PokemonList?
}

class PokemonListRequirement: PokemonListRequirementProtocol {
    static let shared = PokemonListRequirement()
    let dataRepository: PokemonRepository
    
    init(dataRepository: PokemonRepository = PokemonRepository.shared){
        self.dataRepository = dataRepository
    }
    
    func getPokemonList(limit: Int) async -> PokemonList? {
        return await dataRepository.getPokemonList(limit: limit)
    }
}
