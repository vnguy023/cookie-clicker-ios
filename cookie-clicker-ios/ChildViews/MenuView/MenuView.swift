import SwiftUI

struct MenuView: View {
    @EnvironmentObject var dataModel: DataModel
    
    let viewName = String(describing: MenuView.self)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.blue, Color.orange], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Cookie Clicker")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .shadow(color: .black, radius: 10.0, x: 5.0, y: 5.0)
                
                Spacer()
                
                Image(systemName: "hare.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.yellow)
                
                Spacer()
                
                VStack {
                    Button() {
                        actioNewGame()
                    } label: {
                        Text("New Game")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            
                    }   .frame(width: 240, height: 60, alignment: .center)
                        .background(Color.teal)
                        .cornerRadius(20.0)
                    Button() {
                        actionSettings()
                    } label: {
                        Text("Settings")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            
                    }   .frame(width: 240, height: 60, alignment: .center)
                        .background(Color.teal)
                        .cornerRadius(20.0)
                                        
                    Button() {
                        actionCredits()
                    } label: {
                        Text("Credits")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            
                    }   .frame(width: 240, height: 60, alignment: .center)
                        .background(Color.teal)
                        .cornerRadius(20.0)
                }
            }
        }.transition(.slide)
    }
    
    private func actioNewGame() {
        dataModel.incrementSceneChanges(amount: 1)
        
        withAnimation {
            dataModel.stateView = ViewType.GameView
        }
    }
    
    private func actionSettings() {}
    
    private func actionCredits() {}
}

struct MenuView_PreviewContainer: View {
    var body: some View {
        return MenuView()
            .environmentObject(DataModel())
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView_PreviewContainer()
    }
}
