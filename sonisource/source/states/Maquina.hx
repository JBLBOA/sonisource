package states;

import substates.GachaSubstate;

class Maquina extends MusicBeatState
{
    var manija:FlxSprite;
    var moneda:FlxSprite;
    var manijeando:Bool = false;
    override function create()
        {
            FlxG.mouse.visible = true;

            var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('tienda/bg'));
            add(bg);

            var negrito:FlxSprite = new FlxSprite(0, 200);
            negrito.frames = Paths.getSparrowAtlas('tienda/POSE2N');
			negrito.animation.addByPrefix('pose2', "POSE 2 instancia", 24);
			negrito.animation.play('pose2');
			add(negrito);

            var bolas:FlxSprite = new FlxSprite(640, 300).loadGraphic(Paths.image('tienda/maquina/BOLAS'));
            add(bolas);

            var maquinita:FlxSprite = new FlxSprite(570, -80).loadGraphic(Paths.image('tienda/maquina/MAQUINA'));
            add(maquinita);

            moneda = new FlxSprite(790, -300).loadGraphic(Paths.image('tienda/maquina/moneda'));
            moneda.scale.set(0.5, 0.5);
            moneda.alpha = 1;
            add(moneda);

            manija = new FlxSprite(874, 585).loadGraphic(Paths.image('tienda/maquina/MANIJA'));
            add(manija);

            var texto:FlxSprite = new FlxSprite(0, 330);
            texto.frames = Paths.getSparrowAtlas('tienda/TEXTO');
			texto.animation.addByPrefix('idle', "TEXTO instancia", 24);
			texto.animation.play('idle');
			add(texto);

            super.create();
        }

    var moviendose:Bool = false;
    var vueltas:Int = 0;

    override function update(elapsed:Float)
        {
            if (FlxG.mouse.overlaps(manija) && FlxG.mouse.justPressed && !manijeando)
                {
                    FlxTween.tween(moneda, { y: 100 }, 0.5, {ease: FlxEase.backInOut});
                    trace("en cutsene");

                    new FlxTimer().start(1, function(tmr:FlxTimer)
                        {
                            FlxTween.tween(moneda, { y: 450 }, 0.5, {ease: FlxEase.backInOut});
                            FlxTween.tween(moneda, { alpha: 0 }, 0.3);
                            new FlxTimer().start(0.5, function(tmr:FlxTimer)
                                {
                                    moneda.y = -300;
                                    moneda.alpha = 1;
                                    manijeando = true;
                                });
                        });
                }

            if (FlxG.mouse.overlaps(manija) && FlxG.mouse.justPressed && manijeando && vueltas < 4 && !moviendose)
                {
                    moviendose = true;
                    FlxTween.tween(manija, { angle: manija.angle + 90 }, 0.5, {onComplete: function(tmr:FlxTween)
                        {
                            moviendose = false;
                            trace("vueltas: "+vueltas);
                            vueltas += 1;
                        }});
                }

            if (vueltas == 4)
                {
                    openSubState(new GachaSubstate());
                    manijeando = false;
                    vueltas = 0;
                }
    
            super.update(elapsed);
        }
}