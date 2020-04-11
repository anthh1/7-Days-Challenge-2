//
//  ViewController.swift
//  7 Days Challenge
//
//  Created by Anthony Angkasa on 04/04/20.
//  Copyright © 2020 Mini Challenge 1 - G19. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var goButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
  
    }
    
    var slides:[Slide] = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        goButton.layer.cornerRadius = 35
        
        scrollView.delegate = self
        
       slides = createSlides()
       setupSlideScrollView(slides: slides)
       
       pageControl.numberOfPages = slides.count
       pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    func createSlides() -> [Slide] {

        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.welcomeTitle.text = "Welcome To"
        slide1.imageView.image = UIImage (named: "img1")
        slide1.labelTitle.text = ""
        slide1.labelDescription.text = "7 Days Challenge"
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.welcomeTitle.text = ""
        slide2.imageView.image = UIImage (named: "img2")
        slide2.labelTitle.text = "There's still a bunch of activities we can do during our WFH"
        slide2.labelDescription.text = ""
        slide2.frame = CGRect(x:0, y: 0, width: slide2.frame.width, height: 1000)
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.welcomeTitle.text = ""
        slide3.imageView.image = UIImage (named: "img3")
        slide3.labelTitle.text = "Doing exercise is also good. So, why dont you give it a try?"
        slide3.labelDescription.text = ""
        
        return [slide1, slide2, slide3]
    }
    func setupSlideScrollView(slides : [Slide]) {
    scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height - 500)
    scrollView.isPagingEnabled = true
    
    for i in 0 ..< slides.count {
        slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.addSubview(slides[i])
    }
}
     /*
         * default function called when view is scolled. In order to enable callback
         * when scrollview is scrolled, the below code needs to be called:
         * slideScrollView.delegate = self or
         */
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
            pageControl.currentPage = Int(pageIndex)
            
            let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
            let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
            
            // vertical
            let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
            let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
            
            let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
            let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
            
            
            /*
             * below code changes the background color of view on paging the scrollview
             */
    //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
            
        
            /*
             * below code scales the imageview on paging the scrollview
             */
           // let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
            
           // if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
                
             //   slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
               // slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
                
            //} else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            //slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
              //  slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
                
            //} else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
              //  slides[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
                //slides[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
                
            //} else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
              //  slides[3].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
                //slides[4].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
            }
        }
    


