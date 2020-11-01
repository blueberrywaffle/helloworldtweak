#import <AudioToolbox/AudioToolbox.h>
#import "HelloWorldTweak.h"

static void loadPreferences() {
	NSDictionary *preferences = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.blueberrywaffle.helloworldtweakpreferences"];

	enabled = [preferences objectForKey:@"enabled"] ? [[preferences objectForKey:@"enabled"] boolValue] : YES;
}

%hook SBVolumeControl

-(void)increaseVolume {
	 %orig;
	loadPreferences();

	 if (enabled) {
	 	AudioServicesPlaySystemSound(1521);
	 	}
	 }

-(void)decreaseVolume {
	 %orig;
	loadPreferences();

	 if (enabled) {
	 	AudioServicesPlaySystemSound(1521);
	 	}
	 }

%end