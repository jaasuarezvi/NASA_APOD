//
//  ContentView.swift
//  nasaAPOD
//
//  Created by Jairo Andres Suarez on 6/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.apod){apod in
                    Text(apod.title)
                    ImageView(apod.url).frame(width: 375,height: 275)
                    NavigationLink(
                        destination: VStack{
                            Text(apod.title).bold()
                            Text("Date:"+apod.date)
                            Text(apod.explanation)
                        }.padding(),
                        label: {
                            Text("Description")
                        })
                }
            }.navigationBarTitle(Text("Picture of the Day"))
        }
    }
}

