//
//  AstroDetailBuilder.swift
//  astro
//
//  Created by Furkan Torun on 27.10.2020.
//

import UIKit

final class AstroDetailBuilder {
    
    static func make(with viewModel: AstroDetailViewModelProtocol) -> AstroDetailViewController {
        let storyboard = UIStoryboard(name: "AstroDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "AstroDetailViewController") as! AstroDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
}
