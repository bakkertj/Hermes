//
//  PenelopeOperations.swift
//  Hermes
//
//  Created by Trevor Bakker on 3/7/21.
//

import Foundation

func writePenelopeClioServiceWorkerFile( fromClioMatters: [ClioMatter], fromClioContacts: [ClioContact])
{
    var fileStreamer = FileStreamer( newFile : "Service File Workers.csv");
    
    fileStreamer.write("uniqueServiceFileId, uniqueWorkerId, attendingWorker, primaryWorker \n")
    
    var serviceIFileID : Int = 1
    
    for matter in fromClioMatters
    {
        
        
        let attorney = matter.ResponsibleAttorney
        var workerID = "EBakker"
        
        switch( attorney )
        {
        case "Rachel Elkin": // 1095
            workerID = "RElkin"
        case "Erika Alonso":  //1077
            workerID = "EAlonso" //1079
        case "Andrew Skinner": //1122
            workerID = "ASkinner"
        default:
            workerID = "EBakker"
        }
        
        let output : String = String(  serviceIFileID ) + "," + String(workerID) + "," + "TRUE" + "," + "TRUE" + "\n"
        
        serviceIFileID = serviceIFileID + 1
        
        fileStreamer.write( output )
    }
}

func writePenelopeClioServiceAttachmentsFile( fromClioMatters: [ClioMatter], fromClioContacts: [ClioContact])
{
    var fileStreamer = FileStreamer( newFile : "Service File Attachments.csv");
    
    fileStreamer.write("uniqueServiceFileId, attachmentName \n")
    
    var serviceFileID : Int = 1
    for matter in fromClioContacts
    {
        let ID : String = String( matter.ClientID )
        let output : String = String( serviceFileID ) + "," + ID + ".zip\n"
        serviceFileID = serviceFileID + 1
        fileStreamer.write( output )
    }
}

func writePenelopeClioServiceMembersFile( fromClioMatters: [ClioMatter], fromClioContacts: [ClioContact])
{
    var fileStreamer = FileStreamer( newFile : "Service File Members.csv");
    
    fileStreamer.write("uniqueServiceFileId, uniqueIndId, diagnosis1, diagnosis2, diagnosis3, memberUserDefinedCheckbox1, memberUserDefinedCheckbox2, memberUserDefinedDropdown1, memberUserDefinedDropdown2, presentingServiceFilesMember\n")
    
    var serviceFileID : Int = 1
    for matter in fromClioMatters
    {
        let output : String = String( serviceFileID ) + "," + String( matter.ClientID ) + "," + "" + "," + "" + "," + "" + "," + "" + "," + "" + "," + "" + "," + "" + "," + "" + "TRUE" + "\n"
        serviceFileID = serviceFileID + 1
        fileStreamer.write( output )
    }
}

func writePenelopeClioCaseMembersFile( fromClioMatters: [ClioMatter], fromClioContacts: [ClioContact])
{
    var fileStreamer = FileStreamer( newFile : "Case Members.csv");
    
    fileStreamer.write("uniqueCaseId, uniqueIndId, relationship, primaryCaseMember")
    
    for matter in fromClioMatters
    {
        let output : String = String( matter.ClientID ) + "," + String( matter.ClientID ) + "," + "Self" + "," + "TRUE" + "\n"
        
        if( matter.ClientID != -1 )
        {
            fileStreamer.write( output )
        }
    }
}

