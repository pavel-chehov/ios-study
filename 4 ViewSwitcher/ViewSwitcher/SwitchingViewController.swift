//
//  ViewController.swift
//  ViewSwitcher
//
//  Created by Pavel Chehov on 4/11/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    private let blueIdentifier = "Blue"
    private let yellowIdentifier = "Yellow"
    
    private var blueViewController: BlueViewController!
    private var yellowViewController: YellowViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //программное задание действия для кнопки
        //switchViewsButton.action = #selector (switchViews(_:))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        if blueViewController != nil && blueViewController!.view.superview == nil {
            blueViewController = nil
        }
        if yellowViewController != nil && yellowViewController!.view.superview == nil {
            yellowViewController = nil
        }
    }
    
    @IBAction func switchViews(_ sender: UIBarButtonItem) {
        //создаем контроллеры если не созданы
        if yellowViewController?.view.superview == nil {
            if yellowViewController == nil {
                 yellowViewController = self.storyboard?.instantiateViewController(withIdentifier: yellowIdentifier) as! YellowViewController
            }
        } else {
            if blueViewController?.view.superview == nil {
                if blueViewController == nil {
                    blueViewController = self.storyboard?.instantiateViewController(withIdentifier: blueIdentifier) as! BlueViewController
                }
            }
        }
        
//        не работало
//        UIView.beginAnimations("Flip View", context: nil)
//        UIView.setAnimationDuration(0.4)
//        UIView.setAnimationCurve(.easeInOut)
        
//        переключаем
        let animationActions = {
            [unowned self] in
            if self.yellowViewController?.view.superview == nil {
                self.yellowViewController.view.frame = self.view.frame
                self.switchViewController(from: self.blueViewController, to: self.yellowViewController)
            } else {
                self.blueViewController?.view.frame = self.view.frame
                self.switchViewController(from: self.yellowViewController, to: self.blueViewController)
            }
        }
        
//        можно использовать два подхода для анимаций, тут срабатывает мгновенно
        UIView.transition(with: self.view, duration: 0.4, options: .transitionCurlDown, animations: animationActions, completion: nil)
        
//        тут можно отложить
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(0.4)
//        UIView.setAnimationCurve(.easeInOut)
//        UIView.setAnimationTransition(.flipFromLeft, for: self.view, cache: true) // тут кэш
//        animationActions()
//        UIView.commitAnimations()
    }
    
    func switchViewController(from: UIViewController?, to: UIViewController?) {
        if let fromVC = from {
            fromVC.willMove(toParentViewController: nil)
            fromVC.view.removeFromSuperview()
            fromVC.removeFromParentViewController()
        }
        if let toVC = to {
            self.addChildViewController(toVC)
            self.view.insertSubview(toVC.view, at: 0)
            toVC.didMove(toParentViewController: self)
        }
    }
}

