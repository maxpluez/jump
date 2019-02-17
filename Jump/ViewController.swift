
import UIKit

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var blockImage : UIImageView = UIImageView();
        blockImage.backgroundColor=UIColor.brown;
        blockImage.frame = CGRect(x:50, y:10, width:200, height:100);
        self.view.addSubview(blockImage);
        
    }


}

