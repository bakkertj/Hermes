//
//  DataValidator.swift
//  Hermes
//
//  Created by Trevor Bakker on 3/6/21.
//
// https://stackoverflow.com/questions/27998409/email-phone-validation-in-swift

import Foundation

func isValidPhoneNumber(value: String) -> Bool {
    let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    let result = phoneTest.evaluate(with: value)
    return result
}

func isValidEmail(testStr:String) -> Bool {
    print("validate emilId: \(testStr)")
    let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let result = emailTest.evaluate( with: testStr)
    return result
}

extension String {
    var bool: Bool? {
        print("Trying \(self)\n")
        switch self.lowercased() {
        case "true", "t", "yes", "y":
            return true
        case "false", "f", "no", "n", "", "FALSE":
            return false
        default:
            return false
        //return nil
        }
    }
}

extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

func stripPhoneNumber( number : String ) -> String{
    return String(number.filter { !" \n\t\rzxcvbnm,.asdfghjklqwertyuiop[]()-/".contains($0) })
}

func MapQ1842( from: String ) -> String
{
    switch from
    {
    case "OR": return "Outreach"
    case "Outreach": return "Outreach"
    case "SH": return "Shelter"
    case "Shelter": return "Shelter"
    case "AH": return "Annie's House"
    case "Annie's House": return "Annie's House"
    case "Thrift": return "Outreach"
    case "Thrift Store": return "Outreach"
    case "School": return "Shelter"
    case "OR Child Care": return "Outreach"
    case "OR Childcare" : return "Outreach"
    case "No Response": return "Outreach"
    case "<No Response>": return "Outreach"
    default: return "ERROR: \(from)"
    }
}

func ValidateLanguage( language : String ) -> Bool
{
    switch language {
    case "English": return true
    case "French": return true
    case "Spanish": return true
    case "Serbo-Croatian": return true
    case "Chinese": return true
    case "Arabic": return true
    case "Armenian": return true
    case "Assyrian": return true
    case "Azerbaijani": return true
    case "Bahasa": return true
    case "Bangla": return true
    case "Bengali": return true
    case "Bosnian": return true
    case "Bulgarian": return true
    case "Burmese": return true
    case "Byelorussian": return true
    case "Cantonese": return true
    case "Croatian": return true
    case "Czech": return true
    case "Danish": return true
    case "Dutch": return true
    case "Dzongkha": return true
    case "Estonian": return true
    case "Faroese": return true
    case "Finnish": return true
    case "Georgian French": return true
    case "German": return true
    case "Greek": return true
    case "Greenlandic": return true
    case "Hasaniya": return true
    case "Hassaniya": return true
    case "Hebrew": return true
    case "Hindi": return true
    case "Hungarian": return true
    case "Icelandic": return true
    case "Italian": return true
    case "Japanese": return true
    case "Kazakh": return true
    case "Khalkha": return true
    case "Khmer": return true
    case "Kinyarwanda": return true
    case "Kirghiz": return true
    case "Kirundi": return true
    case "Kiswahili": return true
    case "Korean": return true
    case "Lao": return true
    case "Latvian": return true
    case "Lithuanian": return true
    case "Luxembourgish": return true
    case "Macedonian": return true
    case "Mahorian": return true
    case "Malay": return true
    case "Maldivian": return true
    case "Maltese": return true
    case "Mandarin": return true
    case "Marathi": return true
    case "Moldovan": return true
    case "Nauruan": return true
    case "Nepali": return true
    case "Norwegian": return true
    case "Pashtu": return true
    case "Persian": return true
    case "Polish": return true
    case "Portuguese": return true
    case "Punjabi": return true
    case "Romanian": return true
    case "Russian": return true
    case "Samoan": return true
    case "Sangho": return true
    case "Serbian": return true
    case "Sesotho": return true
    case "Sinhala": return true
    case "Slovak": return true
    case "Slovenian": return true
    case "Somali": return true
    case "Tajik": return true
    case "Tamil": return true
    case "Telugu": return true
    case "Thai": return true
    case "Tokelauan": return true
    case "Tongan": return true
    case "Turkish": return true
    case "Turkmen": return true
    case "Tuvaluan": return true
    case "Ukrainian": return true
    case "Uzbek": return true
    case "Vietnamese": return true
    case "ASL": return true
    case "Kurdish": return true
    case "Maori": return true
    case "Other (indicate in notes)": return true;
    default:
        return false;
    }
    
}

