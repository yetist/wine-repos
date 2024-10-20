pkgname = "flush"
pkgver = "9.20.71"
pkgrel = 1
pkgdesc = "同花顺免费版 (A Chinese stock app)"
publisher = "Zhejiang Hithink Flush Information Network Co."

url = "http://www.10jqka.com.cn/"

depends = { "fakechinese" }

source = { "http://resource.thsi.cn/soft/THS_9.20.71_20231127.exe" }

--  file1="THS_9.20.71_20231127.exe"
--  installed_exe1="$W_PROGRAMS_X86_WIN/同花顺/hexin.exe"

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
	-- w_declare_exe "$W_PROGRAMS_X86_WIN\\同花顺" "hexin.exe"
end
