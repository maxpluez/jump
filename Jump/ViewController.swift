
import UIKit

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

class ViewController: UIViewController {
    
    var arrayOfBlocks : Array<UIImageView>;
    
    required init?(coder aDecoder: NSCoder){
        arrayOfBlocks = []
        super.init(coder: aDecoder);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var blockImage : UIImageView = UIImageView();
        blockImage.backgroundColor=UIColor.brown;
        blockImage.frame = CGRect(x:300, y:350, width:104, height:30);
        blockImage.tag = 1000;
        self.view.addSubview(blockImage);
    }


}

