import SwiftUI

struct GameView: View {
    @EnvironmentObject var dataModel: DataModel
    
    let viewName = String(describing: GameView.self)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.orange, Color.teal], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                Text("Scene: \(viewName)")
                    .padding()
                
                Spacer()
                
                Button() {
                    // Action
                    dataModel.incrementSceneChanges(amount: 1)
                    
                    withAnimation {
                        dataModel.stateView = ViewType.SplashView
                    }
                } label: {
                    Text("Go to next View")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(20.0)
                }
            }
        }.transition(.slide)
    }
}

struct GameView_PreviewContainer: View {
    @State private var stateView = ViewType.GameView
    
    var body: some View {
        return GameView()
            .environmentObject(DataModel())
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView_PreviewContainer()
    }
}
