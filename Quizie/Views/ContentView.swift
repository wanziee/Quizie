//
//  ContentView.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 26/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var activeTab: TabModel = .home
    @State private var isTabBarHidden: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            Group{
                if #available(iOS 18, *){
                    TabView(selection: $activeTab){
                        Tab.init(value: .home){
                            HomeScreen()
                                .environmentObject(TriviaManager())
                                .toolbarVisibility(.hidden, for: .tabBar)
                            
                        }
                        Tab.init(value: .search){
                            Text("Search")
                                .toolbarVisibility(.hidden, for: .tabBar)
                        }
                        Tab.init(value: .notifications){
                            Text("Notifications")
                                .toolbarVisibility(.hidden, for: .tabBar)
                        }
                        Tab.init(value: .settings){
                            Text("Settings")
                                .toolbarVisibility(.hidden, for: .tabBar)
                        }
                    }
                } else{
                    TabView(selection: $activeTab){
                        Text("Home")
                            .tag(TabModel.home)
                            .background{
                                if !isTabBarHidden{
                                    hideTabBar{
                                        print("Hidden")
                                        isTabBarHidden = true
                                    }
                                }
                            }
                        Text("Search")
                            .tag(TabModel.search)
                        Text("Notifications")
                            .tag(TabModel.notifications)
                        Text("Settings")
                            .tag(TabModel.settings)
                    }
                }
            }
            CustomTabBar(activeTab: $activeTab)
        }
        
    }
}


struct hideTabBar: UIViewRepresentable{
    var result : () -> ()
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        DispatchQueue.main.async{
            if let tabController = view.tabController{
                tabController.tabBar.isHidden = true
                result()
            }
        }
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}


extension UIView{
    var tabController: UITabBarController?{
        if let controller = sequence(first: self, next: {
            $0.next
        }) .first(where: { $0 is UITabBarController }) as? UITabBarController{
            return controller
        }
        
        return nil
    }
}

#Preview {
    ContentView()
}
