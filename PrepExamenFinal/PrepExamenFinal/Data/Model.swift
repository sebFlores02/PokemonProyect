//
//  Model.swift
//  PrepExamenFinal
//
//  Created by Sebastian Flores on 09/10/23.
//

import Foundation

struct PokemonList: Codable {
//    var id: UUID = UUID()
    var count: Int
    var next: String
    var results: [Pokemon]
}

struct Pokemon: Codable {
    var name: String
    var url: String
}

struct PokemonBase: Codable, Identifiable {
    var id: Int
    var pokemon: Pokemon
    var perfil: Perfil?
}

struct Perfil: Codable {
    var sprites: Sprite
}

struct Sprite: Codable {
    var front_default: String
    var back_default: String
}
