//
//  AstroFilterViewModel.swift
//  astro
//
//  Created by Furkan Torun on 27.10.2020.
//

import Foundation

final class AstroFilterViewModel: AstroFilterViewModelProtocol {
    
    weak var delegate: AstroFilterViewModelDelegate?
    private let service: AstroApiServiceProtocol
    private var astroDetail: AstroDetail? = nil
    
    init(service: AstroApiServiceProtocol) {
        self.service = service
    }
    
    func load() {
        notify(.updateTitle("ASTRO"))
        notify(.setLoading(true))
        notify(.showAstroFilter(true))
    }
    
    func getDetail(astroFilter: AstroFilter) {
        service.fetchAstroDetail(astroFilter: astroFilter) { [weak self](result) in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                let viewModel = AstroDetailViewModel(astroDetail: response)
                self!.delegate?.navigate(to: .detail(viewModel) )
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func notify(_ output: AstroFilterViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
