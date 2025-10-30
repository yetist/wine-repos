pkgname = "163music"
pkgver = "2.9.9"
pkgrel = 1
pkgdesc = "NetEase Cloud Music"
publisher = "NetEase"

url = "http://music.163.com/"

depends = { "fakechinese", "d3dx9" }

source = { "https://d1.music.126.net/dmusic/cloudmusicsetup2.9.9.199909.exe" }

--file1 = "cloudmusicsetup2.9.9.199909.exe"
--installed_exe1 = "$W_PROGRAMS_X86_WIN/Netease/CloudMusic/cloudmusic.exe"

-- install pkg into wine prefix
function install()
	wb.wine(wb.basename(source[1]))
end

-- is this pkg installed?
function check()
	local name = wb.regvalue(
    "HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\网易云音乐",
    "DisplayIcon",
	)
	if name ~= "" then
		return true
	end
	return false
end

-- run app
function run()
	local path = wb.regvalue(
		"HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\网易云音乐",
		"DisplayIcon"
	)
	wb.exec("wine", path)
end
