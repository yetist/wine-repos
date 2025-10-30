pkgname = "quartz"
pkgver = "2016"
pkgrel = 1
pkgdesc = "quartz.dll"
publisher = "Microsoft"

url = "https://www.51dzt.com/rubik-ssr/51dzt"

depends = { "win7sp1-runtime" }
source = { "override.reg" }

-- install pkg into wine prefix
function install()
	print("install quartz")
	print("wine_arch=" .. wb.var.arch)

	file = "x86_microsoft-windows-directshow-core_31bf3856ad364e35_6.1.7601.17514_none_a877a1cc4c284497/quartz.dll"
	os.execute("cabextract -L -F " .. file .. " " .. wb.var.cache_dir .. "/windows6.1-KB976932-X86.exe")
	os.execute(
		"cp x86_microsoft-windows-directshow-core_31bf3856ad364e35_6.1.7601.17514_none_a877a1cc4c284497/quartz.dll "
			.. wb.var.system32_dlls
	)
	wb.wine(wb.var.system32_dlls .. "/regsvr32.exe quartz.dll")

	if wb.var.arch == "win64" then
		file =
			"amd64_microsoft-windows-directshow-core_31bf3856ad364e35_6.1.7601.17514_none_04963d500485b5cd/quartz.dll"
		os.execute("cabextract -L -F " .. file .. " " .. wb.var.cache_dir .. "/windows6.1-KB976932-X64.exe")
		os.execute(
			"cp amd64_microsoft-windows-directshow-core_31bf3856ad364e35_6.1.7601.17514_none_04963d500485b5cd/quartz.dll "
				.. wb.var.system64_dlls
		)
		wb.wine(wb.var.system64_dlls .. "/regsvr32.exe quartz.dll")
	end
	wb.wine("regedit override.reg")
end

-- is this pkg installed?
function check()
	local name = wb.regvalue("HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides", "quartz")
	if name == "native,builtin" then
		return true
	end
	return false
end
