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
        print (columns)
        print ("\n\n\n")
        
    }
    return result
}

func generateClioDefines(fileName: URL)
{
    var outputFile   = URLComponents()
    
    outputFile.path = codePath + "clio.define"
    
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
                do {
                    var fieldName = entry.replacingOccurrences(of: " ", with: "")
                    fieldName = fieldName.replacingOccurrences(of: "\r", with: "")
                    
                    let output : String = "let CLIO_\(fieldName) = \(count)\n"
                    print( output )
                    
                    try output.write(toFile: outputFile.path, atomically: true, encoding: String.Encoding.utf8)
                    
                } catch {
                    print("Had an error opening \(outputFile.path)")
                }
                count += 1
            }
        }
        result.append(columns)
        //print (columns)
       // print ("\n\n\n")
        rowCount += 1;
        
    }
}

