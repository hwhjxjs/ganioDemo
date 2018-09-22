//
//  XianduViewController.swift
//  GanIoDemo
//
//  Created by soft on 20/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class XianduViewController: UIViewController {
   var datas :[XianduModel]? = []

    override func viewDidLoad() {
        super.viewDidLoad()

        NetWorkUtil.loadXianduData { (result) in
            self.datas = result.results!
             self.view.addSubview(self.tableView)
//            let nib = UINib(nibName: "XianduTableViewCell", bundle: nil)
             self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
            self.tableView.reloadData()
        } 

    }
    
    
    lazy var tableView : UITableView = {
        var tableView :UITableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
        
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}

extension XianduViewController :UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell  = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath)
        let model :XianduModel = datas![indexPath.row]
//        let urlStr = model.icon
//        let url : URL = URL(string: urlStr!)!
//        cell.logoIv.kf.setImage(with: ImageResource(downloadURL: url))
        cell.textLabel?.text = model.name
        cell.detailTextLabel?.text = model.enName
        cell.accessoryType = .disclosureIndicator
//        cell.createTimeLabel.text = model.createAt
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.datas == nil ? 0 :(self.datas?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableItemHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let xianduDetailController = XianduDetailViewController()
        let model :XianduModel = datas![indexPath.row]
        xianduDetailController.category = model.enName
        self.navigationController?.pushViewController(xianduDetailController, animated: true)
    }
}
