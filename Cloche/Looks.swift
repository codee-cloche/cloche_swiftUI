//
//  Looks.swift
//  Cloche
//
//  Created by grace kim  on 2022/07/04.
//

import SwiftUI

enum GridType: CaseIterable{
    case double
    case single
    
    var columns: [GridItem] {
        switch self {
        case .double:
            return [GridItem(.flexible()),
                    GridItem(.flexible())]
        
        case .single:
            return [GridItem(.flexible())]
            
        }
    }
}

struct Looks: View{
    @State var text = ""
    @State private var didSelected = false
    @State private var selectedGridType: GridType = .double
    var body: some View{
        VStack(spacing: 0){
            
                //search bar
                SearchBar(text: $text)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                
            HStack{
                //recommended keywords
                Image(systemName:
                        "sparkles")
                .frame(alignment: .leading)
               
                
                Text("추천 검색어")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(alignment: .trailing)
                
                Button(action:{
                    didSelected.toggle()
                }, label:{
                          Text("바캉스")
                            .font(.footnote)
                            .frame(alignment: .trailing)
                            .padding(.leading)
                            
                })
                
                Button(action:{
                    didSelected.toggle()
                }, label:{
                    Text("개강룩")
                        .font(.footnote)
                        .frame(alignment: .trailing)
                        .padding()
                })
                
                
                Button(action:{
                    didSelected.toggle()
                }, label:{
                    Text("스트릿")
                        .font(.footnote)
                        .frame(alignment: .trailing)
                        .padding()
                })
                
        }
            
            Divider()
                .padding(EdgeInsets(top:0, leading: 20, bottom:0, trailing:20))
            
            GridTypePicker(gridType: $selectedGridType)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
            
            let Outfits = Outfits.dummyData
            
            ScrollView{
                LazyVGrid(columns: selectedGridType.columns,
                          content: {
                    ForEach(Outfits) { Outfit in
                        Image(Outfit.imageName)
                            .aspectRatio(contentMode: .fit)
                    }
                })
            }
    
        }
    }
}


struct GridTypePicker: View{
    @Binding var gridType: GridType
    var body: some View{
        Picker("Grid Type", selection: $gridType){
            ForEach(GridType.allCases, id:\.self){type in
                switch type{
                case .double:
                    Image(systemName: "rectangle.grid.2x2")
                case .single:
                    Image(systemName: "rectangle.grid.1x2")
                }
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}



