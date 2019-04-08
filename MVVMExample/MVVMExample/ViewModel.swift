//
//  ViewModel.swift
//  MVVMExample
//
//  Created by Veena on 04/04/19.
//  Copyright © 2019 Veena. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import UIKit

class ViewModel: NSObject {
    
    var apiManager = APIManager()
    var disposeBag = DisposeBag()
    public let searchResults : PublishSubject<[Results]> = PublishSubject()
    
    func fetchAllDatas(){//(completion: @escaping () -> ()){
        apiManager.fetchSearchResults() { (model) in
            DispatchQueue.main.async {
                self.searchResults.onNext(model)
            }
        }
    }
    
    func setBinding(table : UITableView){
        self.searchResults
            .observeOn(MainScheduler.instance)
            .bind(to: table.rx.items(cellIdentifier: "ListTableCell", cellType: ListTableCell.self)) {  (row,track,cell) in
                //let tracks = track
                cell.currentResult = track
                cell.selectionStyle = .none
            }
            .disposed(by: disposeBag)
        
        table.rx.itemSelected.subscribe(onNext: {indexPath in
            
            let _ = table.cellForRow(at: indexPath) as? ListTableCell

            print("cell index Path :- ",indexPath.row)
            
        }).disposed(by: disposeBag)
    }
    
    
}
