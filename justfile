# Local Variables:
# mode: makefile
# End:
# vim: set ft=make :

_default:
	@just --list

erase-keyboard:
	sudo dfu-programmer atmega32u4 erase

flash-keyboard hexfile:
	sudo dfu-programmer atmega32u4 flash {{hexfile}}

go keyboard layout:
	make {{keyboard}}:{{layout}}
	@echo '********************************************************************'
	@echo 'reset keyboard now'
	@sleep 5
	sudo dfu-programmer atmega32u4 erase
	sudo dfu-programmer atmega32u4 flash .build/{{keyboard}}_{{layout}}.hex
	sudo dfu-programmer atmega32u4 reset
