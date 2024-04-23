extends Control

signal fight

var dialog_index = 0;

var dialog = [
	'Где мы оказались? Я что, все еще сплю?',
	'Разумеется! Мы же не с мухами сражаемся. Эти создания живут вне нашей реальности.',
	'...',
	'… Это одно из них?',
	'Мгм. Идол Площади, источник всех ошибок не по твоей вине. Олицетворение ненадежности и лишних снов.',
	'Это объясняет, почему мы на площади. На очень странной, абстрактной версии площади.',
	'Тот факт, что ты меня слушаешь, уже делает тебя лучше этого монстра. Давай, покажи ему свою коронную независимость.'
]

func _ready():
	load_dialog();

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog();

func load_dialog():
	if dialog_index < dialog.size():
		get_node("dialogue/phrase").text = dialog[dialog_index];
		if dialog_index == 2:
			get_node("nameplate/nametag").text = '[center]???[/center]';
			get_node("growl").play();
		else:
			if (dialog_index == 0)or(dialog_index == 3)or(dialog_index == 5):
				get_node("nameplate/nametag").text = '[center]Мерфи[/center]';
			else:
				get_node("nameplate/nametag").text = '[center]Идеал[/center]';
		if dialog_index == 1:
			get_node("ideal1").set_visible(1);
			get_node("sparks").play();
		else:
			if dialog_index == 4:
				get_node("ideal1").set_visible(0);
				get_node("giggle2").play();
				get_node("ideal2").set_visible(1);
			else:
				if dialog_index == 6:
					get_node("ideal2").set_visible(0);
					get_node("giggle").play();
					get_node("ideal3").set_visible(1);
	else:
		$AnimationPlayer.play("sh_down")
		#await get_tree().create_timer(2.0).timeout
		fight.emit()
		queue_free();
	dialog_index +=1;
