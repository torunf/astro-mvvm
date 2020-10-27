//
//  AstroFilterContracts.swift
//  astro
//
//  Created by Furkan Torun on 27.10.2020.
//

import Foundation

protocol AstroFilterViewModelProtocol {
    var delegate: AstroFilterViewModelDelegate? { get set }
    func load()
    func getDetail(astroFilter: AstroFilter)
}

enum AstroFilterViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showAstroFilter(Bool)
}

enum AstroFilterViewRoute {
    case detail(AstroDetailViewModelProtocol)
}

protocol AstroFilterViewModelDelegate: class {
    func handleViewModelOutput(_ output: AstroFilterViewModelOutput)
    func navigate(to route: AstroFilterViewRoute)
}
