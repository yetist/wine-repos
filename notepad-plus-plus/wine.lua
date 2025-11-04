pkgname = "notepad-plus-plus"
pkgver = "8.8.7"
pkgrel = 1
pkgdesc = "A free source code editor and Notepad replacement that supports several programming languages."
publisher = "Don Ho"
url = "https://notepad-plus-plus.org"
icon =
	"https://raw.githubusercontent.com/notepad-plus-plus/notepad-plus-plus/refs/heads/master/PowerEditor/misc/chameleon/chameleon-pencil-200.png#100"
requires = {}
depends = { "fakechinese" }
source =
	{ "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.8.7/npp.8.8.7.Installer.x64.exe" }

function install()
	wb.wine(wb.basename(source[1]))

	local _, path =
		wb.regvalue("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Notepad++", "DisplayIcon")
	wb.desktop("Notepad++", "Utility;TextEditor;", path)
end

function check()
	return wb.regvalue("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Notepad++", "DisplayIcon")
end

function run()
	local _, path =
		wb.regvalue("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Notepad++", "DisplayIcon")
	wb.exec("wine", path)
end
