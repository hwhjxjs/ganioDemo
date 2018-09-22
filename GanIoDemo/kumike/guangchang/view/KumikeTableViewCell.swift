//
//  KumikeTableViewCell.swift
//  GanIoDemo
//
//  Created by soft on 24/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit
import Kingfisher

class KumikeTableViewCell: UITableViewCell {
    
    var pictures : [Picture]!
    
    
    var model:Topic = Topic()
    {
        willSet{
             headLogo.circleImage()
        }
        didSet{
            self.headLogo.kf.setImage(with:URL(string: model.user.img) , placeholder: nil)
            self.headLogo.circleImage()
            self.contentLabel.text = model.content
            self.titleLabel.text = model.user.name
            self.timeLabel.text = model.createTime.convertString()
            self.pictures = model.pictures
            if(model.section.name == nil || model.section.name.count == 0)
            {
                self.xiangqinBtn.isHidden = true
            }
            else
            {
                self.xiangqinBtn.isHidden = false
                self.xiangqinBtn.text = model.section.name
            }
            var replyCount :Int = 0
            if(model.staticField == nil || model.staticField.replycount == nil )
            {
                replyCount = 0
            }
            else
            {
                replyCount = model.staticField.replycount
            }
            commectBtn.setTitle(replyCount.convertString(), for: .normal)
            commectBtn.titleLabel?.textColor = UIColor.gray
            
            
            var praisecount :Int = 0
            if(model.staticField == nil || model.staticField.praisecount == nil)
            {
                praisecount = 0
            }
            else
            {
                praisecount = model.staticField.praisecount
            }
            collectBtn.setTitle(praisecount.convertString(), for: .normal)
            collectBtn.titleLabel?.textColor = UIColor.gray
            
            
            self.collectView?.reloadData()
        }
    }
    
    var collectView :UICollectionView?
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
    
    
    
