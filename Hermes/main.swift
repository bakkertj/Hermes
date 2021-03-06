//
//  main.swift
//  Hermes
//
//  Created by Trevor Bakker on 3/5/21.
//

import Foundation
import ArgumentParser

var titaniumOption: String = ""
var clioOption: String = ""
var outputOption: String = ""
var generateFilesOption: Bool = false;


struct Hermes: ParsableCommand {
    @Argument(help: "directory to find the titanium CSV files.")
    var titaniumDirectory: String
    @Argument(help: "directory to find the clio CSV files.")
    var clioDirectory: String
    @Argument(help: "directory to output the penelope CSV files.")
    var outputDirectory: String
    @Flag(inversion: .prefixedNo)
    var generateFiles: Bool = true
    
    mutating func run() throws {
        titaniumOption      = self.titaniumDirectory
        clioOption          = self.clioDirectory
        outputOption        = self.outputDirectory
        generateFilesOption = self.generateFiles
    }
}

Hermes.main()

var titaniumFiles       = Array<URL>()
var clioFiles           = Array<URL>()

var titaniumDirectory   = URLComponents()
var clioDirectory       = URLComponents()
var outputDirectory     = URLComponents()

titaniumDirectory.path = titaniumOption
clioDirectory.path     = clioOption
outputDirectory.path   = outputOption


if ( generateFilesOption == true )
{
    getFilesFromDirectory(directory:titaniumDirectory,  fileList:&titaniumFiles )
    
    for file in titaniumFiles
    {
        generateTitaniumDefines( fileName:file )
    }
    
    getFilesFromDirectory(directory:clioDirectory,      fileList:&clioFiles )
    
    for file in clioFiles
    {
        generateClioDefines( fileName:file )
    }
}

getFilesFromDirectory(directory:titaniumDirectory,  fileList:&titaniumFiles )

for file in titaniumFiles
{
    readTitaniumCSV( fileName:file )
}
