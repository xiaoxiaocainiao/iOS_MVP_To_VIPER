//
//  BookListTableViewCell.swift
//  LearnMVP
//
//  Created by 王雁 on 2018/4/24.
//  Copyright © 2018年 王雁. All rights reserved.
//

import UIKit

class BookListTableViewCell: UITableViewCell {
    
    private var mBook: Book?
    
    private let titleLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(_ book: Book?) {
        mBook = book
        titleLabel.text = mBook?.name
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = bounds
        titleLabel.textColor = UIColor.red
    }
    
}
