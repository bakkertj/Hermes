//
//  ClioMatter.swift
//  Hermes
//
//  Created by Trevor Bakker on 2021-03-20.
//

import Foundation
var ClioMatterArray = [ClioMatter]()




struct ClioMatter
{
    var ClientID    : Int
    var Description : String
    var ClientName  : String
    var OpenDate    : Date
    var CloseDate   : Date
    var UserDefinedNotes : String
    var OpposingPartyDOB : Date
    var OpposingParty : String
    var OpposingPartyAddress : String
    var OpposingPartyPhoneNumber: Int
    var ResponsibleAttorney : String
    var FamilyCourtNumber : String
    var FamilyCaseNumber : String
    init()
    {
        ClientID = -1
        Description = "Unknown"
        ClientName = "CLIO ERROR"
        OpenDate = Date()
        CloseDate = Date()
        UserDefinedNotes = ""
        ResponsibleAttorney = "Erin Bakker"
        OpposingPartyDOB = Date()
        OpposingParty = "ERROR"
        OpposingPartyAddress = "ERROR"
        OpposingPartyPhoneNumber = -1
        FamilyCourtNumber = "ERROR"
        FamilyCaseNumber = "ERROR"
    }
}
