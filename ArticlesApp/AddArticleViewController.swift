//
//  AddArticleViewController.swift
//  ArticlesApp
//
//  Created by Rayan Taj on 25/11/2021.
//

import UIKit

class AddArticleViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var aritcleDetails: UITextField!
    @IBOutlet weak var natureOutlet: UIButton!
    @IBOutlet weak var fitnessOutlet: UIButton!
    @IBOutlet weak var iosOutlet: UIButton!
    @IBOutlet weak var createOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        natureOutlet.layer.cornerRadius = 20
        natureOutlet.layer.borderWidth = 1
//        natureOutlet.layer.borderColor = UIColor.black
       
    }
    
    //IBActions
    @IBAction func natureButton(_ sender: Any) {
    }
    @IBAction func fitnessButton(_ sender: Any) {
    }
    @IBAction func iosButton(_ sender: Any) {
    }
    @IBAction func createButton(_ sender: Any) {
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


