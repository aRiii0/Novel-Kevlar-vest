fx_version 'cerulean'
game 'gta5'

shared_scripts {
	'@es_extended/imports.lua'
}

server_scripts {
	'config.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua',
	'debug.lua'
	
}

client_scripts {
	'config.lua',
	'@es_extended/locale.lua',
	'client/main.lua',
	'debug.lua'
}
