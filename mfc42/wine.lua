pkgname = "mfc42"
pkgver = "2000"
pkgrel = 1
pkgdesc = "Visual C++ 6 SP4 mfc42 library; part of vcrun6"
publisher = "Microsoft"
requires = { "cabextract" }
source = { "https://download.microsoft.com/download/vc60pro/Update/2/W9XNT4/EN-US/VC6RedistSetup_deu.exe" }
sha256sums = {
	"c2eb91d9c4448d50e46a32fecbcc3b418706d002beab9b5f4981de552098cee7",
}

-- install pkg into wine prefix
function install()
	wb.execl("wine", "VC6RedistSetup_deu.exe", "/T:c:\\windows\\temp", "/c", "/q")
	wb.execl("mv", wb.var.prefix .. "/drive_c/windows/temp/vcredist.exe", ".")
	wb.execl("cabextract", "-d", wb.var.system32_dlls, "-L", "-F", "mfc42*.dll", "vcredist.exe")
end

-- is this pkg installed?
function check()
	return wb.exists(wb.var.system32_dlls .. "/mfc42u.dll")
end
