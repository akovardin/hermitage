//
//    MainRouter.swift
//    RadioHermitage
//
//    Created by Artem Kovardin on 14.03.2020.
//    Copyright (c) 2020 Artem Kovardin. All rights reserved.
//

import UIKit

protocol MainRoutingLogic {

}

protocol MainDataPassing {
    var dataStore: MainDataStore? { get }
}

class MainRouter: NSObject, MainRoutingLogic {

    weak var viewController: MainViewController?
    
    // MARK: Routing
    
}
