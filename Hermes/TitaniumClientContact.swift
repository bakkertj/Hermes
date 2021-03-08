//
//  TitaniumClientContact.swift
//  Hermes
//
//  Created by Trevor Bakker on 3/6/21.
//

import Foundation

var TitaniumClientContactArray = [TitaniumClientContact]()

struct TitaniumClientContact
{
    var ClientID : Int
    var SSNumber : String
    var FirstName : String
    var MiddleName : String
    var LastName : String
    var Active : Bool
    var RegDate : Date
    var AddDate : Date
    var EditDate : Date
    var StatusExt : String
    var OkToEmail : Bool
    var Email : String
    var OkToPhone1 : Bool
    var Phone1 : String
    var OkToPhone2 : Bool
    var Phone2 : String
    var OkToPhone3 : Bool
    var Phone3 : String
    var Address1 : String
    var Address2 : String
    var Address3 : String
    var BirthDate : Date
    var OkToHome : Bool
    var Comment : String
    var FromWeb : Bool
    
    init()
    {
        ClientID = 0
        SSNumber = ""
        FirstName = ""
        MiddleName = ""
        LastName = ""
        Active = false;
        RegDate = Date()
        AddDate = Date()
        EditDate = Date()
        StatusExt = ""
        Email = ""
        Phone1 = ""
        Phone2 = ""
        Phone3 = ""
        Address1 = ""
        Address2 = ""
        Address3 = ""
        BirthDate = Date()
        Comment = ""
        FromWeb = false
        OkToEmail = false
        OkToPhone1 = false
        OkToPhone2 = false
        OkToPhone3 = false
        OkToHome   = false
    }
}
