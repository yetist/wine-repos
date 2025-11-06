pkgname = "vb6run"
pkgver = "2004"
pkgrel = 1
pkgdesc = "MS Visual Basic 6 runtime sp6"
publisher = "Microsoft"
source = {
	"https://github.com/KieuManh366377/Microsoft-Visual-Basic-6.0-Service-Pack-6/raw/refs/heads/main/VB6.0-KB290887-X86.exe",
}
sha256sums = {
	"467b5a10c369865f2021d379fc0933cb382146b702bbca4bcb703fc86f4322bb",
}

-- install pkg into wine prefix
function install()
	wb.execl("wine", "VB6.0-KB290887-X86.exe", "/T:c:\\windows\\temp", "/c", "/q")
	wb.execl("mv", wb.var.windir .. "/temp/vbrun60sp6.exe", ".")

	wb.execl("cabextract", "-L", "vbrun60sp6.exe")
	wb.execl(
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

-- is this pkg installed?
function check()
	return wb.exists(wb.var.system32_dlls .. "/msvbvm60.dll")
end
