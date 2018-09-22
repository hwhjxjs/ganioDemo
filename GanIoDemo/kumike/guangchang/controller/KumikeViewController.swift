//
//  KumikeViewController.swift
//  GanIoDemo
//
//  Created by soft on 23/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit
import SVProgressHUD

class KumikeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var curPage :Int = 0
    
    var topics = [Topic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupRefresh()
        
    }
    
    func setupUI()  {
        self.tableView.register(KumikeTableViewCell.self, forCellReuseIdentifier: "KumikeTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


extension KumikeViewController
{
    func setupRefresh()  {
        // 刷新头部
        let header = RefreshHeader { [weak self] in
            self?.curPage = 0
            NetWorkUtil.loadKumike(curPage: (self?.curPage)!) { (result) in
                if self!.tableView.mj_header.isRefreshing { self!.tableView.mj_header.endRefreshing() }
                print(result.data)
                self?.topics = result.data.topics
                self?.curPage = 1
                self?.tableView.reloadData()
            }
        }
        header?.isAutomaticallyChangeAlpha = true
        header?.lastUpdatedTimeLabel.isHidden = true
        tableView.mj_header = header
        tableView.mj_header.beginRefreshing()
        // 底部刷新控件
        tableView.mj_footer = RefreshAutoGifFooter(refreshingBlock: { [weak self] in
            NetWorkUtil.loadKumike(curPage: (self?.curPage)!) { (result) in
                if self!.tableView.mj_footer.isRefreshing { self!.tableView.mj_footer.endRefreshing() }
                self!.tableView.mj_footer.pullingPercent = 0.0
                print(result.data)
                self?.curPage += 1
                self?.topics += result.data.topics
                self?.tableView.reloadData()
                if result.data.topics.count == 0 {
                    SVProgressHUD.showInfo(withStatus: "没有更多数据啦！")
                    return
                }
            }
        })
        tableView.mj_footer.isAutomaticallyChangeAlpha = true
    }
}

extension KumikeViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :KumikeTableViewCell = tableView.dequeueReusableCell(withIdentifier:  "KumikeTableViewCell", for: indexPath) as! KumikeTableViewCell
        
        cell.model = topics[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model:Topic = topics[indexPath.row]
        return model.heightForCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let tieziController = TieziViewController()
        self.navigationController?.pushViewController(tieziController, animated: true)
    }
}

