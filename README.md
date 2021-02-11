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




