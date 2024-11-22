extends Node

### This script is used to keep track of global time variables
### Some methods will be accesible by every script the game contains

### Private Constants (only accesible by methods within this script)

const _DAYS_PER_YEAR = 365

### Private Variables (only accesible by methods within this script)

var _day = 1
var _minute = 0
var _hour = 6
var _militaryHour = 6
var _dayPeriod = "AM"
var _year = 1
var _season = "Spring"

### Private and Public methods (this list of methods will change as needed)

### Private Functions:

func _minuteCheck():
	if _minute == 60:
		_minute = _varReset()
		_addHour()

func _varReset():
	return 0

func _addHour():
	_hour += 1
	_militaryHour += 1
	_hourCheck()
	_milHourCheck()

func _hourCheck():
	if _hour == 12:
		_changeDayPeriod()
	if _hour == 13:
		_hour = 1

func _milHourCheck():
	if _militaryHour == 24:
		_militaryHour = _varReset()
		_addDay()

func _changeDayPeriod():
	if _dayPeriod == "PM":
		_dayPeriod = "AM"
	else:
		_dayPeriod = "PM"

func _addDay():
	_day += 1
	_dayCheck()

func _dayCheck():
	if _day == _DAYS_PER_YEAR + 1:
		_day = 1
		_addYear()

func _addYear():
	_year += 1


### Global Functions

# Adds a minute when called by any script
func addMinute():
	_minute += 5
	_minuteCheck()

func getTime():
	return {
		"Hour": _hour,
		"Minute": _minute,
		"Day Period": _dayPeriod,
	}

func getDate():
	return {
		"Season": _season,
		"Year": _year,
		"Day": _day,
	}
