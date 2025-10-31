pkgname = "xqwizard"
pkgver = "5.57"
pkgrel = 1
pkgdesc = "象棋巫师"
publisher = "xqbase"
url = "https://www.xqbase.com/"
depends = { "fakechinese", "vb6run" }
source = { "https://www.xqbase.com/download/xqwizard_setup.exe" }

function install()
	wb.wine(wb.basename(source[1]))
end

function check()
	return wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\象棋巫师_is1",
		"DisplayName"
	)
end

function run()
	local _, path = wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\象棋巫师_is1",
		"InstallLocation"
	)
	wb.exec("wine", path .. "XQWIZARD.EXE")
end
