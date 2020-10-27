//
//  AstroDetailViewModel.swift
//  astro
//
//  Created by Furkan Torun on 27.10.2020.
//

import Foundation

final class AstroDetailViewModel: AstroDetailViewModelProtocol {
    
    weak var delegate: AstroDetailViewModelDelegate?
    private let presentation: AstroDetail
    
    init(astroDetail: AstroDetail) {
        self.presentation = astroDetail
    }
    
    func load() {
        delegate?.handleViewModelOutput(.updateTitle("ASTRO DETAILS"))
        delegate?.showDetail(presentation)
    }
    
}
