extends Node

@export var isEnabled : bool = true;
@export var resourceType : Constants.ResourceType;
@export var resourceAmount : Vector2i = Vector2i(0, 0);
@export var resourceTimer : float = 10;
@onready var timer: Timer = $Timer

func _ready() -> void:
	if(isEnabled):
		await get_tree().create_timer(1.0).timeout
		self.timer.start(resourceTimer);

func _on_timer_timeout() -> void:
	print_debug("Timeout")
	if(!isEnabled && !timer.is_stopped()):
		timer.stop();
		return;
		
	var generatedAmount = randi_range(resourceAmount.x, resourceAmount.y);
	ResourceInventoryManager.addItem(resourceType, generatedAmount);
