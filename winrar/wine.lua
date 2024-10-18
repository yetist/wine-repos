pkgname   = 'winrar'
pkgver    = '611'
pkgrel    = 1
pkgdesc   = "WinRAR 6.11"
arch      = {'win32','win64'}
url       = "https://www.win-rar.com/fileadmin/winrar-versions"
icon      = "https://"
license   = {'custom'}
groups    = {'apps'}
depends   = {
  'd3dx9',
  'fakechinese',
}
requires  = {'7z'}
publisher = "RARLAB"
year      = "1993"
file1     = "winrar-x32-611.exe"
overdlls  = {'abc.dll'}
-- exe       = wine.var.program_files .. "/WinRAR/WinRAR.exe"

if (wb.var.arch == "win32")
then
    source = { url .. "/winrar-x32-611.exe", "winrar.png"}
    checksums = {"aaa"}
else
    source = { url .. "/winrar-x64-611.exe", "winrar.png"}
    checksums = {"aaa"}
end

print(wb.pwd())
wb.chdir("/tmp")
print(wb.pwd())

-- print(wine.func.pwd())
-- wine.func.chdir("/tmp")
-- print(wine.func.pwd())
--
-- function test()
--   print("show wine.var")
--   for k, v in pairs(wine.var) do
--       print(k, v)
--   end
--   print(wine.var.arch)
--   wine.func.my_func(33)
-- end
--
-- function install()
--   prefix_dir = wine.var.prefix
--   cache_dir = wine.var.cache
--
--   cache_dir = wine.fn.path_join(prefix_dir, pkgname)
--
--   wine.fn.extract("tar", "-C", "")
--   wine.fn.path_join(prefix_dir, pkgname)
--   wine.fn.system("tar", "-C", "")
--   wine.fn.run("aaa.exe")
--   wine.fn.dialog("aaa.exe")
-- end

-- wine.fn.download(source)
--[[
function install(prefix)
cd  $srcdir
wui.fn.system("tar", "-C", "")
end

function run(prefix)
end

package() {
tar -C ${pkgdir} -xf data.tar.xz
sed -i 's/qq %U/qq --no-sandbox %U/'  ${pkgdir}/usr/share/applications/qq.desktop
install -Dm755 ${srcdir}/linuxqq.sh ${pkgdir}/usr/bin/linuxqq
}
]]--
