pkgname = "source-han-sans-fonts"
pkgver = "2.0.4"
pkgrel = 1
pkgdesc = "Source Han Sans fonts"
url = "https://github.com/adobe-fonts/source-han-sans"

requires = { "unzip" }
source = {
	"https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSans.ttc.zip",
}

-- install pkg into wine prefix
function install()
	os.execute("unzip SourceHanSans.ttc.zip")
	os.rename("SourceHanSans.ttc", "sourcehansans.ttc")
	os.execute("cp *.ttc " .. wb.var.fonts_dir)

	-- win9x fonts
	wb.regset("HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Fonts", {
		-- ; Simplified Chinese
		["Source Han Sans SC ExtraLight"] = "sourcehansans.ttc",
		["Source Han Sans SC Light"] = "sourcehansans.ttc",
		["Source Han Sans SC Normal"] = "sourcehansans.ttc",
		["Source Han Sans SC"] = "sourcehansans.ttc",
		["Source Han Sans SC Medium"] = "sourcehansans.ttc",
		["Source Han Sans SC Bold"] = "sourcehansans.ttc",
		["Source Han Sans SC Heavy"] = "sourcehansans.ttc",
		-- ; Traditional Chinese (Taiwan)
		["Source Han Sans TC ExtraLight"] = "sourcehansans.ttc",
		["Source Han Sans TC Light"] = "sourcehansans.ttc",
		["Source Han Sans TC Normal"] = "sourcehansans.ttc",
		["Source Han Sans TC"] = "sourcehansans.ttc",
		["Source Han Sans TC Medium"] = "sourcehansans.ttc",
		["Source Han Sans TC Bold"] = "sourcehansans.ttc",
		["Source Han Sans TC Heavy"] = "sourcehansans.ttc",
		-- ; Japanese
		["Source Han Sans ExtraLight"] = "sourcehansans.ttc",
		["Source Han Sans Light"] = "sourcehansans.ttc",
		["Source Han Sans Normal"] = "sourcehansans.ttc",
		["Source Han Sans"] = "sourcehansans.ttc",
		["Source Han Sans Medium"] = "sourcehansans.ttc",
		["Source Han Sans Bold"] = "sourcehansans.ttc",
		["Source Han Sans Heavy"] = "sourcehansans.ttc",
		-- ; Korean
		["Source Han Sans K ExtraLight"] = "sourcehansans.ttc",
		["Source Han Sans K Light"] = "sourcehansans.ttc",
		["Source Han Sans K Normal"] = "sourcehansans.ttc",
		["Source Han Sans K"] = "sourcehansans.ttc",
		["Source Han Sans K Medium"] = "sourcehansans.ttc",
		["Source Han Sans K Bold"] = "sourcehansans.ttc",
		["Source Han Sans K Heavy"] = "sourcehansans.ttc",
	})

	-- win fonts
	wb.regset("HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Fonts", {
		-- ; Simplified Chinese
		["Source Han Sans SC ExtraLight"] = "sourcehansans.ttc",
		["Source Han Sans SC Light"] = "sourcehansans.ttc",
		["Source Han Sans SC Normal"] = "sourcehansans.ttc",
		["Source Han Sans SC"] = "sourcehansans.ttc",
		["Source Han Sans SC Medium"] = "sourcehansans.ttc",
		["Source Han Sans SC Bold"] = "sourcehansans.ttc",
		["Source Han Sans SC Heavy"] = "sourcehansans.ttc",
		--; Traditional Chinese (Taiwan)
		["Source Han Sans TC ExtraLight"] = "sourcehansans.ttc",
		["Source Han Sans TC Light"] = "sourcehansans.ttc",
		["Source Han Sans TC Normal"] = "sourcehansans.ttc",
		["Source Han Sans TC"] = "sourcehansans.ttc",
		["Source Han Sans TC Medium"] = "sourcehansans.ttc",
		["Source Han Sans TC Bold"] = "sourcehansans.ttc",
		["Source Han Sans TC Heavy"] = "sourcehansans.ttc",
		--; Japanese
		["Source Han Sans ExtraLight"] = "sourcehansans.ttc",
		["Source Han Sans Light"] = "sourcehansans.ttc",
		["Source Han Sans Normal"] = "sourcehansans.ttc",
		["Source Han Sans"] = "sourcehansans.ttc",
		["Source Han Sans Medium"] = "sourcehansans.ttc",
		["Source Han Sans Bold"] = "sourcehansans.ttc",
		["Source Han Sans Heavy"] = "sourcehansans.ttc",
		--; Korean
		["Source Han Sans K ExtraLight"] = "sourcehansans.ttc",
		["Source Han Sans K Light"] = "sourcehansans.ttc",
		["Source Han Sans K Normal"] = "sourcehansans.ttc",
		["Source Han Sans K"] = "sourcehansans.ttc",
		["Source Han Sans K Medium"] = "sourcehansans.ttc",
		["Source Han Sans K Bold"] = "sourcehansans.ttc",
		["Source Han Sans K Heavy"] = "sourcehansans.ttc",
	})
end

-- is this pkg installed?
function check()
	return wb.exists(wb.var.fonts_dir .. "/sourcehansans.ttc")
end
