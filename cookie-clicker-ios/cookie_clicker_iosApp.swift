import SwiftUI

@main
struct cookie_clicker_iosApp: App {
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
