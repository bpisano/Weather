#  Weather

![](Images/Banner.png)

## What is Weather ?

Weather is a simple app that displays weather in SwiftUI. I saw a lot of tutorials on the web, that shows very basic feature of SwiftUI. I tried to combine all of them in one simple app to demonstrate how SwiftUI works. It shows asynchronous data fetch, binding and how to build user interfaces with SwiftUI.

## Installation

### Dark Sky

Weather use the [Dark Sky API](https://darksky.net/dev) to fetch weather data. To run this app, you'll need a Dark Sky API key. This is entirely free. To do so :
1. Create your account [here](https://darksky.net/dev/register) and get your Dark Sky API key.
2. Open the project, and go to the `NetworkManager.swift` file.
3. Replace `static let darkSky: String = ""` by your key.

### Google Places

If you want to add new cities to the app, you'll need a free Google Places API key. This is an optional feature so you don't need this key to get a preview of this app. To get one, follow the instructions on the official [Google documentation](https://developers.google.com/places/web-service/get-api-key?authuser=1&refresh=1). Dont forget to activate the Google Places API on your project in the Google Cloud Console.

Once you get your key :
1. Go to the `NetworkManager.swift` file.
2. Replace `static let googleMaps: String = ""` by your key.

Weather require **Xcode 11.0** and **iOS 13.0**.

## Issues

This app have some issues probably due to SwiftUI as it is in beta. The layout of the app is sometimes bugy. If you find bugs about SwiftUI, report them to Apple as soon as possible. 

## Contribution

Feel free to give some contribution to this very basic project. This will help us to better understand SwiftUI and how to use it to get started.

## Author

This app was made by me, Benjamin Pisano. If you want to contact me, you can send me DM on Twitter [@benjamin_pisano](https://twitter.com/benjamin_pisano). You can also see [my app](https://apps.apple.com/fr/app/aria/id1431709436?mt=12) on the Mac AppStore.
