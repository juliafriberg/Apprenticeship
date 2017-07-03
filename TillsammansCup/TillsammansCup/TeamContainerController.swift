//
//  TeamContainerController.swift
//  TillsammansCup
//
//  Created by Julia Friberg on 2017-04-12.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import UIKit

class TeamContainerController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupView() {
        // Configure Segmented Control
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        
        // Select First Segment
        segmentedControl.selectedSegmentIndex = 0
    }
    
    func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    public func updateView() {
        if !loginViewController.isLoggedIn {
            remove(asChildViewController: scheduleViewController)
            remove(asChildViewController: profileViewController)
            add(asChildViewController: loginViewController)
            
        } else if segmentedControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: scheduleViewController)
            remove(asChildViewController: loginViewController)
            add(asChildViewController: profileViewController)
        } else {
            remove(asChildViewController: profileViewController)
            remove(asChildViewController: loginViewController)
            add(asChildViewController: scheduleViewController)
        }
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    
    private lazy var scheduleViewController: UIViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "TeamScheduleViewController")
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var profileViewController: UIViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController")
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var loginViewController: LoginViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
}

