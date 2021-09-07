//
//  ImageLoader.swift
//  nasaAPOD
//
//  Created by Jairo Andres Suarez on 7/09/21.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var dowloadedImage: UIImage? = nil
}

extension ImageLoader{
    func load(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            fatalError("unable to parse image url")
        }
        Constant.session.dataTask(with: url,completionHandler: imageDataHandler).resume()
    }
    
    func  imageDataHandler(data:Data?, res:URLResponse?, error: Error?)  {
        guard let data = data, error == nil else {
            fatalError("Unable to get image data")
        }
        DispatchQueue.main.async {
            self.dowloadedImage = UIImage(data: data)
        }
    }
}
