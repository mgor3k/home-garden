//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

class ReversibleAnimationStore: ObservableObject {
    @Published var isAnimating = false
    
    var task: DispatchWorkItem?
    
    func triggerAnimation () {
        withAnimation(.linear(duration: 1)) {
            isAnimating = true
            scheduleAnimationEnd()
        }
    }
    
    func scheduleAnimationEnd() {
        task?.cancel()
        
        let task = DispatchWorkItem { [weak self] in
            withAnimation(.linear(duration: 1)) {
                self?.isAnimating = false
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: task)
        self.task = task
    }
}
