extends Node

var first
var bg1 = load("res://bg-0.tres") 
var bg2 = load("res://bg-1.tres") 
var bg3 = load("res://bg-2.tres") 
var bg4 = load("res://bg-3.tres") 
var bg5 = load("res://bg-4.tres") 
var bg6 = load("res://bg-5.tres")
var bg7 = load("res://bg-6.tres")
var bg8 = load("res://bg-7.tres")
var bgArray = [bg1,bg2,bg3,bg4,bg5,bg6,bg7,bg8]
var colorDict = {
	"#5B86E5":"#36D1DC",
	"#FF5E62":"#FF9966",
	"#11998E":"#38EF7D",
	"#3C1053":"#AD5389",
	"#D6AE7B":"#EACDA3",
	"#0EE82B":"#FDFC47",
	"#9796F0":"#FBC7D4",
	"#B91D73":"F953C6"
}
var color = []
var color2 = []

func _init():
	for i in colorDict:
		color.append(i)
	for i in colorDict.values():
		color2.append(i)
	first = true
