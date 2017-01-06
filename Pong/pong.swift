import UIKit

class pong: UIView {
    //alternative method of making pong
    var shapePosX : CGFloat = 0
    var shapePosY : CGFloat = 0
    var xSpeed : CGFloat = 4
    var ySpeed : CGFloat = 4
    var height = UIScreen.mainScreen().bounds.size.height
    var width = UIScreen.mainScreen().bounds.size.width
    var ballSize : CGFloat = 10
    
    var paddleX : CGFloat = 0
    var paddleY : CGFloat = 0
    var paddleWidth : CGFloat = 0
    var paddleHeight : CGFloat = 0
    
    var move = false
    var startX : CGFloat = 0
    
    //to reactive this version of pong uncomment this
    /*override func awakeFromNib() {
        paddleWidth = width / 4
        paddleHeight = 20
        paddleX = width/2 - paddleWidth/2
        paddleY = height - paddleHeight - 10
        NSTimer.scheduledTimerWithTimeInterval(
            0.01,
            target: self,
            selector: #selector(update),
            userInfo: nil,
            repeats: true)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let pos :CGPoint = touch.locationInView(self)
            //if pos is inside paddle set move to true
            startX = pos.x
            if (pos.x > paddleX && pos.x < paddleX + paddleWidth && pos.y > paddleY && pos.y < paddleY + paddleHeight) {
                move = true
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //if touchesBegan was inside paddle
        if (move) {
            for touch in touches {
                paddleX  = paddleX + (touch.locationInView(self).x - startX)
                startX = touch.locationInView(self).x
            }
        }
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        move = false
    }*/
    
    func update() {

        wallBounce()
        
        paddleBounce()
        
        //check for paddle collisions
        
        shapePosX = shapePosX + xSpeed
        shapePosY = shapePosY + ySpeed
        self.setNeedsDisplay()
    }
    
    func wallBounce() {
        if (shapePosX + ballSize > width) {
            shapePosX = width - ballSize
            xSpeed = -xSpeed
        }
        if (shapePosY + ballSize > height) {
            shapePosY = height - ballSize
            ySpeed = -ySpeed
        }
        if (shapePosX < 0) {
            shapePosX = 0
            xSpeed = -xSpeed
        }
        if (shapePosY < 0) {
            shapePosY = 0
            ySpeed = -ySpeed
        }
    }
    
    func paddleBounce() {
        if (shapePosY + ballSize > paddleY && shapePosY < paddleY + paddleHeight && shapePosX + ballSize > paddleX && shapePosX < paddleX + paddleWidth) {
            ySpeed = -ySpeed
        }
    }
    
    //and uncomment this, also delete the images in Main.storyboard and comment out the code in there
    /*override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 3.0)
        CGContextSetStrokeColorWithColor(context, UIColor.purpleColor().CGColor)
        
        //ball
        CGContextMoveToPoint(context, shapePosX, shapePosY)
        CGContextAddLineToPoint(context, shapePosX, shapePosY + ballSize)
        CGContextAddLineToPoint(context, shapePosX + ballSize, shapePosY + ballSize)
        CGContextAddLineToPoint(context, shapePosX + ballSize, shapePosY)
        CGContextSetFillColorWithColor(context,UIColor.purpleColor().CGColor)
        CGContextFillPath(context)
        
        //paddle
        CGContextMoveToPoint(context, paddleX, paddleY)
        CGContextAddLineToPoint(context, paddleX, paddleY + paddleHeight)
        CGContextAddLineToPoint(context, paddleX + paddleWidth, paddleY + paddleHeight)
        CGContextAddLineToPoint(context, paddleX + paddleWidth, paddleY)
        CGContextSetFillColorWithColor(context,UIColor.blueColor().CGColor)
        CGContextFillPath(context)
        
    }*/
}
