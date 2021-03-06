//
//  FileOps.swift
//  Hermes
//
//  Created by Trevor Bakker on 3/5/21.
//

import Foundation

let codePath = "/Users/tbakker/code/Hermes/"

func getFilesFromDirectory(directory : URLComponents , fileList : inout Array<URL> )
{
    do
    {
        let directoryContents = try FileManager.default.contentsOfDirectory(at: directory.url!, includingPropertiesForKeys: nil, options: [])
        
        // Print the urls of the files contained in the documents directory
        
        for file in directoryContents
        {
            if( file.pathExtension == "csv" )
            {
                fileList . append(file)
            }
        }
    } catch {
        print("Could not search for urls of files in documents directory: \(error)")
    }
    print ("Found \(fileList.count) files in \(directory.path).\n")
}


func readCSV(fileName: URL) -> [[String]]
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
    var rowCount = 0;
    for row in rows
    {
        
        let columns = row.components(separatedBy: ",")
        if( rowCount == 0 )
        {
            print( columns[1])
        }
        result.append(columns)
        //print (columns)
        // print ("\n\n\n")
        rowCount += 1;
        
    }
    return result
}

func readClioCSV(fileName: URL) -> [[String]]
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
    for row in rows
    {
        let columns = row.components(separatedBy: ",")
        result.append(columns)
      //  print (columns)
      //  print ("\n\n\n")
        
    }
    return result
}

func generateClioDefines(fileName: URL)
{
    
    var fileStreamer = FileStreamer( newFile : "clio.swift");
    
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
                
                let output : String = "let CLIO_\(fieldName) = \(count)\n"
                fileStreamer.write(output)
                
                
                count += 1
            }
            return
        }
        result.append(columns)
        rowCount += 1;
        
    }
}

