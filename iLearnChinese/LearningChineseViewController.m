//
//  LearningChineseViewController.m
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearningChineseViewController.h"
#import "LearningChineseDatabaseViewController.h"
#import "LearningChineseHighScoreViewController.h"
#import "LearningChineseGameOneViewController.h"
#import "LearningChineseGameTwoViewController.h"
#import "User.h"

@interface LearningChineseViewController ()

@end

@implementation LearningChineseViewController
@synthesize dico = _dico;
@synthesize managedObjectContext = _managedObjectContext;


- (void)addWordToDBWithEnglish:(NSString *)english 
                    chinese:(NSString *)chinese 
                     pinyin:(NSString *)pinyin
{
    Word *word = [NSEntityDescription insertNewObjectForEntityForName:@"Word"
                                               inManagedObjectContext:self.managedObjectContext];
    [word setEnglish:english];
    [word setPinyin:pinyin];
    [word setChinese:chinese];
    [word setAddByUser:[NSNumber numberWithBool:NO]];
    [self.managedObjectContext save:nil];
}

-(void)loadDefaultDatabase
{
    /* These words are from the book:
       Experiencing Chinese (Traveling in China) */
    // Lesson 1
    [self addWordToDBWithEnglish:@"Please" chinese:@"请" pinyin:@"qǐng"];
    [self addWordToDBWithEnglish:@"Show" chinese:@"出示" pinyin:@"chūshì"];
    [self addWordToDBWithEnglish:@"Entry Card" chinese:@"入境卡" pinyin:@"rùjìngkǎ"];
    [self addWordToDBWithEnglish:@"Plane Ticket" chinese:@"机票" pinyin:@"jīpiào"];
    [self addWordToDBWithEnglish:@"Boarding Pass" chinese:@"登记卡" pinyin:@"dēngjīkǎ"];
    [self addWordToDBWithEnglish:@"Your" chinese:@"您的" pinyin:@"nínde"];
    [self addWordToDBWithEnglish:@"Police" chinese:@"警察" pinyin:@"jǐngchá"];
    [self addWordToDBWithEnglish:@"Information" chinese:@"问询处" pinyin:@"wènxùnchù"];
    
    // Lesson 2
    [self addWordToDBWithEnglish:@"I" chinese:@"我" pinyin:@"wǒ"];
    [self addWordToDBWithEnglish:@"Come" chinese:@"来" pinyin:@"lái"];
    [self addWordToDBWithEnglish:@"China" chinese:@"中国" pinyin:@"zhōngguó"];
    [self addWordToDBWithEnglish:@"Travel" chinese:@"旅游" pinyin:@"lǚyóu"];
    [self addWordToDBWithEnglish:@"Purpose" chinese:@"目的" pinyin:@"mùdì"];
    [self addWordToDBWithEnglish:@"Be" chinese:@"是" pinyin:@"shì"];
    [self addWordToDBWithEnglish:@"Study" chinese:@"学习" pinyin:@"xuéxí"];
    [self addWordToDBWithEnglish:@"Work" chinese:@"工作" pinyin:@"gōngzuò"];
    [self addWordToDBWithEnglish:@"Do business" chinese:@"经商" pinyin:@"jīngshāng"];
    
    // Lesson 3
    [self addWordToDBWithEnglish:@"Open" chinese:@"打开" pinyin:@"dǎkāi"];
    [self addWordToDBWithEnglish:@"Suitcase" chinese:@"箱子" pinyin:@"xiāngzi"];
    [self addWordToDBWithEnglish:@"OK" chinese:@"好的" pinyin:@"hǎode"];
    [self addWordToDBWithEnglish:@"Backpack" chinese:@"背包" pinyin:@"bēibāo"];
    [self addWordToDBWithEnglish:@"Luggage" chinese:@"行李" pinyin:@"xíngli"];
    [self addWordToDBWithEnglish:@"Bag" chinese:@"袋子" pinyin:@"dàizi"];
    [self addWordToDBWithEnglish:@"Exit" chinese:@"出口" pinyin:@"chūkǒu"];
    [self addWordToDBWithEnglish:@"Entrance" chinese:@"入口" pinyin:@"rùkǒu"];
    [self addWordToDBWithEnglish:@"Timetable" chinese:@"时间表" pinyin:@"shíjiānbiǎo"];
    [self addWordToDBWithEnglish:@"Arrival" chinese:@"抵达" pinyin:@"dǐdá"];
    [self addWordToDBWithEnglish:@"Departure" chinese:@"出发" pinyin:@"chūfā"];
    
    // Lesson 4
    [self addWordToDBWithEnglish:@"This" chinese:@"这个" pinyin:@"zhège"];
    [self addWordToDBWithEnglish:@"Need" chinese:@"需要" pinyin:@"xūyào"];
    [self addWordToDBWithEnglish:@"Declaration" chinese:@"申报" pinyin:@"shēnbào"];
    [self addWordToDBWithEnglish:@"Yes / No ?" chinese:@"吗" pinyin:@"ma"];
    [self addWordToDBWithEnglish:@"Not" chinese:@"不" pinyin:@"bù"];
    [self addWordToDBWithEnglish:@"Camera" chinese:@"相机" pinyin:@"xiàngjī"];
    [self addWordToDBWithEnglish:@"Books" chinese:@"书" pinyin:@"shū"];
    [self addWordToDBWithEnglish:@"CD" chinese:@"光盘" pinyin:@"guāngpán"];
    
    // Lesson 5
    [self addWordToDBWithEnglish:@"Animals" chinese:@"动物" pinyin:@"dòngwù"];
    [self addWordToDBWithEnglish:@"Can" chinese:@"可以" pinyin:@"kěyǐ"];
    [self addWordToDBWithEnglish:@"Sorry" chinese:@"对不起" pinyin:@"duìbuqǐ"];
    [self addWordToDBWithEnglish:@"Fruits" chinese:@"水果" pinyin:@"shuǐguǒ"];
    [self addWordToDBWithEnglish:@"Meat products" chinese:@"肉制品" pinyin:@"ròuzhìpǐn"];
    [self addWordToDBWithEnglish:@"Plants" chinese:@"植物" pinyin:@"zhíwù"];
    
    // Lesson 6
    [self addWordToDBWithEnglish:@"Excuse me" chinese:@"请问" pinyin:@"qǐngwèn"];
    [self addWordToDBWithEnglish:@"Where" chinese:@"在哪儿" pinyin:@"zài nǎ'er"];
    [self addWordToDBWithEnglish:@"Get" chinese:@"取" pinyin:@"qǔ"];
    [self addWordToDBWithEnglish:@"Baggage" chinese:@"行李" pinyin:@"xínglǐ"];
    [self addWordToDBWithEnglish:@"Perform" chinese:@"办理" pinyin:@"bànlǐ"];
    [self addWordToDBWithEnglish:@"Boarding" chinese:@"登机" pinyin:@"dēng jī"];
    [self addWordToDBWithEnglish:@"Procedure" chinese:@"手续" pinyin:@"shǒuxù"];
    [self addWordToDBWithEnglish:@"Customs" chinese:@"海关" pinyin:@"hǎiguān"];
    [self addWordToDBWithEnglish:@"Check" chinese:@"托运" pinyin:@"tuōyùn"];
    
    // Lesson 7
    [self addWordToDBWithEnglish:@"Look for" chinese:@"找" pinyin:@"zhǎo"];
    [self addWordToDBWithEnglish:@"To" chinese:@"到了" pinyin:@"dàole"];
    [self addWordToDBWithEnglish:@"Do not" chinese:@"别" pinyin:@"bié"];
    [self addWordToDBWithEnglish:@"Anxious" chinese:@"着急" pinyin:@"zhāojí"];
    [self addWordToDBWithEnglish:@"Again" chinese:@"再" pinyin:@"zài"];
    [self addWordToDBWithEnglish:@"Looking" chinese:@"找找" pinyin:@"zhǎo zhao"];
    [self addWordToDBWithEnglish:@"Passport" chinese:@"护照" pinyin:@"hùzhào"];
    [self addWordToDBWithEnglish:@"Bag" chinese:@"包" pinyin:@"bāo"];
    [self addWordToDBWithEnglish:@"Wallet" chinese:@"钱包" pinyin:@"qiánbāo"];
    
    // Lesson 8
    [self addWordToDBWithEnglish:@"Thank you" chinese:@"谢谢" pinyin:@"xièxiè"];
    [self addWordToDBWithEnglish:@"Help" chinese:@"帮助" pinyin:@"bāngzhù"];
    [self addWordToDBWithEnglish:@"You're welcome" chinese:@"不客气" pinyin:@"bù kèqì"];
    [self addWordToDBWithEnglish:@"Introduction" chinese:@"介绍" pinyin:@"jièshào"];
    [self addWordToDBWithEnglish:@"Recommendation" chinese:@"推荐" pinyin:@"tuījiàn"];
    [self addWordToDBWithEnglish:@"Concern" chinese:@"关心" pinyin:@"guānxīn"];
    
    // Lesson 9
    [self addWordToDBWithEnglish:@"Join" chinese:@"接" pinyin:@"jiē"];
    [self addWordToDBWithEnglish:@"You're welcome" chinese:@"不用谢" pinyin:@"bùyòng xiè"];
    [self addWordToDBWithEnglish:@"See off" chinese:@"送" pinyin:@"sòng"];
    [self addWordToDBWithEnglish:@"See" chinese:@"看" pinyin:@"kàn"];
    [self addWordToDBWithEnglish:@"Accompany" chinese:@"陪" pinyin:@"péi"];
    
    // Lesson 10
    [self addWordToDBWithEnglish:@"Airplane" chinese:@"飞机" pinyin:@"fēijī"];
    [self addWordToDBWithEnglish:@"What" chinese:@"什么" pinyin:@"shénme"];
    [self addWordToDBWithEnglish:@"Time" chinese:@"时候" pinyin:@"shíhou"];
    [self addWordToDBWithEnglish:@"Take off" chinese:@"起飞" pinyin:@"qǐfēi"];
    [self addWordToDBWithEnglish:@"Now" chinese:@"现在" pinyin:@"xiànzài"];
    [self addWordToDBWithEnglish:@"Still" chinese:@"还" pinyin:@"hái"];
    [self addWordToDBWithEnglish:@"Know" chinese:@"知道" pinyin:@"zhīdào"];
    [self addWordToDBWithEnglish:@"Listen" chinese:@"听" pinyin:@"tīng"];
    [self addWordToDBWithEnglish:@"Broadcast" chinese:@"广播" pinyin:@"guǎngbò"];
    [self addWordToDBWithEnglish:@"Message" chinese:@"通知" pinyin:@"tōngzhī"];
    [self addWordToDBWithEnglish:@"Arrive" chinese:@"到达" pinyin:@"dàodá"];
    [self addWordToDBWithEnglish:@"Land" chinese:@"降落" pinyin:@"jiàngluò"];
    [self addWordToDBWithEnglish:@"Land" chinese:@"着陆" pinyin:@"zhuólù"];
    
    //[self addWordToDBWithEnglish:@"" chinese:@"" pinyin:@""];
}

