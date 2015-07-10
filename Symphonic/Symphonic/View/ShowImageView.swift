//
//  ShowImageView.swift
//  Symphonic
//
//  Created by Evan Rosenfeld on 7/9/15.
//  Copyright (c) 2015 Avocado Hills. All rights reserved.
//

import UIKit

class ShowImageView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let view = NSBundle.mainBundle().loadNibNamed("ShowImageView", owner: self, options: nil).first as! UIView
        view.frame = self.frame
        self.addSubview(view)
        
    }
    
//    
//    - (instancetype)initWithCoder:(NSCoder *)aDecoder
//    {
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//    NSString *className = NSStringFromClass([self class]);
//    self.view = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
//    [self addSubview:self.view];
//    return self;
//    }
//    return nil;
//    }
    /*
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
