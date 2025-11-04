pkgname = "vcrun2005"
pkgver = "2011"
pkgrel = 1
pkgdesc = "Visual C++ 2005 libraries (mfc80,msvcp80,msvcr80)"
arch = { "win32", "win64" }
publisher = "Microsoft"

if wb.var.arch == "win64" then
	source = { "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE" }
else
	source = { "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE" }
end

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
