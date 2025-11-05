pkgname = "oleaut32"
pkgver = "2011"
pkgrel = 1
pkgdesc = "MS oleaut32.dll"
publisher = "Microsoft"
requires = { "cabextract" }
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
			"amd64_microsoft-windows-ole-automation_31bf3856ad364e35_6.1.7601.17514_none_1b262ffd1219bd69/oleaut32.dll"
		wb.exec("cabextract", "-L", "-F", file, "windows6.1-KB976932-X64.exe")
		wb.exec("cp", file, wb.var.system64_dlls)
	else
		file = "x86_microsoft-windows-ole-automation_31bf3856ad364e35_6.1.7601.17514_none_bf07947959bc4c33/oleaut32.dll"
		wb.exec("cabextract", "-L", "-F", file, "windows6.1-KB976932-X86.exe")
		wb.exec("cp", file, wb.var.system32_dlls)
	end

	wb.override_dlls("native,builtin", "oleaut32")
end

-- is this pkg installed?
function check()
	local _, value = wb.regvalue("HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides", "oleaut32")
	if value == "native,builtin" then
		return true
	end
	return false
end
