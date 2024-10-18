pkgname   = 'typeeasy'
pkgver    = '2016'
pkgrel    = 1
pkgdesc   = 'TypeEasy(金山打字通)'
publisher = 'Kingsoft'

url = 'https://www.51dzt.com/rubik-ssr/51dzt'

depends = {'fakechinese'}
-- quartz
-- riched20
source = {'https://package.op.wpscdn.cn/wps/download/typeeasy.22063.12012.0.exe'}

-- install pkg into wine prefix
function install()
  wb.wine(wb.basename(source[1]))
end

-- is this pkg installed?
function check()
  return (wb.wine("reg QUERY \"HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\酷狗音乐\" /v DisplayIcon"))
end

-- run app
function run()
  print('hello typeeasy')
--  _, path = wb.wine("reg QUERY \"HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\酷狗音乐\" /v DisplayIcon")
--  _, path = wb.split(wb.strip(path), "\r\n", 2)
--  path = wb.replace(wb.strip(path), "    ", " ")
--  _, _, path = wb.split(path, " ", 3)
--  wb.wine(path)
-- 83067 "DisplayIcon"="C:\\Program Files (x86)\\KuGou\\KGMusic\\KuGou.exe"
--  w_declare_exe "$W_PROGRAMS_X86_WIN\\KuGou\KGMusic" "KuGou.exe"
end
