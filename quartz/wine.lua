pkgname = "quartz"
pkgver = "2016"
pkgrel = 1
pkgdesc = "quartz.dll"
publisher = "Microsoft"
url = "https://www.51dzt.com/rubik-ssr/51dzt"
source = {
	"windows6.1-KB976932-X64.exe::http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe",
	"windows6.1-KB976932-X86.exe::http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe",
}
sha256sums = {
	"f4d1d418d91b1619688a482680ee032ffd2b65e420c6d2eaecf8aa3762aa64c8",
	"e5449839955a22fc4dd596291aff1433b998f9797e1c784232226aba1f8abd97",
}

-- install pkg into wine prefix
function install()
	if wb.var.arch == "win64" then
		file =
			"amd64_microsoft-windows-directshow-core_31bf3856ad364e35_6.1.7601.17514_none_04963d500485b5cd/quartz.dll"
		wb.execl("cabextract", "-L", "-F", file, "windows6.1-KB976932-X64.exe")
		wb.execl("cp", file, wb.var.system64_dlls)
		wb.wine(wb.var.system64_dlls .. "/regsvr32.exe quartz.dll")
	else
		file = "x86_microsoft-windows-directshow-core_31bf3856ad364e35_6.1.7601.17514_none_a877a1cc4c284497/quartz.dll"
		wb.execl("cabextract", "-L", "-F", file, "windows6.1-KB976932-X86.exe")
		wb.execl("cp", file, wb.var.system32_dlls)
		wb.wine(wb.var.system32_dlls .. "/regsvr32.exe quartz.dll")
	end
	wb.override_dlls("native,builtin", "quartz")
end

-- is this pkg installed?
function check()
	return wb.check_override("native,builtin", "quartz")
end
