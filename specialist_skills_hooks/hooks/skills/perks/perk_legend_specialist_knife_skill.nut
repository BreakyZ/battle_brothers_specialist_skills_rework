::ModSpecialistSkillsRework.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_knife_skill", function ( q )
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
			case !item.isWeaponType(this.Const.Items.WeaponType.Dagger):
				return;
			case item.getID() == "weapon.knife" || item.getID() == "weapon.legend_shiv":
				specialistWeapon = true;
		}

		_properties.MeleeSkill += actor.calculateSpecialistBonus(12, specialistWeapon);
		_properties.DamageDirectMult += 0.01 * actor.calculateSpecialistBonus(40, specialistWeapon);

		if (actor.getCurrentProperties().IsSpecializedInDaggers)
		{
			_properties.DamageRegularMin += actor.calculateSpecialistBonus(6, specialistWeapon);
			_properties.DamageRegularMax += actor.calculateSpecialistBonus(16, specialistWeapon);
		}
	}
});
