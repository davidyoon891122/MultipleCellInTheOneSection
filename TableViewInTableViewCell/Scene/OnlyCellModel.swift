//
//  OnlyCellModel.swift
//  TableViewInTableViewCell
//
//  Created by jiwon Yoon on 2023/02/15.
//

import UIKit

enum OnlyCellModel {
    case comment(profileImage: UIImage?, titleText: String, descriptionText: String)
    case reply(title: String, content: String)
}
