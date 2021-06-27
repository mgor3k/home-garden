//
//  Created by Maciej Gorecki on 27/06/2021
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            content
                .navigationTitle("Search")
        }
        .searchable(text: $searchText, prompt: Text("Enter search phrase"))
    }
    
    var content: some View {
        Text("Search results should be here")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
