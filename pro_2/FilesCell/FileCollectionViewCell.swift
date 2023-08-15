//
//  FileCollectionViewCell.swift
//  pro_2
//
//  Created by Gaurav Sara on 13/08/23.
//

import UIKit

class FileCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var fileBackgroundView: UIView!
    @IBOutlet weak var carTitile: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var title: String? {
        didSet {
            configuration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        fileBackgroundView.clipsToBounds = false
        fileBackgroundView.layer.borderWidth = 1
        fileBackgroundView.layer.borderColor = UIColor.systemGray5.cgColor
        fileBackgroundView.layer.cornerRadius = 10
        imageView.layer.cornerRadius = 5
        
    }
    
    func configuration() {
        guard let title = title else { return }
        carTitile.text = title
    }

}
