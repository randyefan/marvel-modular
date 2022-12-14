//
//  AppHelper.swift
//  MarvelApp
//
//  Created by Randy Efan Jayaputra on 11/08/22.
//

#if canImport(UIKit)
import UIKit
#endif

#if canImport(WatchKit)
import WatchKit
#endif

#if canImport(Cocoa)
import Cocoa
#endif

#if !os(Linux)
// MARK: - Properties
/// SwifterSwift: Common usefull properties and methods.
class AppHelper {
    
    // MARK: - Common Functions
    static let shared = AppHelper()
    private init() {} // This prevents others from using the default '()' initializer for this class.
    
    #if !os(macOS)
    /// SwifterSwift: App's name (if applicable).
    var appDisplayName: String? {
        // http://stackoverflow.com/questions/28254377/get-app-name-in-swift
        return Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String
    }
    #endif
    
    #if !os(macOS)
    /// SwifterSwift: App's bundle ID (if applicable).
    var appBundleID: String? {
        return Bundle.main.bundleIdentifier
    }
    #endif
    
    #if os(iOS)
    /// SwifterSwift: StatusBar height
    var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    #endif
    
    #if !os(macOS)
    /// SwifterSwift: App current build number (if applicable).
    var appBuild: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    #endif
    
    #if os(iOS) || os(tvOS)
    /// SwifterSwift: Application icon badge current number.
    var applicationIconBadgeNumber: Int {
        get {
            return UIApplication.shared.applicationIconBadgeNumber
        }
        set {
            UIApplication.shared.applicationIconBadgeNumber = newValue
        }
    }
    #endif
    
    #if !os(macOS)
    /// SwifterSwift: App's current version (if applicable).
    var appVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    #endif
    
    #if os(iOS)
    /// SwifterSwift: Current battery level.
    var batteryLevel: Float {
        return UIDevice.current.batteryLevel
    }
    #endif
    
    #if os(iOS) || os(tvOS)
    /// SwifterSwift: Shared instance of current device.
    var currentDevice: UIDevice {
        return UIDevice.current
    }
    #elseif os(watchOS)
    /// SwifterSwift: Shared instance of current device.
    var currentDevice: WKInterfaceDevice {
        return WKInterfaceDevice.current()
    }
    #endif
    
    #if os(iOS) || os(tvOS)
    var topSafeAreaHeight: CGFloat {
        let window = UIApplication.shared.keyWindow
        return window?.safeAreaInsets.top ?? 0
    }
    #endif
    
    #if os(iOS) || os(tvOS)
    var bottomSafeAreaHeight: CGFloat {
        let window = UIApplication.shared.keyWindow
        return window?.safeAreaInsets.bottom ?? 0
    }
    
    func bottomSpaceToLayout(_ space: CGFloat = 16) -> CGFloat {
        if bottomSafeAreaHeight == 0 {
            return space
        } else if space < 16 {
            return bottomSafeAreaHeight + space/2
        }
        return bottomSafeAreaHeight + space - 8
    }
    #endif
    
    #if !os(macOS)
    /// SwifterSwift: Screen height.
    var screenHeight: CGFloat {
        #if os(iOS) || os(tvOS)
        return UIScreen.main.bounds.height
        #elseif os(watchOS)
        return currentDevice.screenBounds.height
        #endif
    }
    #endif
    
    #if !os(macOS)
    /// SwifterSwift: Current device model.
    var deviceModel: String {
        return currentDevice.model
    }
    #endif
    
    #if !os(macOS)
    /// SwifterSwift: Current device name.
    var deviceName: String {
        return currentDevice.name
    }
    #endif
    
    #if os(iOS)
    /// SwifterSwift: Current orientation of device.
    var deviceOrientation: UIDeviceOrientation {
        return currentDevice.orientation
    }
    #endif
    
    #if !os(macOS)
    /// SwifterSwift: Screen width.
    var screenWidth: CGFloat {
        #if os(iOS) || os(tvOS)
        return UIScreen.main.bounds.width
        #elseif os(watchOS)
        return currentDevice.screenBounds.width
        #endif
    }
    #endif
    
