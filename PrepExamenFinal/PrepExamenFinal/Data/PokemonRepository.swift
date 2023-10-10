//
//  PokemonRepository.swift
//  PrepExamenFinal
//
//  Created by Sebastian Flores on 09/10/23.
//

import Foundation

/// https://pokeapi.co/api/v2/pokemon/?limit=1279

struct API {
    
    static let base = "https://pokeapi.co/api/v2/"
    
    struct routes {
        static let pokemon = "/pokemon"
    }
}

protocol PokemonProtocol {
    func getPokemonList(limit: Int) async -> PokemonList?
    func getPokemonInfo(idPokemon: Int) async -> Perfil?
}

class PokemonRepository: PokemonProtocol {
    static let shared = PokemonRepository()
    
    let nservice: NetworkApiService
    
    init(nservice: NetworkApiService = NetworkApiService.shared){
        self.nservice = nservice
    }
    
    func getPokemonList(limit: Int) async -> PokemonList? {
        return await nservice.getPokemonList(url: URL(string: "\(API.base)\(API.routes.pokemon)")!, limit: limit)
    }
    func getPokemonInfo(idPokemon: Int) async -> Perfil? {
        return await nservice.getPokemonInfo(url: URL(string: "\(API.base)\(API.routes.pokemon)/\(idPokemon)")!)
    }
}
