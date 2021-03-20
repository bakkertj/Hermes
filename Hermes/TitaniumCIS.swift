//
//  TitaniumCIS.swift
//  Hermes
//
//  Created by Trevor Bakker on 2021-03-18.
//

import Foundation

var TitaniumCISArray = [TitaniumCIS]()

struct TitaniumCIS
{
    var ClientID : Int
    var FName : String
    var MName : String
    var LName : String
    var Ethnicity : String
    var Gender : String
    
    init()
    {
        ClientID = -1
        FName = "HOTLINE ERROR"
        MName = "HOTLINE ERROR"
        LName = "HOTLINE ERROR"
        Ethnicity = ""
        Gender = "Female"
    }
}
