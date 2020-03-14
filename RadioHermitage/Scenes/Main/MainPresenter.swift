//
//    MainPresenter.swift
//    RadioHermitage
//
//    Created by Artem Kovardin on 14.03.2020.
//    Copyright (c) 2020 Artem Kovardin. All rights reserved.
//

import UIKit

protocol MainPresentationLogic {
    func presentData(response: Main.Model.Response.ResponseType)
}

class MainPresenter: MainPresentationLogic {

    weak var viewController: MainDisplayLogic?

    func presentData(response: Main.Model.Response.ResponseType) {
        switch response {
        case .presentStop:
            viewController?.displayData(viewModel: .displayStop)
        case .presentPlay:
            viewController?.displayData(viewModel: .displayPlay)
        }
    }

}
