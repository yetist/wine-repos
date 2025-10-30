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
	return wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\MailMaster",
		"DisplayIcon"
	)
end

-- run app
function run()
	local _, path = wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\MailMaster",
		"InstallLocation"
	)
	wb.exec("wine", path .. "\\mailmaster.exe")
end
