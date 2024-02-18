
// CHILD'S PLAY 

var background;
var background2;
var wall;

//PENNY MY BELOVED - schweizer
var penny;

// SHADERS GRAH!!!!!! - jason 
var pixel;

function onCreate()
{
    background = new flixel.FlxSprite(0, 0);
    background.loadGraphic(retrieveAsset('images/Ilustracion_sin_titulo-1', 'image'));
    background.setGraphicSize(Std.int(background.width * 3.46));
    background.antialiasing = ClientPrefs.globalAntialiasing;
    background.scrollFactor.set(1, 1);
    background.updateHitbox();

    pixel = new flixel.addons.display.FlxRuntimeShader(RuntimeShaders.pixel, null, 100);
    pixel.setFloat('size', 10);

    if (!ClientPrefs.lowQuality)
    {
        
        daGloop = new flixel.FlxSprite();
        daGloop.x = 750;
        daGloop.y = 400;
        daGloop.scale.set(3.46, 3.46);
        daGloop.frames = retrieveAsset('images/topgoop', 'atlas');
        daGloop.animation.addByPrefix('topey', 'gooey', 3, false);
        if(ClientPrefs.shaders) daGloop.shader = pixel;
        
        daGloop5 = new flixel.FlxSprite();
        daGloop5.x = 750;
        daGloop5.y = 400;
        daGloop5.scale.set(3.46, 3.46);        
        daGloop5.frames = retrieveAsset('images/sinkgoop', 'atlas');
        daGloop5.animation.addByPrefix('sinkey', 'gooey', 3, true);
        if (ClientPrefs.shaders) daGloop5.shader = pixel;
        
        penny = new flixel.FlxSprite();
        penny.x = 1000;
        penny.y = 400;
        penny.scale.set(2.6, 2.6);
        penny.frames = retrieveAsset('images/penny', 'atlas');
        penny.animation.addByPrefix('idle', 'idle', 6, true);

        wall = new flixel.FlxSprite(-200, 200);
        wall.loadGraphic(retrieveAsset('images/Ilustracion_sin_titulo-2', 'image'));
        wall.setGraphicSize(Std.int(wall.width * 29.3));
        wall.antialiasing = ClientPrefs.globalAntialiasing;
        wall.scrollFactor.set(1, 1);
        wall.updateHitbox();   
    }

    add(background);    
    if (!ClientPrefs.lowQuality) foreground.add(wall);
    if (!ClientPrefs.lowQuality) foreground.add(daGloop);
    

}

function onCreatePost()
{
  PlayState.pibbyHealthbar.x += 140;
  PlayState.pibbyHealthbar.y += 15;
  PlayState.pibbyHealthbar.scale.set(2.5, 2.5);
  if (!ClientPrefs.shaders) PlayState.pibbyHealthbar.color = PlayState.boyfriendColor;
}

function onSongStart()
{
    PlayState.scoreTxt.x -= 140;
    PlayState.camZooming = true;
}

function onMoveCamera(focus:String)
    {
        if (focus == 'dad')
            PlayState.defaultCamZoom = 1.2;
        else
            PlayState.defaultCamZoom = 0.9;
    }

function onEvent(event:String, value1:String, value2:String)
    {
     if (event == 'Apple Filter')
        {
             if (value1 == 'on') 
            {
                if (!ClientPrefs.lowQuality) wall.alpha = 0.0001;
        
            }
             else if (value1 == 'off')
            {
                if (!ClientPrefs.lowQuality) wall.alpha = 1;
              
            }
        }
    }

function onUpdate()
    {
        if (PlayState.dad.curCharacter == 'gumball')
                {
                    PlayState.dad.x = 250;
                    PlayState.dad.y = 450;
                }
        else
                {
                    PlayState.dad.x = 350;
                    PlayState.dad.y = 650;
                }
    }

function onStepHit(curStep:Int)
    {
        if (curStep == 392)
            {
                 if (!ClientPrefs.lowQuality) add(daGloop5);
                 if (!ClientPrefs.lowQuality) add(penny);
               
            }
    }

//thanks for da code
function onBeatHit(curBeat:Int)
    {
        if (curBeat % 1 == 0)
            doGoo();
        if (curBeat % 1 == 0)
            ponny();
    }


function doGoo()
    {
        if (!ClientPrefs.lowQuality) daGloop5.animation.play('sinkey');
        if (!ClientPrefs.lowQuality) daGloop.animation.play('topey');
    }

function ponny()
    {
        if (!ClientPrefs.lowQuality) penny.animation.play('idle');
    }