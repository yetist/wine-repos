pkgname = ""
pkgver = ""
pkgrel = 1
pkgdesc = ""
publisher = ""
url = "http://www.abc.com/"
depends = { "fakechinese" }
source = { "" }

-- install pkg into wine prefix
function install()
	wb.wine(wb.basename(source[1]))
end

-- is this pkg installed?
function check()
	return wb.regvalue("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Software", "DisplayIcon")
end

-- run app
function run()
	local _, path =
		wb.regvalue("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Software", "DisplayIcon")
	wb.exec("wine", path .. "\\software.exe")
end
