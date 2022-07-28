import SwiftUI

struct ChildTwoView: View {
    @EnvironmentObject var dataModel: DataModel
    
    let viewName = String(describing: ChildTwoView.self)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.orange, Color.teal], startPoint: .top, endPoint: .bottom)
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
                        dataModel.stateView = ViewType.ChildView1
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

struct ChildTwoView_PreviewContainer: View {
    @State private var stateView = ViewType.ChildView2
    
    var body: some View {
        return ChildTwoView()
            .environmentObject(DataModel())
    }
}

struct ChildTwoView_Previews: PreviewProvider {
    static var previews: some View {
        ChildTwoView_PreviewContainer()
    }
}
