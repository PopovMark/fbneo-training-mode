assert(rb,"Run fbneo-training-mode.lua")

p1maxhealth = 0x1E00 -- word
p2maxhealth = 0x1E00

p1maxmeter = 0x3
p2maxmeter = 0x3

local p1health = 0x10734E
local p2health = 0x1078AE

local p1meter = 0x107361
local p2meter = 0x1078C1

local p1direction = 0x107364
local p2direction = 0x107365

local p1combocounter = 0x107943
local p2combocounter = 0x1073E3

translationtable = {
	"left",
	"right",
	"up",
	"down",
	"button1",
	"button2",
	"button3",
	"button4",
	"coin",
	"start",
	"select",
	["Left"] = 1,
	["Right"] = 2,
	["Up"] = 3,
	["Down"] = 4,
	["Button A"] = 5,
	["Button B"] = 6,
	["Button C"] = 7,
	["Button D"] = 8,
	["Coin"] = 9,
	["Start"] = 10,
	["Select"] = 11,
}

gamedefaultconfig = {
	hud = {
		combotextx=140,
		combotexty=42,
		comboenabled=true,
		p1healthx=16,
		p1healthy=18,
		p1healthenabled=true,
		p2healthx=288,
		p2healthy=18,
		p2healthenabled=true,
		p1meterx=40,
		p1metery=202,
		p1meterenabled=true,
		p2meterx=278,
		p2metery=202,
		p2meterenabled=true,
	},
}

function playerOneFacingLeft()
	return rb(p1direction)==0xFF
end

function playerTwoFacingLeft()
	return rb(p2direction)==0xFF
end

function playerOneInHitstun()
	return rb(p2combocounter)~=0
end

function playerTwoInHitstun()
	return rb(p1combocounter)~=0
end

function readPlayerOneHealth()
	return rw(p1health)
end

function writePlayerOneHealth(health)
	ww(p1health, health)
end

function readPlayerTwoHealth()
	return rw(p2health)
end

function writePlayerTwoHealth(health)
	ww(p2health, health)
end

function readPlayerOneMeter()
	return rb(p1meter)
end

function writePlayerOneMeter(meter)
	wb(p1meter, meter)
end

function readPlayerTwoMeter()
	return rb(p1meter)
end

function writePlayerTwoMeter(meter)
	wb(p1meter, meter)
end

function infiniteTime()
	wb(0x107C27, 0x63)
end

function Run() -- runs every frame
	infiniteTime()
end
