class_name Projectile
extends ShapeCast3D

@export var moveSpeed: float = 20
@export var maxFlyingTime: float = 2

var _flyingTime: float = 0
var _sphereOffset: float = 0
var _cachedHitData: Hittable.HitData


func _GetHitShape() -> CollisionShape3D:
	var target: CollisionObject3D = get_collider(0)
	var ownerId = target.shape_find_owner(get_collider_shape(0))
	return target.shape_owner_get_owner(ownerId)


func _ready() -> void:
	top_level = true
	enabled = true
	max_results = 1

	_sphereOffset = shape.radius
	_cachedHitData = Hittable.HitData.new(5)

func _physics_process(delta: float) -> void:
	_flyingTime += delta

	if _flyingTime > maxFlyingTime:
		queue_free()
		return

	var distanceToTravel: float = delta * moveSpeed
	target_position = Vector3.BACK * distanceToTravel
	force_shapecast_update()

	if not is_colliding():
		global_transform.origin += transform.basis.z * distanceToTravel
		return

	var hitShape: CollisionShape3D = _GetHitShape()
	if hitShape is Hittable:
		hitShape.Hit(_cachedHitData)
	queue_free()
