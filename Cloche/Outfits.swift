//
//  Outfits.swift
//  Cloche
//
//  Created by grace kim  on 2022/07/04.
//

import SwiftUI

struct Outfits: Identifiable{
    let id = UUID()
    let mainTitle: String
    let subTitle: String
    let imageName: String
    
    static var dummyData: [Outfits]{
        
        var temp = [Outfits]()
        
        temp.append(Outfits(mainTitle: "Sample Outfit", subTitle: "Worn 1 Time", imageName: "outfitSample1"))
        for index in 0...30 {
            temp.append(
            Outfits(mainTitle: "Sample Outfit",
                    subTitle: "Worn \(index) times",
                    imageName: "emptyOutfit"
                    )
            )
        }
        return temp
    }
}
