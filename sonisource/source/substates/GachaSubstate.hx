package substates;

class GachaSubstate extends MusicBeatSubstate
{
    var bolagacha:FlxSprite;
    var recompenza:FlxSprite;
    var bg:FlxSprite;
    var onCoso:Bool = false;
    var ended:Bool = false;

    var xB:Int = 460;
    var yB:Int = 200;
    override function create()
        {
            bolagacha = new FlxSprite(890, 580).loadGraphic(Paths.image('tienda/maquina/gacha'));
            bolagacha.scale.set(0.1,0.1);
            add(bolagacha);

            bg = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
            bg.alpha = 0.0;
            add(bg);

            FlxTween.tween(bolagacha, { y: yB }, 1, {ease: FlxEase.backInOut});
            FlxTween.tween(bolagacha, { x: xB }, 1, {ease: FlxEase.backInOut});
            FlxTween.tween(bolagacha.scale, { x: 0.5, y: 0.5 }, 1, {ease: FlxEase.backInOut});
            FlxTween.tween(bg, { alpha: 0.5 }, 1);
            new FlxTimer().start(1, function(tmr:FlxTimer)
                {
                    onCoso = true;
                });

            super.create();
        }

    override function update(elapsed:Float)
        {
            bolagacha.updateHitbox();
            if (onCoso == true)
                {
                    if (FlxG.mouse.overlaps(bolagacha)) {
                        bolagacha.x = xB + FlxG.random.int(-2, 2);
                        bolagacha.y = yB + FlxG.random.int(-2, 2);
                        if (FlxG.mouse.justPressed)
                            {
                                onCoso = false;
                                cutsene();
                            }
                    } else {
                        bolagacha.x = xB;
                        bolagacha.y = yB;
                    }                    
                }

            if (ended)
                {
                    if (controls.BACK || controls.ACCEPT)
                        {
                            FlxG.sound.play(Paths.sound('cancelMenu'));
                            close();
                        }
                }
            super.update(elapsed);
        }

    var weablanca:FlxSprite;
    function cutsene()
        {
            weablanca = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
            weablanca.alpha = 0;
            add(weablanca);
            FlxG.sound.music.fadeOut();
            FlxTween.tween(weablanca, { alpha: 1 }, 7);
            new FlxTimer().start(8, function(tmr:FlxTimer)
                {
                    recompensa();
                });
        }

    function recompensa()
        {
            FlxTween.tween(weablanca, { alpha: 0 }, 0.5);
            remove(bolagacha);
            ended = true;
            FlxG.sound.music.fadeIn(1, 0, 0.7);
        }
}