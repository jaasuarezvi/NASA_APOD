//
//  APOD.swift
//  nasaAPOD
//
//  Created by Jairo Andres Suarez on 6/09/21.
//

import Foundation

struct  APOD: Identifiable, Codable {
    let id = UUID()
    let title: String
    let explanation: String
    let date: String
    let url: String
}
