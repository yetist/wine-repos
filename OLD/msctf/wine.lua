pkgname = "msctf"
pkgver = "2003"
pkgrel = 1
pkgdesc = "MS Text Service Module"
arch = { "win32", "win64" }
url = "https://www.win-rar.com/fileadmin/winrar-versions"
icon = "https://"
groups = { "apps" }
requires = { "cabextract" }
publisher = "RARLAB"
setup = "directx_Jun2010_redist.exe"
-- exe       = wine.var.program_files .. "/WinRAR/WinRAR.exe"

source = { "https://files.holarse-linuxgaming.de/mirrors/microsoft/directx_Jun2010_redist.exe" }

function install()
	-- os.system('cabextract -d', wb.var.temp_dir, '-L', '-F', '*d3dx9*x86*', setup)
	os.system("cabextract -L -F *d3dx9*x86*" .. setup)

end
