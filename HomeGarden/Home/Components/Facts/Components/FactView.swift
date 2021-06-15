//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

struct FactView: View {
    let normal = Color(red: 0.13, green: 0.36, blue: 0.23)
    let darker = Color(red: 0.12, green: 0.35, blue: 0.24)
    let darkest = Color.accentColor
    
    let fact: Fact
    let action: () -> Void
    
    @StateObject var store = ReversibleAnimationStore()
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "lightbulb.fill")
                    .font(.title2)
                    .foregroundColor(store.isAnimating ? .yellow : .white)
                    .onAppear(perform: store.triggerWithoutAnimation)
                
                Spacer()
            }
            .padding()
            .padding(.top, 6)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(fact.title)
                    .font(.callout)
                Text(fact.content)
                    .font(.caption)
                    .italic()
                Spacer()
            }
            .padding(.top, 24)
            .padding(.bottom, 16)
            
            Spacer()
            
            VStack {
                Spacer()
                Button(action: {
                    action()
                    store.triggerAnimation()
                }) {
                    Image(systemName: "repeat.circle.fill")
                        .font(.title)
                }
            }
            .padding()
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: 300)
        .background(
            ZStack {
                normal
            
            GeometryReader { proxy in
                darker
                    .clipShape(Circle())
                    .frame(width: proxy.size.width / 2)
                    .scaleEffect(2)
                    .offset(x: proxy.size.width / 1.5, y: proxy.size.width / 7)
                }
            
            GeometryReader { proxy in
                darkest
                    .clipShape(Circle())
                    .frame(width: proxy.size.width / 2)
                    .offset(x: proxy.size.width / 1.5, y: proxy.size.width / 7)
                }
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

struct FactView_Previews: PreviewProvider {
    // TODO: Fix this later
    static var previews: some View {
        FactView(fact: FactsStore().facts[0], action: {})
            .frame(width: 400, height: 150)
            .padding()
            .previewLayout(.fixed(width: 500, height: 200))
    }
}
