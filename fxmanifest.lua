fx_version 'cerulean'
game 'gta5'

shared_scripts {
	'@es_extended/imports.lua',
	'config.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua',
	'debug.lua'
	
}

client_scripts {
	'@es_extended/locale.lua',
	'client/main.lua',
	'debug.lua'
}
