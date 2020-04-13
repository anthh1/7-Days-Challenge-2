//
//  YourVideos.swift
//  7 Days Challenge
//
//  Created by Destiana on 08/04/20.
//  Copyright © 2020 Mini Challenge 1 - G19. All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices

class YourVideos: UITableViewController, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
