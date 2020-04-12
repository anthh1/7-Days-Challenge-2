//
//  ChallengeInfoViewController.swift
//  7 Days Challenge
//
//  Created by Calvin Leonardo on 05/04/20.
//  Copyright © 2020 Mini Challenge 1 - G19. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVKit

class ChallengeInfoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBOutlet weak var videoInfoThumbnail: UIButton!
    @IBOutlet weak var challengeNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var challengeScoreLbl: UILabel!
    
    @IBAction func startVideo(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "IMG_0447", ofType: "MOV"){
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {
                video.play()
            })
        }
    }
    
    var challengeDay = 0
    var challengeName = ""
    var challengeDesc = ""
    var challengeScore = 100
    var newScore = 0
    var currentScore = 0
    
    var controller = UIImagePickerController()
    let videoFileName = "/video.mp4"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never

        setLabel()
    }
    
    func setLabel() {
        challengeNameLbl.text = challengeName
        descriptionLbl.text = challengeDesc
        challengeScoreLbl.text = "Day \(challengeScore)"
        
    }
    
    @IBAction func btnDoChallenge(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            controller.sourceType = .camera
            controller.mediaTypes = [kUTTypeMovie as String]
            controller.delegate = self
                
            present(controller, animated: true, completion: nil)
        }
        else {
            print("Camera is not available")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
        if let selectedVideo:URL = (info[UIImagePickerController.InfoKey.mediaURL] as? URL) {
//            let alert = UIAlertController(title: "Submit Video", message: "Are you sure you want to submit it to gallery?", preferredStyle: .alert)
            let selectorToCall = #selector(videoSaved(_:didFinishSavingWithError:context:))
            UISaveVideoAtPathToSavedPhotosAlbum(selectedVideo.relativePath, self, selectorToCall, nil)
            let videoData = try? Data(contentsOf: selectedVideo)
            let paths = NSSearchPathForDirectoriesInDomains(
                    FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
            let documentsDirectory: URL = URL(fileURLWithPath: paths[0])
            let dataPath = documentsDirectory.appendingPathComponent(videoFileName)
            try! videoData?.write(to: dataPath, options: [])
        }
        picker.dismiss(animated: true)
    }
    
    @objc func videoSaved(_ video: String, didFinishSavingWithError error: NSError!, context: UnsafeMutableRawPointer){
        if let theError = error {
            print("error saving the video = \(theError)")
        } else {
           DispatchQueue.main.async(execute: { () -> Void in
           })
            performSegue(withIdentifier: "challengeDone", sender: self)
            
            currentScore = UserDefaults.standard.integer(forKey: "Score")
            newScore = challengeScore + currentScore
            UserDefaults.standard.set(newScore, forKey: "Score")
            
            print(UserDefaults.standard.integer(forKey: "Score"))
        }
    }
}
 
