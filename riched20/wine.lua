pkgname = "riched20"
pkgver = "2004"
pkgrel = 1
pkgdesc = "MS RichEdit Control 2.0 (riched20.dll)"
publisher = "Microsoft"
source = { "http://x3270.bgp.nu/download/specials/W2KSP4_EN.EXE" }
sha256sums = {
	"167bb78d4adc957cc39fb4902517e1f32b1e62092353be5f8fb9ee647642de7e",
}

-- install pkg into wine prefix
function install()
	os.execute("cabextract -L -F i386/riched20.dl_ W2KSP4_EN.EXE")
	os.execute("cabextract --directory=" .. wb.var.system32_dlls .. " i386/riched20.dl_")
	wb.override_dlls("native,builtin", "msls31")
end

-- is this pkg installed?
function check()
	return wb.check_override("native,builtin", "msls31")
end