    func setupUI()  {
        
        self.collectView = UICollectionView(frame: CGRect(x: 0, y: 30, width: kScreenWidth, height: 0), collectionViewLayout: KumikeFlowLayout())
        self.collectView?.backgroundColor = UIColor.white
        self.collectView?.register(GanIoCollectionViewCell.self, forCellWithReuseIdentifier: "collectview")
        self.collectView?.delegate = self
        self.collectView?.dataSource = self
        
        self.addSubview(headLogo)
        headLogo.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(5)
            make.left.equalTo(self).offset(8)
            make.width.height.equalTo(30)
        }
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headLogo.snp.top)
            make.left.equalTo(headLogo.snp.right).offset(5)
            make.right.equalTo(self)
            make.height.equalTo(labelHeight)
        }
        
        self.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(titleLabel)
            make.right.equalTo(self)
            make.height.equalTo(labelHeight)
        }
        
        self.addSubview(tuijianLabel)
        tuijianLabel.snp.makeConstraints { (make) in
            make.top.equalTo(timeLabel.snp.bottom)
            make.left.equalTo(titleLabel)
            make.right.equalTo(self)
        }
        
        self.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(tuijianLabel.snp.bottom)
            make.left.equalTo(titleLabel).offset(-5)
            make.right.equalTo(self)
        }
        
         self.addSubview(collectBtn)
        collectBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-10)
            make.left.equalTo(titleLabel)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        
        self.addSubview(commectBtn)
        commectBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(collectBtn)
            make.left.equalTo(collectBtn.snp.right).offset(5)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        self.addSubview(xiangqinBtn)
        xiangqinBtn.snp.makeConstraints({ (make) in
            make.centerY.equalTo(collectBtn)
            make.right.equalTo(self).offset(-5)
            make.width.equalTo(60)
            make.height.equalTo(30)
            
        })
        
        
        self.addSubview(self.collectView!)
        collectView?.snp.makeConstraints({ (make) in
            make.top.equalTo(contentLabel.snp.bottom).offset(3)
            make.bottom.equalTo(collectBtn.snp.top)
            make.left.equalTo(titleLabel)
            make.right.equalTo(self).offset(-5)
            
        })
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    /**
    * 头像
    */
    lazy var headLogo:UIImageView = {
        var headerImage:UIImageView = UIImageView()
        headerImage.contentMode = .scaleToFill
        headerImage.circleImage()
        return headerImage
    }()
    
    
    /**
    * 标题
    */
    lazy var titleLabel:UILabel = {
       var titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 13)
        return titleLabel
    }()
    
    
    /**
     * 时间
     */
    lazy var timeLabel:UILabel = {
        var timeLabel = UILabel()
        timeLabel.font = UIFont.boldSystemFont(ofSize: 12)
        timeLabel.textColor = UIColor.gray
        return timeLabel
    }()
    
    
    /**
    * 推荐
    */
    lazy var tuijianLabel:UILabel = {
        var tuijianlabel = UILabel()
        tuijianlabel.font = UIFont.boldSystemFont(ofSize: 12)
        tuijianlabel.textColor = UIColor.blue
        return tuijianlabel
    }()
    
    
    /**
    * 文字内容
    */
    lazy var contentLabel :UILabel = {
        var contentLabel = UILabel()
        contentLabel.font = UIFont.boldSystemFont(ofSize: 13)
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        return contentLabel
    }()
    
    
    /**
    * 收藏
    */
    lazy var collectBtn: UIButton = {
       var collectBtn = UIButton()
        collectBtn.setImage(UIImage(named: "xiandu"), for: .normal)
        return collectBtn
    }()
    
    
    
    /**
    * 评论
    */
    lazy var commectBtn: UIButton = {
        var commectBtn = UIButton()
        commectBtn.setImage(UIImage(named: "xiandu"), for: .normal)
        commectBtn.titleLabel?.textColor = UIColor.gray
        commectBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        return commectBtn
    }()
    
    
    /**
     * 相亲
     */
    lazy var xiangqinBtn: UILabel = {
        var xiangqinBtn = UILabel()
        xiangqinBtn.layer.cornerRadius = 8.0
        xiangqinBtn.textColor = UIColor.gray
        xiangqinBtn.font = UIFont.boldSystemFont(ofSize: 12)
        xiangqinBtn.textAlignment = .center
        let cgColor:CGColor = UIColor.gray.cgColor
        xiangqinBtn.layer.borderColor = cgColor//边框颜色
        xiangqinBtn.layer.borderWidth = 0.5//边框宽度
        return xiangqinBtn
    }()
    
}


extension KumikeTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures == nil ? 0 :(pictures.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell : GanIoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier:"collectview" , for: indexPath) as! GanIoCollectionViewCell
        let imageURL:String = pictures[indexPath.row].picture

        let url : URL = URL(string: imageURL)!
        
        cell.imageView.kf.setImage(with: ImageResource(downloadURL: url))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemSize : CGSize?
        if(pictures == nil || pictures.count == 0)
        {
            itemSize = CGSize(width: 0, height: 0)
        }
        else if(pictures.count == 1)
        {
            itemSize = CGSize(width: 100,height: 150)
        }
        else
        {
            itemSize = CGSize(width: image3Widthnew, height: image3Widthnew)
        }
        return itemSize!
    }
}


/// 布局
class KumikeFlowLayout: UICollectionViewFlowLayout {
    var pictures : [Picture]!
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init()
    }
    
    override func prepare() {
        super.prepare()
        // 每个 cell 的大小
        if(pictures == nil || pictures.count == 0)
        {
            itemSize = CGSize(width: 0, height: 0)
        }
        else if(pictures.count == 1)
        {
            itemSize = CGSize(width: 100, height: 150)
        }
        else
        {
            itemSize = CGSize(width: image3Widthnew, height: image3Widthnew)
        }
        minimumLineSpacing = 3
        minimumInteritemSpacing = 3
    }
}
