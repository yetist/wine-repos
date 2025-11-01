pkgname = "aardio"
pkgver = "40.43.19"
pkgrel = 1
pkgdesc = "桌面软件快速开发工具"
publisher = "aardio"
url = "https://www.aardio.com/"
icon = "https://www.aardio.com/images/favicon32.ico"
requires = { "7z", "wrestool" }
depends = { "fakechinese" }
source = { "https://d.aardio.com/ide/aardio.7z" }

function install()
	wb.exec("mkdir", "-p", wb.var.program_files .. "/aardio")
	wb.exec("7z", "x", "-o" .. wb.var.program_files .. "/aardio", "aardio.7z")

	wb.exec("wrestool", "-x", "-t", "14", "-n", "128", "-o", "aardio.ico", wb.var.program_files .. "/aardio/aardio.exe")
	os.execute("icotool -x -b 32 aardio.ico")
	os.execute("cp *16x16*.png ~/.local/share/icons/hicolor/16x16/apps/aardio.png")
	os.execute("cp *32x32*.png ~/.local/share/icons/hicolor/32x32/apps/aardio.png")
	os.execute("cp *48x48*.png ~/.local/share/icons/hicolor/48x48/apps/aardio.png")
	wb.desktop("aardio", "aardio", "Development;", wb.var.program_files .. "/aardio/aardio.exe")
end

function check()
	return wb.exists(wb.var.program_files .. "/aardio/aardio.exe")
end

function run()
	wb.exec("wine", wb.var.program_files .. "/aardio/aardio.exe")
end
