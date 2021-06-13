//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

struct HomeFactsView: View {
    let cardHeight: CGFloat = 150
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Did you know...")
                .bold()
                .font(.title3)
            
            ZStack {
                BackCard(opacity: 0.3, rotation: -6)
                BackCard(opacity: 0.5, rotation: -4)
                
                FactView()
                    .frame(height: cardHeight)
                    .rotationEffect(.degrees(-1))
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
        HomeFactsView()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
    }
}
