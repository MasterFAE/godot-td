class_name GameResourceManager
extends Node

var resourceInventory : Dictionary;

signal onInventoryUpdate;

func addItem(resource: Constants.ResourceType, amount: int = 1) -> void:
	var resourceAmount = resourceInventory.get_or_add(resource, 0);
	if(amount <= 0):
		print_debug("amount is less than 0");
		return;
	resourceInventory[resource] = resourceAmount + amount;
	onInventoryUpdate.emit()
	print_debug("resource added ", resource, amount);
	
		
func removeItem(resource: Constants.ResourceType, amount: int = 1) -> void:
	var resourceAmount = resourceInventory.get_or_add(resource, 0);
	if(resourceAmount <= 0):
		print_debug("amount is less than 0");
		return;
	resourceInventory[resource] = resourceAmount - amount;
	onInventoryUpdate.emit();
	print_debug("resource deleted ", resource, amount);
