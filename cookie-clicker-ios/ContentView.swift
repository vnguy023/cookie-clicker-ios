import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var dataModel: DataModel
    
    var splashView: SplashView {
        return SplashView()
    }
    var menuView: MenuView {
        return MenuView()
    }
    var gameView: GameView {
        return GameView()
    }
    
    var body: some View {
        VStack {
            switch(dataModel.stateView) {
                case .SplashView:
                    splashView
                case .MenuView:
                    menuView
                case .GameView:
                    gameView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @State var stateView = ViewType.SplashView
    
    static var previews: some View {
        ContentView()
            .environmentObject(DataModel())
    }
}
