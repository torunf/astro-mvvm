//
//  AstroDetailContracts.swift
//  astro
//
//  Created by Furkan Torun on 27.10.2020.
//

import Foundation

protocol AstroDetailViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: AstroDetailViewModelOutput)
    func showDetail(_ presentation: AstroDetail)
}

enum AstroDetailViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
}

protocol AstroDetailViewModelProtocol {
    var delegate: AstroDetailViewModelDelegate? { get set }
    func load()
}


