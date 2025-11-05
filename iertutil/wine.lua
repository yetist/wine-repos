pkgname = "iertutil"
pkgver = "2011"
pkgrel = 1
pkgdesc = "MS Runtime Utility"
arch = { "win32", "win64" }
requires = { "cabextract" }
source = {
	"windows6.1-KB976932-X64.exe::http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe",
	"windows6.1-KB976932-X86.exe::http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe",
}
sha256sums = {
	"f4d1d418d91b1619688a482680ee032ffd2b65e420c6d2eaecf8aa3762aa64c8",
	"e5449839955a22fc4dd596291aff1433b998f9797e1c784232226aba1f8abd97",
}

function install()
	if wb.var.arch == "win64" then
		file =
			"amd64_microsoft-windows-ie-runtimeutilities_31bf3856ad364e35_8.0.7601.17514_none_c083f7001a25b301/iertutil.dll"
		wb.exec("cabextract", "-L", "-F", file, "windows6.1-KB976932-X64.exe")
		wb.exec("cp", file, wb.var.system64_dlls)
	else
		file =
			"x86_microsoft-windows-ie-runtimeutilities_31bf3856ad364e35_8.0.7601.17514_none_64655b7c61c841cb/iertutil.dll"
		wb.exec("cabextract", "-L", "-F", file, "windows6.1-KB976932-X86.exe")
		wb.exec("cp", file, wb.var.system32_dlls)
	end
	wb.override_dlls("native,builtin", "iertutil")
end

function check()
	local _, value = wb.regvalue("HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides", "iertutil")
	if value == "native,builtin" then
		return true
	end
	return false
end
