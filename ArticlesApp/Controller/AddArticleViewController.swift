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
    @IBOutlet weak var createOutlet: UIButton!
    @IBOutlet var segment: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Applying specific UI design on segment controller
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .normal)
           
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
         
            self.dismiss(animated: true, completion: nil)

         
        } catch {
            
            let alert = UIAlertController(title: "Something went wrong", message: "sorry, We couldn't add the article", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            
        
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    
    
    
    @IBAction func createButton(_ sender: Any) {
        
        if let name = titleField.text {
            
            if let content = aritcleDetails.text {
                
                
                let segmentVluewString : String =
                convertSegmentValueToString(selectedSegementIndex: segment.selectedSegmentIndex)
                
                addData(articleName: name, aritcleDetails: content, category: Category(rawValue: segmentVluewString)!.rawValue)
                
                
                
            }
            
            
        }
    }
    
    
    func convertSegmentValueToString(selectedSegementIndex : Int) -> String {
        
        switch segment.selectedSegmentIndex {
                
        case 0 :
            return "Nature"
            
        case 1 :
            return "Fitness"
            
        default:
            return "ios"
            
            
        }
        
    }
    
    
}







