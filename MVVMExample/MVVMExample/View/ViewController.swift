//
//  ViewController.swift
//  MVVMExample
//
//  Created by Veena on 04/04/19.
//  Copyright © 2019 Veena. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTB : UITableView!
    @IBOutlet  var viewModel : ViewModel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var menuIcon: UIImageView!
    @IBOutlet weak var dotIcon: UIImageView!
    @IBOutlet weak var searchIcon: UIImageView!
    
    public var searchValues = PublishSubject<[Results]>()
    private let apiManager = APIManager()
    private let disposeBag = DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setHeaderViewProperties()
        configurePropertiesForTableView()
        viewModel.setBinding(table: searchTB)
        setSearchResultsToView()
    }
    
    func setHeaderViewProperties(){
      headerLabel.text = "NY Times Most Popular"
    }
    
    func configurePropertiesForTableView() {
        let nib = UINib(nibName: "ListTableCell", bundle: nil)
        searchTB.register(nib, forCellReuseIdentifier: "ListTableCell")
        searchTB.tableFooterView = UIView()
      //  searchTB.translatesAutoresizingMaskIntoConstraints = false
        searchTB.delegate = nil
        searchTB.dataSource = nil
        searchTB.estimatedRowHeight = 60.0
        searchTB.rowHeight = UITableView.automaticDimension
    }
   
    func setSearchResultsToView(){
        viewModel.fetchAllDatas()
    }
    
 
    
   
}


