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
#import "MergeSort.h"
#import "SortAction.h"


// HelloWorldLayer implementation
@implementation HelloWorldLayer

@synthesize heapSort;
@synthesize mergeSort;
@synthesize bubbleSort;
@synthesize selectionSort;
@synthesize insertionSort;

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
        
        // ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        if (size.width == 1024) {
            //IPAD
            titleFontSize = 64;
            fontSize = 24;
            resOffset = 0.9;
            
            
        }else{
            //iPhone
            titleFontSize = 24;
            fontSize = 16;
            resOffset = 0.9;
        }
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Sort It" fontName:@"Marker Felt" fontSize:titleFontSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height * resOffset );
        NSLog(@"height: %f", size.height );
        NSLog(@"width: %f", size.width ); 
        
       
		
		// add the label as a child to this Layer
		[self addChild: label];
        
        //Menu Buttons
        /*
        CCMenuItemFont *startButton = [CCMenuItemFont itemFromString:@"Start Heap" target:self selector:@selector(start:)];
		startButton.position=ccp(950,25);
        
        //Menu
        CCMenu *menu = [CCMenu menuWithItems:startButton, nil];
		
        [self addChild:menu];
        */
        
        CCLabelTTF *sort1 = [CCLabelTTF labelWithString:@"Heap Sort" fontName:@"Marker Felt" fontSize:titleFontSize];
        CCLabelTTF *sort2 = [CCLabelTTF labelWithString:@"Bubble Sort" fontName:@"Marker Felt" fontSize:titleFontSize];
        CCLabelTTF *sort3 = [CCLabelTTF labelWithString:@"Selection Sort" fontName:@"Marker Felt" fontSize:titleFontSize];
        CCLabelTTF *sort4 = [CCLabelTTF labelWithString:@"Insertion Sort" fontName:@"Marker Felt" fontSize:titleFontSize];
        
        CCMenuItemFont *menuItem1 = [CCMenuItemLabel itemWithLabel:sort1 target:self selector:@selector(startHeapSort:) ];
        CCMenuItemFont *menuItem2 = [CCMenuItemLabel itemWithLabel:sort2 target:self selector:@selector(startBubbleSort:)];
        CCMenuItemFont *menuItem3 = [CCMenuItemLabel itemWithLabel:sort3 target:self selector:@selector(startSelectionSort:)];
        CCMenuItemFont *menuItem4 = [CCMenuItemLabel itemWithLabel:sort4 target:self selector:@selector(startInsertionSort:)];
    
        
        menu = [CCMenu menuWithItems:menuItem1, menuItem2, menuItem3, menuItem4,nil];
        [menu alignItemsVertically];
        //menu.scale = 2;
        [self addChild:menu];
    
		menu.position=ccp(size.width /2 ,size.height /2);
        
        CCLabelTTF *doneLabel = [CCLabelTTF labelWithString:@"Done" fontName:@"Marker Felt" fontSize:titleFontSize];
        CCMenuItemFont *doneButton = [CCMenuItemLabel itemWithLabel:doneLabel target:self selector:@selector(doneButton:)];


        doneMenu = [CCMenu menuWithItems:doneButton, nil];
        [self addChild:doneMenu];
        doneMenu.visible = FALSE;
        doneMenu.position=ccp(size.width * .1 ,size.height *.1);

	}
    
	return self;
}

- (void)start:(id)sender{
    
    if(actionQueue != nil){
        [actionQueue release];
    }
    actionQueue = [[NSMutableArray alloc] init];
    
    [self createElements];
    //[self startHeapSort];
    
    /*
    bubbleSort = [[BubbleSort alloc] initWithArray:elements];
    bubbleSort.delegate = self;
    [bubbleSort run];
    */
    /*
    selectionSort = [[SelectionSort alloc] initWithArray:elements];
    selectionSort.delegate = self;
    [selectionSort run];
     */
    
    insertionSort = [[InsertionSort alloc] initWithArray:elements];
    insertionSort.delegate = self;
    [insertionSort run];
    
    /*
    mergeSort = [[MergeSort alloc] initWithArray:elements];
    mergeSort.delegate = self;
    [mergeSort run];
    */
    
    
    //[heapSort run];
    
    [self sort:self];
}

- (void)doneButton:(id)sender{

    doneMenu.visible = FALSE;
    menu.visible = TRUE;
    
}


