pkgname = "163mail"
pkgver = "2017"
pkgrel = 1
pkgdesc = "163 MailMaster（网易邮箱大师）"
publisher = "NetEase"

url = "http://mail.163.com/dashi/?from=mail46"

depends = { "fakechinese", "vcrun2005" }

source = { "http://client.dl.126.net/pcmail/dashi/mail.exe" }

-- install pkg into wine prefix
function install()
	wb.wine(wb.basename(source[1]))
end

-- is this pkg installed?
function check()
	local ret, out = wb.wine(
		'reg QUERY "HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\MailMaster" /v DisplayIcon'
	)
	if ret ~= 0 then
		return false
	end

	if string.find(wb.strip(out), "DisplayIcon") ~= nil then
		return true
	end
	return false
end

-- run app
function run()
	local _, path = wb.wine(
		'reg QUERY "HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\MailMaster" /v InstallLocation'
	)
	_, path = wb.split(wb.strip(path), "\r\n", 2)
	path = wb.replace(wb.strip(path), "    ", " ")
	_, _, path = wb.split(path, " ", 3)
	path = wb.replace(wb.strip(path), "\\", "\\\\")
	path = wb.replace(wb.strip(path), " ", "\\ ")
	path = wb.replace(wb.strip(path), "(", "\\(")
	path = wb.replace(wb.strip(path), ")", "\\)")
	wb.wine(path .. "\\\\mailmaster.exe")
end
