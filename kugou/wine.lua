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
	local ret, out = wb.wine(
		'reg QUERY "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\酷狗音乐" /v DisplayIcon'
	)
	if ret ~= 0 then
		return false
	end
	if string.find(wb.strip(out), "DisplayIcon") ~= nil then
		return true
	end
	return false
end

-- function get_reg_query_result() end

-- run app
function run()
	_, path = wb.wine(
		'reg QUERY "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\酷狗音乐" /v DisplayIcon'
	)

	_, path = wb.split(wb.strip(path), "\r\n", 2)
	path = wb.replace(wb.strip(path), "    ", " ")
	_, _, path = wb.split(path, " ", 3)
	path = wb.replace(wb.strip(path), "\\", "\\\\")
	path = wb.replace(wb.strip(path), " ", "\\ ")
	path = wb.replace(wb.strip(path), "(", "\\(")
	path = wb.replace(wb.strip(path), ")", "\\)")
	print(path)
	wb.wine(path)
end
