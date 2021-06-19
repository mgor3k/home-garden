//
//  Created by Maciej Gorecki on 19/06/2021
//

import SwiftUI
import AuthenticationServices

struct OnboardingView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Take care of your home garden")
                    .foregroundColor(.white)
                    .font(.system(size: 58))
                    .fontWeight(.black)
                    .shadow(color: .black, radius: 10, x: 0, y: 0)
                
                Spacer()
            }
            .padding(.top, 48)
            .padding(.trailing, 32)
            
            Spacer()
            
            SignInWithAppleButton(onRequest: {_ in }, onCompletion: { _ in
                
            })
                .signInWithAppleButtonStyle(.white)
                .frame(maxHeight: 48)
                .cornerRadius(10)
                .padding()
            
            Text("Some privacy text")
                .foregroundColor(.white)
        }
        .padding()
        .background(
            Image("bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
