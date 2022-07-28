import SwiftUI

struct SplashView: View {
    @EnvironmentObject var dataModel: DataModel
    
    let viewName = String(describing: SplashView.self)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.purple, Color.orange], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                Text("Scene: \(viewName)")
                    .padding()
                
                Spacer()
        
                Button() {
                    // Action
                    dataModel.incrementSceneChanges(amount: 1)
                    
                    withAnimation {
                        dataModel.stateView = ViewType.MenuView
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

struct SplashView_PreviewContainer: View {
    var body: some View {
        return SplashView()
            .environmentObject(DataModel())
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView_PreviewContainer()
    }
}
