

#import "MusicBarView.h"


@interface MusicBarView()
@property float unitWidth;
@property int count;
@property (strong,nonatomic) NSMutableArray *volumes;
@property (strong, nonatomic) NSMutableArray *volumeViews;
@end

@implementation MusicBarView



-(void) initlvar {
    _count = 7;
    [self layoutIfNeeded];
    _unitWidth = self.frame.size.width / (2 * _count + 1);                                                              //막대바 가로 길이
    _volumes = [[NSMutableArray alloc]init];
    _volumeViews = [[NSMutableArray alloc]init];
    
    for (int i = 0;  i < _count; i++) {
        
        
        //view 객체 생성
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake((2*i + 1)* _unitWidth, self.frame.size.height - self.frame.size.height/(i+1), _unitWidth, self.frame.size.height/(i+1))];
        //view 배경색 지정
        [view setBackgroundColor:[UIColor blueColor]];
        //_volumeViews 에 view 객체 넣기
        [_volumeViews addObject:view];
        //화면에 view 넣기
        [self addSubview:view];
    }
    
}


//초기화
- (instancetype)init{
    self = [super init];
    if(nil != self){
        [self initlvar];
    }
    return self;
}



-(void)addValue:(float)value{
    
}

- (void) clear{
    
}


-(void) updateUI{
    
}

@end
