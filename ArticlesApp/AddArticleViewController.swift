//
//  AddArticleViewController.swift
//  ArticlesApp
//
//  Created by Rayan Taj on 25/11/2021.
//

import UIKit
import CoreData
class AddArticleViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
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
    //Functions
    func reloadData() {
        let request = Article.fetchRequest()
    }
    func saveData() {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //IBActions
    @IBAction func natureButton(_ sender: Any) {
    }
    @IBAction func fitnessButton(_ sender: Any) {
    }
    @IBAction func iosButton(_ sender: Any) {
    }
    @IBAction func createButton(_ sender: Any) {
        if titleField.text?.isEmpty ==  true {
            
        }
    }
    
}

enum Category {
    case nature
    case fitness
    case ios
}
