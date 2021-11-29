import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segument: UISegmentedControl!
    @IBOutlet weak var addButton: UIButton!
    
    var arrayOfArticle : [Article] = [Article]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        reloadData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setUpUIDesigns()
        
    }
    
    
    @IBAction func addArticleViewClick(_ sender: Any) {
        
        
        let addArticleVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddArticleViewController") as! AddArticleViewController
        
        addArticleVC.myViewControllerRefrence = self
        
        
        self.present(addArticleVC, animated: true, completion: nil)
        
        
    }
    
    func reloadData() {
        
        let request : NSFetchRequest<Article> = Article.fetchRequest()
        
        do {
            try arrayOfArticle = context.fetch(request)
            //            self.tableView.reloadData()
            
        } catch  {
            print(error)
            print("there is error with reload data ")
        }
    }
    
    func saveData() {
        
        do {
            try context.save()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func filterSegmentAction(_ sender: Any) {
        
        reloadData()
        
        switch segument.selectedSegmentIndex {
            
        case 0 :
            print("All")
            reloadData()
            
        case 1 :
            print("Nature")
            self.arrayOfArticle =  arrayOfArticle.filter( { $0.category?.range(of: "Nature", options: .caseInsensitive) != nil})
            
        case 2 :
            print("Fitness")
            self.arrayOfArticle =  arrayOfArticle.filter( { $0.category?.range(of: "Fitness", options: .caseInsensitive) != nil})
            
        default:
            print("iOS")
            self.arrayOfArticle =  arrayOfArticle.filter( { $0.category?.range(of: "iOS", options: .caseInsensitive) != nil})
            
        }
        
        tableView.reloadData()
        
    }
    
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfArticle.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellTableView = tableView.dequeueReusableCell(withIdentifier: "TableViewCellid" ) as! TableViewCell
        
        cellTableView.text1TableView.text = arrayOfArticle[indexPath.row].articlename
        cellTableView.text2TableView.text = arrayOfArticle[indexPath.row].category
        
        return cellTableView
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticleViewController") as! ArticleViewController
        
        
        vc.articleNameString = arrayOfArticle[indexPath.row].articlename!
        
        vc.categoryLabelString = arrayOfArticle[indexPath.row].category!
        
        vc.contentString = arrayOfArticle[indexPath.row].content!
        
        
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let alert = UIAlertController(title: "Alert", message: "Do you want delete this item?", preferredStyle: .alert )
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: {_ in
                
                self.context.delete(self.arrayOfArticle[indexPath.row])
                self.arrayOfArticle.remove(at: indexPath.row)
                
                self.tableView.reloadData()
                self.saveData()
            }))
            
            self.present(alert, animated: true, completion: nil)
            self.tableView.reloadData()
            saveData()
        }
    }
}



extension ViewController {
    
    
    func setUpUIDesigns()  {
        
        segument.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        
        segument.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .normal)
        
        addButton.layer.cornerRadius = 15
        
    }
    
}
