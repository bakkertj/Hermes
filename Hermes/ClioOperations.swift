//
//  ClioOperations.swift
//  Hermes
//
//  Created by Trevor Bakker on 2021-03-20.
//

import Foundation

func readClioContactsCSV(fileName: URL)
{
    var data : String = ""
    
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd"
    dateFormatterGet.locale = Locale(identifier: "en_US")
  
    do
    {
        data = try String(contentsOf: fileName, encoding: .utf8)
    }
    catch
    {
        print("Error opening file \(fileName.path)")
    }
    
    let rows = data.components(separatedBy: "\n")
    var headerRead : Bool = false
    
    var rowCount : Int = 0
    
    for row in rows
    {
        if( headerRead == true )
        {
            let columns = row.components(separatedBy: ",")

            var clioContact : ClioContact = ClioContact()
            
            clioContact.ClientID = Int ( columns[CLIO_contact_clientid] )!
            clioContact.Name = columns[CLIO_contact_name]
            
            if( columns[ CLIO_contact_phonenumber] != "")
            {
                clioContact.PhoneNumber = Int( columns[CLIO_contact_phonenumber] )!
            }
            clioContact.StreetAddress = columns[CLIO_contact_address]
            clioContact.City = columns[CLIO_contact_city]
            clioContact.State = columns[ CLIO_contact_state]
            clioContact.Country = columns[ CLIO_contact_country]
            clioContact.Notes = columns[CLIO_contact_notes]
            clioContact.Immigration = columns[CLIO_contact_immigration]
            clioContact.Language = columns[CLIO_contact_language]
            clioContact.Race = columns[CLIO_contact_race]
            clioContact.Email = columns[CLIO_contact_email]

            ClioContactArray.append(clioContact)
        }
        
        headerRead = true;
        rowCount += 1
    }
    
}


func lookupClientIDFromClio( fromClioContact: [ClioContact], name: String ) -> Int
{
    for clientContact in fromClioContact{
        if( clientContact.Name == name )
        {
            return ( clientContact.ClientID )
        }
    }
    return -1
}

func readClioMattersCSV(fileName: URL )
{
    var data : String = ""
    
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd"
    dateFormatterGet.locale = Locale(identifier: "en_US")
  
    do
    {
        data = try String(contentsOf: fileName, encoding: .utf8)
    }
    catch
    {
        print("Error opening file \(fileName.path)")
    }
    
    let rows = data.components(separatedBy: "\n")
    var headerRead : Bool = false
    
    var rowCount : Int = 0
    
    for row in rows
    {
        if( headerRead == true )
        {
            let columns = row.components(separatedBy: ",")

            var clioEntry : ClioMatter = ClioMatter()
            
            clioEntry.ClientName = columns[CLIO_matter_clientname]
            
            clioEntry.ClientID = lookupClientIDFromClio( fromClioContact: ClioContactArray, name: clioEntry.ClientName )
            assert( clioEntry.ClientID != -1 );
            clioEntry.Description = MapClioDescription(clio: columns[CLIO_matter_description])
            
            if( columns[CLIO_matter_opendate] != "" && columns[CLIO_matter_opendate] != " ")
            {
                clioEntry.OpenDate = dateFormatterGet.date(from: columns[CLIO_matter_opendate] )!
            }
            
            
            if( columns[CLIO_matter_closedate] != "" && columns[CLIO_matter_closedate] != " ")
            {
                clioEntry.CloseDateFound = true
                clioEntry.CloseDate = dateFormatterGet.date(from: columns[CLIO_matter_closedate] )!
            }
            
            if( columns[CLIO_opposingpartydob] != "" && columns[CLIO_opposingpartydob] != " ")
            {
                clioEntry.OpposingPartyDOB  = dateFormatterGet.date(from: columns[CLIO_opposingpartydob] )!
            }
            
            clioEntry.OpposingPartyAddress = columns[CLIO_opposingaddress]
            clioEntry.OpposingParty = columns[ CLIO_opposingparty ]
            
            if( columns[CLIO_opposingpartyphonenumber] != "" && columns[CLIO_opposingpartyphonenumber] != " ")
            {
                clioEntry.OpposingPartyPhoneNumber = Int( columns[ CLIO_opposingpartyphonenumber] )!
            }
            clioEntry.ResponsibleAttorney = columns[ CLIO_responsibleattorney ]
            clioEntry.UserDefinedNotes = columns[ CLIO_userdefinednotes ]
            clioEntry.FamilyCourtNumber = columns[ CLIO_familycourtnumber ]
            clioEntry.FamilyCaseNumber = columns[ CLIO_familycourtnumber ]
        
            ClioMatterArray.append( clioEntry )
        }
        
        headerRead = true;
        rowCount += 1
    }
    
}
