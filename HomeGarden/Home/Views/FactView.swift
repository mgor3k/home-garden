//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

struct FactView: View {
    let normal = Color(red: 0.13, green: 0.36, blue: 0.23)
    let darker = Color(red: 0.12, green: 0.35, blue: 0.24)
    let darkest = Color.accentColor
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "lightbulb.fill")
                    .font(.title2)
                Spacer()
            }
            .padding()
            .padding(.top, 6)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Some fact")
                    .font(.callout)
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
                    .font(.caption)
                    .italic()
                Spacer()
            }
            .padding(.top, 24)
            .padding(.bottom, 16)
            
            Spacer()
            
            VStack {
                Spacer()
                Image(systemName: "repeat.circle.fill")
                    .font(.title)
            }
            .padding()
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: 300)
        .background(
            normal
                .overlay(
                    GeometryReader { proxy in
            Circle()
                .foregroundColor(darker)
                .frame(width: proxy.size.height * 2, height: proxy.size.height * 2)
                .offset(x: proxy.size.height, y: -proxy.size.height)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
                )
                .overlay(
                    GeometryReader { proxy in
            Circle()
                .foregroundColor(darkest)
                .frame(width: proxy.size.height, height: proxy.size.height)
                .offset(x: proxy.size.height / 2.5, y: proxy.size.height / 2.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

struct FactView_Previews: PreviewProvider {
    static var previews: some View {
        FactView()
            .frame(width: 400, height: 150)
            .padding()
            .previewLayout(.fixed(width: 500, height: 200))
    }
}
