//
//  Created by Maciej Gorecki on 15/06/2021
//

import SwiftUI

struct CalendarSection: View {
    @State var currentPage = 0
    
    var body: some View {
        VStack {
            HStack {
                SectionText("Caring calendar")
                Spacer()
                PageIndicator(
                    currentPage: currentPage,
                    pagesCount: 3
                )
                .animation(.linear, value: currentPage)
            }
            .padding(.horizontal, 24)
            
            CalendarView(index: $currentPage)
        }
    }
}

struct CaringCalendarSection_Previews: PreviewProvider {
    static var previews: some View {
        CalendarSection()
    }
}
