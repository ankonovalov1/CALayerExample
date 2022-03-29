import UIKit

let topBarHeight = 20.0

class BaseVC: UIViewController {
    
    // MARK: Views properties
    
    lazy var shapeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = 20.0
        layer.lineCap = .round
        layer.fillColor = nil
        layer.strokeEnd = 1
        layer.strokeColor = UIColor.blue.cgColor
        return layer
    }()
    
    lazy var loadingShapeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = 20.0
        layer.lineCap = .round
        layer.fillColor = nil
        layer.strokeEnd = 0
        layer.strokeColor = UIColor.yellow.cgColor
        return layer
    }()
    
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        layer.colors = [UIColor.blue.cgColor, UIColor.yellow.cgColor]
        return layer
    }()
    
    // MARK: @IBOutlet Views properties

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
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: (topBarHeight + 30.0) + (imageView.frame.height / 2.0))
        
        shapeLayerConfigure(shapeLayer)
        shapeLayerConfigure(loadingShapeLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        self.view.layer.addSublayer(shapeLayer)
        self.view.layer.addSublayer(loadingShapeLayer)
    }
    
    // MARK: @IBActions
    
    @IBAction func openTapped(_ sender: Any) {
        loadingShapeLayer.strokeEnd += 0.2
        if loadingShapeLayer.strokeEnd == 1 {
            performSegue(withIdentifier: "showGradientVCSegue", sender: self)
        }
    }
    
    // MARK: Private func
    
    private func shapeLayerConfigure(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = self.view.frame
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 2))
        shapeLayer.path = path.cgPath
    }
    
}

