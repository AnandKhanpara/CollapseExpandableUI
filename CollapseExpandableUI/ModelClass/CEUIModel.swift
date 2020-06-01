//
//  CEUIModel.swift
//  CollapseExpandableUI
//
//  Created by Anand Khanpara on 01/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

class CEUIModel {
    
    enum Input {
        case text
        case list
        case empty
    }
    
    var title:String?
    var input:Input
    var isExpanded:Bool
    var details:[DetailsModel]
    
    init(title:String? = nil, input:Input = .empty, details:[DetailsModel] = [DetailsModel](), isExpanded:Bool = false) {
        print(input)
        print("-------------")
        self.title = title
        self.isExpanded = isExpanded
        self.input = input
        self.details = details
    }
}


class DetailsModel {
    var title:String?
    var isSelected:Bool
    
    init(title:String? = nil, isSelected:Bool = false) {
        self.title = title
        self.isSelected = isSelected
    }
}
