//
//  TitaniumDiagnostic.swift
//  Hermes
//
//  Created by Trevor Bakker on 3/7/21.
//

import Foundation

var TitaniumDemographicArray = [TitaniumDemographic]()

struct TitaniumDemographic
{
    var ClientID : Int
    var CaseNoteID : String
    var RecordType : String
    var NoteDate : Date
    var NoteType : String
    var FName : String
    var MName : String
    var LName : String
    var Email : String
    var q1842 : String
    var q1844 : String
    var q1845 : String
    var q1846 : Date
    var q1847 : String
    var q1848 : String
    var q1849 : String
    var q1850 : String
    var q1851 : String
    var q1852 : String
    var q1853 : String
    var q1854 : String
    var q1855 : String
    var q1856 : Bool
    var q1857a2486 : Bool
    var q1857a2487 : Bool
    var q1857a2488 : Bool
    var q1857a2489 : Bool
    var q1857a2490 : Bool
    var q1857a2491 : Bool
    var q1857a2492 : Bool
    var q1857a2689 : Bool
    var q1857a2690 : Bool
    var q1857a3642 : Bool
    var q1858 : String
    var q1863 : Int
    var q1864 : String
    var q3350 : String
    var q3679 : String
    var q3680 : String
    var q3682 : Bool
    var q4793 : String
    
    init()
    {
        ClientID = 0
        CaseNoteID = ""
        RecordType = ""
        NoteDate = Date()
        NoteType = ""
        FName   = "FNU"
        MName = ""
        LName = "LNU"
        Email = ""
        q1842 = ""
        q1844 = ""
        q1845 = ""
        q1846 = Date()
        q1847 = ""
        q1848 = ""
        q1849 = ""
        q1850 = ""
        q1851 = ""
        q1852 = ""
        q1853 = ""
        q1854 = ""
        q1855 = ""
        q1856 = false
        q1857a2486 = false
        q1857a2487 = false
        q1857a2488 = false
        q1857a2489 = false
        q1857a2490 = false
        q1857a2491 = false
        q1857a2492 = false
        q1857a2689 = false
        q1857a2690 = false
        q1857a3642 = false
        q1858 = ""
        q1863 = 0
        q1864 = ""
        q3350 = ""
        q3679 = ""
        q3680 = ""
        q3682 = false
        q4793 = ""
    }
}
