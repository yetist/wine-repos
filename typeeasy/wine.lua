pkgname = "typeeasy"
pkgver = "2016"
pkgrel = 1
pkgdesc = "TypeEasy(金山打字通)"
publisher = "Kingsoft"

url = "https://www.51dzt.com/rubik-ssr/51dzt"

depends = { "fakechinese" }
source = {
	"https://package.op.wpscdn.cn/wps/download/typeeasy.22063.12012.0.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_great_race.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_rat.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_apple.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_space_war.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_flume_ride.exe",
}

-- install pkg into wine prefix
function install()
	wb.wine(wb.basename(source[1]))
	wb.wine(wb.basename(source[2]))
	wb.wine(wb.basename(source[3]))
	wb.wine(wb.basename(source[4]))
	wb.wine(wb.basename(source[5]))
	wb.wine(wb.basename(source[6]))
end

-- is this pkg installed?
function check()
	local name = wb.regvalue("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\TypeEasy", "DisplayName")
	if name ~= "" then
		return true
	else
		return false
	end
end

-- run app
function run()
	local path = wb.regvalue("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\TypeEasy", "InstallPath")
	wb.exec("wine", path .. "\\TypeEasy.exe")
end