func MapQ1847( language : String ) -> String
{
    switch language{
    case "English": return "English"
    case "Spanish": return "Spanish"
    case "Both (English & Spanish)": return "English & Spanish (both)"
    case "Both (English/Spanish)": return "English & Spanish (both)"
    case "Other": return "Other"
    case "No Response": return ""
    case "<No Response>": return ""
    default: return "ERROR: \(language)"
    }
}

func MapQ1848( language : String ) -> String
{
    switch language{
    case "English": return "English"
    case "Spanish": return "Spanish"
    case "Both (English & Spanish)": return "English & Spanish (both)"
    case "Both (English/Spanish)": return "English & Spanish (both)"
    case "Other": return "Other"
    case "No Response": return ""
    case "<No Response>": return ""
    case "":return ""
    default: return "ERROR: \(language)"
    }
}

func MapQ1849( titanium : String ) -> String
{
    switch titanium{
    case "Yes": return "Current Involvement"
    case "No": return "No Involvement"
    case "Previously": return "Previous Involvement"
    case "No Response": return ""
    case "<No Response>": return ""
    default: return "ERROR: \(titanium)"
    }
}

func MapQ1853( titanium : String ) -> String
{
    switch titanium
    {
    case "Not employed": return "Not employed"
    case "Not Employed": return "Not employed"
    case "Employed Part-Time": return "Part-time"
    case "Employed part-time": return "Part-time"
    case "Full-time": return "Full-time"
    case "Full Time": return "Full-time"
    case "Full-Time": return "Full-time"
    case "2+ jobs": return "2+ jobs"
    case "2+Jobs": return "2+ jobs"
    case "No Response": return ""
    case "<No Response>": return ""
    default: return "ERROR: \(titanium)"
    }
}

func MapQ1854( titanium : String ) -> String
{
    switch titanium{
    case "Currently in a relationship with abuser": return "In a relationship with abuser"
    case "On and off relationship with abuser": return "On/off relationship with abuser"
    case "On and Off relationship with abuser": return "On/off relationship with abuser"
    case "Terminated relationship with abuser": return "Ended relationship with abuser"
    case "No Response": return ""
    case "<No Response>": return ""
    default: return "ERROR: \(titanium)"
    }
}

func MapQ1858( titanium : String ) -> String
{
    switch titanium {
    case "Would not qualify at this time" : return "No and would not qualify"
    case "would not qualitfy at this time" : return "No and would not qualify"
    case "Has applied" : return "No, but has applied"
    case "Has a protective order" : return "Yes, currently has a protective order"
    case "Does not have a protective order" : return "No"
    case "would not qualify at this time" : return "No and would not qualify"
    case "has applied" : return "No, but has applied"
    case "has a protective order" : return "Yes, currently has a protective order"
    case "does not have a protective order" : return "No"
    case "No Response": return ""
    case "<No Response>": return ""
    default: return "ERROR: \(titanium)"
    }
}

func MapQ1844( titanium : String ) -> String
{
    switch titanium {
    case "white" : return "Caucasian/White"
    case "Caucasian/White" : return "Caucasian/White"
    case "Anglo American / White" : return "Caucasian/White"
    case "black" : return "African American/Black"
    case "African American/Black" : return "African American/Black"
    case "African American / Black" : return "African American/Black"
    case "Hispanic American / Latino" : return "Hispanic/Latino"
    case "hispanic" : return "Hispanic/Latino"
    case "Hispanic/Latino" : return "Hispanic/Latino"
    case "Other" : return "Other"
    case "other" : return "Other"
    case "White" : return "Caucasian/White"
    case "Black" : return "African American/Black"
    case "Hispanic" : return "Hispanic/Latino"
    case "Asian/Pacific American": return "Asian/Pacific American"
    case "2 or more races" : return "2 or more races"
    case "Native American": return "Native American"
    case "No Response": return ""
    case "<No Response>": return ""
    case "" : return ""
    case " " : return ""
    default: return "ERROR: \(titanium)"
    }
}


