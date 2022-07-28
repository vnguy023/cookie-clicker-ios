import Foundation

class DataModel: ObservableObject {
    @Published public var stateView = ViewType.SplashView
    @Published public var sceneChangeCount: Int = 0
    
    init() {
        
    }
    
    public func incrementSceneChanges(amount: Int) -> Void {
        sceneChangeCount += amount
    }
    
    public func getSceneChangesCount() -> Int {
        return sceneChangeCount
    }
}
