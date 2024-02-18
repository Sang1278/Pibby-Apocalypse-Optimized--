function onCreate()
{
    place = new flixel.FlxSprite(-600, -300);
    place.loadGraphic(retrieveAsset('images/bgnoherofull', 'image'));
    place.scale.set(4, 4);
    place.updateHitbox();
    place.antialiasing = ClientPrefs.globalAntialiasing;
    add(place);

    placeog = new flixel.FlxSprite(-600, -300);
    placeog.loadGraphic(retrieveAsset('images/place', 'image'));
    placeog.scale.set(4, 4);
    placeog.updateHitbox();
    placeog.antialiasing = ClientPrefs.globalAntialiasing;
    placeog.visible = false;
    add(placeog);
}

function onCreatePost()
{
  PlayState.pibbyHealthbar.x += 140;
  PlayState.pibbyHealthbar.y += 15;
  PlayState.pibbyHealthbar.scale.set(2.5, 2.5);
  if (!ClientPrefs.shaders) PlayState.pibbyHealthbar.color = PlayState.boyfriendColor;
  PlayState.noHeroIntro.scale.set(4, 4);
  PlayState.noHeroIntro.screenCenter();
  PlayState.noHeroIntro.y -= 190;
}

function onStepHit(curStep)
{
    if (curStep == 464)
    {
        place.visible = false;
        placeog.visible = true;
    }

    if (curStep == 592)
    {
        placeog.visible = false;
        place.visible = true;
    }
}