pkgname = "163music"
pkgver = "2.9.9"
pkgrel = 1
pkgdesc = "NetEase Cloud Music"
publisher = "NetEase"

url = "http://music.163.com/"

depends = { "fakechinese", "d3dx9" }

source = { "https://d1.music.126.net/dmusic/cloudmusicsetup2.9.9.199909.exe" }

file1 = "cloudmusicsetup2.9.9.199909.exe"
installed_exe1 = "$W_PROGRAMS_X86_WIN/Netease/CloudMusic/cloudmusic.exe"

-- install pkg into wine prefix
function install()
	wb.wine(wb.basename(source[1]))
end

-- is this pkg installed?
function check()
	--	ret = wb.wine(
	--		'reg QUERY "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\" /v DisplayIcon'
	--	)
	--return (ret == 0)
	return false
end

-- run app
function run()
	print("run kogou")
	os.execute("pwd")
	-- w_declare_exe("$W_PROGRAMS_X86_WIN\\NeteaseCloudMusic")("cloudmusic.exe")
end
