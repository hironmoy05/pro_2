//
//  Extensions.swift
//  pro_2
//
//  Created by Gaurav Sara on 14/08/23.
//

import UIKit

// TableView Data Source and Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        playListTitle.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return TableViewCell() }
        
        tableCell.title = playListTitle[indexPath.row]
        tableCell.subTitle = playListSubTitle[indexPath.row]
        tableCell.delegate = self
        
        return tableCell
    }
}


// CollectionView Data Source and Delegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        playListTitle.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return CollectionViewCell() }
        
        cell.title = playListTitle[indexPath.row]
        cell.subTitle = playListSubTitle[indexPath.row]
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        
        return CGSize(width: collectionWidth / 2.2, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        -8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 12, bottom: 0, right: 12)
    }
}


extension ViewController: TableViewCellDelegate {
    func didTapTableCell(title: String) {
        let fileCollectionViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FileViewController") as! FileViewController
        
        navigationController?.pushViewController(fileCollectionViewController, animated: true)
    }
}


// Delegate created for TableViewCell and CollectionViewCell
extension ViewController: CollectionViewCellDelegate {
    func didTapCollectionViewCell(title: String) {
        let fileCollectionViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FileViewController") as! FileViewController
        
        navigationController?.pushViewController(fileCollectionViewController, animated: true)
    }
}
