//
//  GanIoTodayCell.swift
//  GanIoDemo
//
//  Created by soft on 21/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit
import Kingfisher

class GanIoTodayCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var imageCollectView: UICollectionView!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    var datas:[String]?
    
    
    var model = GanIoBean()
    {
        didSet{
            titleLabel.text = model.desc
            typeLabel.text = model.type
            self.datas = model.images
            self.imageCollectView.reloadData()
//            self.imageCollectView.snp.makeConstraints { (make) in
//                make.height.equalTo(model.heightForImageCollect())
//            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    /**
    * 初始化UI
    */
    func setupUI() {
        self.imageCollectView.delegate = self
        self.imageCollectView.dataSource = self
        self.imageCollectView.register(GanIoCollectionViewCell.self, forCellWithReuseIdentifier: "GanIoCollectionViewCell")
        self.imageCollectView.collectionViewLayout = GanIoTodayFlowLayout()
        
    }
    
}




extension GanIoTodayCell:UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas == nil ? 0 :(datas?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell : GanIoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier:"GanIoCollectionViewCell" , for: indexPath) as! GanIoCollectionViewCell
        var imageURL:String = datas![indexPath.row]
        imageURL = imageURL.replacingOccurrences(of: "large", with: "small")
        print("图片url",imageURL)
        let url : URL = URL(string: imageURL)!
        
        cell.imageView.kf.setImage(with: ImageResource(downloadURL: url))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: image3Width, height: image3Width)
    }
}


/// 布局
class GanIoTodayFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        // 每个 cell 的大小
        itemSize = CGSize(width: image3Width, height: image3Width)
        minimumLineSpacing = 5
        minimumInteritemSpacing = 5
    }
}
