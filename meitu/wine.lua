pkgname = "meitu"
pkgver = "4.0.1"
pkgrel = 1
pkgdesc = "Meitu XiuXiu(美图秀秀)"
publisher = "Meitu"

url = "http://xiuxiu.web.meitu.com/"

depends = { "mfc42", "fakechinese" }

source = { "http://xiuxiu.dl.meitu.com/XiuXiu_360Setup_4.0.1.exe" }

-- file1="XiuXiu_360Setup_4.0.1.exe"
-- installed_exe1="$W_PROGRAMS_X86_WIN/Meitu/XiuXiu/XiuXiu.exe"

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
	-- w_declare_exe "$W_PROGRAMS_X86_WIN\\Meitu\\XiuXiu" XiuXiu.exe
end
