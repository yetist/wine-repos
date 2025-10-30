pkgname = "riched20"
pkgver = "2004"
pkgrel = 1
pkgdesc = "MS RichEdit Control 2.0 (riched20.dll)"
publisher = "Microsoft"

depends = { "win2ksp4-runtime" }
source = { "override-dll.reg" }

-- install pkg into wine prefix
function install()
	os.execute("cabextract -L -F i386/riched20.dl_ " .. wb.var.cache_dir .. "/W2KSP4_EN.EXE")
	os.execute("cabextract --directory=" .. wb.var.system32_dlls .. " i386/riched20.dl_")

	-- # https://github.com/Winetricks/winetricks/issues/292
	wb.wine("regedit override-dll.reg")
end

-- is this pkg installed?
function check()
	local _, value = wb.regvalue("HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides", "msls31")
	if value == "native,builtin" then
		return true
	end
	return false
end
