pkgname = "dumpbin"
pkgver = "14.40.33811.0"
pkgrel = 1
pkgdesc = "Microsoft (R) COFF/PE Dumper"
publisher = "Microsoft"
requires = { "7z" }
source = { "https://github.com/Delphier/dumpbin/releases/download/v14.40.33811/dumpbin-14.40.33811-x64.zip" }
sha256sums = {
	"297cf2d565293ad699ebd9ef87eb67cad4b97e7674a37566ffe871aeec64183e",
}

function install()
	os.execute("7z x " .. wb.basename(source[1]))
	os.execute("cp dumpbin.exe link.exe* *.dll " .. wb.var.system32_dlls)
end

function check()
	return wb.exists(wb.var.system32_dlls .. "/dumpbin.exe")
end
