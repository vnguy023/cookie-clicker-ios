import SwiftUI

struct SplashView: View {
    @EnvironmentObject var dataModel: DataModel
    
    @State private var logoSize = 0.8
    @State private var logoOpacity = 0.5
    
    let viewName = String(describing: SplashView.self)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.black, Color.orange], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                VStack{
                    // Logo Image
                    Image(systemName: "hare.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.yellow)
                    
                    // Logo Text
                    Text("Bitcoin Clicker")
                        .font(Font.custom("baskerville-bold", size: 26))
                        .foregroundColor(.white)
                        .opacity(0.8)
                }
                .scaleEffect(logoSize)
                .opacity(logoOpacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.logoSize = 1.2
                        self.logoOpacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation{
                        dataModel.stateView = ViewType.MenuView
                    }
                }
            }
        }.transition(.opacity)
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
