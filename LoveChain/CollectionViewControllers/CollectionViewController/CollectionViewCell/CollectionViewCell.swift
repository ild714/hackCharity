//
//  CollectionViewCell.swift
//  LoveChain
//
//  Created by Ildar on 2/7/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var status: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        // Initialization code
    }
    
    func configure(model: ModelTask) {
        if model.type == .process {
            status.textColor = UIColor(redS: 220, greenS: 128, blueS: 76)
            status.text  = "Ожидает верификации"
        } else if model.type == .done {
            status.textColor = UIColor(redS: 97, greenS: 200, blueS: 95)
            status.text  = "Выполнено"
        } else {
            status.textColor = UIColor(redS: 0, greenS: 128, blueS: 135)
            status.text  = "Ожидает верификации"
        }
        taskLabel.text = model.title
        timeLabel.text = model.time
    }

}
