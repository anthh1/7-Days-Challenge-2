//
//  ProfileView.swift
//  7 Days Challenge
//
//  Created by Anthony Angkasa on 04/04/20.
//  Copyright © 2020 Mini Challenge 1 - G19. All rights reserved.
//

import UIKit

class ProfileView: UIViewController {

    @IBOutlet var imageProfile: UIImageView!
    @IBOutlet var labelScore: UILabel!
    @IBOutlet var lottieView: UIView!
    
     let animationView = AnimationView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                setupAnimation()
           }

           private func setupAnimation(){
                animationView.animation = Animation.named("reward")
                animationView.frame = lottieView.frame
                animationView.backgroundColor = .white
                animationView.contentMode = .scaleAspectFit
                animationView.loopMode = .loop
                animationView.play()
                view.addSubview(animationView)
           }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
