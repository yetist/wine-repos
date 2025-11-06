pkgname = "kugou"
pkgver = "2023"
pkgrel = 1
pkgdesc = "KuGou Music"
publisher = "KuGou"
url = "http://www.kugou.com/"
icon = "https://imge.kugou.com/commendpic/20250513/20250513195547550860.png#128"
depends = { "fakechinese", "quartz", "riched20" }
source = { "https://downmini.yun.kugou.com/web/kugou_10250.exe" }
sha256sums = {
	"4df0aceb15bbd181abab392fe3718178cd68b1b5b97f453717b16fa1628e7c29",
}

function install()
	wb.wine(wb.basename(source[1]))
	local _, path = wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\酷狗音乐",
		"DisplayIcon"
	)
	wb.desktop("酷狗音乐", "Audio;Player;", path)
end

function check() -- return bool
	return wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\酷狗音乐",
		"DisplayIcon"
	)
end

function run()
	local _, path = wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\酷狗音乐",
		"DisplayIcon"
	)
	wb.exec("wine", path)
end
