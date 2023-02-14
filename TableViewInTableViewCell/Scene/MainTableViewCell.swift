//
//  MainTableViewCell.swift
//  TableViewInTableViewCell
//
//  Created by jiwon Yoon on 2023/02/15.
//

import UIKit
import SnapKit

final class MainTableViewCell: UITableViewCell {
    static let identifier = "MainTableViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Writer"
        label.textColor = .label
        
        return label
    }()
    
    private lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.text = "ContentText"
        textView.textColor = .label
        
        textView.isScrollEnabled = false
        textView.isEditable = false
        
        return textView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemCyan
        imageView.layer.cornerRadius = 15.0
        
        return imageView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        [
            profileImageView,
            titleLabel,
            contentTextView
        ]
            .forEach {
                view.addSubview($0)
            }

        let offset: CGFloat = 16.0
        profileImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(offset)
            $0.height.width.equalTo(30.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(offset)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(offset)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalTo(titleLabel)
            $0.bottom.equalToSuperview().offset(-offset)
        }
        
        return view
    }()
    
    func setupCell(title: String, content: String) {
//        titleLabel.text = title
//        contentTextView.text = content
        setupViews()
    }
}

private extension MainTableViewCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
