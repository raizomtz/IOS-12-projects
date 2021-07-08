//
//  extensions.swift
//  004 - piano
//
//  Created by Alonso Martinez on 03/09/20.
//  Copyright © 2020 Alonso Martinez. All rights reserved.
//

import UIKit


//interface building designable para configurar una extension en el atribute inspector para esas variables y que sea mas facil configurarlas
@IBDesignable extension UIButton {
    
    //un elemento inspector en el interface designable
    @IBInspectable var borderWidth: CGFloat{
        set{
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat{
        set{
            layer.cornerRadius = newValue
            
        }
        get{
            return layer.cornerRadius
        }
        
    }
    
    @IBInspectable var borderColor : UIColor? {
        set{
            guard let uiColor = newValue else {return}
            layer.borderColor = uiColor.cgColor
            
        }
        get{
            
            guard let color = layer.borderColor else {return nil}
            return UIColor(cgColor: color)
        }
    }
}
