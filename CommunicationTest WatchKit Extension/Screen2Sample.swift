//
//  Screen2Sample.swift
//  CommunicationTest WatchKit Extension
//
//  Created by Parrot on 2019-10-31.
//  Copyright © 2019 Parrot. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity

class Screen2Sample: WKInterfaceController, WCSessionDelegate {
    
    // MARK: Outlets
    // ---------------------

    // 1. Outlet for the image view
    @IBOutlet var pokemonImageView: WKInterfaceImage!
    
    // 2. Outlet for the label
    @IBOutlet var nameLabel: WKInterfaceLabel!
    
    // MARK: Delegate functions
    // ---------------------
    
    // Default function, required by the WCSessionDelegate on the Watch side
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //@TODO
    }
    
    func session(_ session: WCSession, didReceiveMessageData messageData: Data, replyHandler: @escaping (Data) -> Void) {
        guard let pic1 = UIImage(data: messageData) else { return  }
        pokemonImageView.setImage(pic1)
        guard let pic2 = UIImage(data: messageData) else { return  }
        pokemonImageView.setImage(pic2)
        
    }
  
    // MARK: WatchKit Interface Controller Functions
    // ----------------------------------
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
        // 1. Check if the watch supports sessions
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
        
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    // MARK: Actions
    @IBAction func startButtonPressed() {
        print("Start button pressed")
    }
    
    
    @IBAction func selectNameButtonPressed() {
        print("select name button pressed")
        let cannedResponses = ["Leo", "booze","shadow", "reez", "charmy", "lapras", ]
        presentTextInputController(withSuggestions: cannedResponses, allowedInputMode: .plain) {
            
            (results) in
            
            if (results != nil && results!.count > 0) {
                let userResponse = results?.first as? String
                print(userResponse!)
                    self.nameLabel.setText(userResponse)
            }
            

        }
    }

    }
    
