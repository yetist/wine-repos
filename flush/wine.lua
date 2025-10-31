pkgname = "flush"
pkgver = "9.50.31"
pkgrel = 1
pkgdesc = "同花顺免费版 (A Chinese stock app)"
publisher = "Zhejiang Hithink Flush Information Network Co."

url = "http://www.10jqka.com.cn/"

depends = { "fakechinese" }
source = {
	"https://sp.thsi.cn/staticS3/mobileweb-upload-static-server.file/app_6/downloadcenter/THS_freeldy_9.50.31_1021.exe",
}

-- install pkg into wine prefix
function install()
	wb.wine(wb.basename(source[1]))
end

-- is this pkg installed?
function check()
	return wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\同花顺_is1",
		"DisplayIcon"
	)
end

-- run app
function run()
	local _, path = wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\同花顺_is1",
		"DisplayIcon",
		"gb18030"
	)
	wb.exec("wine", path)
end
