//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Bob Witmer on 2023-06-15.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var imageNumber = -1
    @State private var indexNumber = -1
    
    var body: some View {
        
        VStack {
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .padding()
                .frame(height: 150)
                .frame(maxWidth: .infinity)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .padding()
            
            Spacer()
            
            Button("Show Message") {
                let messageArray: [String] = ["You Are Awesome!",
                                              "You Are Great!",
                                              "You Are Fantastic!",
                                              "You Make Me Smile!",
                                              "When the Genius Bar Needs Help, They Call You!",
                                              "Fabulous? That's You!",
                                              "You Are a Coding Star!"]
                
                // Make sure that the random messages and images are not repeated by using repeat...while loops
                
                let lastMessageNumber = indexNumber
                let lastImageNumber = imageNumber

                repeat {
                    indexNumber = Int.random(in: 0...(messageArray.count - 1))
                } while indexNumber == lastMessageNumber
                
                repeat {
                    imageNumber = Int.random(in: 0...9)
                } while imageNumber == lastImageNumber
                
                messageString = messageArray[indexNumber]
                imageName = "image\(imageNumber)"
                
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
