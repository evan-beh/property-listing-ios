//
//  PropertyDetailsViewController.swift
//  property-listing-ios
//
//  Created by Evan Beh on 06/11/2021.
//

import UIKit
import Combine

class PropertyDetailsViewController: UIViewController,View {
  
    @IBOutlet weak var backClicked: UIButton!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var lastContentOffset: CGFloat = 0
    var statusBarIsWhite = true

    var viewModel: PropertyDetailsViewModel!

    var subscriptions = [AnyCancellable]()

    func bind() {
        
        viewModel.$dataSource
           .receive(on: DispatchQueue.main)
           .sink {[weak self] item in
               
               guard let property:PropertyModel = item else {
                   return
               }
               
               let url = URL(string: property.photo!)
               
               self?.headerImageView.kf.setImage(with: url)

               self?.tableView.reloadData()

           }
           .store(in: &subscriptions)
        
    }
    
    func setupView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: "PropertyDetailsCellType1", bundle: nil), forCellReuseIdentifier: "cell1")
        tableView.register(UINib(nibName: "PropertyDetailsCellType2", bundle: nil), forCellReuseIdentifier: "cell2")
        tableView.register(UINib(nibName: "PropertyDetailsCellType3", bundle: nil), forCellReuseIdentifier: "cell3")

        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
        
        backClicked.addTarget(self, action: #selector(pop), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bind()
        self.viewModel.viewDidLoad()

        self.tableView.contentInsetAdjustmentBehavior = .never

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return statusBarIsWhite ? .lightContent : .darkContent
        
    }
}


extension PropertyDetailsViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
     
         if section == 1 || section == 2
        {
           return 50
        }
        else{
            return 0
        }
        

    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view: GenericView = GenericView.fromNib(named: "PropertyDetailsFooterCell")
        return view

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view: GenericView = GenericView.fromNib(named: "PropertyDetailsHeaderCell")
        if section == 0
        {
            return nil
        }
        else if (section == 1)
        {
            view.lblTitle1.text = "Property details"

        }
        else if (section == 2)
        {
            view.lblTitle1.text = "Description"

        }

        
        return  view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0
        {
            return 1

        }
        else if (section == 1)
        {
            return self.viewModel.dataSource?.property_details?.count ?? 0

        }
        else if (section == 2)
        {
            
            return 1
        }
        else {return 0}



    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        
        if indexPath.section == 0
        {
            return constructSection1(indexPath: indexPath)
        }
        else if (indexPath.section == 1)
        {
            return constructSection2(indexPath: indexPath)

        }
        else if (indexPath.section == 2)
        {
            return constructSection3(indexPath: indexPath)

        }
        
        return UITableViewCell()
    }
    
    func constructSection1(indexPath:IndexPath) -> GenericTableViewCell//basic details
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! GenericTableViewCell
        
        guard let property = self.viewModel.dataSource else {return cell}
        
        cell.lblTitle1.text = property.attributes?.price.description.doubleValue.currency

        cell.lblTitle2.text = property.project_name
        
        cell.lblTitle3.text = property.address?.title
        
        cell.lblTitle4.text = property.address?.subtitle

        cell.lblTitle5.text = "\(property.attributes?.bedrooms ?? 0) Beds"
        cell.lblTitle6.text = "\(property.attributes?.bathrooms ?? 0) Baths"
        cell.lblTitle7.text = "\(property.attributes?.area_size ?? 0) sqt"



        return cell

    }
    
    func constructSection2(indexPath:IndexPath) -> GenericTableViewCell//property details
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! GenericTableViewCell
        
        guard let item  = self.viewModel.dataSource?.property_details?[indexPath.row] else {return cell}
        
        cell.lblTitle1.text = item.label
        cell.lblTitle2.text = item.text

        return cell
    }
    
    func constructSection3(indexPath:IndexPath) -> GenericTableViewCell//desctiption
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! GenericTableViewCell
        
        guard let property = self.viewModel.dataSource else {return cell}

        cell.lblTitle1.text = property.description
        return cell
    }
}

extension PropertyDetailsViewController: UIScrollViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        if (scrollView.contentOffset.y > 1.3)
        {
            statusBarIsWhite = false
            setNeedsStatusBarAppearanceUpdate()

        }
        else{
            
            statusBarIsWhite = true
            setNeedsStatusBarAppearanceUpdate()


        }
    
    }
    
}
