//
//  ShowDetailVC.swift
//  Symphonic
//
//  Created by Evan Rosenfeld on 7/9/15.
//  Copyright (c) 2015 Avocado Hills. All rights reserved.
//

import UIKit

class ShowDetailVC: UIViewController {
    
    @IBOutlet weak var showImageView: ShowImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let scrollView = UIScrollView(frame: self.view.bounds)
//        self.view = scrollView
//        showImageView.removeFromSuperview()
//        showImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)
//        scrollView.addSubview(showImageView)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
