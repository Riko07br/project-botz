extends Node

var lastPlayerPosition: Vector3

func InstantiateBoundToScene(packedScene: PackedScene, parentName: String = "") -> Node:
	var instance: Node = packedScene.instantiate()
	var sceneName: String = get_tree().current_scene.name
	var sceneNode = get_tree().root.get_node(sceneName)

	if parentName == "":
		sceneNode.add_child(instance)
	elif sceneNode.has_node(parentName):
		var parentNode = sceneNode.get_node(parentName)
		parentNode.add_child(instance)
	else:
		var parentNode = Node.new()
		parentNode.name = parentName
		sceneNode.add_child(parentNode)
		parentNode.add_child(instance)
	return instance