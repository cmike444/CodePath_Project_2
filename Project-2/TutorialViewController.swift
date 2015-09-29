//
//  TutorialViewController.swift
//  Project-2
//
//  Created by Chris Mikelson on 9/28/15.
//  Copyright © 2015 Chris Mikelson. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tutorialScrollView: UIScrollView!
    @IBOutlet weak var endTutorialButton: UIButton!
    @IBOutlet weak var endTutorialBackgroundImage: UIImageView!
    @IBOutlet weak var tutorialPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tutorialScrollView.contentSize = CGSize(width: 1280, height: 568);
        tutorialScrollView.pagingEnabled = true;
        tutorialScrollView.delegate = self;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        tutorialPageControl.currentPage = page;
        
        if (page == 3) {
            UIView.animateWithDuration(0.7, animations: {
                self.tutorialPageControl.alpha = 0;
                self.endTutorialBackgroundImage.alpha = 1;
                self.endTutorialButton.alpha = 1;
            })
        } else {
            UIView.animateWithDuration(0.7, animations: {
                self.tutorialPageControl.alpha = 1;
                self.endTutorialBackgroundImage.alpha = 0;
                self.endTutorialButton.alpha = 0;
            })
        }

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
