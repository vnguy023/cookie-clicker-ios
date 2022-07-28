import SwiftUI

@main
struct my_base_gameApp: App {
    @State private var dataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                LinearGradient(colors: [Color.black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            
                ContentView()
                    .environmentObject(dataModel)
            }
        }
    }
}
