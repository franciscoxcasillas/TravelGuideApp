//
//  ContentView.swift
//  TravelGuideApp
//
//  Created by Francisco Jean on 03/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Welcome to Travel Guide App")
                        .font(.custom("Montserrat-Bold", size: 20))
                    Image(systemName: "airplane")
                    Spacer().frame(height: 30)
                    NavigationLink(destination: ContentView()) {
                        Text("Profile")
                            .foregroundColor(.white)
                            .underline()
                    }
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
