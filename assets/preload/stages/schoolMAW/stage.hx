
// MAW

var background;
var wall;
var ch1;
var ch2;
var ch3;
var daGloop5;
//PENNY MY BELOVED - schweizer
var penny;

// SHADERS GRAH!!!!!! - jason 
var pixel;

var void;
//var house;
var rock;
var wtf;
//var glitch;
var stupidFix;

var charColors = [0xff969494, 0xBFE5BA]; // default, glitch part
//var houseColors = [0x8f8f8f, 0x9ADA91]; // also with rock3 and rock4
var rockColors = [0xbababa, 0xB8D4B5]; // only for the rock the characters are on
var coolThingColors = [0xc4c0c0, 0xC1CEAA]; // wtf - forgor, 2023

function onCreate()
{
   pixel = new FlxRuntimeShader(RuntimeShaders.pixel, null, 100);
   pixel.setFloat('size', 3);
   
// school
    background = new flixel.FlxSprite(0, 0);
    background.loadGraphic(retrieveAsset('images/Ilustracion_sin_titulo-1', 'image'));
    background.scale.set(3.46, 3.46);
    background.antialiasing = ClientPrefs.globalAntialiasing;
    background.scrollFactor.set(1, 1);
    background.updateHitbox();

    if (!ClientPrefs.lowQuality)
    {
    wall = new flixel.FlxSprite(-200, 200);
    wall.loadGraphic(retrieveAsset('images/Ilustracion_sin_titulo-2', 'image'));
    wall.scale.set(29.3, 29.3);
    wall.antialiasing = ClientPrefs.globalAntialiasing;
    wall.scrollFactor.set(1, 1);
    wall.updateHitbox();
    }
    
// channels
    ch1 = new flixel.FlxSprite(100, 150);
    ch1.loadGraphic(retrieveAsset('images/channels/chn1', 'image'));
    ch1.setGraphicSize(Std.int(ch1.width * 4));
    ch1.antialiasing = ClientPrefs.globalAntialiasing;
    ch1.scrollFactor.set(1, 1);
    ch1.updateHitbox();

    ch2 = new flixel.FlxSprite(125, -20);
    ch2.loadGraphic(retrieveAsset('images/channels/chn2', 'image'));
    ch2.setGraphicSize(Std.int(ch2.width * 4));
    ch2.antialiasing = ClientPrefs.globalAntialiasing;
    ch2.scrollFactor.set(1, 1);
    ch2.updateHitbox();

    ch3 = new flixel.FlxSprite(100, 150);
    ch3.loadGraphic(retrieveAsset('images/channels/chn3', 'image'));
    ch3.setGraphicSize(Std.int(ch1.width * 4));
    ch3.antialiasing = ClientPrefs.globalAntialiasing;
    ch3.scrollFactor.set(1, 1);
    ch3.updateHitbox();
    ch3.scale.x += 0.2; // just in case....
    
// school other 

    if (!ClientPrefs.lowQuality)
    {
        daGloop = new flixel.FlxSprite();
        daGloop.x = 750;
        daGloop.y = 400;
        daGloop.scale.set(3.46, 3.46);
        daGloop.frames = retrieveAsset('images/topgoop', 'atlas');
        daGloop.animation.addByPrefix('topey', 'gooey', 3, true);
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
    }
// the void
    void = new flixel.FlxSprite(0, -200);
    void.frames = retrieveAsset('images/void/void', 'atlas');
    void.animation.addByPrefix('idle', 'idle', 24, true);
    void.animation.play('idle');
    void.scale.set(6.8, 6.8);
    void.antialiasing = ClientPrefs.globalAntialiasing;
    void.scrollFactor.set(0.6, 0.6);
    void.updateHitbox();  

    rock = new flixel.FlxSprite(0, -200);
    rock.loadGraphic(retrieveAsset('images/void/Ilustracion_sin_titulo-3', 'image'));
    rock.scale.set(5, 5);
    rock.antialiasing = ClientPrefs.globalAntialiasing;
    rock.scrollFactor.set(1, 1);
    rock.updateHitbox();
    rock.color = rockColors[0];

        wtf = new flixel.FlxSprite(0, -200);
        wtf.loadGraphic(retrieveAsset('images/void/Ilustracion_sin_titulo-7', 'image'));
        wtf.scale.set(10, 10);
        wtf.antialiasing = ClientPrefs.globalAntialiasing;
        wtf.scrollFactor.set(1, 1);
        wtf.updateHitbox();
        wtf.color = coolThingColors[0];
    

     //tweenLoopAngle(house, 4, -4, 6, 6);
     tweenLoopAngle(rock, -0.5, 0.5, 2.5, 2.5);
     tweenLoopAngle(wtf, 2, -2, 5, 5);

 

  stupidFix = FlxTween.tween(wtf, {y: wtf.y}, 1);

     add(background);
     if (!ClientPrefs.lowQuality) add(daGloop5);
     if (!ClientPrefs.lowQuality) add(penny);
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
    
    PlayState.dad.x = 250;
    PlayState.dad.y = 450;
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
                if (!ClientPrefs.lowQuality) 
                {
                wall.alpha = 0.0001;
                daGloop.alpha = 0.0001;
                daGloop5.alpha = 0.0001;
                }                              
            }
             else if (value1 == 'off')
            {
                if (!ClientPrefs.lowQuality)
                {
                wall.alpha = 1;
                daGloop.alpha = 1;
                daGloop5.alpha = 1;
                } 
            }
        }
    }


