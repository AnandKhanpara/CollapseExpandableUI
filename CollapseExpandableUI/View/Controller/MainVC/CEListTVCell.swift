//
//  CEListTVCell.swift
//  CollapseExpandableUI
//
//  Created by Anand Khanpara on 01/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class CEListTVCell: UITableViewCell {
    
    //MARK:- Outlet
    
    @IBOutlet weak var constraintTVListHeight:NSLayoutConstraint!
    @IBOutlet weak var tvList:UITableView!
    
    //MARK:- Variable
    
    var arrDetails = [DetailsModel]()
    var ceui:CEUIModel?
    
    //MARK:- Method
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //MARK:- Action
    
    
    //MARK:- Function
    
    func setDetails(ceui:CEUIModel) {
        self.arrDetails = ceui.details
        self.ceui = ceui
        constraintTVListHeight.constant = ceui.isExpanded == true ? CGFloat(ceui.details.count * 50) : 0
        if ceui.isExpanded == true {
            tvList.reloadData()
        }
    }
    
}

//MARK:- Extension

extension CEListTVCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ceui?.isExpanded == true ? arrDetails.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tvList.dequeueReusableCell(withIdentifier: "DetailsListTVCell", for: indexPath) as? DetailsListTVCell else {
            return UITableViewCell()
        }
        cell.setDetails(details: arrDetails[indexPath.row], ceListTVCell: self)
        return cell
    }
    
}
