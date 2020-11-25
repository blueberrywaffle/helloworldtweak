#import <AudioToolbox/AudioToolbox.h>
#import "HelloWorldTweak.h"

static void loadPreferences() {
	NSDictionary *preferences = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.blueberrywaffle.helloworldtweakpreferences"];

	enabled = [preferences objectForKey:@"enabled"] ? [[preferences objectForKey:@"enabled"] boolValue] : YES;
	vibrationSetting = [[preferences objectForKey:@"vibrationSetting"] integerValue];
}

%group HelloWorldTweak


	%hook SBVolumeControl

	-(void)increaseVolume {
		%orig;
		AudioServicesPlaySystemSound(vibrationSetting);
	}

	-(void)decreaseVolume {
		%orig;
		AudioServicesPlaySystemSound(vibrationSetting);
	}

	%end

%end

%ctor {
	loadPreferences();

	if(enabled) {
		%init(HelloWorldTweak)
	}
}
