//
//  API.swift
//  nasaAPOD
//
//  Created by Jairo Andres Suarez on 6/09/21.
//

import Foundation

class  API {
    class func getImageOfTheDay(_ onSuccess: @escaping([APOD]) -> ()) {
        Constant.session.dataTask(with: Constant.request){ (data, res, err) in
            guard let data = data, err == nil else{
                fatalError()
            }
            do{
                let apod = try Constant.decoder.decode([APOD].self, from: data)
                DispatchQueue.main.async {
                    onSuccess(apod)
                }
            }
            catch{
                fatalError(error.localizedDescription)
            }
        }.resume()
    }
}
