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
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var articleContentTextView: UITextView!
    
    
    var articleNameString : String = ""
    var categoryLabelString : String = ""
    var contentString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()


        articleName.text = articleNameString
        categoryLabel.text = categoryLabelString
        articleContentTextView.text = contentString
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
