
#import "ViewController.h"
#import "MusicBarView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *progressBar;                                               //프로그래스 바
@property (weak, nonatomic) IBOutlet UIButton *playBtn;                                                   //플레이 버튼
@property (weak, nonatomic) IBOutlet UITextView *infoTV;                                                 //정보 텍스트 필드
@property (weak, nonatomic) IBOutlet UILabel *startTimeLbl;                                             //시작 시간 라벨
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLbl;                                             //전체 시간 라벨
@property (weak, nonatomic) IBOutlet MusicBarView *musicBarView;                                //뮤직 프로그레스 바


@property (strong,nonatomic)MPMediaPickerController *mpPickerVC;                                // 미디어 피커
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
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