function onStepHit(curStep:Int)
    {
        if (curStep == 2144)
            {
                PlayState.triggerEventNote('Camera Follow Pos', '940', '720');
                if (!ClientPrefs.lowQuality) wall.visible = false;                 
                background.visible = false; 
                if (!ClientPrefs.lowQuality) daGloop.visible = false;
                if (!ClientPrefs.lowQuality) daGloop5.visible = false;                             
                if (!ClientPrefs.lowQuality) penny.visible = false;
                add(ch1);
                PlayState.gf.y = 720;
                PlayState.gf.x += 70;
            }
        if (curStep == 2176)
            {
                ch1.visible = false;
                add(ch2);
            }
        if (curStep == 2208)
            {
                ch2.visible = false;
                add(ch3);
            }
        if (curStep == 2272)
            {
                ch3.visible = false;
                ch1.visible = true;
            }
        if (curStep == 2304)
            {
                ch1.visible = false;
                ch2.visible = true;
            }
        if (curStep == 2336)
            {
                ch2.visible = false;
                ch3.visible = true;
            }
        if (curStep == 2400)
            {
                ch3.visible = false;
                ch1.visible = true;
            }
        if (curStep == 2432)
            {
                ch1.visible = false;
                ch2.visible = true;
            }
        if (curStep == 2464)
            {
                ch2.visible = false;
                ch3.visible = true;
            }
        if (curStep == 2528)
            {
                ch3.visible = false;
                ch1.visible = true;
            }
        if (curStep == 2560)
            {
                ch1.visible = false;
                ch2.visible = true;
            }
        if (curStep == 2592)
            {
                ch2.visible = false;
                ch3.visible = true;
            }
        if (curStep == 2604)
            {
                ch3.visible = false;
                ch1.visible = true;
            }
        if (curStep == 2624)
            {
                ch1.visible = false;
                ch2.visible = true;
            }
        if (curStep == 2632)
            {
                ch2.visible = false;
                ch3.visible = true;
            }
        if (curStep == 2640)
            {
                ch3.visible = false;
                ch1.visible = true;
            }
        if (curStep == 2648)
            {
                ch1.visible = false;
                ch2.visible = true;
            }
        if (curStep == 2656)
            {
                PlayState.triggerEventNote('Camera Follow Pos', '', '');
                ch2.visible = false;
                ch3.visible = true;
            }
        if (curStep == 2688)
            {
                add(void);                                          
                add(rock);
                add(wtf);

                ch1.visible = false;
                ch2.visible = false;
                ch3.visible = false;
                PlayState.gf.x = 1670;
                PlayState.gf.y = 900;
                PlayState.dad.x = 900;
                PlayState.dad.y = 740;
                PlayState.boyfriend.x = 1570;
                PlayState.boyfriend.y = 800;
                PlayState.boyfriend.color = charColors[0];
                PlayState.dad.color = charColors[0];
                PlayState.gf.color = charColors[0];
            }
    }

function tweenLoopAngle(varx, distance1, distance2, duration1, duration2) {
    FlxTween.tween(varx, {angle: distance1}, duration1, {
        ease: FlxEase.sineInOut,
        onComplete: 
        function (twn:FlxTween)
            {
                FlxTween.tween(varx, {angle: distance2}, duration2, {
                    ease: FlxEase.sineInOut,
                    onComplete: 
                    function (twn:FlxTween)
                        {
                            tweenLoopAngle(varx, distance1, distance2, duration1, duration2);
                        }
                });
            }
    });
}

function onPause() {
     stupidFix.active = false;
}

function onResume() {
     stupidFix.active = true;
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
function goodNoteHit(note) {
if (!ClientPrefs.shaders) PlayState.pibbyHealthbar.color = PlayState.scoreTxt.color;
}    
     