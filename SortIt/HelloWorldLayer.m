//
//  HelloWorldLayer.m
//  SortIt
//
//  Created by Chris Desch on 10/27/11.
//  Copyright Desch Enterprises 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "HeapSort.h"
#import "SortAction.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

@synthesize heapSort;
@synthesize spriteElements;
@synthesize elements;
@synthesize actionQueue;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Heap Sort" fontName:@"Marker Felt" fontSize:64];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 +200);
		
		// add the label as a child to this Layer
		[self addChild: label];
        
        //Menu
        //HeapSort* temp = [[HeapSort alloc] init];
        
        //[self startHeapSort:num];
        
        CCMenuItemFont *startButton = [CCMenuItemFont itemFromString:@"Start Heap" target:self selector:@selector(start:)];
		startButton.position=ccp(950,25);
        
        CCMenuItemFont *sortButton = [CCMenuItemFont itemFromString:@"Sort" target:self selector:@selector(sort:)];
		sortButton.position=ccp(750,25);
        
        CCMenu *menu = [CCMenu menuWithItems:startButton,sortButton, nil];
		[self addChild:menu];
		menu.position=ccp(0,0);
        
        
	}
	return self;
}

- (void)start:(id)sender{
    
    if(actionQueue != nil){
        [actionQueue release];
    }
    actionQueue = [[NSMutableArray alloc] init];
    
    [self createElements];
    [self startHeapSort];
    
    [self sort:self];
}

- (void)createElements{
    int num = 10;
    CGSize size = [[CCDirector sharedDirector] winSize];
    int spacing = size.width / num;
    
    int fontSize = 24;
    
    if(elements != nil){
        [elements release];
    }
    elements = [[NSMutableArray alloc] init];
    
    if(spriteElements != nil){
        
        for(CCLabelTTF* label in spriteElements){
            [self removeChild:label cleanup:YES];
            
        }
        
        [spriteElements release];
    }
    spriteElements = [[NSMutableArray alloc] init];
    
    int maxNumValue =100;
    
    
    for (int i = 0; i < num; i++){
        
        [elements addObject:[NSNumber numberWithInt:(arc4random() % maxNumValue)]];
        CCLabelTTF *label = [CCLabelTTF labelWithString:[[elements objectAtIndex:i] stringValue] fontName:@"Marker Felt" fontSize:fontSize];
        label.position = ccp( (spacing/2)*(i+1) , size.height/2 );
        [self addChild:label];
        [spriteElements addObject: label];
    }
}

- (void)startHeapSort{
    
    heapSort = [[HeapSort alloc] initWithArray:elements];
    heapSort.delegate = self;
    [heapSort run];
    
}

- (void)exchangeValues:(HeapSort *)heapSort first:(int)first second:(int)second{
 
    //exchange positions on screen
    
    CCLabelTTF *firstSprite =  [spriteElements objectAtIndex:first];
    CCLabelTTF *secondSprite =  [spriteElements objectAtIndex:second];
    
    SortAction *action = [[SortAction alloc] init];
    action.firstIndex = first;
    action.firstLocation = firstSprite.position;
    action.secondIndex = second;
    action.secondLocation = secondSprite.position;
    [actionQueue addObject:action];
    /*
                           
    CCLabelTTF *firstSprite =  [spriteElements objectAtIndex:first];
    CCLabelTTF *secondSprite =  [spriteElements objectAtIndex:second];
    CGPoint temp = firstSprite.position;
    CGPoint temp2 = secondSprite.position;
    //    [CCSequence actions:
    [firstSprite runAction:[CCMoveTo actionWithDuration:1 position:temp2]];
    [secondSprite runAction:[CCMoveTo actionWithDuration:1 position:temp]];
    */
    /*
    CCMoveTo* firstAction = [CCMoveTo actionWithDuration:1 position:secondSprite.position];
    CCMoveTo* secondAction = [CCMoveTo actionWithDuration:1 position:temp];
    
    id delay = [CCDelayTime actionWithDuration:1];
    
    [firstSprite runAction:firstAction];
    //[secondSprite runAction:secondAction];
    [secondSprite runAction:[CCSequence actions: secondAction, delay, nil]];
    //[self runAction:[CCSequence actions: [secondSprite runAction:secondAction], [firstSprite runAction:firstAction], delay, nil]];
     */
   /* 
    NSLog(@"wait");
    while (![firstAction isDone]&& ![secondAction isDone]){
        //WAIT
    
    }
    NSLog(@"done wait");
    
    */
    
    //sleep(1);
    //exchange positions in array
    //[spriteElements exchangeObjectAtIndex:first withObjectAtIndex:second];
    
}

- (void)sort:(id)sender{
    
    int jumpHeight = 100;
    
    int i=0;
    
    for (SortAction* action in actionQueue){
        
        CCLabelTTF *firstSprite =  [spriteElements objectAtIndex:action.firstIndex];
        CCLabelTTF *secondSprite =  [spriteElements objectAtIndex:action.secondIndex];
        id delay = [CCDelayTime actionWithDuration:i];
        
        //CCMoveTo* firstAction = [CCMoveTo actionWithDuration:1 position:action.secondLocation];
        //CCMoveTo* secondAction = [CCMoveTo actionWithDuration:1 position:action.firstLocation];
        ccBezierConfig bezierFirst;
        bezierFirst.controlPoint_1 = action.firstLocation;
        CGPoint p2= action.secondLocation;
        CGPoint p1= action.firstLocation;

        
        
        bezierFirst.controlPoint_2 = ccp(abs(p2.x + p1.x)/2 , p2.y + jumpHeight);
        bezierFirst.endPosition = action.secondLocation;
           
        ccBezierConfig bezierSecond;
        bezierSecond.controlPoint_1 = action.secondLocation;

        
        bezierSecond.controlPoint_2 = ccp(abs(p1.x + p2.x)/2, p1.y + jumpHeight);
        bezierSecond.endPosition =action.firstLocation;
        
        CCBezierTo* firstAction = [CCBezierTo actionWithDuration:1 bezier:bezierFirst];
        CCBezierTo* secondAction = [CCBezierTo actionWithDuration:1 bezier:bezierSecond];
        
        /*
        [firstSprite runAction:[CCMoveTo actionWithDuration:1 position:action.secondLocation]];
        [secondSprite runAction:[CCMoveTo actionWithDuration:1 position:action.firstLocation]];
        */
        [firstSprite runAction:[CCSequence actions: delay, firstAction, nil]];
        [secondSprite runAction:[CCSequence actions: delay, secondAction, nil]];

        [spriteElements exchangeObjectAtIndex:action.firstIndex withObjectAtIndex:action.secondIndex];
        i++;
    }
    
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
