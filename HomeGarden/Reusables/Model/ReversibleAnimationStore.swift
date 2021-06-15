//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

class ReversibleAnimationStore: ObservableObject {
    @Published var isAnimating = false
    
    let duration: TimeInterval
    
    var task: DispatchWorkItem?
    
    init(duration: TimeInterval = 1) {
        self.duration = duration
    }
    
    func triggerAnimation () {
        withAnimation(.easeInOut(duration: duration)) {
            isAnimating = true
            scheduleAnimationEnd()
        }
    }
    
    func triggerWithoutAnimation() {
        isAnimating = true
        scheduleAnimationEnd()
    }
    
    func scheduleAnimationEnd() {
        task?.cancel()
        
        let task = DispatchWorkItem { [weak self] in
            withAnimation(.easeInOut(duration: self?.duration ?? 1)) {
                self?.isAnimating = false
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: task)
        self.task = task
    }
}
