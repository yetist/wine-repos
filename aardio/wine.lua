pkgname = "aardio"
pkgver = "40.43.19"
pkgrel = 1
pkgdesc = "桌面软件快速开发工具"
publisher = "aardio"
url = "https://www.aardio.com/"
icon = "https://www.aardio.com/images/favicon32.ico"
depends = { "fakechinese" }
source = { "https://d.aardio.com/ide/aardio.7z" }

function install()
	wb.exec("mkdir", "-p", wb.var.program_files .. "/aardio")
	wb.exec("7z", "x", "-o" .. wb.var.program_files .. "/aardio", "aardio.7z")
end

function check()
	return wb.exists(wb.var.program_files .. "/aardio/aardio.exe")
end

function run()
	wb.exec("wine", wb.var.program_files .. "/aardio/aardio.exe")
end
