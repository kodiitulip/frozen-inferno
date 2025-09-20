class_name ItemInfo
extends Resource

enum ItemType {
	FUEL,
	FOOD,
}

@export var item_type: ItemType = ItemType.FUEL
@export var item_icon: Texture2D = PlaceholderTexture2D.new()
