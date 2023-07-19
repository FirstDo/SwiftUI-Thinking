import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Group {
                NavigationLink("LongPressGesture", destination: OnLongPressGestureEX())
                NavigationLink("MagnificationGesture", destination: MagnificationGestureEX())
                NavigationLink("RotationGesture", destination: RotationGestureEX())
                NavigationLink("DragGesture", destination: DragGestureEX())
                NavigationLink("DragGesture2", destination: DragGestureEX2())
                
                NavigationLink("ScrollViewReader", destination: ScrollViewReaderEX())
                NavigationLink("GeometryReader", destination: GeometryReaderEX())
                NavigationLink("MultipleSheets", destination: MultipleSheetsEX())
                NavigationLink("Mask", destination: MaskEX())
                NavigationLink("Sound", destination: SoundsEX())
            }
            
            Group {
                NavigationLink("Haptics", destination: HapticsEX())
                NavigationLink("CoreData1", destination: MainView())
                NavigationLink("CoreData2", destination: CoreDataEX())
                NavigationLink("CoreDataRelation", destination: CoreDataRelationEX())
                NavigationLink("BackgroundThread", destination: BackgroundThreadEX())
                NavigationLink("WeakSelf", destination: WeakSelfEX())
                NavigationLink("FileManager", destination: FileManagerEX())
                NavigationLink("Cache", destination: CacheEX())
                NavigationLink("DownloadImages", destination: DownloadImagesEX())
            }
            
            Group {
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
