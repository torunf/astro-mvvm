//
//  AstroFilterBuilder.swift
//  astro
//
//  Created by Furkan Torun on 27.10.2020.
//

import UIKit

final class AstroFilterBuilder {

    static func make() -> AstroFilterViewController {
        
        let storyboard = UIStoryboard(name: "AstroFilter", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "AstroFilterViewController") as! AstroFilterViewController
        viewController.viewModel = AstroFilterViewModel(service: app.service)
        return viewController
    }
    
}

