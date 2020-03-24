import UIKit

class DetailViewController: UIViewController {

    //from prev controller
    var dataModel:Model!
    
    //IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var byLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageNameLabel.text = dataModel.imageTitle
        yearLabel.text = dataModel.imageYear
        byLabel.text = dataModel.imageAuthor
    
        imageView.image = UIImage(named: dataModel.imageTitle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
