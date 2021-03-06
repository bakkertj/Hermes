//
//  main.swift
//  Hermes
//
//  Created by Trevor Bakker on 3/5/21.
//

import Foundation
import ArgumentParser
import AppKit

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

var contactAlreadyWritten : [ Int ] = [ Int ]()


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


titaniumDirectory.path = titaniumOption + "/Birthday"
getFilesFromDirectory(directory:titaniumDirectory,  fileList:&titaniumFiles )

for file in titaniumFiles
{
    readTitaniumBirthdateCSV( fileName:file )
}

titaniumFiles.removeAll()


titaniumDirectory.path = titaniumOption + "/ClientContact"
getFilesFromDirectory(directory:titaniumDirectory,  fileList:&titaniumFiles )

for file in titaniumFiles
{
    readTitaniumContactCSV( fileName:file )
}

titaniumFiles.removeAll()

titaniumDirectory.path = titaniumOption + "/Demographic"
getFilesFromDirectory(directory:titaniumDirectory,  fileList:&titaniumFiles )

for file in titaniumFiles
{
    readTitaniumDemographicCSV( fileName:file )
}

titaniumFiles.removeAll()

titaniumDirectory.path = titaniumOption + "/CIS"
getFilesFromDirectory(directory:titaniumDirectory,  fileList:&titaniumFiles )

for file in titaniumFiles
{
    readTitaniumCISCSV( fileName:file )
}


titaniumFiles.removeAll()

titaniumDirectory.path = titaniumOption + "/Hotline"
getFilesFromDirectory(directory:titaniumDirectory,  fileList:&titaniumFiles )

for file in titaniumFiles
{
    readTitaniumHotlineCSV( fileName:file )
}

titaniumFiles.removeAll()
titaniumDirectory.path = titaniumOption + "/AdultShelter"
getFilesFromDirectory(directory:titaniumDirectory,  fileList:&titaniumFiles )

for file in titaniumFiles
{
    print ("Reading shelter")
    readTitaniumAdultShelterCSV( fileName:file )
}

titaniumFiles.removeAll()
titaniumDirectory.path = titaniumOption + "/ChildShelter"
getFilesFromDirectory(directory:titaniumDirectory,  fileList:&titaniumFiles )

for file in titaniumFiles
{
    print ("Reading shelter")
    readTitaniumChildShelterCSV( fileName:file )
}


clioFiles.removeAll()

clioDirectory.path = clioOption + "/contacts"
getFilesFromDirectory(directory:clioDirectory,  fileList:&clioFiles )

for file in clioFiles
{
    readClioContactsCSV( fileName:file )
}

clioFiles.removeAll()

clioDirectory.path = clioOption + "/matters"
getFilesFromDirectory(directory:clioDirectory,  fileList:&clioFiles )

for file in clioFiles
{
    readClioMattersCSV( fileName:file ) 
}


writePenelopeIndividualsFile( fromContacts: TitaniumClientContactArray, fromDemographics: TitaniumDemographicArray, fromCIS: TitaniumCISArray, fromHotline: TitaniumHotlineArray, fromClio: ClioContactArray, fromAdultShelter: TitaniumAdultShelterArray, fromChildShelter: TitaniumChildShelterArray  )

writePenelopeContactsFile( fromContacts: TitaniumClientContactArray, fromDemographics: TitaniumDemographicArray, fromCIS: TitaniumCISArray, fromHotline: TitaniumHotlineArray, fromClio: ClioContactArray )

writePenelopeServiceFile( fromClioMatters: ClioMatterArray )
writePenelopeClioCaseFile( fromClioMatters: ClioMatterArray, fromClioContacts: ClioContactArray )
writePenelopeClioCaseMembersFile( fromClioMatters: ClioMatterArray, fromClioContacts: ClioContactArray )
writePenelopeClioServiceMembersFile( fromClioMatters: ClioMatterArray, fromClioContacts: ClioContactArray )
writePenelopeClioServiceWorkerFile( fromClioMatters: ClioMatterArray, fromClioContacts: ClioContactArray )
writePenelopeClioServiceAttachmentsFile( fromClioMatters: ClioMatterArray, fromClioContacts: ClioContactArray )

NSSound.beep()
print("Done!")

