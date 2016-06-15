//=============================================================================
// TagRules.
//=============================================================================
class TagRules extends GameRules
	placeable;


var Tag TagGame;

// Do not call any other NetDamage rules, because we never want the player to be hurt.
function int NetDamage (int OriginalDamage, int Damage, Pawn injured, Pawn instigatedBy, vector HitLocation, out vector Momentum, class<DamageType> DamageType) {

    local Controller killer;
	killer = instigatedBy.Controller;
    
	// Increment the score by 1 and fire an event to notify anything else
	killer.PlayerReplicationInfo.Score += 1;
    TagGame.ScoreEvent(killer.PlayerReplicationInfo, 1, "tag");
	
	// Check the score after being hit
	if (killer != None) {
        TagGame.CheckScore(killer.PlayerReplicationInfo);
    }
	
    // Do no damage to players.
    return 0;
}
