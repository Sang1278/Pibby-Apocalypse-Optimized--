var dadCamZoom = -1;
var coolStep = 0; // rare ass fix

function onCreate()
{
    

    bg = new flixel.FlxSprite(-800, -800);
    bg.loadGraphic(retrieveAsset('images/back', 'image'));
    bg.scale.set(7.2, 7.2);
    bg.antialiasing = ClientPrefs.globalAntialiasing;
    bg.updateHitbox();
    bg.alpha = 0.0001;


    revealBackground = new flixel.FlxSprite(750, 1500);
    revealBackground.loadGraphic(retrieveAsset('images/reveal/realBackground', 'image'));
    //revealBackground.scale.set(4, 4);
    revealBackground.setGraphicSize(Std.int(revealBackground.width * 4));
    revealBackground.updateHitbox(); 
    revealBackground.alpha = 0;       

    outside = new flixel.FlxSprite(1480, 1900);
    outside.loadGraphic(retrieveAsset('images/intro/IMG_8337', 'image'));
    outside.setGraphicSize(Std.int(outside.width * 3.5));
    outside.updateHitbox();
           
    revealBackground.y += 475;
    revealBackground.x += 675;
    
        
    add(bg);
    
    add(revealBackground);
    add(outside);
        
}

function onMoveCamera(focus:String)
{
    if(dadCamZoom != -1){   // chat why are we doing that -1 check again -jason
        if (focus == 'dad') 
            PlayState.defaultCamZoom = dadCamZoom;
        else
            PlayState.defaultCamZoom = dadCamZoom + 0.2;
    }
}
function onCreatePost()
{
  
}
function onStepHit(curStep:Int)
    {
        coolStep = curStep;

        if (curStep == 1535) {
            outside.alpha = 1;                                      
            bg.alpha = 0;            
            dadCamZoom = 0.9;
        }else if (curStep == 1648)
        {
            outside.alpha = 0;                                              

            dadCamZoom = 0.85;
        }else if (curStep == 628)
        {
            outside.alpha = 0;    
            revealBackground.alpha = 1;                             
            bg.alpha = 0;            
            dadCamZoom = 0.85;
        }else if (curStep == 896) {
            dadCamZoom = 0.6;
            revealBackground.alpha = 0;           
            bg.alpha = 1;
        }else if (curStep == 1536)
            dadCamZoom = 0.8;
        else if (curStep == 1648) {
        revealBackground.alpha = 1;
        }
        else if (curStep == 1664) {
            dadCamZoom = 0.6;
          revealBackground.alpha = 0;      
            
            bg.alpha = 1;
            
        }
    }

function onBeatHit(curBeat:Int)
{    
}