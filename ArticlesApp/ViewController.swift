import UIKit
import CoreData

class ViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var arrayOFF : [String] = ["1","2","3","4","5"]

    
    
    var arrayOfArticle : [Article] = [Article]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        
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
    
    
    
    
    
    


}

extension ViewController : UITableViewDelegate , UITableViewDataSource {

    // Table View *****
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfArticle.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
       let cellTableView = tableView.dequeueReusableCell(withIdentifier: "TableViewCellid" ) as! TableViewCell
        
        cellTableView.text1TableView.text = arrayOfArticle[indexPath.row].articlename
        cellTableView.text2TableView.text = arrayOfArticle[indexPath.row].category
//        cellTableView.text3TableView.text = arrayOfArticle[indexPath.row]./

        
        
        
        return cellTableView
    }

}
