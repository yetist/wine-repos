pkgname = "wecom"
pkgver = "5.0.0.8002"
pkgrel = 1
pkgdesc = "企业微信"
publisher = ""
url = ""
icon = "https://wwcdn.weixin.qq.com/node/wwnl/wwnl/style/images/independent/favicon/favicon_48h$c976bd14.png#200"
requires = { "cabextract" }
depends = { "fakechinese" }
-- d3d11
-- msftedit
source = { "https://dldir1.qq.com/wework/work_weixin/WeCom_5.0.0.8002.exe" }

function install()
	wb.wine(wb.basename(source[1]))

	local _, path = wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\企业微信",
		"DisplayIcon"
	)
	wb.desktop("企业微信", "Network;", path)
end

function check()
	return wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\企业微信",
		"DisplayIcon"
	)
end

function run()
	local _, path = wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\企业微信",
		"DisplayIcon"
	)
	wb.exec("wine", path)
end
