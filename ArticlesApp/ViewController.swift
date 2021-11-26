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
        
        addButton.layer.cornerRadius = 10
    }
    
    func reloadData() {
        
        let request : NSFetchRequest<Article> = Article.fetchRequest()
        
        do {
            try arrayOfArticle = context.fetch(request)
            tableView.reloadData()
        } catch  {
            print(error)
            print("there is error with reload data ")
        }
    }
    
    @IBAction func segAction(_ sender: Any) {
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticleViewController") as! ArticleViewController
        
        
        vc.articleNameString = arrayOfArticle[indexPath.row].articlename!
        
        vc.categoryLabelString = arrayOfArticle[indexPath.row].category!
        
        vc.contentString = arrayOfArticle[indexPath.row].content!

                self.present(vc, animated: true, completion: nil)
        
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
    
}
