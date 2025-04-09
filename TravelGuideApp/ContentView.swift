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
    let highImage: String
    let description: String
}


struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .opacity(0.7)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    Text("Welcome to")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 5)
                    Text("Travel Guide App")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 5)
                    Image("plane2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 230)
                    Spacer().frame(height: 30)
                    NavigationLink(destination: DestinationViews()) {
                            Label("See our destinations", systemImage: "airplane")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.5), radius: 4)
                        
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
        Destination(name: "Paris", location: "France", imageName: "paris", highImage: "france-high", description: "The City of Light enchants with romance, art, and elegance. Visit the Eiffel Tower, cafés, and world-class museums."),
        Destination(name: "Rome", location: "Italy", imageName: "roma", highImage: "rome-high", description: "The Eternal City where history comes alive. Walk among ruins, fountains, and Renaissance masterpieces."),
        Destination(name: "Tokyo", location: "Japan", imageName: "tokyo", highImage: "tokyo-high", description: "A vibrant blend of tradition and innovation. Explore ancient temples, neon-lit skyscrapers, and world-class cuisine."),
        Destination(name: "New York", location: "USA", imageName: "newyork", highImage: "newyork-high", description: "The city that never sleeps. From Broadway lights to Central Park, experience energy and culture like nowhere else."),
        Destination(name: "London", location: "UK", imageName: "london", highImage: "london-high", description: "A fusion of royal heritage and modern cool. Discover Big Ben, historic streets, and a rich arts scene."),
        Destination(name: "Sydney", location: "Australia", imageName: "sydney",  highImage: "sydney-high", description: "A coastal gem known for its iconic Opera House, stunning beaches, and laid-back charm.")
    ]
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(destinations) { destination in
                        NavigationLink(destination: DetailedCardView(destination: destination)) {
                            DestinationCardView(destination: destination)
                        }
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
        
struct DetailedCardView: View {
    let destination: Destination
    
    var body: some View {
        VStack {
            Spacer()
            Image(destination.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 230, height: 200)
            Text("\(destination.name)")
                .font(.title)
            Text("\(destination.location)")
                .font(.title3)
                .foregroundColor(.gray)
            Image(destination.highImage)
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 200)
                .padding(30)
            Text(destination.description)
                .frame(width: 300)
            Spacer()
            Spacer()
        }
        
    }
}


#Preview {
    ContentView()
}
