
import UIKit


class ViewController: UIViewController {
    
    var arrayOfBlocks : Array<UIImageView>;
    var numOfBlocks : Int;
    
    var playerIcon : UIImageView!;
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    var started : Bool
    
    required init?(coder aDecoder: NSCoder){
        arrayOfBlocks = []
        numOfBlocks = 0
        started = false;
        super.init(coder: aDecoder);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        // Do any additional setup after loading the view, typically from a nib.
        let block1 : UIButton = self.view.viewWithTag(100) as! UIButton;
        block1.backgroundColor=UIColor.brown;
        playerIcon = self.view.viewWithTag(200) as! UIImageView;
        playerIcon.image = UIImage(named: "girl1.png");
        let exitIcon : UIImageView = self.view.viewWithTag(300) as! UIImageView;
        exitIcon.image = UIImage(named: "exit.png");
    }
    
    func assignbackground(){
        let background = UIImage(named: "background.jpg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
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
        //blockImage.restorationIdentifier = "block"+String(numOfBlocks)
        numOfBlocks += 1
        arrayOfBlocks.append(blockImage)
        self.view.addSubview(blockImage)
    }
    @IBAction func moveLeft(_ sender: Any) {
        if(!started){return;}
        let playerIcon : UIImageView = self.view.viewWithTag(200) as! UIImageView;
        UIView.animate(withDuration: 0.1, delay: 0.025, options: [],
                       animations: {
                        playerIcon.center.x -= playerIcon.bounds.width * 1
        },
                       completion: nil
        )
        /*
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [playerIcon])
        animator.addBehavior(gravity)
        var arrayOfCol : Array<UIImageView> = [playerIcon]
        for e in arrayOfBlocks{
            arrayOfCol.append(e)
        }
        collision = UICollisionBehavior(items: arrayOfCol)
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
 */
    }
    @IBAction func moveRight(_ sender: Any) {
        if(!started){return;}
        let playerIcon : UIImageView = self.view.viewWithTag(200) as! UIImageView;
        UIView.animate(withDuration: 0.1, delay: 0.025, options: [],
                       animations: {
                        playerIcon.center.x += playerIcon.bounds.width * 1
        },
                       completion: nil
        )
        /*
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [playerIcon])
        animator.addBehavior(gravity)
        var arrayOfCol : Array<UIImageView> = [playerIcon]
        for e in arrayOfBlocks{
            arrayOfCol.append(e)
        }
        collision = UICollisionBehavior(items: arrayOfCol)
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
 */
    }
    @IBAction func jumpUp(_ sender: Any) {
        if(!started){return;}
        let playerIcon : UIImageView = self.view.viewWithTag(200) as! UIImageView;
        UIView.animate(withDuration: 0.2, delay: 0.025, options: [],
                       animations: {
                        playerIcon.center.y -= playerIcon.bounds.width * 3
        },
                       completion: nil
        )
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [playerIcon])
        animator.addBehavior(gravity)
        var arrayOfCol : Array<UIImageView> = [playerIcon]
        for e in arrayOfBlocks{
            arrayOfCol.append(e)
        }
        collision = UICollisionBehavior(items: arrayOfCol)
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
    
    @IBAction func startTrial(){
        if(!started){
            started = true
            animator = UIDynamicAnimator(referenceView: view)
            gravity = UIGravityBehavior(items: [playerIcon])
            animator.addBehavior(gravity)
            var arrayOfCol : Array<UIImageView> = [playerIcon]
            for e in arrayOfBlocks{
                arrayOfCol.append(e)
            }
            collision = UICollisionBehavior(items: arrayOfCol)
            collision.translatesReferenceBoundsIntoBoundary = true
            animator.addBehavior(collision)
        }
    }
}

