# react-native-smartech-react-native-nudges

## Getting started

`$ npm install react-native-smartech-react-native-nudges --save`

### Mostly automatic installation

`$ react-native link react-native-smartech-react-native-nudges`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-smartech-react-native-nudges` and add `SmartechReactNativeNudges.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libSmartechReactNativeNudges.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.reactlibrary.SmartechReactNativeNudgesPackage;` to the imports at the top of the file
  - Add `new SmartechReactNativeNudgesPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-smartech-react-native-nudges'
  	project(':react-native-smartech-react-native-nudges').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-smartech-react-native-nudges/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-smartech-react-native-nudges')
  	```


## Usage
```javascript
import SmartechReactNativeNudges from 'react-native-smartech-react-native-nudges';

// TODO: What to do with the module?
SmartechReactNativeNudges;
```
