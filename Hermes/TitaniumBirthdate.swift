//
//  TitaniumNoAppointments.swift
//  Hermes
//
//  Created by Trevor Bakker on 2021-05-25.
//

import Foundation

import Foundation

var TitaniumBirthdateArray = [TitaniumBirthdate]()

struct TitaniumBirthdate
{
    var ClientID : Int
    var Birthdate : Date
    
    init()
    {
        ClientID = -1
        Birthdate = Date()
    }
}
