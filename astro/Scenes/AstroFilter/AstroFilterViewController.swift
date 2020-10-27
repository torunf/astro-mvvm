//
//  AstroFilterViewController.swift
//  astro
//
//  Created by Furkan Torun on 27.10.2020.
//

import UIKit
import Eureka
import CoreLocation

final class AstroFilterViewController: FormViewController {
    
    var viewModel: AstroFilterViewModelProtocol!
    
    let sectionFilter : Section = {
        let view = Section()
        view.tag = "secFilter"
        return view
    }()
    
    let rowDate : DateRow = {
        let view = DateRow() {
            $0.value = Date(fromString: "1995-08-11", format: .isoDate)
            $0.title = "Birth Date"
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "tr")
            formatter.dateStyle = .long
            $0.dateFormatter = formatter
        }.cellSetup({ (cell, row) in
            cell.datePicker.locale = Locale(identifier: "tr")
        })
        
        return view
    }()
    
    let rowTime : TimeRow = {
        let view = TimeRow()
        view.value = Date()
        view.title = "Birth Time"
        return view
    }()
    
    let rowLocation : LocationRow = {
        let view = LocationRow()
        view.value = CLLocation(latitude: 40.9792, longitude: 28.8183)
        view.title = "Birth Location"
        return view
    }()
    
    var rowButton : ButtonRow?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
    }
}

extension AstroFilterViewController: AstroFilterViewModelDelegate {
    
    func handleViewModelOutput(_ output: AstroFilterViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .showAstroFilter(_):
            form.removeAll()
            
            rowButton = {
                    let view = ButtonRow() {
                        (row: ButtonRow) -> Void in
                        row.title = "GET ASTRO DETAIL"
                    }.onCellSelection { [self] (cell, row) in
                            
                        let calendar = Calendar.current
                        let day = calendar.component(.day, from: rowDate.value!)
                        let month = calendar.component(.month, from: rowDate.value!)
                        let year = calendar.component(.year, from: rowDate.value!)
                        let hour = calendar.component(.hour, from: rowTime.value!)
                        let minute = calendar.component(.minute, from: rowTime.value!)
                        let lat = Float((rowLocation.value?.coordinate.latitude)!)
                        let lon = Float((rowLocation.value?.coordinate.longitude)!)

                        let astroFilter = AstroFilter(day: day, month: month, year: year, hour: hour, min: minute, lat: lat, lon: lon, tzone: 3)
                            self.viewModel.getDetail(astroFilter: astroFilter)
                        }
                    return view
                }()
            
            sectionFilter.append(rowDate)
            sectionFilter.append(rowTime)
            sectionFilter.append(rowLocation)
            sectionFilter.append(rowButton!)
            form.append(sectionFilter)
        }
    }
    
    func navigate(to route: AstroFilterViewRoute) {
        switch route {
        case .detail(let viewModel):
            let viewController = AstroDetailBuilder.make(with: viewModel)
            show(viewController, sender: nil)
        }
    }
}
