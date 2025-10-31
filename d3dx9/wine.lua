pkgname = "d3dx9"
pkgver = "2010"
pkgrel = 1
pkgdesc = "MS d3dx9_??.dll from DirectX 9 redistributable"
arch = { "win32", "win64" }
requires = { "cabextract" }
source = { "https://files.holarse-linuxgaming.de/mirrors/microsoft/directx_Jun2010_redist.exe" }

function install()
	-- Installing native directx9 to work around playback bug
	file = "directx_Jun2010_redist.exe"
	os.execute("cabextract -L -F *d3dx9*.cab " .. file)
	if wb.var.arch == "win64" then
		os.execute("for i in *x64.cab; do cabextract -L -F *d3dx9*.dll* -d " .. wb.var.system64_dlls .. " $i; done")
	else
		os.execute("for i in *x86.cab; do cabextract -L -F *d3dx9*.dll* -d " .. wb.var.system32_dlls .. " $i; done")
	end

	wb.override_dll(
		"native",
		"d3dx9_24",
		"d3dx9_25",
		"d3dx9_26",
		"d3dx9_27",
		"d3dx9_28",
		"d3dx9_29",
		"d3dx9_30",
		"d3dx9_31",
		"d3dx9_32",
		"d3dx9_33",
		"d3dx9_34",
		"d3dx9_35",
		"d3dx9_36",
		"d3dx9_37",
		"d3dx9_38",
		"d3dx9_39",
		"d3dx9_40",
		"d3dx9_41",
		"d3dx9_42",
		"d3dx9_43"
	)
end

function check()
	local _, value = wb.regvalue("HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides", "d3dx9_24")
	if value == "native" then
		return true
	end
	return false
end
