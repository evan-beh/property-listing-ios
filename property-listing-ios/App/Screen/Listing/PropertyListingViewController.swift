//
//  PropertyListingViewController.swift
//  property-listing-ios
//
//  Created by Evan Beh on 06/11/2021.
//

import UIKit
import Combine
import Kingfisher


protocol View
{
    func bind()
    func setupView()
    
}

class PropertyListingViewController: UIViewController, View {    
   
    var subscriptions = [AnyCancellable]()
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: PropertyListingViewModel!
    
   
    func bind() {
        
        viewModel.$listing
           .receive(on: DispatchQueue.main)
           .sink { [weak self] items in
              self?.tableView.reloadData()
           }
           .store(in: &subscriptions)
        
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bind()
        self.viewModel.viewDidLoad()
      
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
     
        self.title = "Search Results"
    }
  
    override func viewWillDisappear(_ animated: Bool) {
        self.title = ""


    }

}


extension PropertyListingViewController : UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.didTapOnRow(index: indexPath.row)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.listing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")! as! ListingTableViewCell
        
               
        let item = self.viewModel.listing[indexPath.row]
        cell.lblTitle1.text =  item.project_name
        
        
        let description2 = "\(item.address?.street_name ?? "") \u{00B7} \(item.address?.district ?? "-")"

        cell.lblTitle2.text = description2
        
        let description3 = "\(item.category ?? "") \u{00B7} \(item.completed_at ?? "-")  \u{00B7} \(String(item.tenure ?? 0)) yrs"

        
        cell.lblTitle3.text = description3

        let description4 = "\(item.attributes?.bedrooms ?? 0) Beds  \u{00B7} \(item.attributes?.bathrooms ?? 0) Baths \u{00B7} \(item.attributes?.area_size ?? 0) sqft"
        
        cell.lblTitle4.text = description4
        
        let price =  String(item.attributes?.price ?? 0)

       let cost = price.doubleValue.currency
        
        cell.lblTitle5.text = "\(cost)/mo"
        
        let url = URL(string: item.photo!)
        
        cell.imageView1.kf.setImage(with: url)
        
        return cell
    }
    
   
    
    
    
}

