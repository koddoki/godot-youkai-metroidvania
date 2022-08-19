
extends CanvasLayer

func update(currentHealth, maxHealth):
	$HpFrame/TextureProgress.value = currentHealth;
	$HpFrame/TextureProgress.max_value = maxHealth;
	$HpFrame/CurrentHp.text = String($HpFrame/TextureProgress.value);
	$HpFrame/MaxHp.text = String($HpFrame/TextureProgress.max_value);
