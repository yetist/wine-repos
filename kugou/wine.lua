pkgname = "kugou"
pkgver = "2023"
pkgrel = 1
pkgdesc = "KuGou Music"
publisher = "KuGou"

url = "http://www.kugou.com/"

depends = { "fakechinese", "quartz", "riched20" }
source = { "https://downmini.yun.kugou.com/web/kugou_10250.exe" }

-- install pkg into wine prefix
function install()
	wb.wine(wb.basename(source[1]))
end

-- is this pkg installed?
function check()
	local name = wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\酷狗音乐",
		"DisplayIcon"
	)
	if name ~= "" then
		return true
	else
		return false
	end
end

-- function get_reg_query_result() end

-- run app
function run()
	local path = wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\酷狗音乐",
		"DisplayIcon"
	)
	wb.exec("wine", path)
end
