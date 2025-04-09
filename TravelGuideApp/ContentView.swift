//
//  ContentView.swift
//  TravelGuideApp
//
//  Created by Francisco Jean on 03/04/25.
//

import SwiftUI

struct Destination: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let imageName: String
}


struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    Text("Welcome to Travel Guide App")
                        .font(.custom("Montserrat-Bold", size: 20))
                        .foregroundColor(.white)
                    Image("plane2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 230)
                    Spacer().frame(height: 30)
                    NavigationLink(destination: DestinationViews()) {
                            Label("Destinations", systemImage: "airplane")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                        
                        }
                    Spacer()
                    Spacer()
                    }
                }
            }
        }
    }


struct DestinationViews: View {
    
    let destinations = [
        Destination(name: "Paris", location: "France", imageName: "paris"),
        Destination(name: "Rome", location: "Italy", imageName: "roma"),
        Destination(name: "Tokyo", location: "Japan", imageName: "tokyo"),
        Destination(name: "New York", location: "USA", imageName: "newyork"),
        Destination(name: "London", location: "UK", imageName: "london"),
        Destination(name: "Sydney", location: "Australia", imageName: "sydney")
    ]
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(destinations) { destination in
                        DestinationCardView(destination: destination)
                    }
                }
                .padding()
            }
        }
}

struct DestinationCardView: View {
    let destination: Destination 

    var body: some View {
        VStack (alignment: .center) {
            Image(destination.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
            HStack {
                VStack() {
                    Text(destination.name)
                        .font(.headline)
                    Text(destination.location)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Image(systemName: "heart.fill")
                    .foregroundColor(.gray)
                }
            }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
        



#Preview {
    ContentView()
}
