pkgname = "riched20"
pkgver = "2004"
pkgrel = 1
pkgdesc = "MS RichEdit Control 2.0 (riched20.dll)"
publisher = "Microsoft"

source = { "http://x3270.bgp.nu/download/specials/W2KSP4_EN.EXE" }

-- install pkg into wine prefix
function install()
	os.execute("cabextract -L -F i386/riched20.dl_ W2KSP4_EN.EXE")
	os.execute("cabextract --directory=" .. wb.var.system32_dlls .. " i386/riched20.dl_")
	wb.override_dll("native,builtin", "msls31")
end

-- is this pkg installed?
function check()
	local _, value = wb.regvalue("HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides", "msls31")
	if value == "native,builtin" then
		return true
	end
	return false
end
