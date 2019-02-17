
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
        let playerIcon : UIImageView = self.view.viewWithTag(200) as! UIImageView;
        playerIcon.image = UIImage(named: "girl1.png");
        let exitIcon : UIImageView = self.view.viewWithTag(300) as! UIImageView;
        exitIcon.image = UIImage(named: "exit.png");
        
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
    @IBAction func moveLeft(_ sender: Any) {
        let playerIcon : UIImageView = self.view.viewWithTag(200) as! UIImageView;
        UIView.animate(withDuration: 0.1, delay: 0.025, options: [],
                       animations: {
                        playerIcon.center.x -= playerIcon.bounds.width * 1
        },
                       completion: nil
        )
    }
    @IBAction func moveRight(_ sender: Any) {
        let playerIcon : UIImageView = self.view.viewWithTag(200) as! UIImageView;
        UIView.animate(withDuration: 0.1, delay: 0.025, options: [],
                       animations: {
                        playerIcon.center.x += playerIcon.bounds.width * 1
        },
                       completion: nil
        )
    }
    @IBAction func jumpUp(_ sender: Any) {
        let playerIcon : UIImageView = self.view.viewWithTag(200) as! UIImageView;
        UIView.animate(withDuration: 0.2, delay: 0.025, options: [],
                       animations: {
                        playerIcon.center.y -= playerIcon.bounds.width * 2
        },
                       completion: nil
        )
    }
}