func writePenelopeClioCaseFile( fromClioMatters: [ClioMatter], fromClioContacts: [ClioContact])
{
    var fileStreamer = FileStreamer( newFile : "Cases.csv");
    
    fileStreamer.write("uniqueCaseId, caseNickname, caseOpenDate, caseCloseDate, caseHouseIncome, caseFamilySize, fileNo, presentingIssue1, presentingIssue2, presentingIssue3, presentingIssue4, presentingIssue5, intakeUserDefinedCheckbox1, intakeUserDefinedCheckbox2, intakeUserDefinedDate1, intakeUserDefinedDate2, intakeSummary, userDefinedCheckbox1,userDefinedCheckbox2, userDefinedCheckbox3, userDefinedCheckbox4, userDefinedCheckbox5,userDefinedCheckbox6, userDefinedDate1, userDefinedDate2, userDefinedDate3, userDefinedDropdown1, userDefinedDropdown2, userDefinedDropdown3, userDefinedDropdown4, userDefinedDropdown5, userDefinedDropdown6, userDefinedMemo1, userDefinedMemo2, usedDefinedText1, userDefinedText2, userDefinedText3\n")
    
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd"
    
    for matter in fromClioContacts
    {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        
        var openDate : String = ""

        for clioMatter in fromClioMatters
        {
            print( "Searching \(clioMatter.ClientID) and \(matter.ClientID)")
            if( clioMatter.ClientID == matter.ClientID )
            {
               openDate = df.string(from: clioMatter.OpenDate)
               if( openDate == "" || openDate == " " )
               {
                  openDate = "1900-01-01"
               }
               break;
            }
        }

        
        let output : String = String( matter.ClientID ) + "," + " " + "," + openDate + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + "" + "\n"
        
        fileStreamer.write( output )
    }
    
}

func writePenelopeServiceFile( fromClioMatters: [ClioMatter] )
{
    var fileStreamer = FileStreamer( newFile : "Service Files.csv");
    
    fileStreamer.write("uniqueServiceFileId, uniqueCaseId, serviceName, isGroup, serviceFileStart, serviceFileEnd, estimatedSessionCount, userDefinedCheckbox1, userDefinedCheckbox2, userDefinedDate1, userDefinedDate2, userDefinedDropdown1, userDefinedDropdown2, userDefinedMemo1, userDefinedMemo2, userDefinedText1, userDefinedText2, cosenotes, closereason\n" )
    
    var serviceFileID: Int = 1
    var caseID: Int = 1
    
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd"
    
    for matter in fromClioMatters
    {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        
        let openDate : String = df.string(from: matter.OpenDate)
        
        // \TODO Fix it so an empty date does not return a close date
        var closeDate : String = df.string(from: matter.CloseDate)
        
        if( matter.CloseDateFound == false )
        {
            closeDate = ""
        }
        
        for client in ClioContactArray
        {
            if( client.Name == matter.ClientName )
            {
                caseID = client.ClientID
                break
            }
        }
        
        let userDefinedMemo1: String = matter.UserDefinedNotes
        if( caseID == -1 )
        {
            print("Could not find client \(matter.ClientName)")
        }
        
        var phone : String = ""
        
        if( matter.OpposingPartyPhoneNumber != -1 )
        {
            phone = String(matter.OpposingPartyPhoneNumber )
            phone.insert( "(", at: phone.startIndex )
            phone.insert( ")", at: phone.index(phone.startIndex, offsetBy: 4))
            phone.insert( "-", at: phone.index(phone.startIndex, offsetBy: 8))
        }
        let DOB : String = df.string(from: matter.OpposingPartyDOB )
        
        let userDefinedMemo2: String = "Family Court Number: " + matter.FamilyCourtNumber + " Family Case Number: " + matter.FamilyCaseNumber + " Opposing Party: " + matter.OpposingParty + " Opposing Party Address: " + matter.OpposingPartyAddress + " Opposing Party Phone: " + phone + " Opposing Party DOB: " + DOB
        
        
        
        let output : String = String( serviceFileID ) + "," + String( caseID ) + "," + matter.Description + "," + "FALSE" + "," + String(openDate) + "," + String(closeDate) + "," + "" + "," + "" + "," + "" + "," + "" + "," + "" + "," + "" + "," + "" + "," + "\"" + userDefinedMemo1 + "\"" + "," + "\"" + userDefinedMemo2 + "\"" + "," + "" + "," + "" + "," + "" + "," + "" + "\n"
        
        fileStreamer.write( output )
        
        serviceFileID = serviceFileID + 1
        
    }
}

