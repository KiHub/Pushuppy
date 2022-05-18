//
//  AppDelegate.swift
//  Pushuppy
//
//  Created by  Mr.Ki on 18.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    let onboardingContainerViewController = OnboardingContainerViewController()
    let tabBarController = UITabBarController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        onboardingContainerViewController.delegate = self
        
        let vc1 = SearchViewController()
        let vc2 = ContactsViewController()
        let vc3 = FavoritesViewController()
        
      //  vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
//        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
//        vc3.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        vc1.tabBarItem.image = UIImage(systemName: "stopwatch")
        vc2.tabBarItem.image = UIImage(systemName: "target")
        vc3.tabBarItem.image = UIImage(systemName: "calendar")
        vc1.tabBarItem.title = "Counter"
        vc2.tabBarItem.title = "Plan"
        vc3.tabBarItem.title = "Results"
        
        let nc1 = UINavigationController(rootViewController: vc1)
        let nc2 = UINavigationController(rootViewController: vc2)
        let nc3 = UINavigationController(rootViewController: vc3)
        
        tabBarController.tabBar.tintColor = appBackGroundColor
        tabBarController.viewControllers = [nc1, nc2, nc3]
        checkFirstLaunch()
        
        return true
    }
    
    
    
    class SearchViewController: UIViewController {
        override func viewDidLoad() {
            title = "Counter"
           
            let gradient: CAGradientLayer = CAGradientLayer()
            gradient.colors = [appBackGroundColor.cgColor, appMainColor.cgColor]
                    gradient.locations = [0.0 , 1.0]
                    gradient.startPoint = CGPoint(x : 0.0, y : 0)
                    gradient.endPoint = CGPoint(x :0.0, y: 0.5)
                    gradient.frame = view.bounds
                    view.layer.addSublayer(gradient)
            
        }
    }
    
    class ContactsViewController: UIViewController {
        override func viewDidLoad() {
            title = "Plan"
        }
    }
    
    class FavoritesViewController: UIViewController {
        override func viewDidLoad() {
            title = "Results"
        }
    }

}

extension AppDelegate {
    func checkFirstLaunch() {
        if LocalState.hasOnboarded {
            setRootViewController(tabBarController)
        } else {
            setRootViewController(onboardingContainerViewController)
            
        }
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(tabBarController)
        
    }
}

//MARK: - Slow transition
extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.8,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
