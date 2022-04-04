//
//  SceneDelegate.swift
//  AppLab
//
//  Created by Pham Kien on 21.02.22.
//

import UIKit
import Firebase
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        FirebaseApp.configure()
        let gradient = CAGradientLayer()
        let sizeLength = UIScreen.main.bounds.size.height * 2
        let defaultNavigationBarFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64)

        gradient.frame = defaultNavigationBarFrame
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
//        gradient.locations =  [0.0,0.5,1.0]#004b2c
        gradient.colors = [UIColor.init(hexaRGB: "#84c113", alpha: 1)?.cgColor,UIColor.init(hexaRGB: "#004d29", alpha: 1)?.cgColor]

        UINavigationBar.appearance().setBackgroundImage(self.imageFromLayer(layer: gradient), for: .default)


        let vc =  SupportCovidVC(nibName: "SupportCovidVC", bundle: nil)
        let navi = UINavigationController(rootViewController: vc)
        window?.rootViewController = navi
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    
    func imageFromLayer(layer:CALayer) -> UIImage {
        
        UIGraphicsBeginImageContext(layer.frame.size)

            layer.render(in: UIGraphicsGetCurrentContext()!)

            let outputImage = UIGraphicsGetImageFromCurrentImageContext()

            UIGraphicsEndImageContext()

            return outputImage!
//        let rect = CGRect(x: 0, y: 0, width: 1, height: 40)
//
//        UIGraphicsBeginImageContext(rect.size)
//        layer.render(in:  UIGraphicsGetCurrentContext()!)
//        let outputImage =  UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        if let image = outputImage {
//            return image
//        }
//        return UIImage()
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

