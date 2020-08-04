# Domestika Challange - Domestika Trailers

The goal is to create an iOS App to display a list of Domestika's course trailers.


## Requirements

* xCode 11.6
* Cocoapods 1.9.3


## Setup

Before you could start running the project, you need to run `pod install`.
More info here: (https://cocoapods.org)


## Architecture

I have used VIPER architecture to structure the different screens. I have based the VIPER architecture on this -> (https://github.com/rcasanovan/Xcode-VIPER-Architecture-Template)


##Network request

I have used an API point provided by Domestika to get the assests for the courses. (http://mobile-assets.domestika.org/challenge/home.json)

To make the API call I have used the URLSession provided by iOS. I have also used the Swift Standard Library decodable functionality to parse the array of courses into the models.


## What can be improved in the code?

 * Localizable strings: we can improve the App by adding localization to the string files.
 * Add more unit testing. I only added some test to the Course list screen.
 * Add UI testing
 * Give some feedback to the user if an error occurs when doing the network call, when parsing data, etc.
 * Add Reachability to give the user feedback in case of no connectivity.
 * Add some kind of Pull to Refresh behaviour to the Courses List for the user to be able to refresh the data.


## Third-Party Libraries

* [SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD): A clean and lightweight progress HUD for your iOS and tvOS app.
* [SnapKit](https://github.com/SnapKit/SnapKit): SnapKit is a DSL to make Auto Layout easy on both iOS and OS X.
* [SDWebImage](https://github.com/SDWebImage/SDWebImage): This library provides an async image downloader with cache support


## Support && contact

You can contact by email: albertarredondoalfaro@gmail.com