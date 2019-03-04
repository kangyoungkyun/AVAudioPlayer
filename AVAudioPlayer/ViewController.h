
//라이브러리 임포트 + 프로토콜 구현

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController : UIViewController<MPMediaPickerControllerDelegate, AVAudioPlayerDelegate>


@end

