pkgname   = 'win2ksp4'
pkgver    = '2004'
pkgrel    = 1
pkgdesc   = 'MS RichEdit Control 2.0 (riched20.dll)'
publisher = 'Microsoft'

url = 'https://microsoft.com'

source = {'http://x3270.bgp.nu/download/specials/W2KSP4_EN.EXE'}

-- install pkg into wine prefix
function install()
    wb.pwd()
end

-- is this pkg installed?
function check()
  return wb.exists(wb.basename(source[1]))
end
