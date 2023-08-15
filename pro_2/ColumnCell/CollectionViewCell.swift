//
//  CollectionViewCell.swift
//  pro_2
//
//  Created by Gaurav Sara on 13/08/23.
//

import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    func didTapCollectionViewCell(title: String)
}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var playlistBackground: UIView!
    @IBOutlet weak var playlistTitle: UILabel!
    @IBOutlet weak var playlistSubTitle: UILabel!
    
    var delegate: CollectionViewCellDelegate?
    
    var title: String? {
        didSet {
            configuration()
        }
    }
    
    var subTitle: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // enable tap gesture for playlistBackgroud UIView
        playlistBackground.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(collectionViewCellTapped))
        playlistBackground.addGestureRecognizer(tapGesture)
        
        playlistBackground.clipsToBounds = false
        playlistBackground.layer.borderWidth = 1
        playlistBackground.layer.borderColor = UIColor.systemGray5.cgColor
        playlistBackground.layer.cornerRadius = 10
        
    }
    
    @objc func collectionViewCellTapped() {
        if let title = title {
            delegate?.didTapCollectionViewCell(title: title)
        }
    }
    
    func configuration() {
        guard let title = title else { return }
        guard let subTitle = subTitle else { return }
        
        playlistTitle.text = title
        playlistSubTitle.text = subTitle
    }

}
