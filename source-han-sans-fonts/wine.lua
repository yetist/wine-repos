pkgname   = 'source-han-sans-fonts'
pkgver    = '2021'
pkgrel    = 1
pkgdesc   = 'Source Han Sans fonts'
publisher = 'Adobe'

arch      = {'win32','win64'}
url       = 'https://www.win-rar.com/fileadmin/winrar-versions'
icon      = 'https://'

groups    = {'fonts'}
requires  = {'unzip'}

setup     = 'SourceHanSans.ttc.zip'

source    = {"https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSans.ttc.zip",
             "win9x-fonts.reg",
             "win-fonts.reg"
}

-- install pkg into wine prefix
function install()
    os.execute('unzip SourceHanSans.ttc.zip')
    os.rename('SourceHanSans.ttc', 'sourcehansans.ttc');
    os.execute('cp *.ttc '.. wb.var.fonts_dir)
    wb.wine("regedit win9x-fonts.reg")
    wb.wine("regedit win-fonts.reg")
end

-- is this pkg installed?
function check()
    return wb.exists(wb.var.fonts_dir .. '/sourcehansans.ttc')
end
