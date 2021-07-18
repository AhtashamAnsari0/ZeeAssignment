# iOS  Assignment - ZeeAssignment 
## An iOS app to show images and detail from https://en.wikipedia.org/w/api.php? built in Swift using Xcode 12.5

## Description
This app is being developed using VIPER/Protocol oriented approach. This App contains two modules. First modules(ImagesList) shows the images from search query. Second module(ImageDetail) display the detail of respective image.

Apart from above two modules Network manager works as service layer, Common module as a helper, AppLaunch as launcher. ImagesList module contains view controller, presenter, interactor and router. Interactor  interact with service layer to fetch images. Application business logic goes into interactor while presentation logic goes into Presenter. While Navigation, dependency, data passing related activities is being taken care by Router.

## Dependency
This project has dependency on third party library  Alamofire for network call and RxSwift, json to SwiftObject and data to json conversion. Project has used pods 'IGListKit' and  Swift Package dependencies which is available on https://github.com/Alamofire/Alamofire.git, https://github.com/ReactiveX/RxSwift.git,  


## Getting Started
Clone this repo to your hard drive using 'git clone https://github.com/AhtashamAnsari0/ZeeAssignment.git'. Open 'ZeeAssignment.xcworkspace' in Xcode. It will automatically start  downloading third party dependencies . Once dependencies are downloaded. You are good to run this project in Xcode.

## Testing
The tests can be run in Xcode by pressing Cmd + U after selecting Test target ZeeAssignmentTests.
There are currently unit tests, using some mock classed and json files.

## Tools used
Xcode 12.5 , Simulator(iPhone 11) iOS 14 and iOS 14 (iPhone 8)
