//
//  AstroDetailViewController.swift
//  astro
//
//  Created by Furkan Torun on 27.10.2020.
//

import Foundation
import UIKit
import Eureka

final class AstroDetailViewController: FormViewController {
    
    let sectionDetail : Section = {
        let view = Section()
        view.tag = "secFilter"
        return view
    }()
    
    let row_ascendant : LabelRow = {
        let view = LabelRow()
        view.title = "ascendant"
        return view
    }()
    
    let row_ascendant_lord : LabelRow = {
        let view = LabelRow()
        view.title = "ascendant_lord"
        return view
    }()
    
    let row_Varna : LabelRow = {
        let view = LabelRow()
        view.title = "Varna"
        return view
    }()
    
    let row_Vashya : LabelRow = {
        let view = LabelRow()
        view.title = "Vashya"
        return view
    }()
    
    let row_Yoni : LabelRow = {
        let view = LabelRow()
        view.title = "Yoni"
        return view
    }()
    
    let row_Gan : LabelRow = {
        let view = LabelRow()
        view.title = "Gan"
        return view
    }()
    
    let row_Nadi : LabelRow = {
        let view = LabelRow()
        view.title = "Nadi"
        return view
    }()
    
    let row_SignLord : LabelRow = {
        let view = LabelRow()
        view.title = "SignLord"
        return view
    }()
    
    let row_sign : LabelRow = {
        let view = LabelRow()
        view.title = "sign"
        return view
    }()
    
    let row_Naksahtra : LabelRow = {
        let view = LabelRow()
        view.title = "Naksahtra"
        return view
    }()
    
    let row_NaksahtraLord : LabelRow = {
        let view = LabelRow()
        view.title = "NaksahtraLord"
        return view
    }()
    
    let row_Charan : LabelRow = {
        let view = LabelRow()
        view.title = "Charan"
        return view
    }()
    
    let row_Yog : LabelRow = {
        let view = LabelRow()
        view.title = "Yog"
        return view
    }()
    
    let row_Karan : LabelRow = {
        let view = LabelRow()
        view.title = "Karan"
        return view
    }()
    
    let row_Tithi : LabelRow = {
        let view = LabelRow()
        view.title = "Tithi"
        return view
    }()
    
    let row_yunja : LabelRow = {
        let view = LabelRow()
        view.title = "yunja"
        return view
    }()
    
    let row_tatva : LabelRow = {
        let view = LabelRow()
        view.title = "tatva"
        return view
    }()
    
    let row_name_alphabet : LabelRow = {
        let view = LabelRow()
        view.title = "name_alphabet"
        return view
    }()
    
    let row_paya : LabelRow = {
        let view = LabelRow()
        view.title = "paya"
        return view
    }()
    
    var viewModel: AstroDetailViewModelProtocol!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
    }
    
}

extension AstroDetailViewController: AstroDetailViewModelDelegate {

    func showDetail(_ presentation: AstroDetail) {
        form.removeAll()
        
        sectionDetail.append(row_ascendant)
        sectionDetail.append(row_ascendant_lord)
        sectionDetail.append(row_Varna)
        sectionDetail.append(row_Vashya)
        sectionDetail.append(row_Yoni)
        sectionDetail.append(row_Gan)
        sectionDetail.append(row_Nadi)
        sectionDetail.append(row_SignLord)
        sectionDetail.append(row_sign)
        sectionDetail.append(row_Naksahtra)
        sectionDetail.append(row_NaksahtraLord)
        sectionDetail.append(row_Charan)
        sectionDetail.append(row_Yog)
        sectionDetail.append(row_Karan)
        sectionDetail.append(row_Tithi)
        sectionDetail.append(row_yunja)
        sectionDetail.append(row_tatva)
        sectionDetail.append(row_name_alphabet)
        sectionDetail.append(row_paya)
        form.append(sectionDetail)
            
        row_ascendant.value = presentation.ascendant
        row_ascendant_lord.value = presentation.ascendant_lord
        row_Varna.value = presentation.Varna
        row_Vashya.value = presentation.Vashya
        row_Yoni.value = presentation.Yoni
        row_Gan.value = presentation.Gan
        row_Nadi.value = presentation.Nadi
        row_SignLord.value = presentation.SignLord
        row_sign.value = presentation.sign
        row_Naksahtra.value = presentation.Naksahtra
        row_NaksahtraLord.value = presentation.NaksahtraLord
        row_Charan.value = String(presentation.Charan)
        row_Yog.value = presentation.Yog
        row_Karan.value = presentation.Karan
        row_Tithi.value = presentation.Tithi
        row_yunja.value = presentation.yunja
        row_tatva.value = presentation.tatva
        row_name_alphabet.value = presentation.name_alphabet
        row_paya.value = presentation.paya
        
    }
    
    func handleViewModelOutput(_ output: AstroDetailViewModelOutput) {
            switch output {
            case .updateTitle(let title):
                self.title = title
            case .setLoading(let isLoading):
                UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
            }
    }
}
