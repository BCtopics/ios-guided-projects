//
//  Timer.swift
//  PowerNapTimer
//
//  Created by James Pacheco on 4/12/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class Timer: NSObject {
    
    var timeRemaining: TimeInterval?
    
    var isOn: Bool {
        if timeRemaining != nil {
            return true
        } else {
            return false
        }
    }
    
    func timeAsString() -> String {
        let timeRemaining = Int(self.timeRemaining ?? 20*60)
        let minutesLeft = timeRemaining / 60
        let secondsLeft = timeRemaining - (minutesLeft*60)
        return String(format: "%02d : %02d", arguments: [minutesLeft, secondsLeft])
    }

    @objc private func secondTick() {
        guard let timeRemaining = timeRemaining else {return}
        if timeRemaining > 0 {
            self.timeRemaining = timeRemaining - 1
            perform(#selector(Timer.secondTick), with: nil, afterDelay: 1)
            print(timeRemaining)
        } else {
            self.timeRemaining = nil
        }
    }
    
    func startTimer(_ time: TimeInterval) {
        if !isOn {
            timeRemaining = time
            perform(#selector(Timer.secondTick), with: nil, afterDelay: 1)
        }
    }
    
    func stopTimer() {
        if isOn {
            timeRemaining = nil
        }
    }
}
