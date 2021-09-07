//
//  Costant.swift
//  nasaAPOD
//
//  Created by Jairo Andres Suarez on 6/09/21.
//

import Foundation

class Constant {
    static var apiKey: String{
        return "W3HI3yh1XLhG6JbXj3yB0ajBXXjoiaBJhv7aoVWt"
    }
    static var baseUrlString: String{
        return "https://api.nasa.gov/planetary/apod?"
    }
    static var todayDate: String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = formatter.string(from: date)
        return formattedDate
    }
    
    static var eightDaysAgo: String{
        let date = Date().addingTimeInterval(-8*24*60*60)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = formatter.string(from: date)
        return formattedDate
    }
    
    static var url: URL{
        guard let url = URL(string:
                                "\(baseUrlString)api_key=\(apiKey)&start_date=\(eightDaysAgo)&end_date=\(todayDate)") else{
            fatalError()
        }
        print(url)
        return url
    }
    
    static var session: URLSession{
        let  session = URLSession(configuration: .default)
        return session
    }
    static var request: URLRequest{
        let req = URLRequest(url: url)
        return req
    }
    
    static var decoder: JSONDecoder{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
