pkgname = "aardio"
pkgver = "40.43.19"
pkgrel = 1
pkgdesc = "桌面软件快速开发工具"
publisher = "aardio"
url = "https://www.aardio.com/"
icon = "https://www.aardio.com/images/favicon32.ico#128"
requires = { "7z" }
depends = { "fakechinese" }
source = { "https://d.aardio.com/ide/aardio.7z" }
sha256sums = {
	"7820f2f62161064dc1068f54803da617ce7424484feb49477753ce66eafa07b3",
}

function install()
	wb.exec("mkdir", "-p", wb.var.program_files_x86 .. "/aardio")
	wb.exec("7z", "x", "-o" .. wb.var.program_files_x86 .. "/aardio", "aardio.7z")

	wb.desktop("aardio", "Development;", wb.var.program_files_x86 .. "/aardio/aardio.exe")
end

function check()
	return wb.exists(wb.var.program_files_x86 .. "/aardio/aardio.exe")
end

function run()
	wb.exec("wine", wb.var.program_files_x86 .. "/aardio/aardio.exe")
end
