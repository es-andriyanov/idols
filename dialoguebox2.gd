extends Control

signal end_fight

var dialog_index = 0;

var dialog = [
	'Ах, вот и мой заклятый враг: общение.',
	'- Хочешь выпить? - Какая хорошая погода! - Как дела на учебе?',
	'Постоянные недопонимания, обиды, банальное незнание того, о чем ты говоришь.',
	'- Да я точно проверил! - В одно ухо влетело, в другое вылетело! - Мы заняты, приходите позже.',
	'Как мне делать свою работу, если каждый воспринимает все по-своему и… всегда неправильно?',
	'- Незабываемая скидка! - Что ты как девочка? - Поспорим на деньги?',
	'Хватит лишних слов. Хочешь сделать что-то хорошо - сделай это сам.',
	'- Слышь, ты сейчас получишь! - Смотри, куда едешь! - Был бы ты пообщительнее…'
]

func _ready():
	load_dialog();

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog();

func load_dialog():
	if dialog_index < dialog.size():
		get_node("dialogue/phrase").text = dialog[dialog_index];
		if dialog_index % 2 == 0:
			get_node("nameplate/nametag").text = '[center]Мерфи[/center]';
		else:
			get_node("nameplate/nametag").text = '[center]Идол площади[/center]';
		if dialog_index == 1:
			get_node("whispers").play();
			get_node("ideal2").set_visible(1);
			get_node("growl2").play();
		if dialog_index == 7:
			get_node("roar").play();
	else:
		end_fight.emit()
		queue_free();
	dialog_index +=1;
