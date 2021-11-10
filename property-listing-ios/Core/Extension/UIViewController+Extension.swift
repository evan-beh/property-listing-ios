//
//  UIViewController+Extension.swift
//  property-listing-ios
//
//  Created by Evan Beh on 09/11/2021.
//

import UIKit

extension UIViewController  {

    @objc func pop()
    {
        self.navigationController?.popViewController(animated: true)
    }
}
