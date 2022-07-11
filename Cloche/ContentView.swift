//
//  ContentView.swift
//  Cloche
//
//  Created by 이선재 on 2022/06/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
            TabView{
                Closet()
                    .tabItem{
                        Image(systemName: "c.circle.fill")
                        Text("클로젯")
                    }
                    .edgesIgnoringSafeArea(.top)
                Looks()
                    .tabItem{
                        Image(systemName: "puzzlepiece.extension")
                        Text("조합하기")
                    }
                    .edgesIgnoringSafeArea(.top)
                Third()
                    .tabItem{
                        Image(systemName: "plus")
                        Text("추가하기")
                    }
                Fourth()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                        Text("탐색")
                    }
                Fifth()
                    .tabItem{
                        Image(systemName: "person")
                        Text("마이")
                    }
        }
            

}
    
struct Third: View{
    var body: some View{
        ZStack{
            Text("third")
        }
    }
}

struct Fourth: View{
    var body: some View{
        ZStack{
            Text("fourth")
        }
    }
}

struct Fifth: View{
    
    var body: some View{
        VStack{
            HStack{
                Text("My Account")
                    .font(.largeTitle)
                    .bold()
                Image(systemName:"bell")
                    .resizable()
                    .frame(width:20, height:20)
            }
            
            VStack{
                Image(systemName:"bell")
                    .resizable()
                    .frame(width:200, height:100)
    
                Image(systemName:"bell")
                    .resizable()
                    .frame(width:200, height:100)
                    
            }.redacted(reason: .placeholder)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

struct Previews_Looks_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
}
}
