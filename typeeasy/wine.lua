pkgname = "typeeasy"
pkgver = "2016"
pkgrel = 1
pkgdesc = "TypeEasy(金山打字通)"
publisher = "Kingsoft"

url = "https://www.51dzt.com/rubik-ssr/51dzt"

depends = { "fakechinese" }
source = {
	"https://package.op.wpscdn.cn/wps/download/typeeasy.22063.12012.0.exe",
	"https://package.op.wpscdn.cn/wps/download/typeeasy.22063.12012.0.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_great_race.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_rat.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_apple.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_space_war.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_flume_ride.exe",
}

function inst_icons(exe, icon)
	wb.exec("ln", "-sf", exe)
	ob.execute("wrestool -x -t 14 -n 128 -o app.ico " .. exe)
	os.execute("icotool -x -b 32 app.ico")
	os.execute("cp *16x16*.png ~/.local/share/icons/hicolor/16x16/apps/" .. icon .. ".png")
	os.execute("cp *32x32*.png ~/.local/share/icons/hicolor/32x32/apps/" .. icon .. ".png")
	os.execute("cp *48x48*.png ~/.local/share/icons/hicolor/48x48/apps/" .. icon .. ".png")
end

-- install pkg into wine prefix
function install()
	wb.wine(wb.basename(source[1]))
	wb.wine(wb.basename(source[2]))
	wb.wine(wb.basename(source[3]))
	wb.wine(wb.basename(source[4]))
	wb.wine(wb.basename(source[5]))
	wb.wine(wb.basename(source[6]))

	local _, path =
		wb.regvalue("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\TypeEasy", "InstallPath")
	local exe = path .. "\\TypeEasy.exe"

	inst_icons(exe, "typeeasy")
	wb.desktop("金山打字通", "typeeasy", "Education;Game;KidsGame;", exe)
end

-- is this pkg installed?
function check()
	return wb.regvalue("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\TypeEasy", "DisplayName")
end

-- run app
function run()
	local _, path =
		wb.regvalue("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\TypeEasy", "InstallPath")
	local exe = path .. "\\TypeEasy.exe"
	wb.exec("wine", exe)
end
