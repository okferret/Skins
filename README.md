# Skins
A powerful theme manager of swift projects

##Installation
	
	Swift Package Manager
		
		File > Swift Packages > Add Package Dependency
		Add https://github.com/imotoboy/Skins.git
		
	CocoaPods
		
		source 'https://github.com/CocoaPods/Specs.git'
		platform :ios, '9.0'
		use_frameworks!

		target 'MyApp' do
  			pod 'Skins'
		end
			
##Example
	
	1. plist file
		![](/plist.png)
		
	2. setup
		![](http://tvax4.sinaimg.cn/large/006g6WbKly1gpvzo8iqw8j31cs07idho.jpg)
	        
	3. model of color
		![](http://tva1.sinaimg.cn/large/006g6WbKly1gpvzo86x4mj31co1fgtjj.jpg)
	
	4. usage
	
		view.skin.backgroundColor = .meduim