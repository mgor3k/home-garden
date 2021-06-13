//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            HomeTopBar(
                tasksCount: 2,
                onSearchTapped: {}
            )
            .padding(.horizontal, 24)
            
            VStack(alignment: .leading, spacing: 24) {
                SectionText("Did you know...")
                
                // TODO: Fix this later
                FactsView(store: FactsStore())
            }
            .padding(.horizontal, 24)
            
            VStack {
                HStack {
                    SectionText("My Garden")
                    Spacer()
                    Text("See all")
                        .font(.callout)
                }
                .padding(.top, 16)
                .padding(.horizontal, 24)
                
                MyGardenView()
            }
            
            VStack {
                HStack {
                    SectionText("Caring calendar")
                    Spacer()
                    PageIndicator(currentPage: 0, pagesCount: 3)
                }
                
                CaringCalendarView()
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .padding(.vertical, 24)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
