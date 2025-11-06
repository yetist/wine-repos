pkgname = "directmusic"
pkgver = "2010"
pkgrel = 1
pkgdesc = "MS DirectMusic from DirectX user redistributable"
publisher = "Microsoft"
requires = { "cabextract" }
depends = {
	"dmband",
	"dmcompos",
	"dmime",
	"dmloader",
	"dmscript",
	"dmstyle",
	"dmsynth",
	"dmusic",
	"dmusic32",
	"dsound",
	"dswave",
}
source = {
	"https://download.microsoft.com/download/8/4/a/84a35bf1-dafe-4ae8-82af-ad2ae20b6b14/directx_Jun2010_redist.exe",
}
sha256sums = {}

-- install pkg into wine prefix
function install()
	wb.override_dlls("native", "streamci")
end

-- is this pkg installed?
function check()
	return wb.check_override("native", "streamci")
end
