//
//  TitaniumOperations.swift
//  Hermes
//
//  Created by Trevor Bakker on 3/6/21.
//

import Foundation

func readTitaniumCSV(fileName: URL)
{
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
    var headerRead : Bool = false
    
    var rowCount : Int = 0
    
    for row in rows
    {
        if( headerRead == true )
        {
            let columns = row.components(separatedBy: ",")
            var contactEntry = TitaniumClientContact()
            contactEntry.ClientID = Int(columns[0])!
            
            result.append(columns)
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



