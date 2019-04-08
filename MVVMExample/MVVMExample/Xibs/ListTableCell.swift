//
//  ListTableCell.swift
//  MVVMExample
//
//  Created by Veena on 05/04/19.
//  Copyright © 2019 Veena. All rights reserved.
//

import UIKit

class ListTableCell: UITableViewCell {

    @IBOutlet weak var circleImageView: CircularImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainNameLabel: UILabel!
    @IBOutlet weak var subNameLabel: UILabel!
    @IBOutlet weak var rightArrowImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateIconImage: UIImageView!
    
    
    public var currentResult : Results! {
        didSet {
            setTextToLabel(labelName: titleLabel, labelValue: currentResult.title ?? "")
            setTextToLabel(labelName: mainNameLabel, labelValue: currentResult.source ?? "")
            setTextToLabel(labelName: subNameLabel, labelValue: currentResult.byline ?? "")
            setTextToLabel(labelName: dateLabel, labelValue: currentResult.published_date ?? "")
        }
    }
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setViewProperties()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setViewProperties(){
       circleImageView.backgroundColor = UIColor.darkGray
       mainNameLabel.textColor = UIColor.lightGray
       subNameLabel.textColor = UIColor.lightGray
       dateLabel.textColor = UIColor.lightGray
    }
    
    func setTextToLabel(labelName : UILabel, labelValue : String){
        labelName.text = labelValue
    }
}
