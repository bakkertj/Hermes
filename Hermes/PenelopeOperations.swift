//
//  PenelopeOperations.swift
//  Hermes
//
//  Created by Trevor Bakker on 3/7/21.
//

import Foundation

func writePenelopeIndividualsFile( fromContacts : [TitaniumClientContact] , fromDemographics : [TitaniumDemographic] )
{
    var fileStreamer = FileStreamer( newFile : "Individuals.csv");

    fileStreamer.write("uniqueIndId, firstName, lastName, gender, dateOfBirth, siteName, referral, indLanguage, notes, mainCountry, userDefinedCheckbox3, userDefinedCheckbox4, userDefinedDropdown1, userDefinedDropdown3, userDefinedDropdown4, userDefinedDropdown5, userDefinedDropdown6, userDefinedDropdown7, userDefinedDropdown8, userDefinedDropdown9, userDefinedDropdown10, userDefinedDropdown11, userDefinedDropdown12, userDefinedText1, userDefineText2\n" )
    //writing
    for person in fromDemographics
    {
        let name : String = findClientContactEntry(who: person.ClientID).FirstName + " " + findClientContactEntry(who: person.ClientID).MiddleName
        fileStreamer.write( String(person.ClientID) + " , " + name + " , " +  findClientContactEntry(who: person.ClientID).LastName + "\n")
    }
    
}
