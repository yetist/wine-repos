pkgname = "mfc42"
pkgver = "2000"
pkgrel = 1
pkgdesc = "Visual C++ 6 SP4 mfc42 library; part of vcrun6"
publisher = "Microsoft"
requires = { "cabextract" }
source = { "https://download.microsoft.com/download/vc60pro/Update/2/W9XNT4/EN-US/VC6RedistSetup_deu.exe" }

function install()
	wb.exec("wine", "VC6RedistSetup_deu.exe", "/T:c:\\windows\\temp", "/c", "/q")
	wb.exec("mv", wb.var.prefix .. "/drive_c/windows/temp/vcredist.exe", ".")
	wb.exec("cabextract", "-d", wb.var.system32_dlls, "-L", "-F", "mfc42*.dll", "vcredist.exe")
end

function check()
	return wb.exists(wb.var.system32_dlls .. "/mfc42u.dll")
end
