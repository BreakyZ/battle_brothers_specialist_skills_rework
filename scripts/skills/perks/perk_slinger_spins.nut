this.perk_slinger_spins <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.slinger_spins";
		this.m.Name = this.Const.Strings.PerkName.SlingerSpins;
		this.m.Description = this.Const.Strings.PerkDescription.SlingerSpins;
		this.m.Icon = "ui/perks/sling_01.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onWaitTurn()
	{
		local actor = this.getContainer().getActor();
		local item = actor.getMainhandItem();
		if (item != null && item.isWeaponType(this.Const.Items.WeaponType.Sling))
			actor.getSkills().add(this.new("scripts/skills/effects/slinger_spins_effect"));
	}

	function onTurnEnd()
	{
		local actor = this.getContainer().getActor();
		local item = actor.getMainhandItem();
		if (item != null && item.isWeaponType(this.Const.Items.WeaponType.Sling))
			actor.getSkills().add(this.new("scripts/skills/effects/slinger_spins_effect"));
	}
});
