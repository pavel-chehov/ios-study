//
//  ViewController.swift
//  DialogViewer
//
//  Created by Pavel Chehov on 4/22/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private let header = "header"
    private let content = "content"
    
    private var sections: Array<Dictionary<String, String>>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sections = [
            [header:"First Witch",
             content: "Неу, when will the three of us meet up later?"],
            [header:"Second Witch",
             content: "When everything's straightened out."],
            [header: "Third Witch",
             content:"That'll Ье just before sunset."],
            [header: "First Witch",
             content: "Where?"],
            [header: "Second Witch",
             content:"The dirt patch."],
            [header:"Third Witch",
             content:"I guess we'll see Маc there ."]
        ]
        
        self.collectionView?.register(ContentCell.self, forCellWithReuseIdentifier: "CONTENT")
        self.collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HEADER")
        self.collectionView?.contentInset.top = 20
        let layout = self.collectionView!.collectionViewLayout
        let flow = layout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsetsMake(10, 20, 30, 20)
        
        //flowlayout class doesn't allocate screen space for the headers
        //if we don't require size explicitly
        flow.headerReferenceSize = CGSize(width: 100, height: 42)
    }
    
    func wordsInSection(section: Int) -> [String] {
        let content = sections[section][self.content]
        let words = content?.components(separatedBy: NSCharacterSet.whitespaces)
        return words!
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let words = wordsInSection(section: section)
        return words.count
    }
    
    //get cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let words = wordsInSection(section: indexPath.section)
        let cell  = self.collectionView?.dequeueReusableCell(withReuseIdentifier: "CONTENT", for: indexPath) as! ContentCell
        cell.maxWidth = collectionView.bounds.size.width
        cell.text = words[indexPath.row]
        return cell
    }
    
    //get header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HEADER", for: indexPath) as! HeaderCell
            cell.maxWidth = collectionView.bounds.size.width
            cell.text = sections[indexPath.section][self.header]
            return cell
        } else {
            fatalError("no header!")
        }
    }
    
    //flow layout delegate methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let words = wordsInSection(section: indexPath.section)
        let size = ContentCell.sizeForContentString(str: words[indexPath.row], maxWidth: (self.collectionView?.bounds.size.width)!)
        return size
    }
}

