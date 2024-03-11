extends Node


func play_sfx(sound: AudioStream, parent: Node):
	if sound != null and parent != null:
		var stream = AudioStreamPlayer.new()
		stream.stream = sound
		stream.connect("finished", stream, "queue_free")		
		parent.add_child(stream)
		stream.play()
		
func play_sfx_loop(sound: AudioStream, parent: Node):
	if sound != null and parent != null:
		var stream = AudioStreamPlayer.new()
		stream.stream = sound
		stream.connect("finished", stream, "queue_free")		
		parent.add_child(stream)
		stream.set_autoplay(true)
		stream.play()

	
