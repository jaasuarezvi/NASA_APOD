//
//  ImageView.swift
//  nasaAPOD
//
//  Created by Jairo Andres Suarez on 7/09/21.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader = ImageLoader()
    
    init(_ url:String) {
        self.imageLoader.load(url)
    }
    var body: some View {
        if let image = imageLoader.dowloadedImage {
            return Image(uiImage: image).resizable()
        } else {
            return Image(systemName: "photo").resizable()
        }
        
    }
}


