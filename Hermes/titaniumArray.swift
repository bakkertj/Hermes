

struct TitaniumClientContactHeader
{
    var TitaniumClientContactHeaderArray = [String]()
    
    init()
    {
        TitaniumClientContactHeaderArray.append("c_clientid")
        //TitaniumClientContactHeaderArray.append("c_ss_number")  // drop
        //TitaniumClientContactHeaderArray.append("c_studentid")  // drop
        //TitaniumClientContactHeaderArray.append("c_fileno")     // drop
        TitaniumClientContactHeaderArray.append("c_firstname")
        TitaniumClientContactHeaderArray.append("c_middlename")
        TitaniumClientContactHeaderArray.append("c_lastname")
        //TitaniumClientContactHeaderArray.append("c_active")     // drop
        //TitaniumClientContactHeaderArray.append("c_regdate")    // drop
        //TitaniumClientContactHeaderArray.append("c_adddate")    // drop
        //TitaniumClientContactHeaderArray.append("c_editdate")   // drop
        //TitaniumClientContactHeaderArray.append("c_statustext") // drop
        TitaniumClientContactHeaderArray.append("c_email")
        //TitaniumClientContactHeaderArray.append("c_oktoemail")  // drop
        TitaniumClientContactHeaderArray.append("c_phone1")
        TitaniumClientContactHeaderArray.append("c_oktophone1")
        TitaniumClientContactHeaderArray.append("c_phone2")
        TitaniumClientContactHeaderArray.append("c_oktophone2")
        TitaniumClientContactHeaderArray.append("c_phone3")
        TitaniumClientContactHeaderArray.append("c_oktophone3")
        TitaniumClientContactHeaderArray.append("c_address1")
        TitaniumClientContactHeaderArray.append("c_address2")
        TitaniumClientContactHeaderArray.append("c_oktohome")
        TitaniumClientContactHeaderArray.append("c_birthdate")
        TitaniumClientContactHeaderArray.append("c_comment")
        //TitaniumClientContactHeaderArray.append("c_fromweb") // drop
    }
}

struct TitaniumDemographicHeader
{
    var TitaniumDemographicHeaderArray = [String]()
    
    init()
    {
        TitaniumDemographicHeaderArray.append("clientid")
        TitaniumDemographicHeaderArray.append("casenoteid") // drop
        TitaniumDemographicHeaderArray.append("recordtype") // drop
        TitaniumDemographicHeaderArray.append("notedate") // drop
        TitaniumDemographicHeaderArray.append("notetype") // drop
        TitaniumDemographicHeaderArray.append("fname")
        TitaniumDemographicHeaderArray.append("mname")
        TitaniumDemographicHeaderArray.append("lname")
        TitaniumDemographicHeaderArray.append("email") // drop
        TitaniumDemographicHeaderArray.append("q1842")
        TitaniumDemographicHeaderArray.append("q1844")
        TitaniumDemographicHeaderArray.append("q1845")
        TitaniumDemographicHeaderArray.append("q1846") // drop
        TitaniumDemographicHeaderArray.append("q1847")
        TitaniumDemographicHeaderArray.append("q1848")
        TitaniumDemographicHeaderArray.append("q1849")
        TitaniumDemographicHeaderArray.append("q1850")
        TitaniumDemographicHeaderArray.append("q1851")
        TitaniumDemographicHeaderArray.append("q1852")
        TitaniumDemographicHeaderArray.append("q1853")
        TitaniumDemographicHeaderArray.append("q1854")
        TitaniumDemographicHeaderArray.append("q1855")
        TitaniumDemographicHeaderArray.append("qTRUE856")
        TitaniumDemographicHeaderArray.append("qTRUE857a2486")
        TitaniumDemographicHeaderArray.append("qTRUE857a2487")
        TitaniumDemographicHeaderArray.append("qTRUE857a2488")
        TitaniumDemographicHeaderArray.append("qTRUE857a2489")
        TitaniumDemographicHeaderArray.append("qTRUE857a249FALSE")
        TitaniumDemographicHeaderArray.append("qTRUE857a249TRUE")
        TitaniumDemographicHeaderArray.append("qTRUE857a2492")
        TitaniumDemographicHeaderArray.append("qTRUE857a2689")
        TitaniumDemographicHeaderArray.append("qTRUE857a269FALSE")
        TitaniumDemographicHeaderArray.append("qTRUE857a3642")
        TitaniumDemographicHeaderArray.append("q1858")
        TitaniumDemographicHeaderArray.append("q1863") // drop
        TitaniumDemographicHeaderArray.append("q1864") // drop
        TitaniumDemographicHeaderArray.append("q3350")
        TitaniumDemographicHeaderArray.append("q3679")
        TitaniumDemographicHeaderArray.append("q3680")
        TitaniumDemographicHeaderArray.append("q3682")
        TitaniumDemographicHeaderArray.append("q4793") // drop
    }
}
