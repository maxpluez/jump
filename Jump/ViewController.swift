
import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var viewDrag: UIView!
    var arrayOfBlocks : Array<UIImageView>;
    var numOfBlocks : Int;
    var panGesture       = UIPanGestureRecognizer()
    
    required init?(coder aDecoder: NSCoder){
        arrayOfBlocks = []
        numOfBlocks = 0
        super.init(coder: aDecoder);
    }
    
    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        self.view.bringSubviewToFront(viewDrag)
        let translation = sender.translation(in: self.view)
        viewDrag.center = CGPoint(x: viewDrag.center.x + translation.x, y: viewDrag.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let block1 : UIButton = self.view.viewWithTag(100) as! UIButton;
        block1.backgroundColor=UIColor.brown;
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.draggedView(_:)))
        viewDrag.isUserInteractionEnabled = true
        viewDrag.addGestureRecognizer(panGesture)
        block1.addGestureRecognizer(panGesture)
    }
    
    @IBAction func createBlock(){
        var blockImage = UIImageView();
        blockImage.backgroundColor = UIColor.brown;
        blockImage.frame = CGRect(x:25, y:25, width:100, height:30)
        blockImage.tag = 1000+numOfBlocks
        blockImage.isUserInteractionEnabled = true;
        //blockImage.addGestureRecognizer(panGesture)
        
        numOfBlocks = numOfBlocks+1
        //arrayOfBlocks.append(blockImage)
        self.view.addSubview(blockImage)
    }
    
    


}

