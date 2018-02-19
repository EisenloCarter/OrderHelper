//
//  ShopCartFooter.swift
//  OrderHelper
//
//  Created by spidepa on 19/2/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class ShopCartFooter: UIView {
    
    let label: UILabel = UILabel()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    func configureView() {
        backgroundColor = UIColor(red: 67.0/255.0, green: 205.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        alpha = 0.0
        // Configure label
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = "leihou"
        addSubview(label)
    }
    
    override func draw(_ rect: CGRect) {
        label.frame = bounds
    }

    //MARK: - Animation
    fileprivate func hideFooter() {
        UIView.animate(withDuration: 0.7) {[unowned self] in
            self.alpha = 0.0
        }
    }
    
    fileprivate func showFooter() {
        UIView.animate(withDuration: 0.7) {[unowned self] in
            self.alpha = 1.0
        }
    }
}

extension ShopCartFooter {
    //MARK: - Public API
    public func setNotFiltering() {
        label.text = "nice"
        showFooter()
    }
}
