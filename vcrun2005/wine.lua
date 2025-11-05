pkgname = "vcrun2005"
pkgver = "2011"
pkgrel = 1
pkgdesc = "Visual C++ 2005 libraries (mfc80,msvcp80,msvcr80)"
arch = { "win32", "win64" }
publisher = "Microsoft"
source = {
	"https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE",
	"https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE",
}
sha256sums = {
	"4487570bd86e2e1aac29db2a1d0a91eb63361fcaac570808eb327cd4e0e2240d",
	"8648c5fc29c44b9112fe52f9a33f80e7fc42d10f3b5b42b2121542a13e44adfd",
}

-- install pkg into wine prefix
function install()
	if wb.var.arch == "win64" then
		wb.wine("vcredist_x64.EXE")
	else
		wb.wine("vcredist_x86.EXE")
	end
	wb.override_dlls("native,builtin", "atl80", "msvcm80", "msvcp80", "msvcr80", "vcomp")
end

-- is this pkg installed?
function check()
	local _, value = wb.regvalue("HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides", "atl80")
	if value == "native,builtin" then
		return true
	end
	return false
end
