
#import "ViewController.h"
#import "MusicBarView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *progressBar;                                               //프로그래스 바
@property (weak, nonatomic) IBOutlet UIButton *playBtn;                                                   //플레이 버튼
@property (weak, nonatomic) IBOutlet UITextView *infoTV;                                                 //정보 텍스트 필드
@property (weak, nonatomic) IBOutlet UILabel *startTimeLbl;                                             //시작 시간 라벨
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLbl;                                             //전체 시간 라벨
@property (weak, nonatomic) IBOutlet MusicBarView *musicBarView;                                //뮤직 프로그레스 바


@property (strong,nonatomic)MPMediaPickerController *mpPickerVC;                                //미디어 피커
@property (strong,nonatomic)AVAudioPlayer *player;                                                            //오디오 플레이어 라이브러리
@property (strong,nonatomic)NSURL *furl;                                                                            //파일 주소
@property (strong,nonatomic)NSTimer *secondTimer;                                                         // 초 타이머
@property (strong,nonatomic)NSTimer *millTimer;                                                               // 밀리세컨 타이머
@property  BOOL isInitSound;
@property float rate;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _mpPickerVC = [[MPMediaPickerController alloc]initWithMediaTypes:MPMediaTypeMusic]; //미디어 피커 초기화
    _mpPickerVC.allowsPickingMultipleItems = NO;
    _mpPickerVC.delegate = self;
    
    _player = [[AVAudioPlayer alloc]init];
   // _player.delegate = self;
    

    _isInitSound = NO;
    _rate = 1.0;
}



- (IBAction)onDrawer:(id)sender {
    NSLog(@"onDrawer");
    [self presentViewController:_mpPickerVC animated:YES completion:^{
          NSLog(@"Show Music Picker!");
    }];
    
}

#pragma mark MPMediaPickerControllerDelegate
//미디어 픽커에서 곡을 선택했을 때 관련 정보 설정해주기
-(void) mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
    NSString *title;
    NSString *artist;
    NSString *content;
    
    for (MPMediaItem *item in [mediaItemCollection items]) {
        title = [item valueForKey:MPMediaItemPropertyTitle];
        artist = [item valueForKey:MPMediaItemPropertyArtist];
        _furl= [item valueForKey:MPMediaItemPropertyAssetURL];
    }
    
    content = title;
    content = [content stringByAppendingFormat:@"\n %@",artist];
    NSError *error;
    if(nil != _furl){
        //곡의 url 로 audioPlayer 초기화 하기
        _player = [_player initWithContentsOfURL:_furl error:&error];
        [_player play];
        [_player pause];
        _player = [_player initWithContentsOfURL:_furl error:&error];
        if (nil != error) {
            NSLog(@"initwithcontentsofurl with error %@" , error.localizedDescription);
            return;
        }
        _isInitSound = YES;
        [_totalTimeLbl setText:
         [NSString stringWithFormat:@"%02ld:%02ld" , (long)_player.duration/60, ((long)_player.duration)%60]];
        _player.delegate = self;
        _player.enableRate = YES;
        _player.meteringEnabled = YES;
    }
    
    [_infoTV setText:content];
    [mediaPicker dismissViewControllerAnimated:YES completion:^{
         NSLog(@"Successful pick and return ");
    }];
    
}

//미디어 피커 취소
- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker {
    
    [mediaPicker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"User cancel pick and return ");
    }];
}

#pragma mark  AVAudioPlayerDelegate
/* audioPlayerDidFinishPlaying:successfully: is called when a sound has finished playing. This method is NOT called if the player is stopped due to an interruption. */
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    
}

/* if an error occurs while decoding it will be reported to the delegate. */
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
