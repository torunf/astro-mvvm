//
//  AppContainer.swift
//  astro
//
//  Created by Furkan Torun on 27.10.2020.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let service = AstroApiService()
    
}
