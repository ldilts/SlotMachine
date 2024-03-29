//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Lucas Michael Dilts on 10/19/14.
//  Copyright (c) 2014 Lucas Dilts. All rights reserved.
//

import Foundation

class SlotBrain {
    class func unpackSlotsIntoSlotRows (slots: [[Slot]]) -> [[Slot]] {
        var slotRow: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots {
            for var index = 0; index < slotArray.count; index++ {
                let slot = slotArray[index]
                if index == 0 {
                    slotRow.append(slot)
                }
                else if index == 1 {
                    slotRow2.append(slot)
                }
                else if index == 2 {
                    slotRow3.append(slot)
                }
                else {
                    println("Error")
                }
            }
        }
        var slotInRows: [[Slot]] = [slotRow, slotRow2, slotRow3]
        return slotInRows
    }
    
    class func computeWinnings (slots: [[Slot]]) -> (Int, String, [[Bool]]) {
        var slotsInRows = unpackSlotsIntoSlotRows(slots)
        var winnings = 0
        
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        
        var winningGrid = SlotBrain.makeWinningGrid(slots)
        var count = 0
        var result = (0, "", winningGrid)
        
        for slotRow in slotsInRows {
            if checkFlush(slotRow) == true {
                for var i = 0; i < winningGrid[count].count; i++ {
                    winningGrid[i][count] = true
                }
                result.1 = "Flush"
                println("Flush")
                winnings += 1
                flushWinCount += 1
            }
            
            if checkThreeInARow(slotRow) {
                for var i = 0; i < winningGrid[count].count; i++ {
                    winningGrid[i][count] = true
                }
                result.1 = "Three in a row"
                println("Three in a row")
                winnings += 1
                straightWinCount += 1
            }
            
            if checkThreeOfAKind(slotRow) {
                for var i = 0; i < winningGrid[count].count; i++ {
                    winningGrid[i][count] = true
                }
                result.1 = "3K"
                println("Three of a Kind")
                winnings += 3
                threeOfAKindWinCount += 1
            }
            count++
        }
        
        if flushWinCount == 3 {
            result.1 = "RF"
            println("Royal Flush")
            winnings += 15
        }
        if straightWinCount == 3 {
            result.1 = "ES"
            println("Epic straight")
            winnings += 1000
        }
        if threeOfAKindWinCount == 3 {
            result.1 = "333"
            println("Threes all around")
            winnings += 50
        }
        
        result.0 = winnings
        result.2 = winningGrid
//        return winnings
        if winnings == 0 {
            println("None!")
        }
        println("\n")
        return result
    }
    
    class func checkFlush (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        if slot1.isRed == true && slot2.isRed == true && slot3.isRed == true {
            return true
        }
        else if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeInARow (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true
        }
        else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2{
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeOfAKind (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        if slot1.value == slot2.value && slot1.value == slot3.value {
            return true
        }
        else {
            return false
        }
    }
    
    class func makeWinningGrid(slots: [[Slot]]) -> [[Bool]] {
        var winningGrid: [[Bool]] = []
        
        for var i = 0; i < slots.count; i++ {
            var winnerArray:[Bool] = []
            for var j = 0; j < slots[i].count; j++ {
                var isWinner = false
                winnerArray.append(isWinner)
            }
            winningGrid.append(winnerArray)
        }
        

        return winningGrid
    }
}