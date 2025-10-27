pkgname = "test"
pkgver = "2016"
pkgrel = 1
pkgdesc = "test"
publisher = "test"

url = "https://www.51dzt.com/rubik-ssr/51dzt"

depends = {}
source = {}

-- install pkg into wine prefix
function install()
	print("call install")
end

-- is this pkg installed?
function check()
	wb.override("native", "xls", "ok")
	return true
end

-- run app
function run()
	print(wb.var.pwd)
end
