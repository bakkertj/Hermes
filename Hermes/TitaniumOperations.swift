//
//  TitaniumOperations.swift
//  Hermes
//
//  Created by Trevor Bakker on 3/6/21.
//

import Foundation

func readTitaniumDemographicCSV(fileName: URL)
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
            var demographicEntry = TitaniumDemographic()
            demographicEntry.ClientID = Int(columns[TITANIUM_clientid])!
            demographicEntry.FName = columns[TITANIUM_fname]
            demographicEntry.MName = columns[TITANIUM_mname]
            demographicEntry.LName = columns[TITANIUM_lname]
            demographicEntry.q1842 = columns[TITANIUM_q1842]
            demographicEntry.q1844 = columns[TITANIUM_q1844]
            demographicEntry.q1845 = columns[TITANIUM_q1845]
            demographicEntry.q1847 = columns[TITANIUM_q1847]
            demographicEntry.q1848 = columns[TITANIUM_q1848]
            demographicEntry.q1849 = columns[TITANIUM_q1849]
            demographicEntry.q1850 = columns[TITANIUM_q1850]
            demographicEntry.q1851 = columns[TITANIUM_q1851]
            demographicEntry.q1852 = columns[TITANIUM_q1852]
            demographicEntry.q1853 = columns[TITANIUM_q1853]
            demographicEntry.q1854 = columns[TITANIUM_q1854]
            demographicEntry.q1855 = columns[TITANIUM_q1855]
            demographicEntry.qTRUE856 = ( columns[TITANIUM_qTRUE856] as NSString ).boolValue
            demographicEntry.qTRUE857a2486 = ( columns[TITANIUM_qTRUE857a2486] as NSString ).boolValue
            demographicEntry.qTRUE857a2487 = ( columns[TITANIUM_qTRUE857a2487] as NSString ).boolValue
            demographicEntry.qTRUE857a2488 = ( columns[TITANIUM_qTRUE857a2488] as NSString ).boolValue
            demographicEntry.qTRUE857a2489 = ( columns[TITANIUM_qTRUE857a2489] as NSString ).boolValue
            demographicEntry.qTRUE857a249FALSE = ( columns[TITANIUM_qTRUE857a249FALSE] as NSString ).boolValue
            demographicEntry.qTRUE857a249TRUE = ( columns[TITANIUM_qTRUE857a249TRUE] as NSString ).boolValue
            demographicEntry.qTRUE857a2492 = ( columns[TITANIUM_qTRUE857a2492] as NSString ).boolValue
            demographicEntry.qTRUE857a2689 = ( columns[TITANIUM_qTRUE857a2689] as NSString ).boolValue
            demographicEntry.qTRUE857a269FALSE = ( columns[TITANIUM_qTRUE857a269FALSE] as NSString ).boolValue
            demographicEntry.qTRUE857a3642 = ( columns[TITANIUM_qTRUE857a3642] as NSString ).boolValue
            demographicEntry.q1858 = columns[TITANIUM_q1858]
            demographicEntry.q3350 = columns[TITANIUM_q3350]
            demographicEntry.q3679 = columns[TITANIUM_q3679]
            demographicEntry.q3680 = columns[TITANIUM_q3680]
            demographicEntry.q3682 = ( columns[TITANIUM_q3682] as NSString ).boolValue

       
            print (columns)
        }
        headerRead = true;
        rowCount += 1
    }
}

func readTitaniumContactCSV(fileName: URL)
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
            var contactEntry = TitaniumClientContact()
            contactEntry.ClientID   = Int(columns[TITANIUM_c_clientid])!
            contactEntry.FirstName  = columns[TITANIUM_c_firstname]
            contactEntry.MiddleName = columns[TITANIUM_c_middlename]
            contactEntry.LastName   = columns[TITANIUM_c_lastname]
            contactEntry.Email      = columns[TITANIUM_c_email]
            contactEntry.OkToPhone1 = ( columns[TITANIUM_c_oktophone1] as NSString ).boolValue
            contactEntry.OkToPhone2 = ( columns[TITANIUM_c_oktophone2] as NSString ).boolValue
            contactEntry.OkToPhone3 = ( columns[TITANIUM_c_oktophone3] as NSString ).boolValue
            contactEntry.Phone1     = stripPhoneNumber( number: columns[TITANIUM_c_phone1] )
            assert( contactEntry.Phone1.count == 10 || contactEntry.Phone1.count == 0 , "Client \(contactEntry.ClientID) has a bad phone 1" )
            contactEntry.Phone2     = stripPhoneNumber( number: columns[TITANIUM_c_phone2] )
            assert( contactEntry.Phone2.count == 10 || contactEntry.Phone2.count == 0, "Client \(contactEntry.ClientID) has a bad phone 2" )
            contactEntry.Phone3     = stripPhoneNumber( number: columns[TITANIUM_c_phone3] )
            assert( contactEntry.Phone3.count == 10 || contactEntry.Phone3.count == 0, "Client \(contactEntry.ClientID) has a bad phone 3" )
            contactEntry.Address1   = columns[TITANIUM_c_address1]
            contactEntry.Address2   = columns[TITANIUM_c_address2]
            contactEntry.OkToHome   = ( columns[TITANIUM_c_oktohome] as NSString ).boolValue
            
            // To print the date myDate.string(format: "yyyy-MM-dd")
            let tempDate : Date = dateFormatterGet.date(from: columns[TITANIUM_c_birthdate] )!
            contactEntry.BirthDate  = tempDate
            contactEntry.Comment    = columns[TITANIUM_c_comment]
            
            print (columns)
        }
        headerRead = true;
        rowCount += 1
    }
}

func generateTitaniumDefines(fileName: URL)
{
    
    var fileDefineStreamer = FileStreamer( newFile : "titaniumDefines.swift");
    var fileArrayStreamer  = FileStreamer( newFile : "titaniumArray.swift");
    
    var data : String = ""
    
    do
    {
        data = try String(contentsOf: fileName, encoding: .utf8)
    }
    catch
    {
        print("Error opening file \(fileName.path)")
    }
    
    var result: [[String]] = []
    let rows = data.components(separatedBy: "\n")
    var rowCount = 0;
    var count    = 0;
    
    fileArrayStreamer.write("let TitianiumHeaderArray : [String]()\n")
    
    for row in rows
    {
        let columns = row.components(separatedBy: ",")
        if( rowCount == 0 )
        {
            for entry in columns
            {
                // Cleanup the field names that have bad characters
                var fieldName = entry.replacingOccurrences(of: " ", with: "")
                fieldName = fieldName.replacingOccurrences(of: "\r", with: "")
                fieldName = fieldName.replacingOccurrences(of: ":", with: "")
                fieldName = fieldName.replacingOccurrences(of: "?", with: "")
                fieldName = fieldName.replacingOccurrences(of: "-", with: "")
                
                let output : String = "let TITANIUM_\(fieldName) = \(count)\n"
                fileDefineStreamer.write(output)
                
                fileArrayStreamer.write("TitaniumHeaderArray.append(\"TITANIUM_\(fieldName)\")\n")
                
                count += 1
            }
            return
        }
        result.append(columns)
        rowCount += 1;
        
    }
}



