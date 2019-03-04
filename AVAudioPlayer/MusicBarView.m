

#import "MusicBarView.h"


@interface MusicBarView()
@property float unitWidth;
@property int count;
@property (strong,nonatomic) NSMutableArray *volumes;
@property (strong, nonatomic) NSMutableArray *volumeViews;
@end

@implementation MusicBarView


//2. view 객체 7개 생성

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


//1.초기화
- (instancetype)init{
    self = [super init];
    if(nil != self){
        [self initlvar];
    }
    return self;
}

//3.초기화
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (nil != self) {
        [self initlvar];
    }
    return self;
}

//4.초기화
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (nil != self) {
        [self initlvar];
    }
    return  self;
}


//추가
-(void)addValue:(float)value{
    //_volumes이 Null 이 아니고 _volumes 개수가 7 보다 작으면
    if (nil != _volumes && [_volumes count] < (_count)) {
        [_volumes addObject:[NSNumber numberWithFloat:value]];
    }else{
        //_volumes이 null이고 _volumes 개수가 7 보다 크면
        [_volumes addObject:[NSNumber numberWithFloat:value]];
        [_volumes removeObjectAtIndex:0];
    }
}

//삭제
- (void) clear{
    for (UIView *v in _volumeViews) {
        v.alpha = 0;
    }
}

//업데이트
-(void) updateUI{
    
    for (int i = 0; i < _count && i < [_volumes count]; i++) {
        UIView *view = [_volumeViews objectAtIndex:i];
        view.alpha = 1;
        float volume = [((NSNumber *)[_volumes objectAtIndex:i]) floatValue] * self.frame.size.height;
        [view setFrame:CGRectMake((2*i + 1 )* _unitWidth , self.frame.size.height - volume , _unitWidth, volume)];
    }
    
}

@end
