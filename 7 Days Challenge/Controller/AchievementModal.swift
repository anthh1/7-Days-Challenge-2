//
//  AchievementModal.swift
//  7 Days Challenge
//
//  Created by Anthony Angkasa on 04/04/20.
//  Copyright © 2020 Mini Challenge 1 - G19. All rights reserved.
//

import UIKit
import Lottie

class AchievementModal: UIViewController {

    @IBOutlet var lottieView: UIView!
    
    @IBOutlet weak var animationTitleLbl: UILabel!
    var animationTitle = ""
    
    
    
    var animationName = ""
    
    
     let animationView = AnimationView()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never

        animationTitleLbl.text = animationTitle
        // Do any additional setup after loading the view.
                setupAnimation()
    }

           private func setupAnimation(){
                animationView.animation = Animation.named(animationName)
                animationView.frame = lottieView.frame
                animationView.backgroundColor = .white
                animationView.contentMode = .scaleAspectFit
                animationView.loopMode = .loop
                animationView.play()
                view.addSubview(animationView)
           }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



