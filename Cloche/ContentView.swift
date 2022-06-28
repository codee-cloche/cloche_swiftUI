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
                First()
                    .tabItem{
                        Image(systemName: "c.circle.fill")
                        Text("클로젯")
                    }
                    .edgesIgnoringSafeArea(.top)
                Second()
                    .tabItem{
                        Image(systemName: "puzzlepiece.extension")
                        Text("조합하기")
                    }
                    .edgesIgnoringSafeArea(.top)
                Third()
                    .tabItem{
                        Image(systemName: "plus")
                        Text("아이템 추가하기")
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

struct First: View{
    @State private var didSelected = false
    var body: some View{
        VStack{
            HStack{
                Text("Cloche")
                    .frame(width:200, alignment: .leading)
                    .font(.custom("Vegawanty-Regular", size: 20))
                
                Button(action:{
                    didSelected.toggle()
                }, label:{
                    VStack{
                        Image(systemName: "plus")
                            .foregroundColor(Color.black)
                        Text("아이템 추가하기")
                            .font(.footnote)
                            .foregroundColor(Color.black)
                            
                            
                    }
                })
                
                Button(action:{
                    didSelected.toggle()
                }, label:{
                    VStack{
                        Image(systemName: "heart")
                            .foregroundColor(Color.black)
                        Text("찜한 아이템")
                            .font(.footnote)
                            .foregroundColor(Color.black)
                    }
                })
            }
//
//            UISearchBar()
            
            
        
            
        }
    
    }
}

struct Second: View{
    var body: some View{
        ZStack{
        
            Text("second")
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

