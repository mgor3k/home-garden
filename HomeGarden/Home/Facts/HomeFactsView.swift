//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

struct HomeFactsView: View {
    @StateObject var store: FactsStore
    
    let cardHeight: CGFloat = 150
    @State var isToggling = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Did you know...")
                .bold()
                .font(.title3)
            
            ZStack {
                if isToggling {
                    BackCard(opacity: 0.3, rotation: -6)
                }
                
                BackCard(opacity: isToggling ? 0.5 : 0.3, rotation: isToggling ? -4 : -6)
                BackCard(opacity: isToggling ? 1 : 0.5, rotation: isToggling ? -1 : -4)
                
                if isToggling {
                    FactView(fact: store.currentFact, nextAction: {})
                        .frame(height: cardHeight)
                        .rotationEffect(.degrees(-1))
                }
                
                FactView(
                    fact: isToggling ? store.pastFact : store.currentFact,
                    nextAction: {
                    guard !isToggling else { return }
                    store.toggleNextFact()
                    withAnimation(Animation.easeIn(duration: 0.5)) {
                        isToggling = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            isToggling = false
                        }
                    }
                    

                }
                )
                    .frame(height: cardHeight)
                    .rotationEffect(.degrees(-1))
                    .opacity(isToggling ? 0 : 1)
                    .offset(x: isToggling ? 500 : 0, y: isToggling ? -30 : 0)
            }
        }
    }
}

private extension HomeFactsView {
    struct BackCard: View {
        let opacity: CGFloat
        let rotation: CGFloat
        
        var body: some View {
            Rectangle()
                .foregroundColor(.accentColor.opacity(opacity))
                .frame(height: 150)
                .clipShape(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                )
                .rotationEffect(.degrees(rotation))
        }
    }
}

struct HomeFactsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFactsView(store: FactsStore())
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
    }
}
