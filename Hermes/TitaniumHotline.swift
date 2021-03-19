//
//  TitaniumHotline.swift
//  Hermes
//
//  Created by Trevor Bakker on 2021-03-18.
//

import Foundation

var TitaniumHotlineArray = [TitaniumHotline]()

struct TitaniumHotline
{
    var ClientID : Int
    var FName : String
    var MName : String
    var LName : String
    
    init()
    {
        ClientID = -1
        FName = "HOTLINE ERROR"
        MName = "HOTLINE ERROR"
        LName = "HOTLINE ERROR"
    }
}

