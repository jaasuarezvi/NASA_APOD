//
//  ViewModel.swift
//  nasaAPOD
//
//  Created by Jairo Andres Suarez on 6/09/21.
//

import Foundation
import  Combine

class ViewModel: ObservableObject{
    @Published var apod: [APOD] = []
    init() {
        self.fetch()
    }
}

extension ViewModel {
    func fetch() {
        API.getImageOfTheDay{ apod in
            self.apod = apod
        }
    }
}
