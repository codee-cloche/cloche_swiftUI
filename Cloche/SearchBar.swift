//
//  SearchBar.swift
//  Cloche
//
//  Created by 이선재 on 2022/06/29.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    var body: some View {
        HStack{
            TextField("색상, 브랜드, 검색하고 싶은 옷의 종류를 검색해보세요!", text: $text)
                .padding(15)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .foregroundColor(.black)
                .cornerRadius(8)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                        
                        if isEditing{
                            Button(action: {
                                self.text  = ""
                            }, label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            })
                        }
                    }).onTapGesture{
                        self.isEditing = true
                    }
            if isEditing{
                Button(action: {
                    self.isEditing = false
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }){
                    Text("Cancel")
                    
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
//               
            }
        }
    }
}

