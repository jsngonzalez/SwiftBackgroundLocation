import UIKit
import SwiftBackgroundLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var locationManager = TrackingHeadingLocationManager()
    var backgroundLocationManager = BackgroundLocationManager(regionConfig: RegionConfig(regionRadius: 100.0))
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        if launchOptions?[UIApplication.LaunchOptionsKey.location] != nil {
            BackgroundDebug().write(string: "UIApplicationLaunchOptionsLocationKey")
            
            backgroundLocationManager.startBackground() { result in
                if case let .Success(location) = result {
                    LocationLogger().writeLocationToFile(location: location)
                }
            }
        }

        return true
    }

}

