//
//  DataStorage.swift
//  CollapseExpandableUI
//
//  Created by Anand Khanpara on 01/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class DataStorage: NSObject {
    
    static var arrCEUI = [
        CEUIModel(title: "PhD"),
        CEUIModel(title: "Master Degree"),
        CEUIModel(title: "Bachelor Degree"),
        CEUIModel(title: "Diploma"),
        CEUIModel(title: "Foundation"),
        CEUIModel(title: "Vacational School"),
        CEUIModel(title: "High School"),
        CEUIModel(title: "Other",
                  input: .text),
        CEUIModel(title: "English",
                  input: .list,
                  details: arrDetails()),
        CEUIModel(title: "Hindi",
                  input: .list,
                  details: arrDetails()),
        CEUIModel(title: "Gujarati",
                  input: .list,
                  details: arrDetails()),
        CEUIModel(title: "Marathi",
                  input: .list,
                  details: arrDetails())
    ]
    
    static func arrDetails() -> [DetailsModel] {
        let arr = [
            DetailsModel(title: "Below Basic"),
            DetailsModel(title: "Basic"),
            DetailsModel(title: "Proficient"),
            DetailsModel(title: "Advance")
        ]
        return arr
    }
}

