
import UIKit


class ViewController: UIViewController {
    
    var arrayOfBlocks : Array<UIImageView>;
    var numOfBlocks : Int;
    
    required init?(coder aDecoder: NSCoder){
        arrayOfBlocks = []
        numOfBlocks = 0
        super.init(coder: aDecoder);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let block1 : UIButton = self.view.viewWithTag(100) as! UIButton;
        block1.backgroundColor=UIColor.brown;
    }
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @IBAction func createBlock(){
        var blockImage = UIImageView();
        blockImage.backgroundColor = UIColor.brown;
        blockImage.frame = CGRect(x:25, y:25, width:100, height:30)
        blockImage.tag = 1000+numOfBlocks
        blockImage.isUserInteractionEnabled = true;
        blockImage.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:))))
        blockImage.isUserInteractionEnabled = true;
        numOfBlocks += 1
        arrayOfBlocks.append(blockImage)
        self.view.addSubview(blockImage)
    }
}

