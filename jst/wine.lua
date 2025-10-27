pkgname = "jst"
pkgver = "2016"
pkgrel = 1
pkgdesc = "即时通"
publisher = "Kingsoft"
url = "https://www.51dzt.com/rubik-ssr/51dzt"

depends = { "fakechinese" }
source = {
	"https://sw.pcmgr.qq.com/fcab348cdc9a5eca295417f940a6b3e8/69040f5e/spcmgr/download/jst_Setup.exe",
}

-- install pkg into wine prefix
function install()
	wb.wine(wb.basename(source[1]))
end

-- is this pkg installed?
function check()
	return false
	-- return wb.regvalue("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\TypeEasy", "DisplayName")
end

-- run app
function run()
	local _, path =
		wb.regvalue("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\TypeEasy", "InstallPath")
	--	wb.exec("wine", path .. "\\TypeEasy.exe")
end
