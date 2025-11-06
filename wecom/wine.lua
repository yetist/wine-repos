pkgname = "wecom"
pkgver = "5.0.0.8002"
pkgrel = 1
pkgdesc = "企业微信"
publisher = "腾讯公司"
url = "https://work.weixin.qq.com"
icon = "https://wwcdn.weixin.qq.com/node/wwnl/wwnl/style/images/independent/favicon/favicon_48h$c976bd14.png#200"
requires = {}
depends = { "fakechinese", "msftedit", "oleaut32" }
-- d3d11
source = { "https://dldir1.qq.com/wework/work_weixin/WeCom_5.0.0.8002.exe" }
sha256sums = {
	"c329d90a0fa12e92b65310e756ad9b140ba41c67f95f129456981eadea858d5e",
}

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
	wb.execl("wine", path)
end
