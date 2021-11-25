import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var text1TableView: UILabel!
    
    @IBOutlet weak var text2TableView: UILabel!
    
    @IBOutlet weak var text3TableView: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
