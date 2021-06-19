//
//  Created by Maciej Gorecki on 14/06/2021
//

import SwiftUI

// TODO: Extract border
struct CalendarItem: View {
    var body: some View {
        HStack {
            Image("2")
                .resizable()
                .scaledToFit()
                .padding()
            
            VStack(alignment: .leading, spacing: 16) {
                Section(title: "Next watering on", value: "22 Jun, 21")
                Section(title: "Fertilize on", value: "23 Jun, 21")

                Spacer()
            }
            .padding(.vertical, 24)
            .padding(.horizontal)
            
            Spacer()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                   .stroke(.gray, lineWidth: 1)
           )
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}

extension CalendarItem {
    struct Section: View {
        let title: String
        let value: String
        
        var body: some View {
            HStack(spacing: 16) {
                Circle()
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(width: 15, height: 15)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundColor(.gray)
                        .bold()
                        .font(.callout)
                    
                    Text(value)
                        .bold()
                        .font(.callout)
                }
            }
        }
    }
}

struct CalendarItem_Previews: PreviewProvider {
    static var previews: some View {
        CalendarItem()
            .padding()
            .previewLayout(.fixed(width: 500, height: 300))
    }
}
