//
//  Result.swift
//  astro
//
//  Created by Furkan Torun on 27.10.2020.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
