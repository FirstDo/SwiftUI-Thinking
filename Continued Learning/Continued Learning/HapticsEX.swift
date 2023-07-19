import SwiftUI

final class HapticManager {
    static let instance = HapticManager()
    
    private init() {}
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(stype: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: stype)
        generator.impactOccurred()
    }
}

struct HapticsEX: View {
    let manager = HapticManager.instance
    
    var body: some View {
        VStack(spacing: 20) {
            Button("waring") {
                manager.notification(type: .warning)
            }
            
            Button("error") {
                manager.notification(type: .error)
            }
            
            Button("success") {
                manager.notification(type: .success)
            }
            
            Divider()
            
            Button("heavy") {
                manager.impact(stype: .heavy)
            }
            
            Button("light") {
                manager.impact(stype: .light)
            }
            
            Button("medium") {
                manager.impact(stype: .medium)
            }
            
            Button("rigid") {
                manager.impact(stype: .rigid)
            }
            
            Button("soft") {
                manager.impact(stype: .soft)
            }
        }
    }
}

struct HapticsEX_Previews: PreviewProvider {
    static var previews: some View {
        HapticsEX()
    }
}
