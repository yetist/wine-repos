pkgname   = 'vb6sp6-runtime'
pkgver    = '2004'
pkgrel    = 1
pkgdesc   = 'vb6 sp6'
publisher = 'Microsoft'

url = 'https://microsoft.com'

source = {'https://download.microsoft.com/download/5/6/3/5635D6A9-885E-4C80-A2E7-8A7F4488FBF1/VB60SP6-KB2708437-x86-ENU.msi'}

-- install pkg into wine prefix
function install()
  _ = nil
end

-- is this pkg installed?
function check()
  return wb.exists(wb.basename(source[1]))
end
