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
    var clientid : Int
    var casenoteid : String
    var recordtype : String
    var notedate : Date
    var notetype : String
    var fname : String
    var mname : String
    var lname : String
    var email : String
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
    var qTRUE856 : Bool
    var qTRUE857a2486 : Bool
    var qTRUE857a2487 : Bool
    var qTRUE857a2488 : Bool
    var qTRUE857a2489 : Bool
    var qTRUE857a249FALSE : Bool
    var qTRUE857a249TRUE : Bool
    var qTRUE857a2492 : Bool
    var qTRUE857a2689 : Bool
    var qTRUE857a269FALSE : Bool
    var qTRUE857a3642 : Bool
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
        clientid = 0
        casenoteid = ""
        recordtype = ""
        notedate = Date()
        notetype = ""
        fname = ""
        mname = ""
        lname = ""
        email = ""
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
        qTRUE856 = false
        qTRUE857a2486 = false
        qTRUE857a2487 = false
        qTRUE857a2488 = false
        qTRUE857a2489 = false
        qTRUE857a249FALSE = false
        qTRUE857a249TRUE = false
        qTRUE857a2492 = false
        qTRUE857a2689 = false
        qTRUE857a269FALSE = false
        qTRUE857a3642 = false
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
