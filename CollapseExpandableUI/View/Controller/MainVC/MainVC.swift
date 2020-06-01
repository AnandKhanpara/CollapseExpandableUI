//
//  MainVC.swift
//  CollapseExpandableUI
//
//  Created by Anand Khanpara on 01/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    //MARK:- Outlet
    
    @IBOutlet weak var tvCollapseExpandable:UITableView!
    
    //MARK:- Variable
    
    var arrCEUI = [CEUIModel]() {
        didSet {
            OperationQueue.main.addOperation { [weak self] in
                guard let self = self else { return }
                self.tvCollapseExpandable.reloadData()
            }
        }
    }
    
    //MARK:- View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    //MARK:- Navigation
    
    
    //MARK:- Action
    
    
    //MARK:- Function
    
    func setUI() {
        arrCEUI = DataStorage.arrCEUI
    }
    
    //MARK:- Web Service
    
    
}

//MARK:- Extension

extension MainVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrCEUI.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let fileName = "CollapseExpandableHeaderView"
        guard let headerView = loadNibNamed(fileName: fileName) as? CollapseExpandableHeaderView else {
            return UIView()
        }
        headerView.setDetails(ceui: arrCEUI[section], mainVC: self)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tvCollapseExpandable {
            let arr = arrCEUI[section]
            if arr.input == .text {
                return arr.isExpanded == true ? 1 : 0
            }else if arr.input == .list {
                return arr.isExpanded == true ? 1 : 0
            }
            return 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ceui = arrCEUI[indexPath.section]
        if ceui.input == .text {
            return ceTextTVCell(ceui, indexPath: indexPath)
        }else if ceui.input == .list {
            return ceListTVCell(ceui, indexPath: indexPath)
        }
        return UITableViewCell()
    }
    
    func ceTextTVCell(_ ceui:CEUIModel, indexPath:IndexPath) -> UITableViewCell {
        guard let cell = tvCollapseExpandable.dequeueReusableCell(withIdentifier: "CETextTVCell", for: indexPath) as? CETextTVCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func ceListTVCell(_ ceui:CEUIModel, indexPath:IndexPath) -> UITableViewCell {
        guard let cell = tvCollapseExpandable.dequeueReusableCell(withIdentifier: "CEListTVCell", for: indexPath) as? CEListTVCell else {
            return UITableViewCell()
        }
        cell.setDetails(ceui: ceui)
        return cell
    }
    
}
