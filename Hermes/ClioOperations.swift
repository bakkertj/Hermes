//
//  ClioOperations.swift
//  Hermes
//
//  Created by Trevor Bakker on 2021-03-20.
//

import Foundation

func readClioMattersCSV(fileName: URL)
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
            print("\(clioEntry.ClientName)")
            if( columns[CLIO_matter_closedate] != "" && columns[CLIO_matter_closedate] != " ")
            {
                clioEntry.CloseDate = dateFormatterGet.date(from: columns[CLIO_matter_closedate] )!
            }
            
            if( columns[CLIO_opposingpartydob] != "" && columns[CLIO_opposingpartydob] != " ")
            {
                clioEntry.OpposingPartyDOB  = dateFormatterGet.date(from: columns[CLIO_opposingpartydob] )!
            }
            
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
