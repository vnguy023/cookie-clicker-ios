import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var dataModel: DataModel
    
    var childView1: ChildOneView {
        return ChildOneView()
    }
    var childView2: ChildTwoView {
        return ChildTwoView()
    }
    
    var body: some View {
        VStack{
            switch(dataModel.stateView) {
                case .ChildView1:
                    childView1
                    .transition(.slide)
                case .ChildView2:
                    childView2
                    .transition(.slide)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @State var stateView = ViewType.ChildView1
    
    static var previews: some View {
        ContentView()
            .environmentObject(DataModel())
    }
}
