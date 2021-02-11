# NavigationModule

**Dear Devs, for using this module, please:**

- Clone the repo. 
- Create a new branch call "dev-name-project".
- Drag-n-drop NavigationModule.xcodeproj to your project, please uncheck "copy if needed".
- Feel free to play with the code.
- All changes please push to your branch.
- If you have cool features or changes, just create a pull request for review.

**Cheers🍻**

# Structure

Folders: 
- NavigationModuleViewController - contains object NavigationModuleViewController inherited UIViewController. 
- Navigation - core folder.
- - NavigationRouter - contains the main object of the module. Use this object to initiate the start of navigation module flow.
- - NavigationModule - contains objects to manage level of a navigation controller.
- - Delegate - contains an object for communication between NavigationModule and NavigationRouter.
- - Model - contains NavigationModel object responsible for changing NavigationModuleViewController`s in flow.
- - Error - contains error`s related to the navigation module.
- - NavigationSetModule - contains logic to manage tab bar navigation level.
- - - Model - contains NavigationSetModel inherited of NavigationModel. 
- - - NavigationSetController - contains NavigationSetController inherited of UITabBarController.

**NavigationRouter**

Parameters: 
```
- window: UIWindow! - used for change flow.
- currentModule: NavigationModule - used to save the current state of the navigation module.
```


Methods:
```
- init(in window: UIWindow) - initiate instance of NavigationRouter with window object.
- startNavigationModuleFrom(_ navigationModel: NavigationModel) - logic to start navigation module from the adjusted NavigationModel.
- changeNavigationModule(with navigationModels: [NavigationModel]) - method for changing the current navigation module.
```

**NavigationModel**

Parameters:
```
- initialViewControllerType: NavigationModuleViewController.Type - responsible for setting up a type of NavigationModuleViewController which will be used in the next iteration.
```
Methods:
```
- init(initialViewControllerType: NavigationModuleViewController.Type) - initiate instance of NavigationModel with NavigationModuleViewController.Type object.
- buildComponent(in navigationModule: NavigationModule) -> UINavigationController - method for creating the new entry point to navigation flow.
```
**NavigationRouterDelegate**

Methods:
```
- startNextNavigationModule(with navigationModel: [NavigationModel]) - delegate method for sending next navigation flow from NavigationModule level to NavigationRouter object.
```

**NavigationModule**

Prameters:
```
- navigationRouterModuleDelegate: NavigationRouterDelegate! - used for sending the next navigation flow to NavigationRouter object.
- navigationController: UINavigationController - used for transfer navigation logic to the navigation module level.
- navigationModels: [NavigationModel]? - used for saving usable navigation models.
```

Methods:

```
- init(navigationRouterModuleDelegate: NavigationRouterDelegate, navigationModels: [NavigationModel]?) - initiate an instance of NavigationModule with NavigationRouterDelegate object delegate and an array of NavigationModel.
- startFlow() -> UINavigationController? - the logic for initiate process of flow.
- builder(for navigationModels: [NavigationModel]) -> UINavigationController - building UINavigationController for the flow.
- endFlow(with nextNavigationModel: [NavigationModel]) - method for end current flow and start the next based on [NavigationModel].
- pushViewController<T : NavigationModuleViewController>(_ viewController: T.Type, object: Any?) - push new NavigationModuleViewController to the current navigation stack.
- popViewController() - remove NavigationModuleViewController from the current navigation stack.
```

**TabBarNavigationModule**

Inherited of NavigationModule

Methods:
```
- override builder(for navigationModels: [NavigationModel]) -> UINavigationController - creating UINavigationController with UITabBarConsoller as sub-controller.
```

**NavigationModuleBuilder**

Methods:

```
- build(navigationModels: [NavigationModel], navigationRouterDelegate: NavigationRouterDelegate) - method for creating navigation flow, based on a number of the upcoming list of [Navigation Model]. Making decisions create UINavigationController flow or TabBarController Flow.
```

**NavigationRouterModuleErrors**

Enumerator with Error inheritance.

**NavigationSetModel**

Inherited of NavigationModel

Parameters:

```
- title: String? - value for setting up tab bar item title.
- imageName: String? - value for setting up tab bar item image.
```

Methods: 
```
- init(title: String?, imageName: String?, initialViewControllerType: NavigationModuleViewController.Type) - creating an instance of NavigationSetModel with values for creating tab bar item and NavigationModuleViewController type.
- override buildComponent(in navigationModule: NavigationModule) -> UINavigationController - method for creating UITabBar navigation flow.
```

**NavigationSetController**

Inherited of UITabBarController

Parameters:
```
- navigationModules: [NavigationModule] - an array of used NavigationModules.
```

Methods:
```
- generateViewControllers() - generating UINavigationController`s inside each tab bar flows.
```
# How To Use?

For the start we need to initiate NavigationRouter with the main window, for this please add the following code to willConnectTo in SceneDelegate.swift:

```
guard let mainWindow = window else { return }
let navigationRouter = NavigationRouter.init(in: mainWindow)
```

NavigationRouter and other parts of NavigationModule works with NavigationModel. Create an instance of NavigationModel for start NavigationModule logic:

```
let navigationModel = NavigationModel.init(initialViewControllerType: ViewController1.self)
```

ViewController1 should inherit of NavigationModuleViewController:

```
class ViewController1: NavigationModuleViewController {}
```

Last step for initialize NavigationModule logic, call method startNavigationModuleFrom() of NavigationRouter object:

```
navigationRouter.startNavigationModuleFrom(navigationModel)
```

In case all the steps do in the right way, method willConnectTo of SceneDelegate.swift must look like: 

```
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        guard let mainWindow = window else { return }
    
        let navigationRouter = NavigationRouter.init(in: mainWindow)
        let navigationModel = NavigationModel.init(initialViewControllerType: ViewController1.self)
        navigationRouter.startNavigationModuleFrom(navigationModel)
    }
}
```

For pushing new NavigationModuleViewController object from NavigationModule level call method pushViewController(_: object:) :
```
self.navigationModule?.pushViewController(ViewController1.self, object: nil) // where self -> NavigationModuleViewController
```

If you want to start a new flow with UITabBar use method endFlow(with:) of NavigationModule with an array of NavigationSetModel:

```
let navigationSetModel1 = NavigationSetModel.init(title: "Title1", imageName: "image_name", initialViewControllerType: ViewController2.self)
let navigationSetModel2 = NavigationSetModel.init(title: "Title2", imageName: "image_name", initialViewControllerType: ViewController2.self)
let navigationSetModel3 = NavigationSetModel.init(title: "Title3", imageName: "image_name", initialViewControllerType: ViewController2.self)
self.navigationModule?.endFlow(with: [navigationSetModel1, navigationSetModel2 ,navigationSetModel3]) // where self -> NavigationModuleViewController
```

For passing, data to the next NavigationModuleViewController use  pushViewController(_: object:) with passing object:
```
self.navigationModule?.pushViewController(ViewController1.self, object: 200) // where self -> UIViewController2 inherited of NavigationModuleViewController
```
ViewController1 must be inherited of NavigationModuleViewController and look like:

```
class ViewController1: NavigationModuleViewController {
    
    var counter: Int?
    
    required init(navigationModule: NavigationModule? = nil, object: Any? = nil) {
        super.init(navigationModule: navigationModule, object: object)
        if let counter = (object as? Int) {
            self.counter = counter
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
}
```

In this case, all object processing encapsulated in the upcoming controller.