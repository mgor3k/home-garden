//
//  ContentView.swift
//  HomeGarden
//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HomeTopBar(
                tasksCount: 2,
                onSearchTapped: {}
            )
                .padding(24)
            HomeFactsView()
                .padding(24)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