func writePenelopeContactsFile( fromContacts : [TitaniumClientContact] , fromDemographics : [TitaniumDemographic], fromCIS: [TitaniumCIS], fromHotline : [TitaniumHotline], fromClio : [ClioContact] )
{
    var fileStreamer = FileStreamer( newFile : "Individual Contacts.csv");
    
    
    
    fileStreamer.write("uniqueIndId, contactType, contact, extension, useContact, instructions, primaryContact\n" )
    var count : Int = 0;
    
    for person in fromDemographics
    {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        
        var masterSet : Bool = false
        
        let clientID : String = String(person.ClientID)
        
        count = count + 1
        
        contactAlreadyWritten.append( person.ClientID )
        
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
            
            var master : String = "FALSE"
            if( masterSet == false )
            {
                masterSet = true
                master = "TRUE"
            }
            
            let output : String = clientID + "," + "Tel (Cell)" + "," + phone + "," + "," + "TRUE" + "," + oktocontact + "," + master + "\n"
            
            
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
            
            var master : String = "FALSE"
            if( masterSet == false )
            {
                masterSet = true
                master = "TRUE"
            }
            
            let output : String = clientID + "," + "Work Phone" + "," + phone + "," + "," + "TRUE" + "," + oktocontact + "," + master + "\n"
            
            
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
        else {
            
            if( person.Email != "" )
            {
                var master : String = "FALSE"
                if( masterSet == false )
                {
                    masterSet = true
                    master = "TRUE"
                }
                let output : String = clientID + "," + "Email" + "," + person.Email + "," + "," + "" + "," + "" + "," + master + "\n"
                
                fileStreamer.write( output )
            }
        }
    }
    
    var hotlineDict : [ Int : TitaniumHotline ] = [ Int : TitaniumHotline ]()
    for hotlineEntry in fromHotline
    {
        //    print("Adding \(cisEntry.ClientID)")
        hotlineDict[ hotlineEntry.ClientID ] = hotlineEntry
    }
    
    // Write the hotline only contacts
    for person in hotlineDict.values
    {
        let clientID = String ( person.ClientID )
        
        if( ( contactAlreadyWritten.contains( person.ClientID ) == false ) && person.Email != "" )
        {
            count = count + 1
            let output : String = clientID + "," + "Email" + "," + person.Email + "," + "," + "TRUE" + "," + "" + "," + "TRUE" + "\n"
            contactAlreadyWritten.append( person.ClientID )
            fileStreamer.write( output )
        }
        
    }
    
    var clioDict : [ Int : ClioContact ] = [ Int : ClioContact ]()
    for clioEntry in fromClio
    {
        clioDict[ clioEntry.ClientID ] = clioEntry
    }
    // write CIS contacts
    
    // Write the hotline only contacts
    for person in clioDict.values
    {
        var written : Bool = false
        if( ( contactAlreadyWritten.contains( person.ClientID ) == false ) && person.Email != "" )
        {
            count = count + 1
            let email : String = person.Email
            
            let clientID = String ( person.ClientID )
            
            //TODO fix this to verify if email exists
            let output : String = clientID + "," + "Email" + "," + email + "," + "," + "TRUE" + "," + "" + "," + "FALSE" + "\n"
            
            written = true;
            
            fileStreamer.write( output )
        }
        
        if( ( contactAlreadyWritten.contains( person.ClientID ) == false ) && person.PhoneNumber != -1 )
        {
            var phone : String = String( person.PhoneNumber )
            
            phone.insert( "(", at: phone.startIndex )
            phone.insert( ")", at: phone.index(phone.startIndex, offsetBy: 4))
            phone.insert( "-", at: phone.index(phone.startIndex, offsetBy: 8))
            
            let clientID = String ( person.ClientID )
            count = count + 1
            //TODO fix this to verify if email exists
            let output : String = clientID + "," + "Tel (Home)" + "," + phone + "," + "," + "TRUE" + "," + "" + "," + "TRUE" + "\n"
            
            written = true
            
            fileStreamer.write( output )
        }
        
        if( written == true )
        {
            contactAlreadyWritten.append( person.ClientID )
        }
    }
    print("Wrote \(count) client contacts")
}

