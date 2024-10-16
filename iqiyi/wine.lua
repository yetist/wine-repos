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
  return (wb.wine("reg QUERY \"HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\PPStream\" /v SetupPath"))
end

-- run app
function run()
  _, path = wb.wine("reg QUERY \"HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\PPStream\" /v SetupPath")
  _, path = wb.split(wb.strip(path), "\r\n", 2)
  path = wb.replace(wb.strip(path), "    ", " ")
  _, _, path = wb.split(path, " ", 3)
  wb.wine("\"" .. path .. "\\QyClient.exe\"")
end
