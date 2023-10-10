//
//  ContentView.swift
//  PrepExamenFinal
//
//  Created by Sebastian Flores on 09/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        List(viewModel.pokemonList) { PokemonBase in
                HStack {
                    WebImage(url: URL(string: PokemonBase.perfil?.sprites.front_default ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .center)
                    Text(PokemonBase.pokemon.name)
                }
        }
        .onAppear {
            Task {
                await viewModel.getPokemonList()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
