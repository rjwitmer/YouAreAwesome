//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Bob Witmer on 2023-06-15.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = ""
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundColor(.orange)
                .padding(.all)
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .padding()
                .border(.orange, width: 1)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
            HStack {
                Button("Awesome") {
                    // This is the action performed when the button is pressed
                    messageString = "You Are Awesome!"
                }
                .buttonStyle(.borderedProminent)
                Button("Great") {
                    // This is the action performed when the button is pressed
                    messageString = "You Are Great!"
                }
                .buttonStyle(.borderedProminent)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
