import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var paddle: UIImageView!
    @IBOutlet weak var ball: UIImageView!
    
    var xSpeed : CGFloat = 2
    var ySpeed : CGFloat = 2
    
    var height = UIScreen.mainScreen().bounds.size.height
    var width = UIScreen.mainScreen().bounds.size.width
    
    var startX : CGFloat = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func awakeFromNib() {
        NSTimer.scheduledTimerWithTimeInterval(
            0.01,
            target: self,
            selector: #selector(update),
            userInfo: nil,
            repeats: true)
    }
    
    func update() {
        
        bounce()
        ball.center = CGPointMake(ball.center.x + xSpeed, ball.center.y + ySpeed)
    }
    
    func bounce() {
        if (ball.center.x > width - 12.5) {
            xSpeed = -abs(xSpeed)
        }
        if (ball.center.y > height - 12.5) {
            ySpeed = -abs(ySpeed)
        }
        if (ball.center.x < 12.5) {
            xSpeed = abs(xSpeed)
        }
        if (ball.center.y < 12.5) {
            ySpeed = abs(ySpeed)
        }
        
        if (CGRectIntersectsRect(ball.frame, paddle.frame)) {
            ySpeed = -abs(ySpeed)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let pos :CGPoint = touch.locationInView(self.view)
            paddle.center = CGPointMake(pos.x, paddle.center.y)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let pos :CGPoint = touch.locationInView(self.view)
            paddle.center = CGPointMake(pos.x, paddle.center.y)
            print(pos)
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
