pkgname = "vb6run"
pkgver = "2004"
pkgrel = 1
pkgdesc = "MS Visual Basic 6 runtime sp6"
publisher = ""
url = "http://www.microsoft.com/"
source = {
	"https://github.com/KieuManh366377/Microsoft-Visual-Basic-6.0-Service-Pack-6/raw/refs/heads/main/VB6.0-KB290887-X86.exe",
}

function install()
	wb.exec("wine", "VB6.0-KB290887-X86.exe", "/T:c:\\windows\\temp", "/c", "/q")
	wb.exec("mv", wb.var.prefix .. "/drive_c/windows/temp/vbrun60sp6.exe", ".")
	wb.exec("cabextract", "-L", "vbrun60sp6.exe")
	wb.exec(
		"mv",
		"asycfilt.dll",
		"comcat.dll",
		"msvbvm60.dll",
		"oleaut32.dll",
		"olepro32.dll",
		"stdole2.tlb",
		wb.var.system32_dlls
	)
end

function check()
	return wb.exists(wb.var.system32_dlls .. "/msvbvm60.dll")
end
