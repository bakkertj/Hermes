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
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        
        let clientID : String = String(person.ClientID)
        let name : String = findClientContactEntry(who: person.ClientID).FirstName + " " + findClientContactEntry(who: person.ClientID).MiddleName
        let lastName : String = findClientContactEntry(who: person.ClientID).LastName
        let birthDate : String = df.string(from: findClientContactEntry(who: person.ClientID).BirthDate)
        
        let siteName : String = MapQ1842( from: person.q1842 )
        let referral : String = person.q1848
        var indLanguage : String = "ERROR"
        if( ValidateLanguage( language : MapQ1847( language: person.q1847 ) ) )
        {
            indLanguage = MapQ1847( language: person.q1847)
        }
        
        let notes : String = findClientContactEntry(who: person.ClientID).Address1 + findClientContactEntry(who: person.ClientID).Address2
        let mainCountry : String = person.q3680
        
        var userDefinedCheckbox3 : String
        
        if( person.q1844 != "" )
        {
            userDefinedCheckbox3 = person.q1844
        }
        else
        {
            userDefinedCheckbox3 = person.q3679
        }
        
        
        let output : String = clientID + " , " + name + " , " +  lastName + " , " + person.q1845 + " , " + birthDate + " , " + siteName + " , " + referral + " , " + indLanguage + " , " + notes + " , " + mainCountry + " , " + userDefinedCheckbox3 + "\n"
        
        fileStreamer.write( output )
    }
}
