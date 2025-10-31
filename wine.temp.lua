pkgname = ""
pkgver = ""
pkgrel = 1
pkgdesc = ""
publisher = ""
url = "http://www.abc.com/"
depends = { "fakechinese" }
source = { "" }

-- install pkg into wine prefix
function install()
	--[[
	wb.wine(wb.basename(source[1]))
  ]]
end

-- is this pkg installed?
function check()
	return false
	--[[
  return wb.regvalue("HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Software", "DisplayIcon")
  ]]
end

-- run app
function run()
	--[[
  local _, path =
    wb.regvalue("HKLM\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Software", "DisplayIcon")
  wb.exec("wine", path .. "\\software.exe")
  ]]
end
--[[
    wb.var.prefix
    wb.var.cache_dir
    wb.var.build_dir
    wb.var.arch
    wb.var.windir
    wb.var.program_files
    wb.var.program_files_x86
--    wb.var.program_files_w6432
    wb.var.system32_dlls
    wb.var.system64_dlls
    wb.var.wine_commonfiles
    wb.var.wine_commonfiles_x86
    wb.var.version
    wb.var.windows_dir
    wb.var.fonts_dir

    wb.pwd()
    wb.chdir()
    wb.dirname()
    wb.basename()
    wb.exists()
    wb.isdir()
    wb.wine()
    wb.exec()
    wb.regvalue()
    wb.override_dll()
--]]
