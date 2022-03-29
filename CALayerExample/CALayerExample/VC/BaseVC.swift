import UIKit

class BaseVC: UIViewController {
    
    // MARK: Views properties

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.width / 2
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 3
            imageView.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    @IBOutlet weak var openButton: UIButton! {
        didSet {
            openButton.layer.shadowOffset = CGSize(width: 0, height: 5)
            openButton.layer.shadowRadius = 5
            openButton.layer.shadowOpacity = 0.8
        }
    }
    
    // MARK: VC lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

