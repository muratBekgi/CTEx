import UIKit

enum selectedScope:Int {
    case title = 0
    case author = 1
    case year = 2
}

class TableViewController: UITableViewController, UISearchBarDelegate {

    let initialDataAry:[Model] = Model.generateModelArray()
    var dataAry:[Model] = Model.generateModelArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBarSetup()
    }

    func searchBarSetup() {
        let searchBar = UISearchBar(frame: CGRect(x:0,y:0,width:(UIScreen.main.bounds.width),height:70))
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Title","Author","Year"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        self.tableView.tableHeaderView = searchBar
    }
    
    // MARK: - search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            dataAry = initialDataAry
            self.tableView.reloadData()
        }else {
            filterTableView(ind: searchBar.selectedScopeButtonIndex, text: searchText)
        }
    }
    
    func filterTableView(ind:Int,text:String) {
        switch ind {
        case selectedScope.title.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.imageTitle.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        case selectedScope.author.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.imageAuthor.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        case selectedScope.year.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.imageYear.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        default:
            print("no type")
        }
    }
    
    
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataAry.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell1
        
        let model = dataAry[indexPath.row]
        
        cell.nameLbl.text = model.imageTitle
        
        cell.imgView.image = UIImage(named: model.imageTitle)
        
        cell.byLbl.text = model.imageAuthor
        cell.yearLbl.text = model.imageYear
        
        
        return cell
    }

    //add delegate method for pushing to new detail controller
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.dataModel = dataAry[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }


}
