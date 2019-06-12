//
//  button.swift
//  EnhanceQuizStarter
//
//  Created by Kris Rajendren on Jun/10/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import UIKit


@IBDesignable class button: UIButton
{
    var cornerRadius: CGFloat = 10
    {
        didSet
        {
            refreshCorners(value: cornerRadius)
        }
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    func refreshCorners(value: CGFloat)
    {
        layer.cornerRadius = value
    }

    func sharedInit()
    {
        refreshCorners(value: cornerRadius)
    }
}


