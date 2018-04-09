import UIKit

public class Balls: UIView {
    private var colors: [UIColor] = []
    private var balls: [UIView] = []
    private var ballSize: CGSize = CGSize(width: 40, height: 40)
    private var animator: UIDynamicAnimator?
    private var snapBehavoir: UISnapBehavior?
    private var collisionBehavior: UICollisionBehavior?
    
    public init(colors: [UIColor]) {
        self.colors = colors
        self.collisionBehavior = UICollisionBehavior(items: [])
        collisionBehavior?.setTranslatesReferenceBoundsIntoBoundary( with: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
        super.init(frame: CGRect(x:0, y:0, width: 400, height: 400))
        self.animator = UIDynamicAnimator(referenceView: self)
        self.animator?.addBehavior(collisionBehavior!)
        self.backgroundColor = UIColor.gray
        ballsView()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func ballsView() {
        for (index, color) in colors.enumerated() {
            let ball = UIView(frame: CGRect.zero)
            ball.backgroundColor = color
            
            let origin = 40 * index + 100
            ball.frame = CGRect(x: origin, y:origin, width: Int(ballSize.width), height: Int(ballSize.height))
            ball.layer.cornerRadius = ballSize.width / 2
        
            self.addSubview(ball)
            self.balls.append(ball)
            self.collisionBehavior?.addItem(ball)
            
        }
    }
    
    override public func touchesBegan (_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch  = touches.first {
            let location = touch.location(in: self)
            for ball in balls {
                if (ball.frame.contains(location)) {
                    snapBehavoir = UISnapBehavior(item: ball, snapTo: location)
                    snapBehavoir?.damping = 0.5
                    animator?.addBehavior(snapBehavoir!)
                }
            }
        }
    }
    
    override public func touchesMoved (_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            if (snapBehavoir != nil) {
                snapBehavoir?.snapPoint = location
            }
        }
    }
    
    override public func touchesEnded (_ touches: Set<UITouch>, with event: UIEvent?) {
        if(snapBehavoir != nil) {
            animator?.removeBehavior(snapBehavoir!)
            snapBehavoir = nil
        }
    }
}


