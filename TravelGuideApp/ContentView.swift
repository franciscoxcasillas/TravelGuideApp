//
//  ContentView.swift
//  TravelGuideApp
//
//  Created by Francisco Jean on 03/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            NavigationView {
                VStack {
                    Text("Welcome to Travel Guide App")
                        .font(.custom("Montserrat-Bold", size: 20))
                    Image(systemName: "airplane")
                    NavigationLink("Profile", destination: ContentView())
                }
            }
           
        }
    }
}



#Preview {
    ContentView()
}
