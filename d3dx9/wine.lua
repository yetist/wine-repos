pkgname = "d3dx9"
pkgver = "2010"
pkgrel = 1
pkgdesc = "MS d3dx9_??.dll from DirectX 9 redistributable"
arch = { "win32", "win64" }

depends = { "directx-runtime" }
requires = { "cabextract" }
source = { "override.reg" }

function install()
	file = "directx_Jun2010_redist.exe"
	os.execute("cabextract -L -F *d3dx9* " .. file)
	os.execute("for i in *.cab; do cabextract -d " .. wb.var.system32_dlls .. "-L -F *d3dx9*.dll*")
	if wb.var.arch == "win64" then
		os.execute("cabextract -L -F *d3dx9*x64* " .. file)
		os.execute("for i in *.cab; do cabextract -d " .. wb.var.system64_dlls .. "-L -F *d3dx9*.dll*")
	end
	-- For now, not needed, but when Wine starts preferring our builtin dll over native it will be.
	wb.wine("regedit override.reg")
end

function check()
	ret, text = wb.wine('reg QUERY "HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides" /v d3dx9_24')
	if ret ~= 0 then
		return false
	end
	if string.find(wb.strip(text), "native") ~= nil then
		return true
	end
	return false
end
