//
//  MainTableViewCell.swift
//  TableViewInTableViewCell
//
//  Created by jiwon Yoon on 2023/02/15.
//

import UIKit
import SnapKit

final class CommentCell: UITableViewCell {
    static let identifier = "CommentCell"
    
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
        textView.font = .systemFont(ofSize: 16.0)
        
        textView.backgroundColor = .clear
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
    
    private let separatorView = SeparatorView(
        size: 1.0,
        bgColor: .lightGray.withAlphaComponent(0.3),
        direction: .horizontal
    )
    
    private lazy var containerView: UIView = {
        let view = UIView()
        [
            profileImageView,
            titleLabel,
            contentTextView,
            separatorView
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
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(contentTextView.snp.bottom).offset(offset)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    func setupCell(title: String, content: String) {
        titleLabel.text = title
        contentTextView.text = content
        setupViews()
        selectionStyle = .none
    }
}

private extension CommentCell {
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
