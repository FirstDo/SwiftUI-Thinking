import SwiftUI
import AVKit

final class SoundManager: ObservableObject {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    private init() {}
    
    func playSound(_ name: String) {
        let url = Bundle.main.url(forResource: name, withExtension: ".mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print(error.localizedDescription)
        }
        
    }
}

struct SoundsEX: View {
    
    let manager = SoundManager.instance
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                manager.playSound("tada")
            }
            
            Button("Play sound 2") {
                manager.playSound("badum")
            }
        }
    }
}

struct SoundsEX_Previews: PreviewProvider {
    static var previews: some View {
        SoundsEX()
    }
}
