::ModSpecialistSkillsRework.HooksMod.hook("scripts/skills/actives/reload_bolt", function ( q )
{
	q.onAfterUpdate = @( __original ) function( _properties )
	{
		__original( _properties );
		if (_properties.isInventorSpecialist)
		{
			this.m.ActionPointCost -= 1;
		}
	}
});