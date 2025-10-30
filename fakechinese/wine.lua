pkgname = "fakechinese"
pkgver = "2019"
pkgrel = 1
pkgdesc = "Creates aliases for Chinese fonts using Source Han Sans fonts"
publisher = "Adobe"

depends = { "source-han-sans-fonts" }
source = { "replace.reg" }

-- install pkg into wine prefix
function install()
	wb.wine("regedit replace.reg")
end

-- is this pkg installed?
function check()
  local val = wb.regvalue(
    "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows NT\\CurrentVersion\\FontLink\\SystemLink",
    "Arial",
  )
  if val == "sourcehansans.ttc" then
    return true
  end
  return false
end
