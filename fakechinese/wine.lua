pkgname   = 'fakechinese'
pkgver    = '2019'
pkgrel    = 1
pkgdesc   = "Creates aliases for Chinese fonts using Source Han Sans fonts"
publisher = "Adobe"

depends  = {'source-han-sans-fonts'}
source    = {"replace.reg" }

function install()
  wb.wine("regedit replace.reg")
end

-- is this pkg installed?
function check()
  local ret, text = wb.wine("reg QUERY \"HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows NT\\CurrentVersion\\FontLink\\SystemLink\" /v Arial")
  if (string.find(text, "sourcehansans.ttc") ~= nil) then
    return true
  end
  return false
end
