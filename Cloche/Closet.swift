//
//  Closet.swift
//  Cloche
//
//  Created by 이선재 on 2022/07/10.
//

import SwiftUI

struct Closet: View {
    //variables for searchbar
    var columns = Array(repeating: GridItem(.flexible()), count: 3)
    @State var categoryIndex = 0
    @State var text = ""
    @State var isEditing = false
    
    
    @State private var didSelected = false
    var body: some View{
        VStack{
            HStack{
                Text("Cloche")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                
                
            
                
                Button(action:{
                    didSelected.toggle()
                }, label:{
                    VStack{
                        Image(systemName: "heart")
                            .foregroundColor(Color.black)
                        Text("Likes")
                            .font(.footnote)
                            .foregroundColor(Color.black)
                    }
                })
            }
            .padding(.top, 50)

            SearchBar(text: $text)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30){
                    ForEach(0..<categories.count, id: \.self){data in
                                        
                        Categories(data: data, index: $categoryIndex)
                    }
                }
            }
            .padding(.top, 30)
            
            ScrollView(.vertical, showsIndicators: false){
                LazyVGrid(columns: columns, spacing: 20){
//                    "\($0)".contains(text) || text.isEmpty ||
                    ForEach(cData.filter({"\($0)".contains(categories[categoryIndex])})){ clothes in
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                            VStack {
                                Image("\(clothes.image)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 110)
                                
                                                
                                HStack {
                                    VStack (alignment: .leading){
                                        Text(clothes.title)
                                            .font(.footnote)
                                            .frame(maxWidth: .infinity, alignment: .center)
//                                            .fontWeight(.bold)
                                            .foregroundColor(Color("mainfont"))
                                         
                                    }
                                                    
                                    Spacer()
                                }
                            }
                            
                        }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
//                            .background(Color(clothes.cardColor))
//                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(color: Color(clothes.cardColor).opacity(0.5), radius: 10, x:0, y: 10)
                    }
                }
            }
            .padding(.top, 30)
            
            Spacer()
            
           
        }
        .padding(.horizontal, 20)
    
    
    }
     
}

struct Closet_Previews: PreviewProvider {
    static var previews: some View {
        Closet()
    }
}

struct Categories: View {

    var data: Int
//    var data: [] = []
    @Binding var index: Int

    var body: some View{
        VStack(spacing: 8 ){
            Image(String(data+1))
                .resizable()
                .aspectRatio(contentMode: .fit)

                .frame(height: 50)

                .padding(7)
                .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray, lineWidth: 1))
//                .border(Color.gray, width: 1)

            Text(categories[data])
                .font(.system(size: 22))
                .fontWeight(index == data ? .bold : .none)
                .foregroundColor(Color(index == data ? "mainfont" : "subfont"))

            Capsule()
                .fill(Color("mainfont"))
                .frame(width: 30, height: 4)
                .opacity(index == data ? 1 : 0)
        }.onTapGesture {
            withAnimation {
                index = data
            }
        }
    }
}

struct Clothes: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var cardColor: String
    var price: String
    var category: String

}

//var categories = [["아우터", "1"], ["상의", "2"], ["하의", "3"], ["신발", "4"], ["액세서리", "5"]]
var categories = ["아우터", "상의", "하의", "신발", "액세서리"]
var categoriesImag = [2, 1, 3, 4, 5, 6]

var cData = [
    Clothes(title: "Yale Hoodie", image: "1", cardColor: "Color1", price: "$2.99", category: "상의"),
    Clothes(title: "Uniqlo Jacket", image: "2", cardColor: "Color2", price: "$0.99", category: "아우터"),
    Clothes(title: "Levis Jeans", image: "3", cardColor: "Color3", price: "$3.99", category: "하의"),
    Clothes(title: "Black Boots", image: "4", cardColor: "Color1", price: "$2.99", category: "신발"),
    Clothes(title: "Leather Jacket", image: "6", cardColor: "Color1", price: "$2.99", category: "아우터"),
]
