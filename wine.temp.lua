pkgname = ""
pkgver = ""
pkgrel = 1
pkgdesc = ""
publisher = ""

url = "http://www..com/"

depends = { "fakechinese" }

source = { "" }

--  file1="THS_9.20.71_20231127.exe"
--  installed_exe1="$W_PROGRAMS_X86_WIN/同花顺/hexin.exe"

-- install pkg into wine prefix
function install()
	print("install(" .. pkgname .. ")")
	wb.wine(wb.basename(source[1]))
end

-- is this pkg installed?
function check()
	print("check(" .. pkgname .. ")")
	--	ret = wb.wine(
	--		'reg QUERY "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\" /v DisplayIcon'
	--	)
	--return (ret == 0)
	return false
end

-- run app
function run()
	print("run(" .. pkgname .. ")")
	os.execute("pwd")
	-- w_declare_exe "$W_PROGRAMS_X86_WIN\\同花顺" "hexin.exe"
end
