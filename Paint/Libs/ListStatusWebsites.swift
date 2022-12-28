//
//  ListStatusWebsites.swift
//  mp4Downloader
//
//  Created by abc on 23/08/2022.
//

import Foundation
import UIKit

class MyCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!

}

class ListStatusWebsites: UIViewController {

 
    var ArrayImage:[String] = ["IconStatusFacebook","IconStatusTwitter","IconStatusInstagram","IconStatusFacebook","IconStatusTwitter","IconStatusInstagram","IconStatusFacebook","IconStatusTwitter","IconStatusInstagram","IconStatusFacebook","IconStatusTwitter","IconStatusInstagram","IconStatusFacebook","IconStatusTwitter","IconStatusInstagram","IconStatusFacebook","IconStatusTwitter","IconStatusInstagram","IconStatusFacebook","IconStatusTwitter","IconStatusInstagram","IconStatusFacebook","IconStatusTwitter","IconStatusInstagram","IconStatusFacebook","IconStatusTwitter","IconStatusInstagram","IconStatusFacebook","IconStatusTwitter","IconStatusInstagram","IconStatusFacebook","IconStatusTwitter","IconStatusInstagram"]
    var ArrayTitles:[String] = ["Facebook","Twitter","Instagram","Facebook","Twitter","Instagram","Facebook","Twitter","Instagram","Facebook","Twitter","Instagram","Facebook","Twitter","Instagram","Facebook","Twitter","Instagram","Facebook","Twitter","Instagram","Facebook","Twitter","Instagram","Facebook","Twitter","Instagram","Facebook","Twitter","Instagram","Facebook","Twitter","Instagram"]

    @IBOutlet weak var topView: UIView!

    @IBOutlet weak var nav1: NavigationBar!

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //IconStatusFacebook
        nav1.title = "LIST & STATUS OF WEBSITE"
        nav1.isLeftButtonHidden = true
        nav1.isRightSecondButtonHidden = true

        
        let cellSize = CGSize(width:92 , height:116)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical//.horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        
        topView.layer.cornerRadius = 35.0
        

        collectionView.reloadData()
//        collectionView.delegate = self
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let flowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: 92, height: 116)
//            flowLayout.itemSize = CGSize(width: 800, height: 800)

//            flowLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 100.f);
  
        
            flowLayout.headerReferenceSize = CGSize(width: collectionView.frame.size.width, height: 60.0)
        }
        
        
    


        
    }
}

extension ListStatusWebsites: UICollectionViewDataSource {

    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArrayImage.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.textLabel.text = ArrayTitles[indexPath.row]
        cell.imgView.image = UIImage.init(named: ArrayImage[indexPath.row])
        //  UIImage.init(named: <#T##String#>)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}

extension ListStatusWebsites: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
             let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! SectionHeader
            if(indexPath.section == 0)
            {
             sectionHeader.label.text = "Supported Social Networking Apps"
        }
            else
            {
                sectionHeader.label.text = "Other Supported Apps"

            }
                return sectionHeader
        } else
        {
            //No footer in this case but can add option for that
             return UICollectionReusableView()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item + 1)
    }
}


class SectionHeader: UICollectionReusableView
{
    @IBOutlet weak var label: UILabel!
}
