pkgname   = 'iqiyi'
pkgver    = '12.8.5.8638'
pkgrel    = 1
pkgdesc   = 'iQIYI(爱奇艺）'
publisher = '爱奇艺'

url = 'http://www.iqiyi.com/'

depends = {'fakechinese'}
source = {'https://dl-static.iqiyi.com/hz/IQIYIsetup_app.exe'}

-- install pkg into wine prefix
function install()
  wb.wine(wb.basename(source[1]))
end

-- is this pkg installed?
function check()
  return wb.regvalue(
    "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\PPStream",
    "SetupPath",
  )
end

-- run app
function run()
  local _, path = wb.regvalue(
    "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\PPStream",
    "SetupPath"
  )
  wb.exec("wine", path .. "\\QyClient.exe")
end
