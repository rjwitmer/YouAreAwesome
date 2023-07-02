//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Bob Witmer on 2023-06-15.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var soundIsOn = true
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var imageNumber = -1
    @State private var messageNumber = -1
    @State private var soundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    
    
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
                .animation(.easeInOut(duration: 0.15), value: messageString)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .padding()
                .animation(.default, value: messageString)
            
            Spacer()
            
            HStack {
                
                Text("Sound: \(soundIsOn ? "On" : "Off")")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) { _ in
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                
                Spacer()
                
                Button("Show Message") {
                    let messageArray: [String] = ["You Are Awesome!",
                                                  "You Are Great!",
                                                  "You Are Fantastic!",
                                                  "You Make Me Smile!",
                                                  "When the Genius Bar Needs Help, They Call You!",
                                                  "Fabulous? That's You!",
                                                  "You Are a Coding Star!"]
                    
                    
                    messageNumber = nonRepeatingRandom(lastNumber: messageNumber, upperBound: messageArray.count - 1)
                    messageString = messageArray[messageNumber]
                    
                    imageNumber = nonRepeatingRandom(lastNumber: imageNumber, upperBound: 9)
                    imageName = "image\(imageNumber)"
                    
                    soundNumber = nonRepeatingRandom(lastNumber: soundNumber, upperBound: 5)
                    if soundIsOn {
                        playSound(soundName: "sound\(soundNumber)")
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .tint(.accentColor)
            .padding()
        }
        .padding()
    }
    
    // Function to Generate a non repeating random index number between zero and Upper Bound Integer
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var indexNumber = -1
        repeat {
            indexNumber = Int.random(in: 0...upperBound)
        } while indexNumber == lastNumber
        return(indexNumber)
    }
    
    // Function to Play a sound
    // Requires:    import AVFAudio
    //              @State private var audioPlayer: AVAudioPlayer!
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName).")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
