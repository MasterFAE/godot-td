extends PanelContainer

@onready var goldLabel: Label = $MarginContainer/HBoxContainer/Label


func _ready() -> void:
	ResourceInventoryManager.onInventoryUpdate.connect(onInventoryUpdate)
	
	
func onInventoryUpdate() -> void:
	var gold = ResourceInventoryManager.resourceInventory.get(Constants.ResourceType.GOLD, 0);
	goldLabel.text = str(gold);
