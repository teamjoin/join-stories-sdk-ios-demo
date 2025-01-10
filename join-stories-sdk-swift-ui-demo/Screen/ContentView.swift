import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "table")
                }
            
            NotificationView()
                .tabItem {
                    Label("Notifications", systemImage: "bell")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
