// ====================================================================
// Tag.
// ====================================================================

class Tag extends xDeathMatch;

// Very simple PostBeginPlay, taken from MutBigHeads and modified a bit.
function PostBeginPlay()
{
	local TagRules G;
	
	Super.PostBeginPlay();

	G = spawn(class'TagRules');
    G.TagGame = self;

	if ( Level.Game.GameRulesModifiers == None )
		Level.Game.GameRulesModifiers = G;
	else    
		Level.Game.GameRulesModifiers.AddGameRules(G);
}	

defaultproperties
{
  Acronym="T"
  DecoTextName="Lf94TagGame.Tag"
  Description="Best combined with Zoom/Instagib and Super Berserker mutators. Like this mod? Send a request to ircsurfer33@gmail.com"
  GameName="Laser Tag"
}