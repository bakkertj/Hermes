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

struct Hermes: ParsableCommand {
    @Argument(help: "directory to find the titanium CSV files.")
    var titaniumDirectory: String
    @Argument(help: "directory to find the clio CSV files.")
    var clioDirectory: String
    @Argument(help: "directory to output the penelope CSV files.")
    var outputDirectory: String

    mutating func run() throws {
        titaniumOption  = self.titaniumDirectory
        clioOption      = self.clioDirectory
        outputOption    = self.outputDirectory
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


getFilesFromDirectory(directory:titaniumDirectory,  fileList:&titaniumFiles )

for file in titaniumFiles
{
    print ( readCSV( fileName:file ) )
}

getFilesFromDirectory(directory:clioDirectory,      fileList:&clioFiles )

for file in clioFiles
{
    generateClioDefines( fileName:file )
}
