resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

files { "web-side/index.html" }
ui_page "web-side/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"client-side/*"
}

files {
	"web-side/*"
}
