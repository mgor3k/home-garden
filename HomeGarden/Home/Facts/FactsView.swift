//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

struct FactsView: View {
    @StateObject var store: FactsStore
    @StateObject var animationStore = ReversibleAnimationStore(duration: 0.2)
    
    let cardHeight: CGFloat = 150
    @State var isToggling = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Did you know...")
                .bold()
                .font(.title3)
            
            ZStack {
                ForEach(store.facts.indices.prefix(3)) { index in
                    FactView(
                        fact: store.facts[index],
                        nextAction: {
                            store.toggleFacts()
                            animationStore.triggerAnimation()
                        }
                    )
                    .zIndex(Double(index) * -1)
                    .frame(height: cardHeight)
                    .opacity(opacity(forIndex: index))
                    .rotationEffect(rotationAngle(forIndex: index))
                }
            }
        }
    }
    
    func opacity(forIndex index: Int) -> Double {
        switch index {
        case 0:
            return animationStore.isAnimating ? 0.9 : 1
        case 1:
            return animationStore.isAnimating ? 0.3 : 0.5
        case 2:
            return animationStore.isAnimating ? 0.2 : 0.3
        default:
            return 0
        }
    }
    
    func rotationAngle(forIndex index: Int) -> Angle {
        switch index {
        case 0:
            return .degrees(animationStore.isAnimating ? -2 : 0)
        case 1:
            return .degrees(animationStore.isAnimating ? -2 : -4)
        case 2:
            return .degrees(animationStore.isAnimating ? -4 : -6)
        default:
            return .zero
        }
    }
}

struct HomeFactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView(store: FactsStore())
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
    }
}
