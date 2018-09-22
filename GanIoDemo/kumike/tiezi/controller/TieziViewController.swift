//
//  TieziViewController.swift
//  GanIoDemo
//
//  Created by hwh on 25/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit



class TieziViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NetWorkUtil.loadTiezi { (result) in
            print(result)
        }
        self.view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
