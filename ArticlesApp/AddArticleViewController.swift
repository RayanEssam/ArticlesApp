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
    
    var categoryType : Category = .nature
    
    override func viewDidLoad() {
        super.viewDidLoad()
        natureOutlet.layer.cornerRadius = 15
        natureOutlet.layer.borderWidth = 1
        natureOutlet.layer.borderColor = UIColor.purple.cgColor
        fitnessOutlet.layer.cornerRadius = 15
        fitnessOutlet.layer.borderWidth = 1
        fitnessOutlet.layer.borderColor = UIColor.purple.cgColor
        iosOutlet.layer.cornerRadius = 15
        iosOutlet.layer.borderWidth = 1
        iosOutlet.layer.borderColor = UIColor.purple.cgColor
        createOutlet.layer.cornerRadius = 15
    }
    //Functions
    func addData(articleName: String, aritcleDetails: String, category: String) {
        let coreData = Article(context: context)
        coreData.content = aritcleDetails
        coreData.articlename = articleName
        coreData.category = category
        saveData()
    }
    
    func saveData() {
        do {
            try context.save()
            print("Done")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //IBActions
    @IBAction func natureButton(_ sender: Any) {
        categoryType = .nature
    }
    @IBAction func fitnessButton(_ sender: Any) {
        categoryType = .fitness
    }
    @IBAction func iosButton(_ sender: Any) {
        categoryType = .ios
    }
    @IBAction func createButton(_ sender: Any) {
        if let name = titleField.text {
            
            if let content = aritcleDetails.text {
                
                
                addData(articleName: name, aritcleDetails: content, category: categoryType.rawValue)
                
                
            }
            
            
        }
    }
    
}

enum Category: String {
    case nature
    case fitness
    case ios
}
