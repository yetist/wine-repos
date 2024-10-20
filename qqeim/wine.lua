pkgname = "qqeim"
pkgver = "2014"
pkgrel = 1
pkgdesc = "QQ Enterpris（企业QQ）"
publisher = "Tencent"

url = "http://www.qq.com/"

depends = { "riched20", "msctf", "winxp", "fakechinese" }

source = { "http://dldir1.qq.com/qqfile/crm/hrtx/HRTX1.89.2036.exe" }

-- file1="HRTX1.89.2036.exe"
-- installed_exe1="$W_PROGRAMS_X86_WIN/Tencent/QQEIM/Bin/QQEIM.exe"

-- install pkg into wine prefix
function install()
	wb.wine(wb.basename(source[1]))
	--  w_override_dlls disabled txplatform.exe
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
	-- w_declare_exe "$W_PROGRAMS_X86_WIN\\Tencent\\QQEIM\\Bin" QQEIM.exe
end
