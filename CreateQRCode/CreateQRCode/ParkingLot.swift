//
//  ParkingLot.swift
//  CreateQRCode
//
//  Created by Peddinti,Suresh Chandra on 11/13/19.
//  Copyright © 2019 Peddinti,Suresh Chandra. All rights reserved.
//

import UIKit

class ParkingLot{
    var superMarketName:String
    var parkingDirection:String
    var parkingSlot:String
    var qrCode:UIImage? //ox1
    var isOccupied:Bool
    
    init(superMarketName:String,parkingDirection:String,parkingSlot:String,qrCode:UIImage,isOccupied:Bool){
        self.superMarketName = superMarketName
        self.parkingDirection = parkingDirection
        self.parkingSlot = parkingSlot
        self.qrCode = qrCode
        self.isOccupied = isOccupied
    }
}

class ParkingLotArray{
    
    var parkingLots:[ParkingLot] = []
    
     static var _shared = ParkingLotArray()
    
    init(){
    }
    
    subscript(index:Int) -> ParkingLot{
        return parkingLots[index]
    }
    
    func addParkingLot(parkingLot:ParkingLot){
        parkingLots.append(parkingLot)
    }
    
}