var excludeList : [String] = [String]()

func writePenelopeIndividualsFile( fromContacts : [TitaniumClientContact] , fromDemographics : [TitaniumDemographic], fromCIS: [TitaniumCIS], fromHotline : [TitaniumHotline], fromClio : [ClioContact])
{
    var fileStreamer = FileStreamer( newFile : "Individuals.csv");
    
    fileStreamer.write("uniqueIndId, firstName, middleInitial, lastName, title, gender, dateOfBirth, siteName, referral, safetyConcern, safetyConcernText, financialConcern, financialConcernText, partnerAware, homeAware, english, indLanguage, taxSchedule, idNum, nii, notes, mainAddress1, mainAddress2, mainCity, mainProvState, mainCounty, mainCountry, mainPcZip, funder, funderDept, userdefinedCountry, userDefinedCheckbox1, userDefinedCheckbox2, userDefinedCheckbox3, userDefinedCheckbox4, userDefinedCheckbox5, userDefinedCheckbox6, userDefinedCheckbox7,   userDefinedDate1, userDefinedDate2, userDefinedDate3, userDefinedDate4, userDefinedDate5, userDefinedDate6, userDefinedDate7, userDefinedDropdown1, userDefinedDropdown2, userDefinedDropdown3, userDefinedDropdown4, userDefinedDropdown5, userDefinedDropdown6, userDefinedDropdown7, userDefinedDropdown8, userDefinedDropdown9, userDefinedDropdown10, userDefinedDropdown11, userDefinedDropdown12, userDefinedMemo1, userDefinedMemo2, userDefinedMemo3, userDefinedMemo4, userDefinedMemo5, userDefinedMemo6, userDefinedText1, userDefineText2, userDefineText3, userDefineText4, userDefineText5, userDefineText6, userDefineText7, userDefineText8, workIdentNo, workName, workContact, workAddress1, workAddress2, workCity, workProvState, workCountry, workPzip,workUrl, workComments\n" )
    
    
    
    var personDict : [ Int : TitaniumDemographic ] = [ Int : TitaniumDemographic ]()
    
    for person in fromDemographics
    {
        personDict[ person.ClientID ] = person;
    }
    
    print("Number of records is \(fromDemographics.count)")
    print("Number of client contacts is \(fromContacts.count)")
    print("Number of unique clients is \(personDict.count)")
    var count : Int = 0
    
    var demographicCount : Int = 0
    for person in personDict.values
    {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        
        let clientID : String = String(person.ClientID)
        
        excludeList.append( clientID )
        
        var name : String = findClientContactEntry(who: person.ClientID).FirstName + " " + findClientContactEntry(who: person.ClientID).MiddleName
        
        var lastName : String = findClientContactEntry(who: person.ClientID).LastName
        
        if( name == " " )
        {
            name = person.FName + " " + person.MName
            lastName = person.LName
        }
        
        if( lastName == "" || lastName == " " )
        {
            lastName = "LNU"
        }
        
        if( name == "" || name == " " )
        {
            name = "FNU"
        }
        
        name = String( name.prefix(24) )
        lastName = String( lastName.prefix(24) )
        
        let birthDate : String = df.string(from: findClientContactEntry(who: person.ClientID).BirthDate)
        
        let siteName : String = MapQ1842( from: person.q1842 )
        var referral : String = "ERROR"
        
        referral = MapQ1848( language: person.q1848)
        
        var indLanguage : String = "ERROR: \(person.q1848)"
        
        indLanguage = MapQ1847( language: person.q1847)
        
        var notes : String = findClientContactEntry(who: person.ClientID).Address1 + " " + findClientContactEntry(who: person.ClientID).Address2
        
        notes = notes.replacingOccurrences( of: "\n", with: " ")
        notes = notes.replacingOccurrences( of: "\r", with: " ")
        
        
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
            userDefinedDropdown5 = "7+ "
        }
        else if ( person.q1856 )
        {
            userDefinedDropdown5 = "\"N/A - no children\""
        }
        else if ( person.q1857a3642 )
        {
            userDefinedDropdown5 = ""
        }
        
        let userDefinedDropdown6  : String = MapQ1858( titanium: person.q1858 )
        let userDefinedDropdown7  : String = MapQ1850( titanium: person.q1850 )
        let userDefinedDropdown8  : String = MapQ1851( titanium: person.q1851 )
        let userDefinedDropdown9  : String = MapQ3350( titanium: person.q3350 )
        let userDefinedDropdown10 : String = MapQ1852( titanium: person.q1852 )
        let userDefinedDropdown11 : String = MapQ1854( titanium: person.q1854 )
        let userDefinedDropdown12 : String = MapQ1855( titanium: person.q1855 )
        
        let userDefinedText1 = name + " " + lastName
        
        let userDefinedText2 : String = clientID
        
        let userDefinedMemo1 : String = findClientContactEntry(who: person.ClientID).Comment.replacingOccurrences(of: ",", with: " ")
        
        let gender : String = MapGender( from: person.q1845 )
        
        count = count + 1
        
        let output : String = clientID + "," + name + "," + " " + "," + lastName + " , " + " " + "," + gender + "," + birthDate + "," + siteName + "," + referral + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + indLanguage + "," + " " + "," + " " + "," + " " + "," + notes + "," + " " + "," + " " + "," + " " + "," + " " + "," + mainCounty + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + userDefinedCheckbox3 + "," + userDefinedCheckbox4 + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + userDefinedDropdown1 + "," + " " + "," + userDefinedDropdown3 + "," + userDefinedDropdown4 + "," + userDefinedDropdown5 + ",\"" + userDefinedDropdown6 + "\",\"" + userDefinedDropdown7 + "\",\"" + userDefinedDropdown8 + "\",\"" + userDefinedDropdown9 +  "\",\"" + userDefinedDropdown10 + "\",\"" + userDefinedDropdown11 + "\",\"" + userDefinedDropdown12 + "\"," + userDefinedMemo1 + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + userDefinedText1 + "," + userDefinedText2 + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "\n"
        
        fileStreamer.write( output )
        demographicCount += 1
    }
    
    var clientDict : [ Int : TitaniumClientContact ] = [ Int : TitaniumClientContact ]()
    for clientEntry in fromContacts
    {
        clientDict[ clientEntry.ClientID ] = clientEntry
    }
    
    var clientCount : Int = 0
    for clientEntry in clientDict.values
    {
        if( excludeList.contains( String(clientEntry.ClientID) ) == false )
        {
            count = count + 1
            //       print("Found a ClientContact \(clientEntry.ClientID)")
            excludeList.append(String(clientEntry.ClientID))
            var name     = clientEntry.FirstName + " " + clientEntry.MiddleName
            var lastName = clientEntry.LastName
            
            if( lastName == "" || lastName == " " )
            {
                lastName = "LNU"
            }
            
            if( name == "" || name == " " )
            {
                name = "FNU"
            }
            
            let output : String = String(clientEntry.ClientID) + "," + name + "," + " " + "," + lastName + " , " + " " + "," + "Female" + "," + " " + "," + "Outreach" + "," + " " + "," + " " + "," + " "
                + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + ",\"" + " " + "\",\"" + " " + "\",\"" + " " + "\",\"" + " " +  "\",\"" + " " + "\",\"" + " " + "\",\"" + " " + "\"," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "\n"
            
            fileStreamer.write( output )
            clientCount = clientCount + 1
            
        }
    }
    
    var cisDict : [ Int : TitaniumCIS ] = [ Int : TitaniumCIS ]()
    for cisEntry in fromCIS
    {
        //    print("Adding \(cisEntry.ClientID)")
        cisDict[ cisEntry.ClientID ] = cisEntry
    }
    
    
    var cisCount : Int = 0
    for cisEntry in cisDict.values
    {
        if( excludeList.contains( String(cisEntry.ClientID) ) == false )
        {
            count = count + 1
            //    print("Found a CIS \(cisEntry.ClientID)")
            excludeList.append(String(cisEntry.ClientID))
            var name     = cisEntry.FName + " " + cisEntry.MName
            var lastName = cisEntry.LName
            
            if( lastName == "" || lastName == " " )
            {
                lastName = "LNU"
            }
            
            if( name == "" || name == " " )
            {
                name = "FNU"
            }
            
            let gender : String = MapGender( from: cisEntry.Gender)
            
            let output : String = String(cisEntry.ClientID) + "," + name + "," + " " + "," + lastName + " , " + " " + "," + gender + "," + " " + "," + "Outreach" + "," + " " + "," + " " + "," + " "
                + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + ",\"" + " " + "\",\"" + " " + "\",\"" + " " + "\",\"" + " " +  "\",\"" + " " + "\",\"" + " " + "\",\"" + " " + "\"," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "\n"
            
            fileStreamer.write( output )
            cisCount = cisCount + 1
        }
    }
    
    
    
    var hotlineDict : [ Int : TitaniumHotline ] = [ Int : TitaniumHotline ]()
    
    for hotline in fromHotline
    {
        hotlineDict[ hotline.ClientID ] = hotline;
    }
    
    var hotlineCount : Int = 0
    
    for hotline in hotlineDict.values
    {
        if( excludeList.contains( String(hotline.ClientID) ) == false )
        {
            count = count + 1
            excludeList.append(String(hotline.ClientID))
            
            var name     = hotline.FName + " " + hotline.MName
            var lastName = hotline.LName
            
            if( lastName == "" || lastName == " " )
            {
                lastName = "LNU"
            }
            
            if( name == "" || name == " " )
            {
                name = "FNU"
            }
            
            
            let output : String = String(hotline.ClientID) + "," + name + "," + " " + "," + lastName + " , " + " " + "," + "Female" + "," + " " + "," + "Shelter" + "," + " " + "," + " " + "," + " "
                + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + ",\"" + " " + "\",\"" + " " + "\",\"" + " " + "\",\"" + " " +  "\",\"" + " " + "\",\"" + " " + "\",\"" + " " + "\"," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "\n"
            
            fileStreamer.write( output )
            hotlineCount = hotlineCount + 1
        }
        
    }
    
    // \TODO Add address
    
    // Write the hotline only contacts
    for person in fromClio
    {
        if( excludeList.contains( String(person.ClientID) ) == false )
        {
            count = count + 1
            excludeList.append(String(person.ClientID))
            
            let input_name     = person.Name
        
            let name_array = input_name.split(separator: " ")
            var name : String = ""

            for i in 0..<(name_array.count-1)
            {
                name = name + name_array[i] + " "
            }
            
            var lastName = name_array[name_array.count - 1]
            
            if( lastName == "" || lastName == " " )
            {
                lastName = "LNU"
            }
            
            if( name == "" || name == " " )
            {
                name = "FNU"
            }
            
            let language = MapQ1847( language: person.Language )
            
            let output : String = String(person.ClientID) + "," + name + "," + " " + "," + lastName + " , " + " " + "," + "Female" + "," + " " + "," + "Outreach" + "," + " " + "," + " " + "," + " "
                + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + language + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + ",\"" + " " + "\",\"" + " " + "\",\"" + " " + "\",\"" + " " +  "\",\"" + " " + "\",\"" + " " + "\",\"" + " " + "\"," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "," + " " + "\n"
            
            fileStreamer.write( output )
        }
    }
    
    print("Wrote \(count) Total Records")
    print("Demographic Count        : \(demographicCount)")
    print("Client Contact Count     : \(clientCount)")
    print("CIS Count                : \(cisCount)")
    print("Hotline Count            : \(hotlineCount)")
}