func MapQ3680( titanium : String ) -> String
{
    switch titanium {
    case "Other": return ""
    default: return titanium
    }
}

func MapQ1850( titanium : String ) -> String
{
    switch titanium {
    case "$0": return "$0"
    case "$0.00": return "$0"
    case "$0.00 ": return "$0"
    case "$1-$30K": return "$1-$30k"
    case "$30K-$75K": return "$30k-$75k"
    case "$75K-$150K": return "$75k-$150k"
    case "$150K+": return "$150k+"
    case "$1-$30k": return "$1-$30k"
    case "$30k-$75k": return "$30k-$75k"
    case "$75k-$150k": return "$75k-$150k"
    case "$150k+": return "$150k+"
    case "Unknown": return "Unknown"
    case "No Response": return ""
    case "<No Response>": return ""
    default: return "ERROR: \(titanium)"
    }
}

func MapQ1851( titanium : String ) -> String
{
    switch titanium {
    case "$0": return "$0"
    case "$0.00": return "$0"
    case "$0.00 ": return "$0"
    case "$1-$30K": return "$1-$30k"
    case "$30K-$75K": return "$30k-$75k"
    case "$75K-$150K": return "$75k-$150k"
    case "$150K+": return "$150k+"
    case "$1-$30k": return "$1-$30k"
    case "$30k-$75k": return "$30k-$75k"
    case "$75k-$150k": return "$75k-$150k"
    case "$150k+": return "$150k+"
    case "Unknown": return "Unknown"
    case "No Response": return ""
    case "<No Response>": return ""
    default: return "ERROR: \(titanium)"
    }
}

func MapQ3350( titanium : String ) -> String
{
    switch titanium {
    case "Under $24250": return "Under $24,250"
    case "$35201-$56300": return "$35,201-$56,300"
    case "Over $56300": return "Over $56,300"
    case "Unknown": return "Unknown"
    case "$24251-$35200": return "$24,251-$35,200"
    case "No Response": return ""
    case "<No Response>": return ""
    case "": return ""
    default: return "ERROR: \(titanium)"
    }
}

func MapQ1852( titanium: String ) -> String
{
    switch( titanium )
    {
    case "Less Than High School": return "Less than HighSchool"
    case "High School Degree": return "HighSchoolDegree/GED"
    case "Vocational Schooling": return "Vocational Schooling"
    case "Some College": return "Some College"
    case "College Degree": return "College Degree"
    case "Some Graduate School": return "Some Graduate School"
    case "Graduate Degree": return "Graduate Degree"
    case "No Response": return ""
    case "<No Response>": return ""
    default: return "ERROR: \(titanium)"
    }
}

func MapQ1855( titanium: String ) -> String
{
    switch( titanium )
    {
    case "Heterosexual Relationship": return "Heterosexual"
    case "Same Sex Relationship": return "Same Sex"
    case "No Response": return ""
    case "<No Response>": return ""
    default: return "ERROR: \(titanium)"
    }
}

