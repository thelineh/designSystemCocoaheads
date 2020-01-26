//
//  TagView.swift
//  DesignSystemPod
//
//  Created by Aline Ghizzi on 26/01/20.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit

public class TagView: UIView {
    
    private var tagType: TagType?

    private var textLabel: UILabel
    
    override init(frame: CGRect) {
        self.textLabel = UILabel()
        
        super.init(frame: frame)
        
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        self.addSubview(textLabel)
    }
    
    private func setupConstraints() {
        let insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        textLabel.bindFrameToSuperviewBounds(offset: insets)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = tagType?.borderRadius ?? 0
    }
    
    func configure(with type: TagType) {
        self.tagType = type
        self.textLabel.text = type.title
        self.textLabel.textColor = type.fontColor
        self.textLabel.font = type.font.withSize(12)
        self.backgroundColor = type.backgroundColor
        self.clipsToBounds = true
    }
}
