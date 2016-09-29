//
//  JMprogressView.swift
//  GongblerIOS
//
//  Created by 에버스터디 on 2016. 1. 8..
//  Copyright © 2016년 eric. All rights reserved.
//

import UIKit


class JMprogressView: UIView {
    
    var bgcolor : UIColor?
    static let sharedInstance = JMprogressView()
    var v_inline : lineview!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        self.frame = frame
        
        self.v_inline = lineview()
        self.v_inline.frame = CGRect(x: self.center.x-10, y: self.center.y-10, width: 30, height: 30)
        self.v_inline.backgroundColor = UIColor.clear
        self.v_inline.alpha = 1.0
        self.v_inline.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        self.v_inline.b_appear = true
        
        if  self.v_inline.alpha == 0.0 {
            
            self.v_inline.alpha = 1.0
        }
        
        if self.bgcolor != nil {
            
            self.v_inline!.bgcolor = self.bgcolor
            
        }
        
        self.addSubview(self.v_inline)
        self.bringSubview(toFront: self.v_inline)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func show(){
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 3, options: UIViewAnimationOptions() , animations: { [weak self] in
            
             self!.v_inline.transform = CGAffineTransform.identity
            let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotation.toValue = NSNumber(value: M_PI * 2 as Double)
            rotation.duration = 1
            rotation.isCumulative = true
            rotation.repeatCount = FLT_MAX
             self!.v_inline.layer.add(rotation, forKey: "rotationAnimation")
            
            
            }, completion: nil)

        
    }
    
    func hide(){
        
        if self.v_inline!.b_appear != nil && self.v_inline!.b_appear == true {
            
            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: { [weak self] in
                
                self!.v_inline.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                self!.v_inline.alpha = 0.0
                
                }, completion:{(finish : Bool) in
                    
                    self.v_inline.b_appear = false
                    self.v_inline.transform = CGAffineTransform.identity
                    self.v_inline.removeFromSuperview()
                    self.v_inline.layer.removeAllAnimations()
                    self.removeFromSuperview()
                    
                    self.v_inline = nil
                
                }
            )
            
        }

    }
    
    
    
    func showLoadingbar(_ pview : UIView!){
 
        let jmpro = JMprogressView(frame: pview.frame)
        
        pview.addSubview(jmpro)
        
        jmpro.show()

    }
    
    
    func stopanimationjm(_ pview : UIView!) -> JMprogressView? {
        let subviewEnum = pview.subviews
        
        for view in subviewEnum {
            
            if view.isKind(of: JMprogressView.self){
                return view as? JMprogressView
            }
        }
        return nil
    }
    
    
    func stopanimation(_ pview : UIView!){

        let jmview = self.stopanimationjm(pview)
        
        if jmview != nil {
            
            jmview?.removeFromSuperview()
            jmview?.hide()
            
            
        }

        
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}



