//
//  Factory.swift
//  SlotMachine
//
//  Created by Lucas Michael Dilts on 10/18/14.
//  Copyright (c) 2014 Lucas Dilts. All rights reserved.
//

import Foundation
import UIKit

class Factory {
    
    // Class function
    class func createSlots() -> [[Slot]] {
        let kNumberOfSlots = 3
        let kNumberOfContainers = 3
        
        var slots: [[Slot]] = []
        for var containerNumber = 0; containerNumber < kNumberOfContainers; containerNumber++ {
            var slotArray:[Slot] = []
            for var slotNumber = 0; slotNumber < kNumberOfSlots; slotNumber++ {
                var slot = Factory.createSlot(slotArray)
                slotArray.append(slot)
            }
            slots.append(slotArray)
        }
        return slots
    }
    
    class func createSlot (currentCards : [Slot]) -> Slot {
        var currentCardValues:[Int] = []
        
        for slot in currentCards {
            currentCardValues.append(slot.value)
        }
        
        var randomNumber = Int(arc4random_uniform(UInt32(13)))
        while contains(currentCardValues, randomNumber + 1) {
            randomNumber = Int(arc4random_uniform(UInt32(13)))
        }
        
        var slot:Slot
        switch randomNumber {
            case 0:
                slot = Slot(value: 1, image: UIImage(named: "Ace"), isRed: true, isWinner: false)
            case 1:
                slot = Slot(value: 2, image: UIImage(named: "Two"), isRed: true, isWinner: false)
            case 2:
                slot = Slot(value: 3, image: UIImage(named: "Three"), isRed: true, isWinner: false)
            case 3:
                slot = Slot(value: 4, image: UIImage(named: "Four"), isRed: true, isWinner: false)
            case 4:
                slot = Slot(value: 5, image: UIImage(named: "Five"), isRed: false, isWinner: false)
            case 5:
                slot = Slot(value: 6, image: UIImage(named: "Six"), isRed: false, isWinner: false)
            case 6:
                slot = Slot(value: 7, image: UIImage(named: "Seven"), isRed: true, isWinner: false)
            case 7:
                slot = Slot(value: 8, image: UIImage(named: "Eight"), isRed: false, isWinner: false)
            case 8:
                slot = Slot(value: 9, image: UIImage(named: "Nine"), isRed: false, isWinner: false)
            case 9:
                slot = Slot(value: 10, image: UIImage(named: "Ten"), isRed: true, isWinner: false)
            case 10:
                slot = Slot(value: 11, image: UIImage(named: "Jack"), isRed: false, isWinner: false)
            case 11:
                slot = Slot(value: 12, image: UIImage(named: "Queen"), isRed: false, isWinner: false)
            case 12:
                slot = Slot(value: 13, image: UIImage(named: "King"), isRed: true, isWinner: false)
            default:
                slot = Slot(value: 0, image: UIImage(named: "Ace"), isRed: true, isWinner: false)
        }
        return slot
    }
}