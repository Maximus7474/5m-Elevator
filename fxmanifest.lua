fx_version "cerulean"

description "Simple elevator UI"
author "Maximus Prime"
version '0.0.1'
repository 'https://github.com/Maximus7474/5M-Elevator'

lua54 'yes'

games {
  "gta5"
}

ui_page 'web/build/index.html'

client_script "client/**/*"
server_script "server/**/*"

files {
	'web/build/index.html',
	'web/build/**/*',
}