//
//  FileOps.swift
//  Hermes
//
//  Created by Trevor Bakker on 3/5/21.
//

import Foundation


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
    for row in rows
    {
        let columns = row.components(separatedBy: ",")
        result.append(columns)
        print (columns)
        print ("\n\n\n")
        
    }
    return result
}
