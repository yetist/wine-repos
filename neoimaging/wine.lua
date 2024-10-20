pkgname = "neoimaging"
pkgver = "4.4.1"
pkgrel = 1
pkgdesc = "光影魔术手 (A Chinese raster graphics editor)"
publisher = "Thunder Network"
url = "http://www.neoimaging.cn/"

depends = { "riched20", "winhttp", "fakechinese" }

source = { "https://dlc2.pconline.com.cn/filedown_50795_6911045/l7YfyGZZ/NeoImagingSetup_4.4.1.exe" }

--  file1="NeoImagingSetup_4.4.1.exe"
--  installed_exe1="$W_PROGRAMS_X86_WIN/Thunder Network/NeoImaging/Program/nEOiMAGING4.exe"

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
	print("run " .. pkgname)
	os.execute("pwd")
	--  w_declare_exe "$W_PROGRAMS_X86_WIN\\Thunder Network\NeoImaging\Program" "nEOiMAGING4.exe"
	--  w_declare_exe "$W_PROGRAMS_X86_WIN\\Thunder Network\NeoViewer\Program" "NeoViewer.exe"
end
