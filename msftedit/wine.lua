pkgname = "msftedit"
pkgver = "2011"
pkgrel = 1
pkgdesc = "Microsoft RichEdit Control"
publisher = "Microsoft"
requires = { "cabextract" }
if wb.var.arch == "win64" then
	source = {
		"windows6.1-KB976932-X64.exe::http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe",
	}
else
	source = {
		"windows6.1-KB976932-X86.exe::http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe",
	}
end

function install()
	if wb.var.arch == "win64" then
		file = "amd64_microsoft-windows-msftedit_31bf3856ad364e35_6.1.7601.17514_none_33f6fe754dd11735/msftedit.dll"
		wb.exec("cabextract", "-L", "-F", file, "windows6.1-KB976932-X64.exe")
		wb.exec("cp", file, wb.var.system64_dlls)
	else
		file = "x86_microsoft-windows-msftedit_31bf3856ad364e35_6.1.7601.17514_none_d7d862f19573a5ff/msftedit.dll"
		wb.exec("cabextract", "-L", "-F", file, "windows6.1-KB976932-X86.exe")
		wb.exec("cp", file, wb.var.system32_dlls)
	end
	wb.override_dll("native,builtin", "msftedit")
end

function check()
	local _, value = wb.regvalue("HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides", "msftedit")
	if value == "native,builtin" then
		return true
	end
	return false
end
