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
                ForEach(store.facts.indices) { index in
                    FactView(
                        fact: store.facts[index],
                        nextAction: store.toggleFacts
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
            return 1
        case 1:
            return 0.5
        case 2:
            return 0.3
        default:
            return 0
        }
    }
    
    func rotationAngle(forIndex index: Int) -> Angle {
        switch index {
        case 0:
            return .zero
        case 1:
            return .degrees(-4)
        case 2:
            return .degrees(-6)
        default:
            return .zero
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
