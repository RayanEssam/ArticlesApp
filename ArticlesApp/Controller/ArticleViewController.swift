//
//  ArticleViewController.swift
//  ArticlesApp
//
//  Created by Rayan Taj on 25/11/2021.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var articleName: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var articleContentTextView: UITextView!
    
    
    var articleNameString : String = ""
    var categoryLabelString : String = ""
    var contentString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.layer.cornerRadius = 15
        articleName.text = articleNameString
        categoryLabel.text = "#\(categoryLabelString)"
        articleContentTextView.text = contentString
    }
    


}
