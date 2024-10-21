pkgname = "kugou"
pkgver = "2023"
pkgrel = 1
pkgdesc = "KuGou Music"
publisher = "KuGou"

url = "http://www.kugou.com/"

depends = {"quartz", "riched20", "fakechinese"}
source = { "https://downmini.yun.kugou.com/web/kugou_10250.exe" }

-- install pkg into wine prefix
function install()
  wb.wine(wb.basename(source[1]))
end

-- is this pkg installed?
function check()
  ret = wb.wine(
  'reg QUERY "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\酷狗音乐" /v DisplayIcon'
  )
  return (ret == 0)
end

-- run app
function run()
  print("run kogou")
  os.execute("pwd")
  print(wb.var.program_files_x86)
  --   _, path = wb.wine("reg QUERY \"HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\酷狗音乐\" /v DisplayIcon")
  --   _, path = wb.split(wb.strip(path), "\r\n", 2)
  --   path = wb.replace(wb.strip(path), "    ", " ")
  --   _, _, path = wb.split(path, " ", 3)
  --   wb.wine(path)
  -- 83067 "DisplayIcon"="C:\\Program Files (x86)\\KuGou\\KGMusic\\KuGou.exe"
  --  w_declare_exe "$W_PROGRAMS_X86_WIN\\KuGou\KGMusic" "KuGou.exe"
end
