//
//  IconButton.swift
//  HomeGarden
//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

struct IconButton: View {
    let icon: Icon
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Circle()
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .shadow(
                    color: .black.opacity(0.1), radius: 10, x: 0, y: 0
                )
                .overlay(
                    Image(systemName: icon.systemName)
                        .resizable()
                        .frame(width: 22, height: 22)
                        .foregroundColor(.black)
                )
        }
    }
}

extension IconButton {
    enum Icon {
        case search
        
        var systemName: String {
            switch self {
            case .search:
                return "magnifyingglass"
            }
        }
    }
}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton(icon: .search, action: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
