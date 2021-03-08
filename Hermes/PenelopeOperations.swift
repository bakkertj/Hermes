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

    fileStreamer.write("uniqueIndId, firstName, lastName, gender, dateOfBirth, siteName, referral, indLanguage, notes, mainCounty, userDefinedCheckbox3, userDefinedCheckbox4, userDefinedDropdown1, userDefinedDropdown3, userDefinedDropdown4, userDefinedDropdown5, userDefinedDropdown6, userDefinedDropdown7, userDefinedDropdown8, userDefinedDropdown9, userDefinedDropdown10, userDefinedDropdown11, userDefinedDropdown12, userDefinedText1, userDefineText2\n" )
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
        var referral : String = "ERROR"
        if( ValidateLanguage( language : MapQ1848( language: person.q1848 ) ) )
        {
            referral = MapQ1847( language: person.q1848)
        }
        var indLanguage : String = "ERROR"
        if( ValidateLanguage( language : MapQ1847( language: person.q1847 ) ) )
        {
            indLanguage = MapQ1847( language: person.q1847)
        }
        
        let notes : String = findClientContactEntry(who: person.ClientID).Address1 + findClientContactEntry(who: person.ClientID).Address2
        let mainCountry : String = person.q3680
        
        // Bool?
        var userDefinedCheckbox3 : String
        userDefinedCheckbox3 = String( person.q3682).uppercased()
        
        var userDefinedCheckbox4 : String
        userDefinedCheckbox4 = String( person.q1856).uppercased()
        
        var userDefinedDropdown1 : String
        
        if( person.q1844 != "" )
        {
            userDefinedDropdown1 = MapQ1844( titanium: person.q1844 )
        }
        else
        {
            userDefinedDropdown1 = MapQ1844( titanium: person.q3679 )
        }
        
        let userDefinedDropdown3 : String = MapQ1849( titanium: person.q1849 )
        let userDefinedDropdown4 : String = MapQ1853( titanium: person.q1853 )
        let userDefinedDropdown6 : String = MapQ1858( titanium : person.q1858 )
        let userDefinedDropdown7 : String = person.q1850
        let userDefinedDropdown8 : String = person.q1851
        let userDefinedDropdown9 : String = person.q3350
        let userDefinedDropdown10 : String = person.q1852
        let userDefinedDropdown11 : String = MapQ1854( titanium: person.q1854 )
        let userDefinedDropdown12 : String = person.q1855
        
        let userDefinedText1 = findClientContactEntry(who: person.ClientID).FirstName + " " + findClientContactEntry(who: person.ClientID).MiddleName + " " + findClientContactEntry(who: person.ClientID).LastName
        
        let userDefinedText2 : String = String( findClientContactEntry(who: person.ClientID).ClientID )
        
        let output : String = clientID + " , " + name + " , " +  lastName + " , " + person.q1845 + " , " + birthDate + " , " + siteName + " , " + referral + " , " + indLanguage + " , " + notes + " , " + mainCountry + " , " + userDefinedCheckbox3 + " , " + userDefinedCheckbox4 + " , " + userDefinedDropdown1 + " , " + userDefinedDropdown3 + " , " + userDefinedDropdown4 + " , " + "NEED TO DISCUSS" + " , " + userDefinedDropdown6 + " , " + userDefinedDropdown7 + " , " + userDefinedDropdown8 + " , " + userDefinedDropdown9 +  " , " + userDefinedDropdown10 + " , " + userDefinedDropdown11 + " , " + userDefinedDropdown12 + " , " + userDefinedText1 + " , " + userDefinedText2 + "\n"
        
        
        fileStreamer.write( output )
    }
}
