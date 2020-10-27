//
//  AstroFilter.swift
//  astro
//
//  Created by Furkan Torun on 27.10.2020.
//

import Foundation

public struct AstroFilter: Encodable {
    let day: Int
    let month: Int
    let year: Int
    let hour: Int
    let min: Int
    let lat: Float
    let lon: Float
    let tzone: Float
}
