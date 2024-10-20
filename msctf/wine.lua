pkgname = "d3dx9"
pkgver = "2010"
pkgrel = 1
pkgdesc = "MS d3dx9_??.dll from DirectX 9 redistributable"
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

	--     for x in wb.glob(wb.var.temp_dir+'/*.cab')
	--         wb.system('cabextract', '-d', wb.var.system32_dlls, '-L', '-F', '*d3dx9*.dll*', x)
	--     done
	--
	--     for x in "${W_TMP}"/*.cab; do
	--         w_try_cabextract -d "${W_SYSTEM32_DLLS}" -L -F 'd3dx9*.dll' "${x}"
	--     done
	--
	--     if test "${W_ARCH}" = "win64"; then
	--         w_try_cabextract -d "${W_TMP}" -L -F '*d3dx9*x64*' "${W_CACHE}"/directx9/${DIRECTX_NAME}
	--
	--         for x in "${W_TMP}"/*x64.cab; do
	--             w_try_cabextract -d "${W_SYSTEM64_DLLS}" -L -F 'd3dx9*.dll' "${x}"
	--         done
	--     fi
	--
	--     -- For now, not needed, but when Wine starts preferring our builtin dll over native it will be.
	--     wb.override_dlls('native', 'd3dx9_24', 'd3dx9_25', 'd3dx9_26', 'd3dx9_27', 'd3dx9_28', 'd3dx9_29')
end
