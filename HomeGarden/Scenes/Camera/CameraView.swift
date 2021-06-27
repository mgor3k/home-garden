//
//  Created by Maciej Gorecki on 27/06/2021
//

import SwiftUI

struct CameraView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            Text("Camera should be here")
                .foregroundColor(.white)
                .bold()
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
