::ModSpecialistSkillsRework.HooksMod.hook("scripts/entity/tactical/actor", function ( q )
{
	q.calculateSpecialistBonus <- function( _stat, _specialistWeapon = false)
	{
		if (_specialistWeapon)
		{
			return _stat
		}
		local dc;
		if (::ModSpecialistSkillsRework.Mod.ModSettings.getSetting("SSUStyle").getValue())
		{
			if (this.isPlayerControlled())
			{
				dc = this.getDaysWithCompany();
			}
		
			dc = this.Math.floor(dc / 7);
			return this.Math.floor(0.01 * this.Math.min(5 * dc + 25, 100) * _stat);
		}
		else
		{
			return this.Math.floor((this.Math.min(11, this.getLevel()) - 1) * 0.1 * _stat);
		}
	}
});