- (void)startHeapSort:(id)sender{
    
    if(actionQueue != nil){
        [actionQueue release];
    }
    actionQueue = [[NSMutableArray alloc] init];
    
    menu.visible = FALSE;
    doneMenu.visible = TRUE;
    
    [self createElements];
    
    heapSort = [[HeapSort alloc] initWithArray:elements];
    heapSort.delegate = self;
    [heapSort run];
    
    [heapSort release];
    
    [self sort:self];
    
}

- (void)startInsertionSort:(id)sender{
    
    if(actionQueue != nil){
        [actionQueue release];
    }
    actionQueue = [[NSMutableArray alloc] init];
    
    menu.visible = FALSE;
    doneMenu.visible = TRUE;
    
    [self createElements];
    
    insertionSort = [[InsertionSort alloc] initWithArray:elements];
    insertionSort.delegate = self;
    [insertionSort run];
    
    [insertionSort release];
    
    [self sort:self];
    
}

- (void)startBubbleSort:(id)sender{
    
    if(actionQueue != nil){
        [actionQueue release];
    }
    actionQueue = [[NSMutableArray alloc] init];
    
    menu.visible = FALSE;
    doneMenu.visible = TRUE;
    
    [self createElements];
    
    bubbleSort = [[BubbleSort alloc] initWithArray:elements];
    bubbleSort.delegate = self;
    [bubbleSort run];
    
    [bubbleSort release];
    
    [self sort:self];
    
}

- (void)startSelectionSort:(id)sender{
    
    if(actionQueue != nil){
        [actionQueue release];
    }
    actionQueue = [[NSMutableArray alloc] init];
    
    menu.visible = FALSE;
    doneMenu.visible = TRUE;
    
    [self createElements];
    
    selectionSort = [[SelectionSort alloc] initWithArray:elements];
    selectionSort.delegate = self;
    [selectionSort run];
    
    [selectionSort release];
    
    [self sort:self];
    
}

- (void)createElements{
    int num = 10;
    CGSize size = [[CCDirector sharedDirector] winSize];
    int spacing = size.width / num;
    
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
        label.position = ccp( ((spacing)*(i))+(spacing/2) , size.height/2 );
        [self addChild:label];
        [spriteElements addObject: label];
        
    }

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
    
}

- (void)mergeItems:(MergeSort *)mergeSort first:(int)first second:(int)second{
    
    //exchange positions on screen
    
    CCLabelTTF *firstSprite =  [spriteElements objectAtIndex:first];
    CCLabelTTF *secondSprite =  [spriteElements objectAtIndex:second];
    
    SortAction *action = [[SortAction alloc] init];
    action.firstIndex = first;
    action.firstLocation = firstSprite.position;
    action.secondIndex = second;
    action.secondLocation = secondSprite.position;
    [actionQueue addObject:action];
    
}

- (void)divideAndMergeItems:(MergeSort *)mergeSort a:(NSMutableArray*)a b:(NSMutableArray*)b lo:(int)lo hi:(int)hi {
 
    //sort low to mid
    //Create new level
        
    //sort mid to high
    //Create new level
    
    //Merge and delete layer
}

- (void)exchangeItemsBubble:(BubbleSort *)bubbleSort first:(int)first second:(int)second{
    
    CCLabelTTF *firstSprite =  [spriteElements objectAtIndex:first];
    CCLabelTTF *secondSprite =  [spriteElements objectAtIndex:second];
    
    SortAction *action = [[SortAction alloc] init];
    action.firstIndex = first;
    action.firstLocation = firstSprite.position;
    action.secondIndex = second;
    action.secondLocation = secondSprite.position;
    [actionQueue addObject:action];
    
}


- (void)exchangeItemsSelection:(SelectionSort *)selectionSort first:(int)first second:(int)second{
    
    CCLabelTTF *firstSprite =  [spriteElements objectAtIndex:first];
    CCLabelTTF *secondSprite =  [spriteElements objectAtIndex:second];
    
    SortAction *action = [[SortAction alloc] init];
    action.firstIndex = first;
    action.firstLocation = firstSprite.position;
    action.secondIndex = second;
    action.secondLocation = secondSprite.position;
    [actionQueue addObject:action];
    
}

- (void)exchangeItemsInsertion:(InsertionSort *)insertionSort first:(int)first second:(int)second{
    
    CCLabelTTF *firstSprite =  [spriteElements objectAtIndex:first];
    CCLabelTTF *secondSprite =  [spriteElements objectAtIndex:second];
    
    SortAction *action = [[SortAction alloc] init];
    action.firstIndex = first;
    action.firstLocation = firstSprite.position;
    action.secondIndex = second;
    action.secondLocation = secondSprite.position;
    [actionQueue addObject:action];
    
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
