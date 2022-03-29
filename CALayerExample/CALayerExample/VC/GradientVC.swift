import UIKit

class GradientVC: UIViewController {
    
    // MARK: Views properties
    
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        layer.colors = [UIColor.blue.cgColor, UIColor.yellow.cgColor]
        return layer
    }()
    
    // MARK: VC lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = view.frame
    }
    
}
