pkgname   = 'fakechinese'
pkgver    = '2019'
pkgrel    = 1
pkgdesc   = "Creates aliases for Chinese fonts using Source Han Sans fonts"
publisher = "Adobe"

depends   = {'source-han-sans-fonts'}
source    = {"replace.reg" }

-- install pkg into wine prefix
function install()
  wb.wine("regedit replace.reg")
end

-- is this pkg installed?
function check()
  local ret, text = wb.wine("reg QUERY \"HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows NT\\CurrentVersion\\FontLink\\SystemLink\" /v Arial")
  if ret ~= 0 then
    return false
  end
  if (string.find(wb.strip(text), "sourcehansans.ttc") ~= nil) then
    return true
  end
  return false
end
