//
//  ClioContact.swift
//  Hermes
//
//  Created by Trevor Bakker on 2021-03-20.
//

import Foundation

var ClioContactArray = [ClioContact]()


struct ClioContact
{
    var Name : String
    var PhoneNumber : Int
    var StreetAddress : String
    var City : String
    var State : String
    var Country : String
    var Notes : String
    var ClientID : Int
    var Immigration : String
    var Language : String
    var Race : String
    
    init ()
    {
        ClientID = -1
        Name = "CLIO CONTACT ERROR"
        PhoneNumber = -1
        StreetAddress = "CLIO CONTACT ERROR"
        City = "CLIO CONTACT ERROR"
        State = "CLIO CONTACT ERROR"
        Country = "CLIO CONTACT ERROR"
        Notes = "CLIO CONTACT ERROR"
        Immigration = "CLIO CONTACT ERROR"
        Language = "CLIO CONTACT ERROR"
        Race = "CLIO CONTACT ERROR"
    }
    
}
