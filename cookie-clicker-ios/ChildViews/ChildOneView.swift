import SwiftUI

struct ChildOneView: View {
    @EnvironmentObject var dataModel: DataModel
    
    let viewName = String(describing: ChildOneView.self)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.purple, Color.orange], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                Text("Scene changed \(dataModel.sceneChangeCount) times")
                    .padding()
                
                Spacer()
                
                Text("Scene: \(viewName)")
                    .padding()
                
                Button() {
                    // Action
                    dataModel.incrementSceneChanges(amount: 1)
                    
                    withAnimation {
                        dataModel.stateView = ViewType.ChildView2
                    }
                } label: {
                    Text("Go to Root View")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(20.0)
                }
                
                Spacer()
            }
        }
    }
}

struct ChildOneView_PreviewContainer: View {
    var body: some View {
        return ChildOneView()
            .environmentObject(DataModel())
    }
}

struct ChildOneView_Previews: PreviewProvider {
    static var previews: some View {
        ChildOneView_PreviewContainer()
    }
}
