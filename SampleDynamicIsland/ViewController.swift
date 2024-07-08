//
//  ViewController.swift
//  SampleDynamicIsland
//
//  Created by Burak İmdat on 8.07.2024.
//

import UIKit
import ActivityKit

class ViewController: UIViewController {
    private var startTime: Date? = nil
    private var isTrackingTime: Bool = false
    private var activity: Activity<MyActivityAttributes>? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let button = UIButton(type: .system)
        button.setTitle("Start live activity", for: .normal)
        button.addTarget(self, action: #selector(startLiveActivity), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        view.addSubview(button)
    }
    
    @objc func startLiveActivity() {
        isTrackingTime.toggle()
        if (!isTrackingTime) {
            guard let content = activity?.content else { return }
            
            Task {
                await activity?.end(content, dismissalPolicy: .immediate)
            }
            return
        }
        startTime = .now
        let initialContentState = MyActivityAttributes.ContentState(startTime: .now)
        let activityAttributes = MyActivityAttributes()
        let content = ActivityContent(state: initialContentState, staleDate: nil)
        
        do {
            activity = try Activity<MyActivityAttributes>.request(attributes: activityAttributes, content: content)
        } catch (let error) {
            print("Error starting activity: \(error.localizedDescription)")
        }
    }


}

