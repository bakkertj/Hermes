//
//  PenelopeOperations.swift
//  Hermes
//
//  Created by Trevor Bakker on 3/7/21.
//

import Foundation

func writePenelopeContactsFile( fromContacts : [TitaniumClientContact] , fromDemographics : [TitaniumDemographic] )
{
    var fileStreamer = FileStreamer( newFile : "Individual Contacts.csv");
    
    fileStreamer.write("uniqueIndId, contactType, contact, extension, useContact, instructions, primaryContact\n" )
    
    for person in fromDemographics
    {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        
        var masterSet : Bool = false
        
        let clientID : String = String(person.ClientID)
        
        // if telephone exists then create a home entry
        if( findClientContactEntry( who: person.ClientID ).Phone1 != "" )
        {
            var phone : String = findClientContactEntry( who: person.ClientID ).Phone1
            
            phone.insert( "(", at: phone.startIndex )
            phone.insert( ")", at: phone.index(phone.startIndex, offsetBy: 4))
            phone.insert( "-", at: phone.index(phone.startIndex, offsetBy: 8))
            
            var oktocontact : String = ""
            if( findClientContactEntry( who: person.ClientID ).OkToPhone1 )
            {
                oktocontact = "Safe"
            }
            
            masterSet = true;
            
            let output : String = clientID + "," + "Tel (Home)" + "," + phone + "," + "," + "TRUE" + "," + oktocontact + "," + "TRUE" + "\n"
            
            
            fileStreamer.write( output )
        }
        
        // if telephone exists then create a call entry
        if( findClientContactEntry( who: person.ClientID ).Phone2 != "" )
        {
            var phone : String = findClientContactEntry( who: person.ClientID ).Phone2
            
            phone.insert( "(", at: phone.startIndex )
            phone.insert( ")", at: phone.index(phone.startIndex, offsetBy: 4))
            phone.insert( "-", at: phone.index(phone.startIndex, offsetBy: 8))
            
            var oktocontact : String = ""
            if( findClientContactEntry( who: person.ClientID ).OkToPhone2 )
            {
                oktocontact = "Safe"
            }
            
            masterSet = true;
            
            let output : String = clientID + "," + "Tel (Cell)" + "," + phone + "," + "," + "TRUE" + "," + oktocontact + "," + "TRUE" + "\n"
            
            
            fileStreamer.write( output )
        }
        
        // if telephone exists then create a call entry
        if( findClientContactEntry( who: person.ClientID ).Phone3 != "" )
        {
            var phone : String = findClientContactEntry( who: person.ClientID ).Phone3
            
            phone.insert( "(", at: phone.startIndex )
            phone.insert( ")", at: phone.index(phone.startIndex, offsetBy: 4))
            phone.insert( "-", at: phone.index(phone.startIndex, offsetBy: 8))
            
            var oktocontact : String = ""
            if( findClientContactEntry( who: person.ClientID ).OkToPhone3 )
            {
                oktocontact = "Safe"
            }
            
            masterSet = true;
            
            let output : String = clientID + "," + "Work Phone" + "," + phone + "," + "," + "TRUE" + "," + oktocontact + "," + "TRUE" + "\n"
            
            
            fileStreamer.write( output )
        }
        
        // if email exists then create an email entry
        if( findClientContactEntry( who: person.ClientID ).Email != "" )
        {
            let email : String = findClientContactEntry( who: person.ClientID ).Email
            
            var oktocontact : String = ""
            if( findClientContactEntry( who: person.ClientID ).OkToEmail )
            {
                oktocontact = "Safe"
            }
            
            var master : String = "FALSE"
            if( masterSet == false )
            {
                masterSet = true
                master = "TRUE"
            }
            let output : String = clientID + "," + "Email" + "," + email + "," + "," + "TRUE" + "," + oktocontact + "," + master + "\n"
            
            fileStreamer.write( output )
        }
        
        
        
    }
    
    
    
}