func MapClioDescription( clio: String ) -> String
{
    switch( clio )
    {
    case "Adjudication of Paternity  SAPCR  Divorce": return "Full Rep - Divorce with children"
    case "Advice on Decree": return "Full Rep - Modification"
    case "Appeal" : return "General"
    case "Appeal " : return "General"
    case "Bill of Review/Modification": return "Full Rep - Modification"
    case "Brief Services-Divorce w/o Children": return "Full Rep - Divorce without children"
    case "Child Custody": return "Full Rep - SAPCR" // NEED
    case "Child Custody Intake": return "Full Rep - SAPCR" // NEED
    case "Child Support": return "Full Rep - Modification" // NEED
    case "Child support": return "Full Rep - Modification" // NEED
    case "Child Support ": return "Full Rep - Modification" // NEED
    case "Child support ": return "Full Rep - Modification" // NEED
    case "Child Support Arrears": return "Full Rep - Modification" // NEED
    case "Common law divorce w/ children":  return "Full Rep - Divorce with children"
    case "CPS": return "Full Rep - SAPCR" // NEED
    case "CPS ": return "Full Rep - SAPCR" // NEED
    case "CPS Modification": return "Full Rep - SAPCR" // NEED
    case "CPS Removal": return "Full Rep - SAPCR" // NEED
    case "Custody": return "Full Rep - SAPCR" // NEED
    case "Custody ": return "Full Rep - SAPCR" // NEED
    case "Custody DF-14-10444 & Divorce DF-16-15327": return "Full Rep - Divorce with children" // NEED
    case "Custody/Child Support": return "Full Rep - SAPCR" // NEED
    case "Custody/Modification": return "Full Rep - Modification" // NEED
    case "Deed": return "General" // NEED
    case "Deed Change": return "General" // NEED
    case "Description": return "General" // NEED
    case "DIV W/ CH": return "Full Rep - Divorce with children"
    case "Divorce":  return "Full Rep - Divorce without children"
    case "Divorce ":  return "Full Rep - Divorce without children"
    case "Divorce  no kids": return "Full Rep - Divorce without children"
    case "Divorce (SAPCR done)": return "Full Rep - Divorce without children"
    case "Divorce & Custody/Child Suuport": return "Full Rep - Divorce without children"
    case "Divorce and child custody": return "Full Rep - Divorce with children"
    case "Divorce and Criminal Matter": return "Full Rep - Divorce without children"
    case "Divorce and Custody": return "Full Rep - Divorce with children"
    case "Divorce and Custody/Child Support": return "Full Rep - Divorce with children"
    case "Divorce and modification": return "Full Rep - Divorce without children"
    case "Divorce and PO": return "Full Rep - Protective Order"
    case "Divorce and PO ": return "Full Rep - Protective Order"
    case "Divorce and Protective Order": return "Full Rep - Protective Order"
    case "Divorce and SAPCR": return "Full Rep - Divorce with children"
    case "Divorce Intake": return "Full Rep - Divorce without children"
    case "Divorce Intake (2/11/21)": return "Full Rep - Divorce with children"
    case "Divorce w/o Children ": return "Full Rep - Divorce without children"
    case "Divorce no children": return "Full Rep - Divorce without children"
    case "Divorce no children ": return "Full Rep - Divorce without children"
    case "Divorce no children  PO": return "Full Rep - Protective Order"
    case "Divorce no children and Enforcement": return "Full Rep - Divorce without children"
    case "Divorce no kids": return "Full Rep - Divorce without children"
    case "Divorce no kids + Protective Order": return "Full Rep - Divorce without children"
    case "Divorce no kids/Protective Order": return "Full Rep - Divorce without children"
    case "Divorce w. children": return "Full Rep - Divorce with children"
    case "Divorce w/ adult children": return "Full Rep - Divorce with children"
    case "Divorce w/ adult disabled chld": return "Full Rep - Divorce with children"
    case "Divorce w/ child": return "Full Rep - Divorce with children"
    case "Divorce w/ Child": return "Full Rep - Divorce with children"
    case "Divorce w/ child + Protective Order": return "Full Rep - Divorce with children"
    case "Divorce w/ children": return "Full Rep - Divorce with children"
    case "Divorce w/ Children": return "Full Rep - Divorce with children"
    case "Divorce w/ children and PO": return "Full Rep - Divorce with children"
    case "Divorce w/ children writ of attachment": return "Full Rep - Divorce with children"
    case "Divorce w/ kids": return "Full Rep - Divorce with children"
    case "Divorce w/ no children": return "Full Rep - Divorce without children"
    case "Divorce w/child": return "Full Rep - Divorce with children"
    case "Divorce w/child ": return "Full Rep - Divorce with children"
    case "Divorce w/children": return "Full Rep - Divorce with children"
    case "Divorce w/o child": return "Full Rep - Divorce without children"
    case "Divorce w/o child ": return "Full Rep - Divorce without children"
    case "Divorce w/o children": return "Full Rep - Divorce without children"
    case "Divorce w/o Children": return "Full Rep - Divorce without children"
    case "Divorce w/o children  paternity  SAPCR  CPS": return "Full Rep - Divorce without children"
    case "Divorce with Chiildren": return "Full Rep - Divorce with children"
    case "Divorce with child": return "Full Rep - Divorce with children"
    case "Divorce with Childre": return "Full Rep - Divorce with children"
    case "Divorce with Children": return "Full Rep - Divorce with children"
    case "Divorce with Children ": return "Full Rep - Divorce with children"
    case "Divorce with children ": return "Full Rep - Divorce with children"
    case "Divorce with children and PO": return "Full Rep - Divorce with children"
    case "Divorce with Kids": return "Full Rep - Divorce with children"
    case "Divorce with one child.": return "Full Rep - Divorce with children"
    case "Divorce without children": return "Full Rep - Divorce without children"
    case "Divorce- no children": return "Full Rep - Divorce without children"
    case "Divorce-common law": return "Full Rep - Divorce without children"
    case "Divorce-custody/child support-PO": return "Full Rep - Divorce with children"
    case "Divorce/ PO": return "Full Rep - Divorce without children"
    case "Divorce/Custody": return "Full Rep - Divorce with children"
    case "Divorce/Custody/ Protective Order": return "Full Rep - Divorce with children"
    case "Divorce- no children ": return "Full Rep - Divorce without children"
    case "Drafting Divorce Decree": return "Full Rep - Divorce without children"
    case "Duplantis- Modification": return "Full Rep - Modification"
    case "Enforcement": return "Full Rep - Modification"
    case "Eviction/Divorce": return "Full Rep - Divorce without children"
    case "Eviction/Divorce ": return "Full Rep - Divorce without children"
    case "Family Law": return "Full Rep - Divorce with children"
    case "Full Rep.- Divorce ": return "Full Rep - Divorce without children"
    case "Full Rep - Divorce w/ Children":return "Full Rep - Divorce with children"
    case "Full Rep - Divorce w/ children": return "Full Rep - Divorce with children"
    case "Full Rep - Divorce w/o children": return "Full Rep - Divorce without children"
    case "Full Rep - Modification": return "Full Rep - Modification"
    case "Full Rep - Modification (Aguila)": return "Full Rep - Modification"
    case "Full Rep - Modification (Marsh)": return "Full Rep - Modification"
    case "Full Rep - SACPR": return "Full Rep - SAPCR"
    case "Full Rep - SAPCR": return "Full Rep - SAPCR"
    case "Full Rep - SAPCR (Vega)": return "Full Rep - SAPCR"
    case "Full Rep -Divorce w/ children": return "Full Rep - Divorce with children"
    case "Full Rep -Divorce w/o children": return "Full Rep - Divorce with children"
    case "Full Rep -SAPCR": return "Full Rep - SAPCR"
    case "Full Rep- Divorce w/ Children": return "Full Rep - Divorce with children"
    case "Full Rep- Divorce w/ Chldren": return "Full Rep - Divorce with children"
    case "Full Rep- Modification": return "Full Rep - Modification"
    case "Full Rep-Divorce w/ Child": return "Full Rep - Divorce with children"
    case "Full Rep-Divorce w/o Children": return "Full Rep - Divorce without children"
    case "Full Rep-Modification": return "Full Rep - Modification"
    case "Full Rep-SAPCR": return "Full Rep - SAPCR"
    case "Full Rep.- Divorce": return "Full Rep - Divorce without children"
    case "General": return "General"
    case "Guidry- Modification": return "Full Rep - Modification"
    case "Intake for New Divorce Case": return "Full Rep - Divorce without children"
    case "Intake for SAPCR Mod. Not going to take": return "SAPCR"
    case "Modification": return "Full Rep - Modification"
    case "Modification ": return "Full Rep - Modification"
    case "Modification -  custody": return "Full Rep - Modification"
    case "Modification (Carlos Andrade)": return "Full Rep - Modification"
    case "Modification (Re-opened)": return "Full Rep - Modification"
    case "Modification / CPS Removal": return "Full Rep - Modification"
    case "Modification and Enforcement": return "Full Rep - Modification"
    case "Modification and Writ (Sims)": return "Full Rep - Modification"
    case "Modification by OAG": return "Full Rep - Modification"
    case "Modification in Denton County": return "Full Rep - Modification"
    case "Modification of Divorce": return "Full Rep - Modification"
    case "Modification of SAPCR": return "Full Rep - Modification"
    case "Modification- SAPCR": return "Full Rep - Modification"
    case "Modification/ enforcement": return "Full Rep - Modification"
    case "Modification/ Enforcement": return "Full Rep - Modification"
    case "Modification/Appeal": return "Full Rep - Modification"
    case "Original SAPCR": return "Full Rep - SAPCR"
    case "Passport Consent": return "Brief Services - SAPCR" // NEED
    case "PATERNITY": return "Brief Services - SAPCR" // NEED
    case "PATERNITY ": return "Brief Services - SAPCR" // NEED
    case "PO": return "Full Rep - Protective Order" // Ok??
    case "PO ":return "Full Rep - Protective Order"
    case "Power of Attorney  Referrals": return "General" // NEED
    case "Property Matter": return "General" // NEED
    case "Protective Order": return "Full Rep - Protective Order" // NEED
    case "Protective Order & Custody": return "Full Rep - SAPCR" // NEED
    case "Protective Order and Consulting Expert": return "Full Rep - Protective Order" // NEED
    case "Protective Order and Divorce w/ children": return "Full Rep - Divorce with children" // NEED
    case "Protective Order and SAPCR": return "Full Rep - SAPCR" // NEED
    case "Recently finalized divorce. Needs clarification on order and standards for modification. Advise only.": return "Full Rep - Modification" // NEED
    case "Research on Adult Children": return "General" // NEED
    case "Return Client: Divorce w/o Children": return "Full Rep - Divorce without children"
    case "SACPR": return "Full Rep - SAPCR"
    case "SAPCR": return "Full Rep - SAPCR"
    case "SAPCR ": return "Full Rep - SAPCR"
    case "SAPCR  PO  Divorce": return "Full Rep - SAPCR"
    case "SAPCR (adoption) and Divorce": return "Full Rep - SAPCR"
    case "SAPCR (AG)": return "Full Rep - SAPCR"
    case "SAPCR & PO": return "Full Rep - SAPCR"
    case "SAPCR & Protective Order": return "Full Rep - SAPCR"
    case "SAPCR and Protective Order": return "Full Rep - SAPCR"
    case "SAPCR Intake": return "Full Rep - SAPCR"
    case "SAPCR Mod/Divorce": return "Full Rep - Modification"
    case "SAPCR Modification": return "Full Rep - Modification"
    case "SAPCR- MOD": return "Full Rep - Modification"
    case "SAPCR-OAG": return "Full Rep - SAPCR"
    case "SAPCR/Adoption": return "Full Rep - SAPCR"
    case "Sexual harassment suit": return "General" // NEED
    case "Small Claims Court Post-Decree Division": return "General" // NEED
    case "Transfer of SAPCR": return "Full Rep - SAPCR"
    case "Modification and Enforcement ": return "Full Rep - Modification"
    default: return "ERROR  -\(clio)-"
    }
}
