//
//  XianduDetailViewController.swift
//  GanIoDemo
//
//  Created by soft on 22/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit
import Kingfisher

class XianduDetailViewController: UIViewController {
    
    var category: String?
    var datas : [XianduDetailModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
//        let nib :UINib = UINib(nibName: "XianduTableViewCell", bundle: nil)
//        self.tableview.register(nib, forCellReuseIdentifier: "XianduTableViewCell")
        self.tableview.register(XianduNewTableViewCell.self, forCellReuseIdentifier: "XianduNewTableViewCell")
        self.tableview.tableFooterView = UIView()
        self.view.addSubview(self.tableview)
        self.navigationItem.title = "闲读详情"
        NetWorkUtil.loadXianduDetail(category: self.category!) { (result) in

            self.datas = result.results
            self.tableview.reloadData()
        }

    }
    
    
    
    private lazy var tableview : UITableView =  {
        var tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
        
        }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension XianduDetailViewController :UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas == nil ? 0: (self.datas?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:XianduNewTableViewCell = self.tableview.dequeueReusableCell(withIdentifier: "XianduNewTableViewCell", for: indexPath) as! XianduNewTableViewCell
        let model: XianduDetailModel = self.datas![indexPath.row]
        cell.model = model


        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableview.deselectRow(at: indexPath, animated: true)
    }
    
    
}
