//
//  GenericTableViewCell.swift
//  property-listing-ios
//
//  Created by Evan Beh on 08/11/2021.
//

import UIKit

class GenericTableViewCell: UITableViewCell, NibProvidable, ReusableView {


    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var lblTitle1: UILabel!
    @IBOutlet weak var lblTitle2: UILabel!
    @IBOutlet weak var lblTitle3: UILabel!
    @IBOutlet weak var lblTitle4: UILabel!
    @IBOutlet weak var lblTitle5: UILabel!
    @IBOutlet weak var lblTitle6: UILabel!
    @IBOutlet weak var lblTitle7: UILabel!
    @IBOutlet weak var lblTitle8: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
