//
//  ViewController.swift
//  VideoRecorder
//
//  Created by Paul Solt on 10/2/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
        
        requestPermissionAndShowCamera()
	}
    
    private func requestPermissionAndShowCamera() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            requestVideoPermission()
        case .restricted:
            preconditionFailure("Video is disabled, please review device restrictions.")
        case .denied:
            preconditionFailure("Hey you denied us, but you can't use the app without giving permission, so go in Settings and make this right.")
        case .authorized:
            showCamera()
        @unknown default:
            preconditionFailure("A new status code was added that we need to handle.")
        }
    }
    
    private func requestVideoPermission() {
        AVCaptureDevice.requestAccess(for: .video) { (isGranted) in
            guard isGranted else {
                preconditionFailure("UI: Tell the user to enable permissions for Video/Camera")
            }
            
            DispatchQueue.main.async {
                self.showCamera()
            }
        }
    }
	
	private func showCamera() {
		performSegue(withIdentifier: "ShowCamera", sender: self)
	}
}
