//
//  DetailsListTVCell.swift
//  CollapseExpandableUI
//
//  Created by Anand Khanpara on 01/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class DetailsListTVCell: UITableViewCell {
    
    //MARK:- Outlet
    
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var imgViewSelected:UIImageView!
    @IBOutlet weak var btnSelectDetails:UIButton!
    
    //MARK:- Variable
    
    var ceListTVCell:CEListTVCell?
    var details:DetailsModel?
    
    //MARK:- Action
    
    @IBAction func btnSelectDetails_touchUpInside(_ sender:UIButton) {
        guard let arrDetails = ceListTVCell?.arrDetails else { return }
        for details in arrDetails {
            if details.title == self.details?.title {
                self.details?.isSelected = !(self.details?.isSelected ?? false)
            }else {
                details.isSelected = false
            }
        }
        ceListTVCell?.tvList.reloadData()
    }
    
    //MARK:- Function
    
    func setDetails(details: DetailsModel, ceListTVCell:CEListTVCell) {
        self.ceListTVCell = ceListTVCell
        self.details = details
        lblTitle.text = details.title
        lblTitle.textColor = details.isSelected == true ? .purple : .gray
        imgViewSelected.isHidden = !details.isSelected
        if details.isSelected == true {
            imgViewSelected.image = imgViewSelected.image?.withRenderingMode(.alwaysTemplate)
            imgViewSelected.tintColor = .purple
        }
    }
}
