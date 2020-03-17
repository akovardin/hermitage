//
//    MainModels.swift
//    RadioHermitage
//
//    Created by Artem Kovardin on 14.03.2020.
//    Copyright (c) 2020 Artem Kovardin. All rights reserved.
//

import UIKit

enum Main {

    enum Model {
        struct Request {
            enum RequestType {
                case toggle
            }
        }

        struct Response {
            enum ResponseType {
                case presentPlay(image: String)
                case presentStop
            }
        }

        struct ViewModel {
            enum ViewModelData {
                case displayPlay(image: String)
                case displayStop
            }
        }
    }

}
