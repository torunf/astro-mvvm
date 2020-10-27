//
//  AstroDetail.swift
//  astro
//
//  Created by Furkan Torun on 27.10.2020.
//

import Foundation


public struct AstroDetail: Decodable, Equatable {
    
    public enum CodingKeys: String, CodingKey {
        case ascendant
        case ascendant_lord
        case Varna
        case Vashya
        case Yoni
        case Gan
        case Nadi
        case SignLord
        case sign
        case Naksahtra
        case NaksahtraLord
        case Charan
        case Yog
        case Karan
        case Tithi
        case yunja
        case tatva
        case name_alphabet
        case paya
    }
    
    
    public let ascendant: String
    public let ascendant_lord: String
    public let Varna: String
    public let Vashya: String
    public let Yoni: String
    public let Gan: String
    public let Nadi: String
    public let SignLord: String
    public let sign: String
    public let Naksahtra: String
    public let NaksahtraLord: String
    public let Charan: Int
    public let Yog: String
    public let Karan: String
    public let Tithi: String
    public let yunja: String
    public let tatva: String
    public let name_alphabet: String
    public let paya: String
    
}
