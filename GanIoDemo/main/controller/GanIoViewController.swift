//
//  GanIoViewController.swift
//  GanIoDemo
//
//  Created by soft on 21/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit

class GanIoViewController: UIViewController {
    
    var datas: [GanIoBean] =  []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(datas)
        
        setupUI()
    }
    
    func setupUI()  {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GanIoTableViewCell.self, forCellReuseIdentifier: "GanIoTableViewCell")
//        tableView.register(UINib(nibName: "GanIoTodayCell", bundle: nil), forCellReuseIdentifier: "GanIoTodayCell")
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

}


extension GanIoViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :GanIoTableViewCell = tableView.dequeueReusableCell(withIdentifier:  "GanIoTableViewCell", for: indexPath) as! GanIoTableViewCell
        
        cell.model = datas[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(tableItemHeight + datas[indexPath.row].heightForImageCollect())
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
