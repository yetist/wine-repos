pkgname = "typeeasy"
pkgver = "2016"
pkgrel = 1
pkgdesc = "TypeEasy(金山打字通)"
publisher = "Kingsoft"
icon =
	"https://personal-act.wpscdn.cn/rubik_components_test_operator/rubik-admin/resource/1655803755471_logoimg.png#102"
url = "https://www.51dzt.com/rubik-ssr/51dzt"
depends = { "fakechinese", "quartz", "riched20", "vb6run", "mfc42" }
source = {
	"https://package.op.wpscdn.cn/wps/download/typeeasy.22063.12012.0.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_great_race.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_rat.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_apple.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_space_war.exe",
	"https://wdl1.cache.wps.cn/dzt/game/dzt_flume_ride.exe",
}
sha256sums = {
	"458d39fcba83aa20d1a40372929f3ea8d49f3b92fd26d1d4dd94d237f8ffb66c",
	"c3d30b72cae59e116bdada7b5cf1d813039a4480b02c54763ba708e4d1a2d430",
	"371bf5b247b200b41ce5c47fa7db7351772391b1183d11c4f8e22394facd2296",
	"4d34f3d3b20c605c10fe855de94f6cf0b9f15aeaf1e33c1ff68f78f68d618e71",
	"e5da5eb4cd327a2de8d9c30bada6da295f295c2a44ff8b6901f1f22843445bce",
	"f4b18b44c141c95313599593b1fd1a23bead1478c285cb983f429d26515fbdc0",
}

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

	wb.desktop("金山打字通", "Education;Game;KidsGame;", exe)
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
