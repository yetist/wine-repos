pkgname = "quartz"
pkgver = "2016"
pkgrel = 1
pkgdesc = "quartz.dll"
publisher = "Microsoft"
url = "https://www.51dzt.com/rubik-ssr/51dzt"

if wb.var.arch == "win64" then
	source = {
		"windows6.1-KB976932-X64.exe::http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe",
	}
else
	source = {
		"windows6.1-KB976932-X86.exe::http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe",
	}
end

-- install pkg into wine prefix
function install()
	if wb.var.arch == "win64" then
		file =
			"amd64_microsoft-windows-directshow-core_31bf3856ad364e35_6.1.7601.17514_none_04963d500485b5cd/quartz.dll"
		wb.exec("cabextract", "-L", "-F", file, "windows6.1-KB976932-X64.exe")
		wb.exec("cp", file, wb.var.system64_dlls)
		wb.wine(wb.var.system64_dlls .. "/regsvr32.exe quartz.dll")
	else
		file = "x86_microsoft-windows-directshow-core_31bf3856ad364e35_6.1.7601.17514_none_a877a1cc4c284497/quartz.dll"
		wb.exec("cabextract", "-L", "-F", file, "windows6.1-KB976932-X86.exe")
		wb.exec("cp", file, wb.var.system32_dlls)
		wb.wine(wb.var.system32_dlls .. "/regsvr32.exe quartz.dll")
	end
	wb.override_dll("native,builtin", "quartz")
end

-- is this pkg installed?
function check()
	local _, value = wb.regvalue("HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides", "quartz")
	if value == "native,builtin" then
		return true
	end
	return false
end
