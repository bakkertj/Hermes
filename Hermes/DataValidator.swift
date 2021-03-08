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
    case "SH": return "Shelter"
    case "AH": return "Annie's House"
    case "Thrift": return "Outreach"
    case "School": return "Shelter"
    case "OR Childcare" : return "Outreach"
    default: return ""
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
    case "Both (English & Spanish)": return "Spanish"
    case "Other": return "Other"
    default: return "ERROR"
    }
}
