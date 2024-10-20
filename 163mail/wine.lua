pkgname = "163mail"
pkgver = "2017"
pkgrel = 1
pkgdesc = "163 MailMaster（网易邮箱大师）"
publisher = "NetEase"

url = "http://mail.163.com/dashi/?from=mail46"

depends = { "vcrun2005", "fakechinese" }

source = { "http://client.dl.126.net/pcmail/dashi/mail.exe" }

-- file1="mail.exe"
-- installed_exe1="$W_PROGRAMS_X86_WIN/MailMaster/Start.exe"

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
	-- w_declare_exe "$W_PROGRAMS_X86_WIN\\MailMaster" "Start.exe"
end
