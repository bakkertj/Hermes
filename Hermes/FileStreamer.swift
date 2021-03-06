//
//  FileStreamer.swift
//  Hermes
//
//  Created by Trevor Bakker on 3/5/21.
//

import Foundation

struct FileStreamer {
    lazy var fileHandle = FileHandle(forWritingAtPath: logPath)
    
    var providedFileName : String = ""
 

    init( newFile: String )
    {
        print("Opening \(newFile)\n")
        self.providedFileName = "\(newFile)"
    }
    
    lazy var logPath: String = {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)[0]
        let filePath = path + "/\(providedFileName)"
        if FileManager.default.fileExists(atPath: filePath) == false{
            FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
        }
        return filePath

    }()

    mutating func write(_ string: String) {
        fileHandle?.seekToEndOfFile()
        if let data = string.data(using: String.Encoding.utf8){
            fileHandle?.write(data)
        }
    }
}
