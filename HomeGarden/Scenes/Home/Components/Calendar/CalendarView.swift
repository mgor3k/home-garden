//
//  Created by Maciej Gorecki on 13/06/2021
//

import SwiftUI

struct CalendarView: View {
    @Binding var index: Int
    
    var body: some View {
        GeometryReader { proxy in
            TabView(selection: $index) {
                ForEach(0..<3) { id in
                    CalendarItem()
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .tag(id)
                }
            }
            .frame(width: proxy.size.width)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .frame(height: 200)


    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(index: .constant(0))
    }
}
