import SwiftUI

struct GameView: View {
    @EnvironmentObject var dataModel: DataModel
    
    let viewName = String(describing: GameView.self)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.orange, Color.teal], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                HStack {
                    Button() {
                        actionSettings()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 48))
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    HStack {
                        Image(systemName: "bitcoinsign.circle")
                            .font(.system(size: 48))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Text("\(dataModel.bitcoinCount)  ")
                            .frame(width: 120, height: 60, alignment: .trailing)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .cornerRadius(20.0)
                    }   .background(.blue)
                        .cornerRadius(20.0)
                }   .padding()
                    
                Spacer()

                
                Spacer()
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button() {
                        actionCollect()
                    } label: {
                        Image(systemName: "bitcoinsign.circle.fill")
                            .font(.system(size: 256))
                            .foregroundColor(.yellow)
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
        }.transition(.slide)
    }
    
    private func actionSettings() {
        withAnimation {
            dataModel.stateView = ViewType.MenuView
        }
    }
    
    private func actionCollect() {
        dataModel.collectBitCoin()
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
