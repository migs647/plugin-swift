// A reminder to myself on how to quickly create a throw away gui app on OSX (i.e. a single file,
// w/o relying on XCode project templates

//Notes: In general it is hard to know how to create a Cocoa based gui without using XCode.
//This issue has existed for both Objective-C and now Swift

//Furthermore, Swift<-->Cocoa syntax has changed dramatically over various Swift versions,
//making stackoverflow posts unreliable

//This file provides a template for creating a throw away gui app

//Status: macOS only -- throw away apps for devices have many non-trivial aspects

//Status: This currenty works under swift 3 + package manager (just replace the main.swift generated
// with swift init --executable with this file
// However, it is not currently Swifty

//todo:
// add metal custom view or sprite kit demo to demonstrate using more frameworks

import Cocoa

print("Hello, world!")

//todo: remind myself what this does
NSApplication.shared()

//#1 status bar
let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength).foo()
statusItem.title = "Quit"
// statusItem.action = #selector(NSApplication.terminate)


//#2 random window (not the typical pattern)
let window = NSWindow(contentRect: NSMakeRect(0, 0, 320, 200),
                      styleMask: .titled,
                      backing: .buffered,
                      defer: true)
window.orderFrontRegardless()


//#3 App delegate (more typical pattern)
class AppDel: NSObject, NSApplicationDelegate {
    var mainWindow: NSWindow?

    var foo: Bar

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("Finished Launching")


        let window = NSWindow(contentRect: NSMakeRect(800, 600, 320, 200),
                              styleMask: [.titled, .closable],
                              backing: .buffered,
                              defer: true)
        window.orderFrontRegardless()
        self.mainWindow = window

        NSApp.activate(ignoringOtherApps: true)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ app: NSApplication) -> Bool {
        return true
    }

    var fooProp: String {
        return "foo"
    }

    public override init() {
        super.init()
    }

    init(whitelist: @escaping Comparison = { _ -> Bool in return true }, blacklist: @escaping Comparison = { _ -> Bool in return true } ) {
        self.whitelist = whitelist
        self.blacklist = blacklist
    }

    init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
        requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider.defaultRequestMapping) {
        print("foo")
    }

    deinit {
        print("deinit")
    }

    lazy var lazyFooProp: String = {
        return "foo"
    }()

    func logPath() -> URL {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
        print(docs)
    }

    dynamic let artworkImageView = ListingsCollectionViewCell._artworkImageView()

    typealias DownloadImageClosure = (_ url: URL?, _ imageView: UIImageView) -> ()
}

typealias Dictionary = [String: AnyObject]

NSApp.setActivationPolicy(.regular)

let del = AppDel()
NSApp.delegate = del

NSApp.run()

typealias Foo = Int

func foo123() -> (String) -> Void { }

enum Foo {
    case bar
}

enum FooInt: Int {
    case bar = 3
    case baz, bat = 3
}

extension Foo: CustomStringConvertible { }
extension Observable where Element: BooleanType { }

let bar1 = foo as? Int
let bar2 = foo as! Int
let bar3 = foo as Int

if foo {
    print("1")
} else if bar {
    print("2")
} else {
    print("3")
}

let x = foo ? "YES" : "NO"

present(vc) {}

func foo(completion: @escaping (String) -> Void) { }

observer.onNext((self.appViewController.presentedViewController as? FulfillmentContainerViewController) != nil)

if case .leaf(let value) = node {
    print(value)
}

let o = AnyObserver { [weak self, foo] event in
    print(event, foo)
}

var requestBidderDetailsCommand = { (enabled: Observable<Bool>) -> CocoaAction in
    appDelegate().requestBidderDetailsCommand(enabled: enabled)
}

let rotationAnimation = CABasicAnimation(keyPath:"transform")

extension Collection where Iterator.Element: ObservableType, Iterator.Element.E: BooleanType {

}

guard let dollars = formatter.string(from: NSDecimalNumber(mantissa: cents, exponent: -2, isNegative: false)) else {
    return ""
}

cardHandler.cardStatus
    .subscribe { (event) in
        print(event)
    }
    .addDisposableTo(rx_disposeBag)

func detectDevelopmentEnvironment() -> Bool {
    var developmentEnvironment = false
    #if DEBUG || (arch(i386) || arch(x86_64)) && os(iOS)
        developmentEnvironment = true
    #elseif os(macOS)
        developmentEnvironment = false
    #else
        developmentEnvironment = 32
    #endif
    return developmentEnvironment
}

extension UIView {
    public var rx_hidden: AnyObserver<Bool> {
        return AnyObserver { [weak self] event in
            MainScheduler.ensureExecutingOnScheduler()
        }
    }
}

func didReceiveResponse(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
    print()
}