func writePenelopeIndividualsFile( fromContacts : [TitaniumClientContact] , fromDemographics : [TitaniumDemographic] )
{
    var fileStreamer = FileStreamer( newFile : "Individuals.csv");
    
    fileStreamer.write("uniqueIndId, firstName, middleInitial, lastName, title, gender, dateOfBirth, siteName, referral, safetyConcern, safetyConcernText, financialConcern, financialConcernText, partnerAware, homeAware, english, indLanguage, taxSchedule, idNum, nii, notes, mainAddress1, mainAddress2, mainCity, mainProvState, mainCounty, mainCountry, mainPcZip, funder, funderDept, userdefinedCountry, userDefinedCheckbox1, userDefinedCheckbox2, userDefinedCheckbox3, userDefinedCheckbox4, userDefinedCheckbox5, userDefinedCheckbox6, userDefinedCheckbox7,   userDefinedDate1, userDefinedDate2, userDefinedDate3, userDefinedDate4, userDefinedDate5, userDefinedDate6, userDefinedDate7, userDefinedDropdown1, userDefinedDropdown2, userDefinedDropdown3, userDefinedDropdown4, userDefinedDropdown5, userDefinedDropdown6, userDefinedDropdown7, userDefinedDropdown8, userDefinedDropdown9, userDefinedDropdown10, userDefinedDropdown11, userDefinedDropdown12, userDefinedMemo1, userDefinedMemo2, userDefinedMemo3, userDefinedMemo4, userDefinedMemo5, userDefinedMemo6, userDefinedText1, userDefineText2, userDefineText3, userDefineText4, userDefineText5, userDefineText6, userDefineText7, userDefineText8, workIdentNo, workName, workContact, workAddress1, workAddress2, workCity, workProvState, workCountry, workPzip,workUrl, workComments\n" )
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
        
        referral = MapQ1848( language: person.q1848)
        
        var indLanguage : String = "ERROR: \(person.q1848)"
        
        indLanguage = MapQ1847( language: person.q1847)
        
        let notes : String = findClientContactEntry(who: person.ClientID).Address1 + " " + findClientContactEntry(who: person.ClientID).Address2
        let mainCounty : String = MapQ3680( titanium: person.q3680 )
        
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
        
        var userDefinedDropdown5 : String = ""
        
        if( person.q1857a2689)
        {
            userDefinedDropdown5 = "0"
        }
        else if ( person.q1857a2486 )
        {
            userDefinedDropdown5 = "1"
        }
        else if ( person.q1857a2487 )
        {
            userDefinedDropdown5 = "2"
        }
        else if ( person.q1857a2488 )
        {
            userDefinedDropdown5 = "3"
        }
        else if ( person.q1857a2489 )
        {
            userDefinedDropdown5 = "4"
        }
        else if ( person.q1857a2490 )
        {
            userDefinedDropdown5 = "5"
        }
        else if ( person.q1857a2491 )
        {
            userDefinedDropdown5 = "6"
        }
        else if ( person.q1857a2492 || person.q1857a2690 )
        {
            userDefinedDropdown5 = "7+"
        }
        else if ( person.q1856 )
        {
            userDefinedDropdown5 = "N/A — no children"
        }
        else if ( person.q1857a3642 )
        {
            userDefinedDropdown5 = ""
        }  
        
        let userDefinedDropdown6  : String = MapQ1858( titanium : person.q1858 )
        let userDefinedDropdown7  : String = MapQ1850( titanium: person.q1850 )
        let userDefinedDropdown8  : String = MapQ1851( titanium: person.q1851 )
        let userDefinedDropdown9  : String = MapQ3350( titanium: person.q3350 )
        let userDefinedDropdown10 : String = MapQ1852( titanium: person.q1852 )
        let userDefinedDropdown11 : String = MapQ1854( titanium: person.q1854 )
        let userDefinedDropdown12 : String = MapQ1855( titanium: person.q1855 )
        
        let userDefinedText1 = findClientContactEntry(who: person.ClientID).FirstName + " " + findClientContactEntry(who: person.ClientID).MiddleName + " " + findClientContactEntry(who: person.ClientID).LastName
        
        let userDefinedText2 : String = String( findClientContactEntry(who: person.ClientID).ClientID )
        
        let output : String = clientID + "," + name + "," + " " + "," + lastName + " , " + " " + "," + person.q1845 + "," + birthDate + "," + siteName + "," + referral + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + indLanguage + "," + " " + "," + " " + "," + " " + "," + notes + "," + " " + "," + " " + "," + " " + "," + " " + "," + mainCounty + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + userDefinedCheckbox3 + "," + userDefinedCheckbox4 + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + userDefinedDropdown1 + "," + " " + "," + userDefinedDropdown3 + "," + userDefinedDropdown4 + "," + userDefinedDropdown5 + ",\"" + userDefinedDropdown6 + "\",\"" + userDefinedDropdown7 + "\",\"" + userDefinedDropdown8 + "\",\"" + userDefinedDropdown9 +  "\",\"" + userDefinedDropdown10 + "\",\"" + userDefinedDropdown11 + "\",\"" + userDefinedDropdown12 + "\"," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + userDefinedText1 + "," + userDefinedText2 + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "\n"
        
        print("Writing \(clientID)")
        fileStreamer.write( output )
    }
}
