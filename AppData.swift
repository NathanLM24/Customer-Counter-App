//
//  AppData.swift
//  Store Customer Counter
//
//  Created by Nathan Beckett on 19/04/2021.
//

import Foundation
import SwiftUI


struct AppDataModel {
    var count: Int
    var limit: Int
    var newLimit: Int
}

class AppData: ObservableObject {
    @Published var data = AppDataModel(count: Int(), limit: Int(), newLimit: Int())
}
