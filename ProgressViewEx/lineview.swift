//
//  lineview.swift
//  GongblerIOS
//
//  Created by 에버스터디 on 2016. 1. 11..
//  Copyright © 2016년 eric. All rights reserved.
//

import UIKit
import SpriteKit


class lineview: UIView {
    var bgcolor : UIColor?
    var b_appear : Bool?
    

    
    deinit{  }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

     
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
     
        autoreleasepool(invoking: {
           
            let outcenter = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
            let outradius : CGFloat = 30
            let outarcwidth: CGFloat = 3
            
            let outpi  = CGFloat(M_PI)
            
            let outstartAngle: CGFloat = 0.0
            let outendAngle: CGFloat = outpi * 2
            
            
            let path1 = UIBezierPath(arcCenter: outcenter, radius: outradius/2 - outarcwidth/2, startAngle: outstartAngle, endAngle: outendAngle, clockwise: true)
            
            path1.flatness = 0.6
            
            
            if  bgcolor != nil {
                
                
                bgcolor?.setFill()
                
                
            }else{
                
                bgcolor =  UIColor.purple
                
                bgcolor?.setFill()
            }
            
            
            path1.fill()
            
            
            // 안에 라인
            
            let center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
            let radius : CGFloat = 20
            let arcwidth: CGFloat = 3
            
            let pi  = CGFloat(M_PI)
            
            let startAngle: CGFloat = 11 * pi / 6
            let endAngle: CGFloat = 5 * pi / 3
            
            
            let path = UIBezierPath(arcCenter: center, radius: radius/2 - arcwidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            path.lineWidth = arcwidth
            path.flatness = 0.6
            UIColor.white.setStroke()
            path.stroke()
            
        })
        
       
    }


}
