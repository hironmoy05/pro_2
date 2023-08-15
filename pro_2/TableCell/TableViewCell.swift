//
//  TableViewCell.swift
//  pro_2
//
//  Created by Gaurav Sara on 12/08/23.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func didTapTableCell(title: String)
}

class TableViewCell: UITableViewCell {
    @IBOutlet weak var tableViewBackground: UIView!
    @IBOutlet weak var playlistTitle: UILabel!
    @IBOutlet weak var playlistSubTitle: UILabel!
    
    var delegate: TableViewCellDelegate?
    
    var title: String? {
        didSet {
            configuration()
        }
    }
    
    var subTitle: String?
    
    var carsTitle = Array(repeating: "Video name here if the title is long", count: 30)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableViewBackground.clipsToBounds = false
        tableViewBackground.layer.borderWidth = 1
        tableViewBackground.layer.borderColor = UIColor.systemGray5.cgColor
        tableViewBackground.layer.cornerRadius = 10
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewCellTapped))
        tableViewBackground.addGestureRecognizer(tapGesture)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        let desiredContentWidth: CGFloat = contentView.frame.width * 0.94
        let newXPosition: CGFloat = (contentView.frame.width - desiredContentWidth) / 2
        
        contentView.frame = CGRect(x: newXPosition, y: contentView.frame.origin.y, width: desiredContentWidth, height: contentView.frame.height)
    }
    
    @objc func tableViewCellTapped() {
        if let title = title {
            delegate?.didTapTableCell(title: title)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configuration() {
        guard let title = title else { return }
        guard let subTitle = subTitle else { return }

        playlistTitle.text = title
        playlistSubTitle.text = subTitle
    }
}
