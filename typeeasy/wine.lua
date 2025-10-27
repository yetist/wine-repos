pkgname = "typeeasy"
pkgver = "2016"
pkgrel = 1
pkgdesc = "TypeEasy(金山打字通)"
publisher = "Kingsoft"

url = "https://www.51dzt.com/rubik-ssr/51dzt"

depends = { "fakechinese" }
source = { "https://package.op.wpscdn.cn/wps/download/typeeasy.22063.12012.0.exe" }

-- install pkg into wine prefix
function install()
	wb.wine(wb.basename(source[1]))
end

-- is this pkg installed?
function check()
	local ret, out =
		wb.wine('reg QUERY "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\TypeEasy" /v DisplayName')
	if ret ~= 0 then
		return false
	end

	if string.find(wb.strip(out), "DisplayName") ~= nil then
		return true
	end
	return false
end

-- run app
function run()
	local _, path =
		wb.wine('reg QUERY "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\TypeEasy" /v InstallPath')
	_, path = wb.split(wb.strip(path), "\r\n", 2)
	path = wb.replace(wb.strip(path), "    ", " ")
	_, _, path = wb.split(path, " ", 3)
	path = wb.replace(wb.strip(path), "\\", "\\\\")
	wb.wine(path .. "\\\\TypeEasy.exe")
end
