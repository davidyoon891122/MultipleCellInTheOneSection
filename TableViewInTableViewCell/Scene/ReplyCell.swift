//
//  InnerTableViewCell.swift
//  TableViewInTableViewCell
//
//  Created by jiwon Yoon on 2023/02/15.
//

import UIKit
import SnapKit

final class ReplyCell: UITableViewCell {
    static let identifier = "ReplyCell"
    
    private lazy var writerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
        
        return label
    }()
    
    private lazy var replyTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Reply Test"
        textView.textColor = .gray
       
        textView.isScrollEnabled = false
        textView.isEditable = false
        
        return textView
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2023.02.15"
        label.textColor = .gray
        
        return label
    }()
    
    private let separatorView = SeparatorView(size: 1.0, bgColor: .lightGray.withAlphaComponent(0.3), direction: .horizontal)
    
    private lazy var containerView: UIView = {
        let view = UIView()
        [
            writerLabel,
            replyTextView,
            dateLabel,
            separatorView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        writerLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(offset)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        replyTextView.snp.makeConstraints {
            $0.top.equalTo(writerLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(replyTextView.snp.bottom)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(offset)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    func setupCell(title: String, content: String) {
        writerLabel.text = title
        replyTextView.text = content
        setupViews()
        selectionStyle = .none
    }
}

private extension ReplyCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        containerView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalToSuperview().offset(offset)
        }
        
    }
}
