//
//  CameraPreviewView.swift
//  iOS6-VideoRecorder
//
//  Created by Paul Solt on 7/10/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit
import AVFoundation

/// Use this class to make a fullscreen or partial screen view that can
/// display a live camera preview

class CameraPreviewView: UIView {
    
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var videoPlayerLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    var session: AVCaptureSession? {
        get { return videoPlayerLayer.session }
        set { videoPlayerLayer.session = newValue }
    }
}
