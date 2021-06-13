//
//  Created by Maciej Gorecki on 13/06/2021
//

import SwiftUI

struct CaringCalendarView: View {
    var body: some View {
        HStack {
            ForEach(0...2, id: \.self) { id in
                Text("hehe")
            }
        }
    }
}

struct CaringCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CaringCalendarView()
    }
}
