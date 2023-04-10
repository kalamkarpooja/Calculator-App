//
//  RoundBtn.swift
//  Calculator
//
//  Created by Mac on 16/04/23.
//

import UIKit

    @IBDesignable
    class RoundBtn:UIButton{
        
        @IBInspectable var roundButton : Bool = false{
            didSet{
                if roundButton{
                    layer.cornerRadius = frame.height / 2
                }
            }
        }
        override func prepareForInterfaceBuilder() {
            if roundButton{
                layer.cornerRadius = frame.height / 2
            }
        }
}
