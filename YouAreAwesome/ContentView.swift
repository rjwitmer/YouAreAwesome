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
    @State private var imageNumber = 0
    @State private var indexNumber = 0
    
    var body: some View {
        
        VStack {
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .padding()
            
            Spacer()
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .padding()
                .frame(height: 150)
                .frame(maxWidth: .infinity)
            
            Spacer()
            
            Button("Show Message") {
                let messageArray: [String] = ["You Are Awesome!",
                                              "You Are Great!",
                                              "You Are Fantastic!",
                                              "You Make Me Smile!",
                                              "When the Genius Bar Needs Help, They Call You!",
                                              "Fabulous? That's You!",
                                              "You Are a Coding Star!"]

                messageString = messageArray[indexNumber]
                indexNumber = (indexNumber < (messageArray.count - 1) ? indexNumber + 1 : 0)
                
                imageName = "image\(imageNumber)"
                imageNumber = (imageNumber == 9 ? 0 : (imageNumber + 1))
                
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
