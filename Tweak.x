#import <AudioToolbox/AudioToolbox.h>
#import "HelloWorldTweak.h"

static void loadPreferences() {
	NSDictionary *preferences = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.blueberrywaffle.helloworldtweakpreferences"];

	enabled = [preferences objectForKey:@"enabled"] ? [[preferences objectForKey:@"enabled"] boolValue] : YES;
	vibrationSetting = [[preferences objectForKey:@"vibrationSetting"] integerValue];
}

%hook SBVolumeControl

-(void)increaseVolume {
	 %orig;
	loadPreferences();

	 if (enabled) {
	 	AudioServicesPlaySystemSound(vibrationSetting);
	 	}
	 }

-(void)decreaseVolume {
	 %orig;
	loadPreferences();

	 if (enabled) {
	 	AudioServicesPlaySystemSound(vibrationSetting);
	 	}
	 }

%end