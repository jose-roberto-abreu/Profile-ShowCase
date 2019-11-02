//
//  UITableView+Dequeue.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import UIKit

extension UITableView {

    func getCell<T: UITableViewCell>(type: T.Type) -> T {
        let cellIdentifier = "\(type)"
        if let cell = self.dequeueReusableCell(withIdentifier: cellIdentifier) as? T {
            return cell
        } else {
            let cell = type.init(style: .default, reuseIdentifier: cellIdentifier)
            return cell
        }
    }

}
