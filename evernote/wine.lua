pkgname = "evernote"
pkgver = "6.6.4"
pkgrel = 1
pkgdesc = "Evernote"
publisher = "Evernote Corporation"

url = "http://music.evernote.com/"

depends = { "fakechinese", "wininet" }

source = { "https://cdn1.evernote.com/win6/public/Evernote_6.6.4.5512.exe" }

-- file1="Evernote_6.5.4.5512.exe"
-- installed_exe1="$W_PROGRAMS_X86_WIN/Evernote/Evernote/Evernote.exe"

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
	-- w_declare_exe "$W_PROGRAMS_X86_WIN\\Evernote\Evernote" Evernote.exe
end