    /// SwifterSwift: Check if app is running in debug mode.
    var isInDebuggingMode: Bool {
        // http://stackoverflow.com/questions/9063100/xcode-ios-how-to-determine-whether-code-is-running-in-debug-release-build
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    #if !os(macOS)
    /// SwifterSwift: Check if app is running in TestFlight mode.
    var isInTestFlight: Bool {
        // http://stackoverflow.com/questions/12431994/detect-testflight
        return Bundle.main.appStoreReceiptURL?.path.contains("sandboxReceipt") == true
    }
    #endif
    
    #if os(iOS)
    /// SwifterSwift: Check if multitasking is supported in current device.
    var isMultitaskingSupported: Bool {
        return UIDevice.current.isMultitaskingSupported
    }
    #endif
    
    #if os(iOS)
    /// SwifterSwift: Current status bar network activity indicator state.
    var isNetworkActivityIndicatorVisible: Bool {
        get {
            return UIApplication.shared.isNetworkActivityIndicatorVisible
        }
        set {
            UIApplication.shared.isNetworkActivityIndicatorVisible = newValue
        }
    }
    #endif
    
    #if os(iOS)
    /// SwifterSwift: Check if device is iPad.
    var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    #endif
    
    #if os(iOS)
    /// SwifterSwift: Check if device is iPhone.
    var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    #endif
    
    #if os(iOS) || os(tvOS)
    /// SwifterSwift: Check if device is registered for remote notifications for current app (read-only).
    var isRegisteredForRemoteNotifications: Bool {
        return UIApplication.shared.isRegisteredForRemoteNotifications
    }
    #endif
    
    /// SwifterSwift: Check if application is running on simulator (read-only).
    var isRunningOnSimulator: Bool {
        // http://stackoverflow.com/questions/24869481/detect-if-app-is-being-built-for-device-or-simulator-in-swift
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
    
    #if os(iOS)
    /// SwifterSwift: Status bar visibility state.
    var isStatusBarHidden: Bool {
        return UIApplication.shared.isStatusBarHidden
    }
    #endif
    
    #if os(iOS) || os(tvOS)
    /// SwifterSwift: Key window (read only, if applicable).
    var keyWindow: UIView? {
        return UIApplication.shared.keyWindow
    }
    #endif
    
    #if os(iOS) || os(tvOS)
    /// SwifterSwift: Most top view controller (if applicable).
    var mostTopViewController: UIViewController? {
        get {
            return UIApplication.shared.keyWindow?.rootViewController
        }
        set {
            UIApplication.shared.keyWindow?.rootViewController = newValue
        }
    }
    #endif
    
    #if os(iOS) || os(tvOS)
    /// SwifterSwift: Shared instance UIApplication.
    var sharedApplication: UIApplication {
        return UIApplication.shared
    }
    #endif
    
    #if os(iOS)
    /// SwifterSwift: Current status bar style (if applicable).
    var statusBarStyle: UIStatusBarStyle? {
        return UIApplication.shared.statusBarStyle
    }
    #endif
    
    #if !os(macOS)
    /// SwifterSwift: System current version (read-only).
    var systemVersion: String {
        return currentDevice.systemVersion
    }
    #endif
}

// MARK: - Methods
extension AppHelper {
    
    /// SwifterSwift: Delay function or closure call.
    ///
    /// - Parameters:
    ///   - milliseconds: execute closure after the given delay.
    ///   - queue: a queue that completion closure should be executed on (default is DispatchQueue.main).
    ///   - completion: closure to be executed after delay.
    ///   - Returns: DispatchWorkItem task. You can call .cancel() on it to cancel delayed execution.
    @discardableResult func delay(milliseconds: Double, queue: DispatchQueue = .main, completion: @escaping () -> Void) -> DispatchWorkItem {
        let task = DispatchWorkItem { completion() }
        queue.asyncAfter(deadline: .now() + (milliseconds/1000), execute: task)
        return task
    }
    
    /// SwifterSwift: Debounce function or closure call.
    ///
    /// - Parameters:
    ///   - millisecondsOffset: allow execution of method if it was not called since millisecondsOffset.
    ///   - queue: a queue that action closure should be executed on (default is DispatchQueue.main).
    ///   - action: closure to be executed in a debounced way.
    func debounce(millisecondsDelay: Int, queue: DispatchQueue = .main, action: @escaping (() -> Void)) -> () -> Void {
        // http://stackoverflow.com/questions/27116684/how-can-i-debounce-a-method-call
        var lastFireTime = DispatchTime.now()
        let dispatchDelay = DispatchTimeInterval.milliseconds(millisecondsDelay)
        let dispatchTime: DispatchTime = lastFireTime + dispatchDelay
        return {
            queue.asyncAfter(deadline: dispatchTime) {
                let when: DispatchTime = lastFireTime + dispatchDelay
                let now = DispatchTime.now()
                if now.rawValue >= when.rawValue {
                    lastFireTime = DispatchTime.now()
                    action()
                }
            }
        }
    }
    
    #if os(iOS) || os(tvOS)
    /// SwifterSwift: Called when user takes a screenshot
    ///
    /// - Parameter action: a closure to run when user takes a screenshot
    func didTakeScreenShot(_ action: @escaping (_ notification: Notification) -> Void) {
        // http://stackoverflow.com/questions/13484516/ios-detection-of-screenshot
        _ = NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification,
                                                   object: nil,
                                                   queue: OperationQueue.main) { notification in
                                                    action(notification)
        }
    }
    #endif
    
    /// SwifterSwift: Class name of object as string.
    ///
    /// - Parameter object: Any object to find its class name.
    /// - Returns: Class name for given object.
    func typeName(for object: Any) -> String {
        let objectType = type(of: object.self)
        return String.init(describing: objectType)
    }
    
}
#endif

