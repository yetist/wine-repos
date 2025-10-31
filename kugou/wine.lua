pkgname = "kugou"
pkgver = "2023"
pkgrel = 1
pkgdesc = "KuGou Music"
publisher = "KuGou"
url = "http://www.kugou.com/"
depends = { "fakechinese", "quartz", "riched20" }
source = { "https://downmini.yun.kugou.com/web/kugou_10250.exe" }
-- checksums = {}

function install()
	wb.wine(wb.basename(source[1]))
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
