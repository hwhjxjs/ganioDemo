//
//  GanIoTableViewCell.swift
//  GanIoDemo
//
//  Created by soft on 23/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit
import Kingfisher

class GanIoTableViewCell: UITableViewCell {
   
    
    var datas:[String]?
    
    var collectView :UICollectionView?
    
    var model = GanIoBean()
    {
        didSet{
            titleLabel.text = model.desc
            styleLabel.text = model.type
            self.datas = model.images
            self.collectView?.reloadData()

        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    
    func setupUI()  {
        self.collectView = UICollectionView(frame: CGRect(x: 0, y: 30, width: kScreenWidth, height: 0), collectionViewLayout: GanIoFlowLayout())
        self.collectView?.backgroundColor = UIColor.white
        self.collectView?.register(GanIoCollectionViewCell.self, forCellWithReuseIdentifier: "collectview")
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(5)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(20)
        }
        
        self.addSubview(styleLabel)
        styleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-5)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(20)
        }
        
        self.addSubview(collectView!)
        collectView?.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.bottom.equalTo(styleLabel.snp.top)
        }
        
        self.collectView?.delegate = self
        self.collectView?.dataSource = self

    }
    
    
    var titleLabel:UILabel = {
       var label = UILabel()
        return label
    }()
    
    
    var styleLabel :UILabel = {
       var label = UILabel()
        return label
    }()
    
    
    
//    var collectView :UICollectionView = {
//       var collectView = UICollectionView()
//       collectView.register(GanIoCollectionViewCell.self, forCellWithReuseIdentifier: "collectview")
//        collectView.collectionViewLayout = GanIoFlowLayout()
//        return collectView
//    }()

}



extension GanIoTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas == nil ? 0 :(datas?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell : GanIoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier:"collectview" , for: indexPath) as! GanIoCollectionViewCell
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
class GanIoFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        // 每个 cell 的大小
        itemSize = CGSize(width: image3Width, height: image3Width)
        minimumLineSpacing = 3
        minimumInteritemSpacing = 3
    }
}
