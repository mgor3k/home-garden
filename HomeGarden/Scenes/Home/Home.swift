//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

struct HomeView: View {
    let namespace: Namespace.ID
    
    let facts: [Fact]
    let myGarden: [Plant]
    
    @Binding var selectedPlant: Plant?
    @State var isShowingProfile = false
    
    let onSearchTapped: () -> Void
    let onLogoutTapped: () -> Void
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                content
            }
            .sheet(isPresented: $isShowingProfile) {
                ProfileView {
                    isShowingProfile = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: onLogoutTapped)
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    var content: some View {
        VStack(spacing: 32) {
            HomeTopBar(
                tasksCount: 2,
                onSearchTapped: onSearchTapped,
                onProfileTapped: {
                    isShowingProfile = true
                }
            )
            .padding(.horizontal, 24)
            
            VStack(alignment: .leading, spacing: 24) {
                SectionText("Did you know...")
                FactsView(store: .init(facts: facts))
            }
            .padding(.horizontal, 24)
            
            VStack {
                HStack {
                    SectionText("My Garden")
                    Spacer()
                    NavigationLink(destination: MyGardenListView()) {
                        Text("See all")
                            .font(.callout)
                    }
                }
                .padding(.top, 16)
                .padding(.horizontal, 24)
                
                MyGardenView(
                    namespace: namespace,
                    store: .init(plants: myGarden),
                    selectedPlant: $selectedPlant
                )
            }
            
            CalendarSection()
            
            Spacer()
        }
        .padding(.vertical, 24)
    }
}

struct HomeView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        HomeView(
            namespace: namespace,
            facts: [],
            myGarden: [],
            selectedPlant: .constant(nil),
            onSearchTapped: {},
            onLogoutTapped: {}
        )
    }
}
