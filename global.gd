extends Node

var selected = -1
var id = "A"
var score = 0
var total = 0
var rank = 0
var wiimote:GDWiimote = null
var wiimote2:GDWiimote = null

@onready var audio_player = AudioStreamPlayer.new()
@export var server_url := "ws://172.17.98.44:9001"
var websocket := WebSocketPeer.new()

var was_connected := false

func _ready():
	websocket.connect_to_url(server_url)
	add_child(audio_player)

func _process(_delta):
	websocket.poll()
	var state = websocket.get_ready_state()
	if state == WebSocketPeer.STATE_OPEN:
		while websocket.get_available_packet_count() > 0:
			var raw = websocket.get_packet().get_string_from_utf8()
			var res = JSON.parse_string(raw)
			if res != null:
				var data = res
				print(res.pc,res.id,res.score,res.ranking)
				if data.has("pc") and data.has("id") and data.pc == 4.0 and data.id == id:
					rank = data.ranking
					total = data.score
				
func send_score():
	var msg = JSON.stringify({
		"pc":selected,
		"id":id,
		"score":score
	})
	if websocket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		websocket.send_text(msg)

func play_sound(sound: AudioStream):
	audio_player.stream = sound
	audio_player.play()
	
func reset():
	id = "A"
	score = 0
	rank = 0
	total = 0