- (void)checkDatabase
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Word" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *myDB = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (![myDB count])
    {
        NSLog(@"LOADING DEFAULT DATABASE");
        [self loadDefaultDatabase];
    }
    else
    {
        NSLog(@"The database is not empty.");
    }
}

- (void)checkUser
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *myDB = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (![myDB count])
    {
        NSLog(@"LOADING DEFAULT USER");
        
        User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User"
                                                   inManagedObjectContext:self.managedObjectContext];
        
        [user setName:@"Default"];
        [self.managedObjectContext save:nil];
    }
    else
    {
        NSLog(@"USER EXIST.");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.png"]]];
    [self checkDatabase];
    [self checkUser];
}

- (void)viewDidUnload
{
    [self setDico:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (BOOL)isChineseKeyboardActivated
{
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSDictionary* defaults = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    NSString *chineseKeyboard = [[NSString alloc] initWithString:@"zh_Hans-HWR@sw=HWR"];
    id appleKeyboards = [defaults objectForKey:@"AppleKeyboards"];
    for (int i = 0; i < [appleKeyboards count]; i++)
    {
        if ([chineseKeyboard isEqual:[appleKeyboards objectAtIndex:i]])
        {
            NSLog(@"Launchable okay");
            return YES;
        }
    }
    return NO;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=//General/Keyboard/Keyboards"]];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PushDatabase"])
    {
        LearningChineseDatabaseViewController *words = segue.destinationViewController;
        words.managedObjectContext = self.managedObjectContext;
    }
    else if ([segue.identifier isEqualToString:@"PushHighscore"])
    {
        LearningChineseHighScoreViewController *scores = segue.destinationViewController;
        scores.managedObjectContext = self.managedObjectContext;        
    }
    else if ([segue.identifier isEqualToString:@"PushGameOne"])
    {
        LearningChineseGameOneViewController *words = segue.destinationViewController;
        words.managedObjectContext = self.managedObjectContext;
    }
    else if ([segue.identifier isEqualToString:@"PushGameTwo"])
    {
        LearningChineseGameTwoViewController *words = segue.destinationViewController;
        words.managedObjectContext = self.managedObjectContext;
    }
    else if ([segue.identifier isEqualToString:@"PushGameThree"])
    {
        LearningChineseGameTwoViewController *words = segue.destinationViewController;
        words.managedObjectContext = self.managedObjectContext;
    }
}
- (IBAction)game2Button:(id)sender
{
    bool isLaunchable = [self isChineseKeyboardActivated];
    if (!isLaunchable)
    {
        NSComparisonResult order = [[UIDevice currentDevice].systemVersion compare: @"5.1" options: NSNumericSearch];
        if (order == NSOrderedSame || order == NSOrderedDescending) {
            // OS version >= 5.1
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Chinese keyboard not activated" message:@"You need to activate the 'Chinese-Simplified (Handwriting)' keyboard to Go to General > Settings > Keyboard > International Keyboards." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        } else {
            // OS version < 5.1
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Chinese keyboard not activated" message:@"You need to activate the 'Chinese-Simplified (Handwriting)' keyboard to play this game. Would you like to activate this keyboard ?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
            [alert show];
        }
    }
    else
    {
        [self performSegueWithIdentifier:@"PushGameTwo" sender:sender];
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

@end
