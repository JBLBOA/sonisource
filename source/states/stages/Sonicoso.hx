package states.stages;

class Sonicoso extends BaseStage
{
    override function create()
        {
            var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('bgs/soni/Fondo'));
            bg.scale.set(2.0,2.0);
            add(bg);

            var a1:FlxSprite = new FlxSprite().loadGraphic(Paths.image('bgs/soni/Arboles'));
            a1.scale.set(2.0,2.0);
            add(a1);

            var a2:FlxSprite = new FlxSprite(930, 300).loadGraphic(Paths.image('bgs/soni/Arboles2'));
            a2.scale.set(2.0,2.0);
            add(a2);

            var f2:FlxSprite = new FlxSprite(230,435).loadGraphic(Paths.image('bgs/soni/Flores2'));
            f2.scale.set(2.0,2.0);
            add(f2);

            var piso:FlxSprite = new FlxSprite(0, 950).loadGraphic(Paths.image('bgs/soni/Cesped'));
            piso.scale.set(2.0,2.0);
            add(piso);

            var f1:FlxSprite = new FlxSprite(110, 520).loadGraphic(Paths.image('bgs/soni/Flores'));
            f1.scale.set(2.3,2.3);
            add(f1);
        }

    override function createPost()
        {
            var eso:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('bgs/soni/eso'));
            eso.scale.set(2.3,2.3);
            eso.scrollFactor.set(0,0);
            add(eso);

            var a3:FlxSprite = new FlxSprite(-90, 0).loadGraphic(Paths.image('bgs/soni/Arboles3'));
            a3.scale.set(1.9,2);
            a3.scrollFactor.set(0.5,0.5);
            add(a3);
        }
}