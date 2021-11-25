import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var collictionView: UICollectionView!
    
    
    
    
    var arrayTest : [String] = ["1","2","3","4","5","6","7","8","9","10"]
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

extension ViewController : UITableViewDelegate , UITableViewDataSource ,  UICollectionViewDataSource , UICollectionViewDelegate {

    // Table View *****
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTest.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
       let cellTableView = tableView.dequeueReusableCell(withIdentifier: "TableViewCellid" ) as! TableViewCell
        
        return cellTableView
    }
    
    
    // Colliction View *****



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayTest.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collictionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellid", for: indexPath) as! CollectionViewCell
        
        return cell
        
    }

}
