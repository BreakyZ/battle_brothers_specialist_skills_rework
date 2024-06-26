::ModSpecialistSkillsRework.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_woodaxe_skill", function ( q )
{
	q.onUpdate = @( __original ) function( _properties )
	{
		local actor = this.getContainer().getActor();
		local item = actor.getMainhandItem();
		local specialistWeapon = false

		switch (true) 
		{
			case item == null:
				return;
			case !item.isWeaponType(this.Const.Items.WeaponType.Axe):
				return;
			case item.getID() == "weapon.woodcutters_axe" || item.getID() == "weapon.legend_saw":
				specialistWeapon = true;
		}

		if (item.isWeaponType(this.Const.Items.WeaponType.Throwing))
		{
			_properties.RangedSkill += actor.calculateSpecialistBonus(12, specialistWeapon);
		}
		else
		{
			_properties.MeleeSkill += actor.calculateSpecialistBonus(12, specialistWeapon);
		}

		if (actor.getCurrentProperties().IsSpecializedInAxes)
		{
			_properties.DamageRegularMin += actor.calculateSpecialistBonus(6, specialistWeapon);
			_properties.DamageRegularMax += actor.calculateSpecialistBonus(16, specialistWeapon);
		}
	}
});
