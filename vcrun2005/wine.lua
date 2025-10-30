pkgname = "vcrun2005"
pkgver = "2011"
pkgrel = 1
pkgdesc = "Visual C++ 2005 libraries (mfc80,msvcp80,msvcr80)"
arch = { "win32", "win64" }
publisher = "Microsoft"

-- depends = { "win2ksp4-runtime" }
source = { "override-dll.reg" }
if wb.var.arch == "win64" then
	table.insert(
		source,
		"https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE"
	)
else
	table.insert(
		source,
		"https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE"
	)
end

-- install pkg into wine prefix
function install()
	wb.wine("regedit override-dll.reg")

	if wb.var.arch == "win64" then
		wb.wine("vcredist_x64.EXE")
	else
		wb.wine("vcredist_x86.EXE")
	end
end

-- is this pkg installed?
function check()
	local _, value = wb.regvalue("HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides", "atl80")
	if value == "native,builtin" then
		return true
	end
	return false
end
