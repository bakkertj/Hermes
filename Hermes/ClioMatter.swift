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
    var CloseDateFound : Bool
    var UserDefinedNotes : String
    var OpposingPartyDOB : Date
    var OpposingParty : String
    var OpposingPartyAddress : String
    var OpposingPartyPhoneNumber: Int
    var OpposingCounsel : String
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
        CloseDateFound = false
        UserDefinedNotes = ""
        ResponsibleAttorney = "Erin Bakker"
        OpposingPartyDOB = Date()
        OpposingParty = "ERROR"
        OpposingPartyAddress = "ERROR"
        OpposingCounsel = ""
        OpposingPartyPhoneNumber = -1
        FamilyCourtNumber = "ERROR"
        FamilyCaseNumber = "ERROR"
    }
}
