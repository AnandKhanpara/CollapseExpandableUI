//
//  CollapseExpandableHeaderView.swift
//  CollapseExpandableUI
//
//  Created by Anand Khanpara on 01/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class CollapseExpandableHeaderView: UIView {

    //MARK:- Outlet
    
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var imgViewYes:UIImageView!
    @IBOutlet weak var viewBG:UIView!
    @IBOutlet weak var btnSelectHeader:UIButton!
    
    //MARK:- Variable
    
    var mainVC:MainVC?
    var ceui:CEUIModel?
    
    //MARK:- Action
    
    @IBAction func btnSelectHeader_touchUpInside(_ sender:UIButton) {
        guard let arrCEUI = mainVC?.arrCEUI else { return }
        for ceui in arrCEUI {
            if ceui.title == self.ceui?.title {
                self.ceui?.isExpanded = !(self.ceui?.isExpanded ?? false)
            }else {
                ceui.isExpanded = false
            }
        }
        mainVC?.tvCollapseExpandable.reloadData()
    }
    
    //MARK:- Function
    
    func setDetails(ceui: CEUIModel, mainVC:MainVC? = nil) {
        self.mainVC = mainVC
        self.ceui = ceui
        lblTitle.text = ceui.title
        lblTitle.textColor = ceui.isExpanded == true ? .purple : .gray
        imgViewYes.isHidden = !ceui.isExpanded
        viewBG.layer.cornerRadius = 25
        viewBG.layer.borderColor = UIColor.gray.cgColor
        viewBG.layer.borderWidth = 2
        if ceui.isExpanded == true {
            imgViewYes.image = imgViewYes.image?.withRenderingMode(.alwaysTemplate)
            imgViewYes.tintColor = .purple
        }
    }
}
