//
//    MainInteractor.swift
//    RadioHermitage
//
//    Created by Artem Kovardin on 14.03.2020.
//    Copyright (c) 2020 Artem Kovardin. All rights reserved.
//

import UIKit

protocol MainBusinessLogic {
    func makeRequest(request: Main.Model.Request.RequestType)
}

protocol MainDataStore {
}

class MainInteractor: MainBusinessLogic {
    var played = false
    var presenter: MainPresentationLogic?
    var service: MainServiceLogic?

    func makeRequest(request: Main.Model.Request.RequestType) {
        if service == nil {
            service = MainService()
        }

        switch request {
        case .toggle:
            if played {
                service?.stop()
                played = false
                presenter?.presentData(response: .presentStop)
            } else {
                let image = service?.play()
                played = true
                presenter?.presentData(response: .presentPlay(image: image ?? ""))
            }
        }
    }

}
