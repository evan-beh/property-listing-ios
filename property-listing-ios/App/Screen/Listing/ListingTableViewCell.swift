//
//  ListingTableViewCell.swift
//  property-listing-ios
//
//  Created by Evan Beh on 09/11/2021.
//

import UIKit

class ListingTableViewCell: GenericTableViewCell {

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func awakeFromNib()
    {
        
            super.awakeFromNib()

            self.baseView.layer.shadowOffset =  CGSize(width: 5, height: 10)   // CGSizeMake(0, 1)
            self.baseView.layer.shadowColor =   UIColor.init(red: 11/255.0, green: 17/255.0, blue: 52/255.0, alpha: 0.15).cgColor
            self.baseView.layer.shadowRadius = 8
            self.baseView.layer.shadowOpacity = 1
            self.baseView.layer.cornerRadius = 4
            self.baseView.clipsToBounds = true
            self.baseView.layer.masksToBounds = false
            self.layer.masksToBounds = false
        
        self.imageView1.makeRoundborder(radius: 4)
        
    }

}
